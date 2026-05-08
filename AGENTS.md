# Agent Guide

Use `elixir/AGENTS.md` for codebase rules before editing the Elixir runner.
Dayplayer workflow prompts live in `docs/dayplayer-agent-workflow/`.

## Run Symphony

Required local env: `LINEAR_API_KEY`, `SYMPHONY_WORKSPACE_ROOT`, `SOURCE_REPO_URL`,
`CODEX_BIN`, and `CODEX_MODEL`.

```bash
cd elixir
brew install mise
mise trust
mise install
mise exec -- mix setup
mise exec -- mix build
mise exec -- ./bin/symphony ./WORKFLOW.md --port 4321 --i-understand-that-this-will-be-running-without-the-usual-guardrails
open http://127.0.0.1:4321/
```

The dashboard runs on `http://127.0.0.1:4321/`.
