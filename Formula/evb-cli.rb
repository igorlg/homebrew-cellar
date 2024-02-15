require "language/node"

class EvbCli < Formula
  desc "A package for building EventBridge patterns"
  homepage "https://github.com/mhlabs/evb-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/evb-cli/-/evb-cli-1.2.4.tgz"
  sha256 "e702587d38ab6e349afefd96a8145fb3d92d77715dbb15b0f083ce4f6c7a9c30"
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
