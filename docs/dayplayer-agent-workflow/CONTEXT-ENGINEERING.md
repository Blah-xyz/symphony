# Context Engineering

The Dayplayer workflow is designed for agent legibility.

## Principles

- `AGENTS.md` is a compact map.
- Durable knowledge lives in indexed repo docs.
- Context should be discoverable by tools, not hidden in chat.
- Plans and issues should be enriched before implementation.
- Architecture and product taste should be enforced mechanically when possible.
- Failures should feed back into docs, checks, prompts, or role boundaries.

## BLAH Symphony Expectations

- Keep BLAH Symphony repo docs concise and current.
- Prefer links to authoritative docs over duplicated long manifests.
- Keep parent PRDs and implementation contracts in Linear and repo docs.
- Add stale-reference checks for old repo names, old branch names, unsupported trackers, and removed workflow conventions.
- Use doc-gardening issues for cleanup that is broader than one implementation slice.

## Research Agent

The research-agent hydrates Linear issues before planning. It gathers source links, relevant repo facts, current implementation state, external reference summaries, and open risks. Its output is a Linear workpad update or issue-body section that planner-agent can consume without repeating the same research.
