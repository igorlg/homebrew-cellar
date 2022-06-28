require "language/node"

class MhlabsEvbCli < Formula
  desc "A package for building EventBridge/CloudWatch Events patterns"
  homepage "https://github.com/mhlabs/evb-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/evb-cli/-/evb-cli-1.1.39.tgz"
  sha256 "7b397d7d269aead2cf01db4e1b7549f26ef3dbb231da3b87784e5868704ed2ff"
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
