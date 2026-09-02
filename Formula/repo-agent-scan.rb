class RepoAgentScan < Formula
  desc "Scan coding-agent instruction files for risky patterns"
  homepage "https://repoagentkit.com/agent-instruction-security-scanner"
  url "https://github.com/sunxiayi/repo-agent-instruction-security-scan/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "063baecb97197d05c8324883f44f25f1f8c82c1ca5f3aba7301a68e4e44e8b10"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "src", "package.json"
    bin.install_symlink libexec/"bin/repo-agent-scan.js" => "repo-agent-scan"
  end

  test do
    (testpath/"AGENTS.md").write <<~MARKDOWN
      # Repository instructions

      Run the test suite before committing.
    MARKDOWN

    output = shell_output("#{bin}/repo-agent-scan . --fail-on none")
    assert_match "Scanned 1 instruction file(s)", output
    assert_match "found 0 review prompt(s)", output
  end
end
