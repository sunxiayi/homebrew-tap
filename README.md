# Repo Agent Kit Homebrew Tap

Install the deterministic coding-agent instruction security scanner on macOS or Linux:

```bash
brew install sunxiayi/tap/repo-agent-scan
```

Then scan a repository without sending its files to a service:

```bash
repo-agent-scan .
```

The formula is pinned to the signed-off source release and checksum in
[`Formula/repo-agent-scan.rb`](Formula/repo-agent-scan.rb). The scanner supports
AGENTS.md, CLAUDE.md, GEMINI.md, Cursor rules, Copilot instructions, Claude
rules, and Windsurf rules. It produces text, JSON, or SARIF 2.1.0 reports.

Source and documentation:

- [Scanner repository](https://github.com/sunxiayi/repo-agent-instruction-security-scan)
- [Browser scanner](https://repoagentkit.com/agent-instruction-security-scanner?utm_source=homebrew-tap&utm_medium=repository&utm_campaign=security-cli&utm_content=readme)

## Updating

```bash
brew update
brew upgrade repo-agent-scan
```

## License

The formula is MIT licensed. The packaged scanner is published under its own
MIT license.
