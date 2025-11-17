# Igor's Homebrew Tap

A custom Homebrew tap containing formulas for tools that haven't gone upstream yet, or personal forks with modifications.

## Installation

```bash
brew tap igorlg/cellar
brew install igorlg/cellar/<formula>
```

Or in a single command:

```bash
brew install igorlg/cellar/<formula>
```

## Available Formulas

### AWS & Cloud Tools

#### cwlogs-cli
CLI tool to quickly set up cross log group search in CloudWatch Logs Insights based on prefix, tags, and/or RegEx patterns.

- **Source**: [@mhlabs/cwlogs-cli](https://github.com/mhlabs/cwlogs-cli)
- **Install**: `brew install igorlg/cellar/cwlogs-cli`

#### evb-cli
A package for building EventBridge patterns.

- **Source**: [@mhlabs/evb-cli](https://github.com/mhlabs/evb-cli)
- **Install**: `brew install igorlg/cellar/evb-cli`

#### iam-policies-cli
CLI tool for working with AWS IAM policies.

- **Source**: [@mhlabs/iam-policies-cli](https://github.com/mhlabs/iam-policies-cli)
- **Install**: `brew install igorlg/cellar/iam-policies-cli`

#### codebuild-local
Script to run AWS CodeBuild locally using Docker.

- **Source**: [aws/aws-codebuild-docker-images](https://github.com/aws/aws-codebuild-docker-images)
- **Install**: `brew install igorlg/cellar/codebuild-local`
- **Requirement**: Docker must be installed

### Serverless & SAM

#### samp-cli
CLI tool for AWS Serverless Application Model (SAM) patterns.

- **Source**: [samp-cli](https://github.com/mhlabs/samp-cli)
- **Install**: `brew install igorlg/cellar/samp-cli`

### Development Tools

#### mcp-language-server
MCP server that exposes language server capabilities to LLMs.

- **Source**: [isaacphi/mcp-language-server](https://github.com/isaacphi/mcp-language-server)
- **Install**: `brew install igorlg/cellar/mcp-language-server`

#### git-open
Open GitHub/GitLab/CodeCommit page for a git repository from the command line. Fork with support for branches and multiple platforms.

- **Source**: [igorlg/git-open](https://github.com/igorlg/git-open) (fork)
- **Install**: `brew install igorlg/cellar/git-open`
- **Usage**: Run `git-open` from any git repository

## Automated Updates

This tap uses GitHub Actions to automatically check for and update formulas when new versions are released upstream. Updates are created as pull requests for review.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## Maintenance

Formulas are automatically kept up-to-date via GitHub Actions workflows that:
- Check for new NPM package versions
- Check for new GitHub releases
- Generate pull requests with updates

## License

See individual formula licenses. This tap itself is provided as-is for community use.
