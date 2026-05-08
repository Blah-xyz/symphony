# Agent Roles

The Dayplayer workflow uses specialized agent roles. Skills are capabilities inside role prompts, not scheduling units.

## Roles

- **orchestrator**: owns issue polling, blocker reconciliation, dispatch, retries, cancellation, and role selection.
- **research-agent**: gathers grounded repo, Linear, web, and documentation context; enriches issues; separates verified facts from inference.
- **triage-agent**: applies labels, checks readiness, resolves blocker state, and asks for missing information.
- **planner-agent**: turns enriched issues or PRDs into implementation plans and issue trees.
- **implementation-agent**: implements exactly one Linear issue in one worktree and opens one PR.
- **verification-agent**: runs validation, app/browser/simulator checks, and evidence capture.
- **review-agent**: reviews PRs, CI, and issue closure readiness.
- **doc-gardener**: repairs stale docs, broken cross-links, missing context, and recurring agent-readiness gaps.

## Role Boundaries

- Research does not implement.
- Planning does not perform broad research when a research packet is required.
- Implementation does not silently expand scope.
- Verification does not edit product code except through a follow-up issue.
- Review does not merge product code unless the policy explicitly allows it.
