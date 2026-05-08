# Dayplayer Agent Workflow

This directory contains Dayplayer-specific Linear workflow notes and role prompts for Symphony.
The runnable orchestration app is this repository.

## Runtime

Run Symphony from:

```bash
cd /Users/moostybeard/code/src/github.com/xprojects/harness/symphony/elixir
```

Required local environment:

```bash
export LINEAR_API_KEY=...
export SYMPHONY_WORKSPACE_ROOT=/Users/moostybeard/code/src/github.com/xprojects/harness/blah-symphony-workspaces
export SOURCE_REPO_URL=git@github.com:vstlouis/agent-factory-dayplayer.git
export CODEX_BIN=codex
export CODEX_MODEL=gpt-5.5
```

Install and start:

```bash
brew install mise
mise trust
mise install
mise exec -- mix setup
mise exec -- mix build
mise exec -- ./bin/symphony ./WORKFLOW.md --port 4321 --i-understand-that-this-will-be-running-without-the-usual-guardrails
open http://127.0.0.1:4321/
```

`SYMPHONY_WORKSPACE_ROOT` intentionally points outside the source checkout so per-ticket clones
do not pollute `symphony`.

`SOURCE_REPO_URL` intentionally points at the Dayplayer product repo. The Symphony checkout is the
runner and must not be mutated by Dayplayer Linear issues.

## Linear

- Work source: Linear project `Dayplayer`.
- Project slug: `f4e9aba66020` in `elixir/WORKFLOW.md`.
- Team key: `BLA`.
- Expected states: `Backlog`, `Needs Research`, `Needs Triage`, `Todo`, `In Progress`, `Human Review`, `Merging`, `Rework`, `Done`, `Canceled`, `Duplicate`.

Do not use local issue folders or GitHub for dispatch.

## Workflow Assets

- `agents/` contains role prompts for research, planning, triage, implementation, verification, review, and doc gardening.
- `BOARD-LANES-AND-ROLES.md` defines how Linear states map to role behavior.
- `targets/blah-symphony/` contains the target workflow/config notes.
- `EXECUTION_PROMPT_FOR_CODEX.md` is the supervised worker prompt.

These files are documentation and prompt inputs. The active scheduler remains `elixir/WORKFLOW.md`.
