# Architecture

The BLAH Symphony Dayplayer workflow is a prompt and operations layer for Codex agents working in `vstlouis/agent-factory-dayplayer`. The active runner is the Elixir Symphony implementation in this repository. The issue tracker is Linear.

## Components

- **Linear tracker** is provided by Symphony's default `tracker.kind: linear` runtime.
- **Orchestrator** owns polling, issue eligibility, blocker reconciliation, retries, cancellation, and Codex session dispatch.
- **Workspace manager** creates one isolated workspace per Linear issue from `main`, runs configured hooks, and preserves failed workspaces for diagnosis.
- **Prompt compiler** combines Linear issue context, BLAH Symphony repo docs, role prompt expectations, validation requirements, and safety constraints.
- **Codex runner** starts Codex in app-server mode, injects the `linear_graphql` tool, monitors progress, and stops sessions when issues become terminal.
- **Evidence policy** records prompts, issue/workspace metadata, changed files, command logs, validation output, PR URLs, and final workpad updates.

## Context Engineering

The workflow treats repo-local knowledge as the system of record. `AGENTS.md` stays short and points agents to durable docs. Detailed context is indexed, owned, and mechanically checked. When an agent fails because context was missing, the fix is to add a rule, doc, check, or tool that makes the missing context visible next time.

## Parallel Lanes

BLAH Symphony cleanup can run beside runtime work only when file ownership does not overlap. The research-agent, doc-gardener, and verification-agent prompts remain useful as bounded roles, but Symphony's default runtime remains the dispatch mechanism.
