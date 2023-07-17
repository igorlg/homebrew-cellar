require "language/node"

class SampCli < Formula
  desc "CLI tool for extended productivity with AWS Serverless Application Model (SAM)"
  homepage "https://github.com/ljacobsson/samp-cli#readme"
  url "https://registry.npmjs.org/samp-cli/-/samp-cli-1.0.8.tgz"
  sha256 "6ac9a4f8e6329134cb2ad7c97b12ab9933bd47931d9a0d49d1463db2baacf28b"
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
