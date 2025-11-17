#!/usr/bin/env python3
"""
Update Homebrew formulas from GitHub releases.
Handles both Go-based and Git-based formulas that source from GitHub releases.
"""

import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Dict, Optional
from urllib.request import urlopen, Request

# Configuration: repo -> formula mapping
GITHUB_FORMULAS = {
    "isaacphi/mcp-language-server": {
        "formula": "Formula/mcp-language-server.rb",
        "type": "go",
        "url_template": "https://github.com/{repo}/archive/refs/tags/{tag}.tar.gz",
    },
    "igorlg/git-open": {
        "formula": "Formula/git-open.rb",
        "type": "git",
        "url_template": "https://github.com/{repo}/releases/download/{tag}/git-open-{version}.tar.gz",
    },
    "aws/aws-codebuild-docker-images": {
        "formula": "Formula/codebuild-local.rb",
        "type": "git",
        "url_template": "https://github.com/{repo}/archive/refs/tags/{tag}.tar.gz",
        "skip_v_prefix": True,  # This repo uses tags without 'v' prefix
    },
}


def get_github_token() -> Optional[str]:
    """Get GitHub token from environment."""
    import os
    return os.environ.get("GITHUB_TOKEN")


def get_latest_release(repo: str) -> Optional[Dict]:
    """Fetch latest release info from GitHub API."""
    url = f"https://api.github.com/repos/{repo}/releases/latest"
    headers = {"Accept": "application/vnd.github.v3+json"}

    token = get_github_token()
    if token:
        headers["Authorization"] = f"token {token}"

    try:
        req = Request(url, headers=headers)
        with urlopen(req) as response:
            return json.loads(response.read())
    except Exception as e:
        print(f"Error fetching release for {repo}: {e}", file=sys.stderr)
        return None


def calculate_sha256(url: str) -> Optional[str]:
    """Download file and calculate SHA256."""
    try:
        result = subprocess.run(
            ["curl", "-sL", url],
            capture_output=True,
            check=True
        )
        sha_result = subprocess.run(
            ["shasum", "-a", "256"],
            input=result.stdout,  # Pass bytes directly
            capture_output=True,
            check=True
        )
        return sha_result.stdout.decode().split()[0]
    except subprocess.CalledProcessError as e:
        print(f"Error calculating SHA256 for {url}: {e}", file=sys.stderr)
        return None


def update_formula(formula_path: str, version: str, url: str, sha256: str) -> bool:
    """Update formula file with new version, URL, and SHA256."""
    path = Path(formula_path)
    if not path.exists():
        print(f"Formula not found: {formula_path}", file=sys.stderr)
        return False

    content = path.read_text()
    original_content = content

    # Update version (if explicitly set) - do this first
    if 'version "' in content:
        content = re.sub(
            r'version\s+"[^"]+"',
            f'version "{version}"',
            content
        )

    # Update URL and SHA256 together to preserve formatting
    # Pattern: Match url line with optional git params, and optionally sha256 on next line
    url_sha_pattern = re.compile(
        r'(  url\s+"[^"]+")(?:,\s*using:\s*:\w+)?(?:,\s*tag:\s*[\'"][^\'"]+[\'"])?'
        r'(\n  sha256\s+"[^"]+")?',
        re.MULTILINE
    )

    def url_sha_replacer(match):
        # Always return url + newline + sha256 in proper format
        return f'  url "{url}"\n  sha256 "{sha256}"'

    content = url_sha_pattern.sub(url_sha_replacer, content, count=1)

    # Only write if content actually changed
    if content != original_content:
        path.write_text(content)
        print(f"✓ Updated {formula_path} to version {version}")
        return True
    else:
        print(f"  No changes needed for {formula_path} (already at version {version})")
        return True


def process_formula(repo: str, config: Dict) -> bool:
    """Process a single formula update."""
    print(f"\nChecking {repo}...")

    release = get_latest_release(repo)
    if not release:
        return False

    tag = release["tag_name"]

    # Extract version (remove 'v' prefix if present, unless skip_v_prefix is set)
    if config.get("skip_v_prefix"):
        version = tag
    else:
        version = tag.lstrip("v")

    # Build download URL
    url = config["url_template"].format(
        repo=repo,
        tag=tag,
        version=version
    )

    print(f"  Latest release: {tag}")
    print(f"  Download URL: {url}")

    # Calculate SHA256
    print(f"  Calculating SHA256...")
    sha256 = calculate_sha256(url)
    if not sha256:
        return False

    print(f"  SHA256: {sha256}")

    # Update formula
    return update_formula(config["formula"], version, url, sha256)


def main():
    """Main function to update all GitHub-based formulas."""
    print("=" * 60)
    print("Updating GitHub-based Homebrew formulas")
    print("=" * 60)

    success_count = 0
    fail_count = 0

    for repo, config in GITHUB_FORMULAS.items():
        try:
            if process_formula(repo, config):
                success_count += 1
            else:
                fail_count += 1
        except Exception as e:
            print(f"Error processing {repo}: {e}", file=sys.stderr)
            fail_count += 1

    print("\n" + "=" * 60)
    print(f"Summary: {success_count} updated, {fail_count} failed")
    print("=" * 60)

    return 0 if fail_count == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
