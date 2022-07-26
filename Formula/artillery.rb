require "language/node"

class Artillery < Formula
  desc "Modern performance testing toolkit for DevOps and SRE"
  homepage "https://github.com/artilleryio/artillery#readme"
  url "https://registry.npmjs.org/artillery/-/artillery-2.0.0-22.tgz"
  sha256 "3af86ce2c6cec47f30b5574d77902b7bf6e0c3eaf8a5cdcd81f34bc15bd56cd4"
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
