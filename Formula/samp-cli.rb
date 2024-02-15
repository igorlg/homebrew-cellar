require "language/node"

class SampCli < Formula
  desc "CLI tool for extended productivity with AWS Serverless Application Model (SAM)"
  homepage "https://github.com/ljacobsson/samp-cli#readme"
  url "https://registry.npmjs.org/samp-cli/-/samp-cli-1.0.70.tgz"
  sha256 "f488fd499e9444f1915874a15439f177e043222206bbd8ab4a7498516987d7d7"
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
    system "#{bin}/samp", "-v"
  end
end
