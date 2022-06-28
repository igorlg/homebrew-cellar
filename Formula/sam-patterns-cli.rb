require "language/node"

class SamPatternsCli < Formula
  desc "Command line interface for quickly using patterns from https://github.com/aws-samples/serverless-patterns/"
  homepage "https://github.com/mhlabs/sam-patterns-cli#readme"
  url "https://registry.npmjs.org/sam-patterns-cli/-/sam-patterns-cli-0.0.28.tgz"
  sha256 "83fd8c5881fe61fcec3ca750347699ce4f3eff428f1fb5f3c8003b921120b886"
  license "ISC"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/sam-patterns", "-v"
  end
end
