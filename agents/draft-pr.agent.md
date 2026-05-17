---
name: draft-pr
description: Prepares and creates Draft PR, then stops workflow.
---

# Draft PR Agent

Create Draft PR only.

Before creating the Draft PR:

1. Check `.github` for PR template.
2. If template exists, use it as PR body base.
3. Edit only the PR description content and add/adjust:
   - `Key Changes Section`
   - `Technical Solution Section`
   - `Impact Analysis Section` (optional for low-impact/cosmetic/minor isolated changes)

Then include Jira, Figma, BE contract, alignment summary, implementation summary, AC checklist, validation report, manual self-test, risks, and reviewer notes. Stop after Draft PR.
