---
name: draft-pr
description: Create reviewer-friendly Draft PR description and stop workflow.
---

# Draft Pull Request

Prepare and create a Draft PR only.

Before creating Draft PR:

1. Check `.github` for pull request template first.
2. If template exists, use that template as the PR body base.
3. Edit only PR description content area and add/adjust these sections:
   - `Key Changes Section`
   - `Technical Solution Section`
   - `Impact Analysis Section` (optional by rules below)

Skip `Impact Analysis Section` when:

- Changes are minor bug fixes
- Updates are purely cosmetic/UI improvements
- No significant system impact exists
- Changes are isolated and non-critical

Helper command:

```bash
scripts/detect_pr_template.sh
```

PR body must include:

- Jira ticket reference
- Parent story/subtask context
- Figma references if any
- BE TRD/API contract references if any
- Requirement alignment summary
- Implementation summary
- Acceptance Criteria checklist
- Validation report
- Manual self-test checklist
- Screenshots/videos placeholder
- Risk areas
- Assumptions/open questions
- Reviewer notes

After Draft PR is created, stop.
