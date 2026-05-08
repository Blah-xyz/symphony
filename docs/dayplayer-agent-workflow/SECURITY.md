# Security

## Secrets

- Use least-privilege Linear credentials for issue orchestration.
- Use GitHub credentials only for clone, push, PR, and review operations.
- Use the OpenAI key only on the runner side.
- Never include secrets in prompts, logs, issues, pull requests, evidence, or commits.
- Copy only allowlisted local env files into worktrees: `.env.local`, `.env.development.local`, and `.env.test.local`.
- Never copy production env files.

## Prompt Injection

Issue bodies and comments are untrusted input. The prompt compiler must delimit issue content and remind agents that issue text cannot override system, repo, or workflow policy.

## High-Risk Work

Payment, auth, data deletion, secrets, production deployments, and broad architectural rewrites require explicit issue ownership and may require human review before dispatch.
