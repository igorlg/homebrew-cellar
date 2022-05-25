require "language/node"

class IamPoliciesCli < Formula
  desc "A CLI tool for building simple to complex IAM policies"
  homepage "https://github.com/mhlabs/iam-policies-cli"
  url "https://github.com/mhlabs/iam-policies-cli/archive/refs/tags/1.0.4.zip"
  sha256 "6d4db597234f3793e827443c29b611bda62ac805db738022bd7805e4d2fdeebe"
  license ""

  depends_on "node"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/iam-pol", "-v"
  end
end
