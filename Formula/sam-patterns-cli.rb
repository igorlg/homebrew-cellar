require "language/node"

class SamPatternsCli < Formula
  desc "CLI tool for importing patterns from https://serverlessland.com/patterns into your SAM template"
  homepage "https://github.com/mhlabs/sam-patterns-cli"
  url "https://github.com/mhlabs/sam-patterns-cli/archive/refs/tags/0.0.27.zip"
  sha256 "43855a6f29a8d3b39720daf171c0c3df97e30c329c0c5eccc1eb8fd6003c8be2"
  license ""

  depends_on "node"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "sam-patterns", "-v"
  end
end
