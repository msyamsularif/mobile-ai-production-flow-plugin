---
name: implementation-plan
description: Break the technical requirements document (TRD) into scoped atomic implementation tasks.
---

# Implementation Plan

Create an ordered task breakdown.

Before task breakdown, generate multi-option planning output using:

- `policies/planning-options-rules.md`
- `templates/planning-options-template.md`

Apply token governance during planning and task breakdown:

- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Each task must include:

- Goal
- Affected files
- Expected changes
- Validation steps
- Risk level
- Rollback notes
- Dependency on previous task (if any)

Atomic task rule:

- One task must represent one small, testable outcome only.
- Do not combine unrelated modules or concerns in one task.

Do not proceed to implementation tasks before human selects an option.

Prefer small scoped changes. Do not introduce new dependencies without approval.
