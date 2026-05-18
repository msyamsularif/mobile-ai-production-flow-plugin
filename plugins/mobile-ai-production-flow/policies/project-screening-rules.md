# Project Screening Rules

Use these rules for project-level screening before ticket-level execution.
This policy is provider-agnostic and should work across Claude, Copilot, and Codex adapters.

## Objective

- Determine whether a project is ready for repeated ticket execution.
- Build a reusable baseline context to reduce per-ticket token usage.
- Identify blockers early before deep multi-ticket work starts.

## Required Minimum Inputs

- Project identifier and name
- Business objective
- Initial scope boundary (in-scope and out-of-scope)
- Primary owner and decision maker
- Delivery platform(s): iOS, Android, Flutter, React Native, or mixed

If any minimum field is missing, return `decision=needs_input`.

## Screening Dimensions

1. Business and scope readiness
- Is objective testable?
- Is scope bounded for an incremental release?

2. Delivery readiness
- Are repos/environments accessible?
- Are ownership and handoff expectations clear?

3. Architecture and dependency readiness
- Are external dependencies identified?
- Are critical interfaces and contracts discoverable?

4. Governance readiness
- Are risk, compliance, and security requirements stated?
- Are release constraints and approvals known?

## Budget Policy (project-level baseline)

- Total project screening budget: `<= 5000` input tokens equivalent.
- Per-source soft cap: `<= 800` input tokens equivalent.
- Prioritize source summaries over full documents.
- Stop loading additional sources once decision confidence is sufficient.

Note: token accounting differs by provider. Adapters should map these logical caps to platform-native counters.

## Output Contract

Output must follow `templates/project-screening-template.json`.
Do not output free-form narrative outside schema.

## Decision Rules

- `go`: project baseline is adequate for ticket-level screening.
- `needs_input`: project can continue only after concrete clarifications.
- `stop`: project is currently out of automation scope or access is blocked.

## Baseline Reuse Rule

When `decision=go`, emit baseline references that ticket-level screening can reuse:

- source_of_truth references
- global definition of done
- shared constraints and risks
- baseline version/hash hint

Ticket screening should consume this baseline instead of re-expanding project context.

