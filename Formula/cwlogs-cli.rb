require "language/node"

class MhlabsCwlogsCli < Formula
  desc "CLI tool to quickly set up cross log group search in CloudWatch Logs Insights based on prefix, tags and/or RegEx pattern"
  homepage "https://github.com/mhlabs/cwlogs-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/cwlogs-cli/-/cwlogs-cli-1.0.2.tgz"
  sha256 "c6a3df9540e0aefe14cfef77848c1377bee3dff8cf9a5f59271bd1c5489430a5"
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
    raise "Test not implemented."
  end
end
