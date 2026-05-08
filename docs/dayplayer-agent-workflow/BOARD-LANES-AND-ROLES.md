# Board Lanes And Roles

Linear states are the durable board lanes. Agent roles are prompt behaviors selected by the
workflow while an issue is in a lane.

## Linear State Contract

Use this lane order for Dayplayer workflow work:

```text
Backlog -> Needs Research -> Needs Triage -> Todo -> In Progress -> Human Review -> Merging -> Done
```

- `Backlog`: parked or not ready. Symphony does not dispatch it.
- `Needs Research`: research-agent gathers verified context and posts a research packet.
- `Needs Triage`: triage-agent reconciles labels, blockers, readiness, and target repo.
- `Todo`: implementation-agent can start an unblocked issue.
- `In Progress`: active implementation or continuation.
- `Human Review`: validated PR or true human/access blocker.
- `Merging`: approved issue ready for the land flow.
- `Rework`: reviewer-requested changes that need another implementation pass.
- `Done`, `Canceled`, `Duplicate`: terminal states.

## Agent Roles

- `research-agent`: reads repo, Linear, and approved references; writes research packets; does not edit code.
- `triage-agent`: fixes issue metadata/readiness; does not edit code.
- `planner-agent`: creates implementation-ready issue plans and issue trees.
- `implementation-agent`: implements exactly one `Todo` issue and opens one PR.
- `verification-agent`: proves a change works and records evidence.
- `review-agent`: reviews PRs for correctness, scope, and evidence.
- `doc-gardener`: cleans stale docs and workflow context through dedicated cleanup issues.

## Repo Boundaries

- `Blah-xyz/symphony` is the runner, prompt, and workflow configuration repo.
- `vstlouis/agent-factory-dayplayer` is the Dayplayer product repo for implementation work.
- Research and triage lanes must not modify product code or Symphony code. They update Linear
  comments, labels, blockers, and state.
- Symphony workflow closeout issues can update Symphony docs only when the issue explicitly says
  the target repo is Symphony.
- Workspace creation clones Dayplayer only. It intentionally does not run `bun install`
  automatically, because research and triage lanes are no-code lanes and should not create large
  dependency trees. Implementation agents may install dependencies inside their workspace when
  issue validation requires it.

## Smoke Flow

For the first live proof, move the smoke issue from `Backlog` to `Needs Research`. Do not move it
directly to `Todo`.
