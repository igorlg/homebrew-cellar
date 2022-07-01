require "language/node"

class Artillery < Formula
  desc "Modern performance testing toolkit for DevOps and SRE"
  homepage "https://github.com/artilleryio/artillery#readme"
  url "https://registry.npmjs.org/artillery/-/artillery-2.0.0-19.tgz"
  sha256 "82644334fa03a79e57234abc30842dcb63e6d1bbb77f3e0a61c9ed8566c14725"
  license "MPL-2.0"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/artillery", "-v"
  end
end
