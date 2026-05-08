# Workflow

## Issue Source

BLAH Symphony work lives in Linear. The workflow does not import local issue folders and does not use GitHub Issues as the work queue.

GitHub remains the code host for `vstlouis/agent-factory-dayplayer` and the pull request system.

## Eligibility

A Linear issue is dispatchable only when:

- it is in a dispatchable state such as `Todo` or `In Progress`;
- it is not a tracking, umbrella, or planning-only issue;
- all Linear blockers are resolved;
- the description and comments are specific enough for an AFK Codex run;
- it belongs to the intended BLAH Symphony Linear project;
- it is not waiting on human product judgment, unavailable credentials, or destructive access.

## Lifecycle

1. `discovered`: Linear issue is visible to Symphony's tracker.
2. `needs_research`: research-agent should enrich the issue before planning.
3. `needs_triage`: triage-agent must clarify missing scope, blockers, or state.
4. `ready`: orchestrator can dispatch.
5. `claimed`: workspace creation has started.
6. `running`: role agent is active.
7. `validating`: final checks are running.
8. `pr_opened`: PR exists against `main`.
9. `reviewing`: review-agent or human review is active.
10. `needs_fix`: safe follow-up edits are required.
11. `needs_human`: judgment, access, or ambiguity blocks automation.
12. `complete`: Linear issue reaches `Done` or another terminal state.
13. `failed`: run exceeded retry policy or hit an unrecoverable error.

## Implementation Loop

- Fetch the Linear issue, comments, links, blockers, attachments, and branch name through Symphony's Linear context, `linear_graphql`, or Linear MCP.
- Read BLAH Symphony root `README.md`, `SPEC.md`, `elixir/AGENTS.md`, `elixir/README.md`, `elixir/WORKFLOW.md`, and relevant `.codex/skills/*`.
- Create a worktree from `main`.
- Branch using Linear's branch name when available, otherwise `codex/<linear-identifier>-<title-kebab>`.
- Copy only `.env.local`, `.env.development.local`, and `.env.test.local` when present.
- Run focused checks during implementation.
- Run the issue-required final validation before opening a PR.
- Open the PR to `main` and attach/link it to the Linear issue.
- Maintain a single `## Codex Workpad` Linear comment with plan, acceptance criteria, validation, and handoff details.

## Stop Conditions

Stop and mark the issue `needs-human` when the work needs unavailable secrets, production access, unclear product judgment, destructive data changes, or a policy exception not documented in the issue.
