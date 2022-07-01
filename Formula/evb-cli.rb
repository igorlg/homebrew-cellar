require "language/node"

class MhlabsEvbCli < Formula
  desc "A package for building EventBridge/CloudWatch Events patterns"
  homepage "https://github.com/mhlabs/evb-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/evb-cli/-/evb-cli-1.1.40.tgz"
  sha256 "d0b116c01fc23cf3d764cd640f28729cd3d2f4d3243a970e20f82b8d0441fa2b"
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
