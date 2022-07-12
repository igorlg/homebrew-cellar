require "language/node"

class AwsAmplifyCli < Formula
  desc "Amplify CLI"
  homepage "https://github.com/aws-amplify/amplify-cli#readme"
  url "https://registry.npmjs.org/@aws-amplify/cli/-/cli-9.1.0.tgz"
  sha256 "b88470ca974530dfe2ea26154912f0fcf23cd8135b77a23a1c5595135c04f9b2"
  license "Apache-2.0"

  livecheck do
    url :stable
  end

  depends_on "node"

  resource "amplify_binary" do
    url "https://github.com/aws-amplify/amplify-cli/releases/download/v9.1.0/amplify-pkg-macos.tgz"
    sha256 "25ff8105d41489f27e0fb16f44de6d7de995c11b90ee4d2910d315e86e30eca7"
  end

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    resource("amplify_binary").stage do
      bin.install "amplify-pkg-macos" => "amplify"
    end
  end

  test do
    system "#{bin}/amplify", "--version"
  end
end
