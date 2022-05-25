require "language/node"

class EvbCli < Formula
  desc "Pattern generator and debugging tool for Amazon EventBridge"
  homepage "https://github.com/mhlabs/evb-cli"
  url "https://github.com/mhlabs/evb-cli/archive/refs/tags/v1.1.39a.zip"
  sha256 "99d574dcf91102f5836713fafac5d65bcb84bfc56c0e8722a8f18360905b7212"
  license ""

  depends_on "node"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/evb", "-v"
  end
end
