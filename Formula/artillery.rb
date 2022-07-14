require "language/node"

class Artillery < Formula
  desc "Modern performance testing toolkit for DevOps and SRE"
  homepage "https://github.com/artilleryio/artillery#readme"
  url "https://registry.npmjs.org/artillery/-/artillery-2.0.0-21.tgz"
  sha256 "f2d1a52ba246baf5a43a99bb4a0d03d314257618eafc8e12395a4f39e6b47574"
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
