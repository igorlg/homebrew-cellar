class GitOpen < Formula
  desc "Open GitHub/GitLab/CodeCommit page for a git repository from the command line"
  homepage "https://github.com/igorlg/git-open"
  url "https://github.com/igorlg/git-open/releases/download/v1.4.0/git-open-1.4.0.tar.gz"
  sha256 "8b29422506ccd6db7c5d79fdef616389331432899e4ed4d54ffa4613d83a7ff1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "git-open.sh" => "git-open"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/git-open -v")
  end
end
