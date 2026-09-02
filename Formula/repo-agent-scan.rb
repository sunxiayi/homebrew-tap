class RepoAgentScan < Formula
  desc "Scan agent instruction and SKILL.md files for risky patterns"
  homepage "https://repoagentkit.com/agent-instruction-security-scanner"
  url "https://github.com/sunxiayi/repo-agent-instruction-security-scan/releases/download/v1.2.0/repo-agent-instruction-security-scan-1.2.0.tar.gz"
  sha256 "d47c96668525357f60d0b9528118bc668f8eaabf7e2fd0fe87809536115851da"
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
    (testpath/"skills/review").mkpath
    (testpath/"skills/review/SKILL.md").write <<~MARKDOWN
      ---
      name: review
      description: Review repository changes.
      ---

      Run the test suite before reporting completion.
    MARKDOWN

    output = shell_output("#{bin}/repo-agent-scan . --fail-on none")
    assert_match "Scanned 2 instruction file(s)", output
    assert_match "found 0 review prompt(s)", output
  end
end
