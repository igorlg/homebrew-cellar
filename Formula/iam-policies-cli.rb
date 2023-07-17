require "language/node"

class IamPoliciesCli < Formula
  desc "A CLI tool for building simple to complex IAM policies"
  homepage "https://github.com/mhlabs/iam-policies-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/iam-policies-cli/-/iam-policies-cli-1.0.5.tgz"
  sha256 "727800a47f176e4c7dd6c9c024dc2b9de30064a647bda4ac8694589f35e6ccfc"
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
    system "#{bin}/iam-pol", "-v"
  end
end
