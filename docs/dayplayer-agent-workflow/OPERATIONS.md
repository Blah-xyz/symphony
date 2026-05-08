# Operations

## Startup

1. Verify `/Users/moostybeard/code/src/github.com/xprojects/harness/symphony` exists and points at `Blah-xyz/symphony`.
2. Verify `main` is current in the Symphony checkout.
3. Verify `LINEAR_API_KEY` is set.
4. Verify Codex app-server authentication.
5. Verify `mise`, Elixir, and Erlang install cleanly.
6. Start the Elixir Symphony runner with a Linear workflow.

## Local Setup

```bash
/Users/moostybeard/code/src/github.com/xprojects/harness/symphony/start-symphony.sh
```

The script starts Symphony from `symphony/elixir`, loads the root `symphony/.envrc` through
`direnv` when available, builds the Elixir runner, and serves the dashboard on
`http://127.0.0.1:4321/`.

Keep real values in the untracked `symphony/.envrc`:

```bash
export LINEAR_API_KEY=...
export SYMPHONY_WORKSPACE_ROOT=/Users/moostybeard/code/src/github.com/xprojects/harness/blah-symphony-workspaces
export SOURCE_REPO_URL=git@github.com:vstlouis/agent-factory-dayplayer.git
export CODEX_BIN=codex
export CODEX_MODEL=gpt-5.5
```

Use a copied workflow file only if the default `elixir/WORKFLOW.md` needs temporary local
experiments. The committed default is the Dayplayer Linear workflow.

## Cleanup Lane

The cleanup lane should clean repo-process docs, stale references, workflow prompts, Linear issue quality, and context-engineering gaps without touching runtime product code unless a dedicated Linear issue owns that change.

## Failure Handling

Preserve failed workspaces and evidence. Requeue only after the failure is understood. Repeated failure should create or update a Linear issue with the missing guardrail, doc, tool, or secret.
