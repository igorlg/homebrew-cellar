require "language/node"

class SamPatternsCli < Formula
  desc "Command line interface for quickly using patterns from https://github.com/aws-samples/serverless-patterns/"
  homepage "https://github.com/mhlabs/sam-patterns-cli#readme"
  url "https://registry.npmjs.org/sam-patterns-cli/-/sam-patterns-cli-0.0.30.tgz"
  sha256 "f43613d8dadeef87f8ed61d20ceca75dac1cb487e7e37c7991e7761665dd4da8"
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
