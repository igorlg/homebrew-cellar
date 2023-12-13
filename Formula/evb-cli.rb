require "language/node"

class EvbCli < Formula
  desc "A package for building EventBridge patterns"
  homepage "https://github.com/mhlabs/evb-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/evb-cli/-/evb-cli-1.2.3.tgz"
  sha256 "33b9adb93e5b2bc861a52d022cf09e26a7a7f1d06624e1748d7635924d9b5e20"
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
