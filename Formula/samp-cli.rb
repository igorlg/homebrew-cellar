require "language/node"

class SampCli < Formula
  desc "CLI tool for extended productivity with AWS Serverless Application Model (SAM)"
  homepage "https://github.com/ljacobsson/samp-cli#readme"
  url "https://registry.npmjs.org/samp-cli/-/samp-cli-1.0.67.tgz"
  sha256 "afc8ad34c169f5a2b645a7bc3daa396cda64e128a7804fadbeaf711b0b0ed0b1"
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
