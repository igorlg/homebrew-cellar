require "language/node"

class IamPoliciesCli < Formula
  desc "A CLI tool for building simple to complex IAM policies"
  homepage "https://github.com/mhlabs/iam-policies-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/iam-policies-cli/-/iam-policies-cli-1.0.7.tgz"
  sha256 "03508a05a81fd6116a1dd7fa1b3140b2ab1ddf04e8be0f87620ab37e7b957ff1"
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
