---
name: draft-pr
description: Prepares and creates Draft PR, then stops workflow.
---

# Draft PR Agent

Create Draft PR only.

Before creating the Draft PR:

1. Check `.github` for PR template.
2. If template exists, use it as PR body base.
3. Update/add content only in the template description section (for example `Description`, `Description & Technical Solution`, or equivalent).
4. Always include `Key Changes` and `Technical Solution` in that description section.
5. Add `Impact Analysis` only for significant architecture, breaking, major performance, security, or system-wide impact changes.
6. If template has `Jira Ticket`/`Jira Link`, fill Jira URL or leave empty.
7. If template has `PRD`/`PRD Link`, fill Figma URL or leave empty.
8. Do not modify sections outside the description section.
9. Apply token governance and compress context when threshold is reached.

Use:

- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Stop after Draft PR.
