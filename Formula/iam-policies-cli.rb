require "language/node"

class IamPoliciesCli < Formula
  desc "A CLI tool for building simple to complex IAM policies"
  homepage "https://github.com/mhlabs/iam-policies-cli#readme"
  url "https://registry.npmjs.org/@mhlabs/iam-policies-cli/-/iam-policies-cli-1.0.4.tgz"
  sha256 "e0e78bee724ef632fb772995d440ddf26eeb1fb1c71e09546b260d87dd10d005"
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
