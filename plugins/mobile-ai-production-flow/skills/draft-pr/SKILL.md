---
name: draft-pr
description: Create reviewer-friendly Draft PR description and stop workflow.
---

# Draft Pull Request

Prepare and create a Draft PR only.

Before creating Draft PR:

1. Check `.github` for pull request template first.
2. If template exists, use that template as the PR body base.
3. Update/add content only in description section (for example `Description`, `Description & Technical Solution`, or equivalent). Do not update any other sections.
4. In that description section, add/adjust:
   - `Key Changes`
   - `Technical Solution`
   - `Impact Analysis` (optional by rules below)
5. If template includes `Jira Ticket` or `Jira Link`, fill with Jira ticket URL, or leave empty if unavailable.
6. If template includes `PRD Link` or `PRD`, fill with Figma design URL, or leave empty if unavailable.

Add `Impact Analysis` only when:

- There are significant architectural changes
- Breaking changes are introduced
- Major performance implications exist
- Security considerations are present
- System-wide effects need highlighting

Skip `Impact Analysis` when:

- Changes are minor bug fixes
- Updates are purely cosmetic/UI improvements
- No significant system impact exists
- Changes are isolated and non-critical

Helper command:

```bash
scripts/detect_pr_template.sh
```

Apply token governance for final PR description context:

- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Respect existing template shape; only update the description section content.

After Draft PR is created, stop.
