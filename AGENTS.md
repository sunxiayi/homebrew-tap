# Repository guidance

This repository contains Homebrew formulas for Repo Agent Kit command-line
tools.

- Keep formulas reproducible: use immutable release URLs and verified SHA-256
  checksums.
- Run `brew style`, `brew audit --strict`, and `brew test` for changed formulas.
- Do not add analytics, credentials, mutable download URLs, or post-install
  network calls.
- Keep README installation commands synchronized with the formula name.
