# BLAH Symphony Workflow

This target workflow defines how the prompt pack should be applied to `vstlouis/agent-factory-dayplayer` through the `Blah-xyz/symphony` runner.

## Work Source

- Linear issues in the BLAH Symphony project.
- No local markdown issue queue.
- No GitHub Issues dispatch.

## Branching

- Base branch: `main`.
- PR target: `main`.
- Worktree branch: use Linear's branch name when available, otherwise `codex/<linear-identifier>-<title-kebab>`.

## Context Read Order

1. `elixir/AGENTS.md`.
2. Root `README.md`.
3. Root `SPEC.md`.
4. `elixir/README.md`.
5. `elixir/WORKFLOW.md`.
6. `.codex/skills/linear/SKILL.md`.
7. `.codex/skills/pull/SKILL.md`, `.codex/skills/commit/SKILL.md`, `.codex/skills/push/SKILL.md`, and `.codex/skills/land/SKILL.md` when relevant.
8. The assigned Linear issue, comments, blockers, links, attached PRs, and workpad.

## Env Copy

When creating a workspace, copy only these files from a trusted source checkout when explicitly needed:

- `.env.local`
- `.env.development.local`
- `.env.test.local`

Never copy production env files. Never commit env files.

## Completion

Open one PR against `main`. The PR body must include summary, acceptance checklist, validation commands and results, evidence path when relevant, unresolved risks, and follow-up issue suggestions. Attach or link the PR to the Linear issue and move the Linear issue to `Human Review` only after validation and PR feedback checks are complete.
