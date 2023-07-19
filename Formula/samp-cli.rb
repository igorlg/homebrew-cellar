require "language/node"

class SampCli < Formula
  desc "CLI tool for extended productivity with AWS Serverless Application Model (SAM)"
  homepage "https://github.com/ljacobsson/samp-cli#readme"
  url "https://registry.npmjs.org/samp-cli/-/samp-cli-1.0.13.tgz"
  sha256 "7194c05ab05dcccabd5bb616dc86d5b4c31b818ac671740dbe0b933e96b0b77c"
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
