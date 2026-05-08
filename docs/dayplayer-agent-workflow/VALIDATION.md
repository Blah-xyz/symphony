# Validation

Validation has two layers: prompt-pack checks and BLAH Symphony runner/product checks.

## Workflow Checks

- `git diff --check`
- stale-reference scans for removed repo names, removed branch names, unsupported tracker configuration, and removed local issue-store conventions
- role prompt consistency checks
- target config checks

## Runner Checks

Use the Symphony runner repo's `elixir/AGENTS.md`, `elixir/README.md`, and `Makefile` as source of truth. For runner changes, final validation normally includes:

- `cd elixir && mise exec -- mix setup`
- `cd elixir && mise exec -- mix build`
- `cd elixir && mise exec -- make all`
- `cd elixir && mise exec -- mix specs.check`
- live Linear/Codex E2E only when the issue explicitly calls for it

## Dayplayer Checks

Use the Dayplayer product repo's `AGENTS.md`, `README.md`, `package.json`, and `docs/agents/*` as
source of truth. For product implementation work, final validation normally starts with:

- `bun run lint`
- `bun run i18n:check`
- `bun run test`
- `bun run convex:codegen` when Convex schema, functions, or generated types changed
