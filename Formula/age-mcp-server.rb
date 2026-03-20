class AgeMcpServer < Formula
  include Language::Python::Virtualenv

  desc "Apache AGE MCP Server"
  homepage "https://github.com/rioriost/age-mcp-server"
  url "https://github.com/rioriost/age-mcp-server/releases/download/0.2.43/age_mcp_server-0.2.43.tar.gz"
  sha256 "58c501003161afed1b88d02e065701659855d6cc64272806d3dd83ecaaa3081f"
  license "MIT"

  depends_on "python@3.13"
  resource "agefreighter" do
    url "https://files.pythonhosted.org/packages/df/22/366000df0beb89029d0bf18ecb90eccbd59ccf68fa69143966148cb9d35c/agefreighter-1.0.33.tar.gz"
    sha256 "e88f1904d549868181cb382d96223cf54ce7dd5a05acaaffe203d8478324e440"
  end
  resource "ply" do
    url "https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da/ply-3.11.tar.gz"
    sha256 "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
  end

  def install
    virtualenv_install_with_resources
    system libexec/"bin/python", "-m", "pip", "install", "psycopg[binary,pool]", "mcp"
  end

  test do
    system "#{bin}/age-mcp-server", "--help"
  end
end
