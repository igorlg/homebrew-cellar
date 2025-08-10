class McpLanguageServer < Formula
  desc "MCP server that exposes language server capabilities to LLMs"
  homepage "https://github.com/isaacphi/mcp-language-server"
  url "https://github.com/isaacphi/mcp-language-server/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "cc8a052d6c0283545edaf6d50e452660baa726bc18e76591680f9a611f9d2b48"
  license "BSD-3-Clause"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "mcp-language-server"
    bin.install "mcp-language-server"
  end

  test do
    assert_match "Usage of", shell_output("#{bin}/mcp-language-server --help 2>&1")
  end
end
