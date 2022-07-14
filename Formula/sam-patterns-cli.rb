require "language/node"

class SamPatternsCli < Formula
  desc "Command line interface for quickly using patterns from https://github.com/aws-samples/serverless-patterns/"
  homepage "https://github.com/mhlabs/sam-patterns-cli#readme"
  url "https://registry.npmjs.org/sam-patterns-cli/-/sam-patterns-cli-0.0.29.tgz"
  sha256 "f30677d6cf0dff3c049f37f6bb02c2e887c41b6fd41170fab9f05f79f9baa750"
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
