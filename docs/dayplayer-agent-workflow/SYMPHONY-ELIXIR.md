# Symphony Elixir

The active orchestration app is `Blah-xyz/symphony`, cloned locally at:

```text
/Users/moostybeard/code/src/github.com/xprojects/harness/symphony
```

Use the Elixir implementation under `elixir/`. Do not resurrect the old TypeScript/GitHub overlay.

## Runtime Shape

- Tracker: `tracker.kind: linear`
- Project slug: `f4e9aba66020` in `elixir/WORKFLOW.md`
- Token: `LINEAR_API_KEY`
- Runner: `cd elixir && mise exec -- ./bin/symphony ./WORKFLOW.md`
- Dashboard: pass `--port 4321`
- Codex mode: `codex app-server`
- Linear helper: Symphony injects `linear_graphql` during app-server sessions

## Reference Docs

- `symphony/README.md`
- `symphony/SPEC.md`
- `symphony/elixir/README.md`
- `symphony/elixir/AGENTS.md`
- `symphony/elixir/WORKFLOW.md`
- `symphony/.codex/skills/linear/SKILL.md`

## Local Commands

```bash
cd /Users/moostybeard/code/src/github.com/xprojects/harness/symphony/elixir
brew install mise
mise trust
mise install
mise exec -- mix setup
mise exec -- mix build
export LINEAR_API_KEY=...
export SYMPHONY_WORKSPACE_ROOT=/Users/moostybeard/code/src/github.com/xprojects/harness/blah-symphony-workspaces
export SOURCE_REPO_URL=git@github.com:vstlouis/agent-factory-dayplayer.git
export CODEX_BIN=codex
export CODEX_MODEL=gpt-5.5
mise exec -- ./bin/symphony ./WORKFLOW.md --port 4321
```

## Workflow Notes

Use Linear as the durable source of issue state, comments, blockers, and workpad updates. Do not import work from local markdown issue folders, and do not switch the tracker to GitHub Issues.

The default workflow depends on Linear states such as `Needs Research`, `Needs Triage`, `Todo`, `In Progress`, `Human Review`, `Merging`, `Rework`, and terminal states such as `Done`, `Closed`, `Cancelled`, or `Duplicate`. Configure those states in Linear before trusting unattended runs.
