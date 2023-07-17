require "language/node"

class EvbCli < Formula
  desc "A package for building EventBridge/CloudWatch Events patterns"
  homepage "https://github.com/mhlabs/evb-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/evb-cli/-/evb-cli-1.1.51.tgz"
  sha256 "5b04c886c7ff2d8971c2d600738e2812038119262fbc2fa7feb35810b83926c9"
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
    system "#{bin}/evb", "-v"
  end
end
