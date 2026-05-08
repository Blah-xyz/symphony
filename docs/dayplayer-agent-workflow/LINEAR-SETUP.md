# Linear Setup

Use Linear as the work source for BLAH Symphony. Do not import issues from local markdown folders for active execution.

## Required Linear Setup

1. Use the Dayplayer project in the BLAH Linear workspace:
   `https://linear.app/blah-xyz/project/dayplayer-f4e9aba66020/overview`.
2. Set `tracker.project_slug: "f4e9aba66020"` in `elixir/WORKFLOW.md`.
3. Create a Linear personal API key and export it as `LINEAR_API_KEY`.
4. Confirm the relevant Linear team has the states expected by the workflow:
   - `Backlog`
   - `Needs Research`
   - `Needs Triage`
   - `Todo`
   - `In Progress`
   - `Human Review`
   - `Merging`
   - `Rework`
   - terminal states: `Done`, `Closed`, `Cancelled` or `Canceled`, `Duplicate`

## Local Environment

```bash
export LINEAR_API_KEY=...
export SYMPHONY_WORKSPACE_ROOT=/Users/moostybeard/code/src/github.com/xprojects/harness/blah-symphony-workspaces
export SOURCE_REPO_URL=git@github.com:vstlouis/agent-factory-dayplayer.git
export CODEX_BIN=codex
export CODEX_MODEL=gpt-5.5
```

Keep real token values in your local shell, shell profile, or an untracked local env file. Do not commit them.

Use `.env.example` as the placeholder checklist. It intentionally contains only Linear/Symphony variables and no GitHub issue tracker variables.

Keep the real `.envrc` in the `symphony` repository root or another trusted untracked location. Direnv only loads `.envrc` files from the current directory or its parents, not from sibling directories.

## Workflow Expectations

- Use `tracker.kind: linear`.
- Use `tracker.project_slug: "f4e9aba66020"`.
- Leave `tracker.api_key` unset or set it to `$LINEAR_API_KEY`.
- Use `Needs Research` for research-agent packets and `Needs Triage` for metadata/readiness reconciliation before `Todo`.
- Keep `SOURCE_REPO_URL` pointed at `vstlouis/agent-factory-dayplayer`; Symphony is the runner, not the dispatch target.
- Use Linear blockers/relations instead of markdown-only blocker text.
- Keep one persistent `## Codex Workpad` comment per active issue.
- Attach or link the GitHub PR to the Linear issue.
- Move issues through Linear states only when the corresponding quality bar is met.

## What Not To Do

- Do not use local issue folders as the active work queue.
- Do not use GitHub Issues for dispatch.
- Do not copy the old TypeScript/GitHub tracker plan back into this repo.
- Do not commit secrets, local env files, logs with tokens, or Codex auth files.
