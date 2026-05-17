---
name: run-mobile-ticket
description: Run the mobile AI production workflow from Jira ticket intake until Draft Pull Request creation.
---

# Run Mobile Ticket Workflow

Use this skill when the engineer asks to work on a Jira ticket until Draft PR.

## Automation Boundary

You may run automatically until Draft PR creation only.

You must not:

- Mark PR as ready for review.
- Merge PR.
- Handle review feedback unless explicitly asked.
- Add new dependencies without approval.
- Modify unrelated files.

## Required Flow

1. Create working branch from current checked out branch.
2. Fetch Jira subtask and parent story.
3. Scan descriptions, comments, attachments, and linked issues.
4. Discover Figma, BE TRD, API contract, and docs references.
5. Research design and backend contract if available.
6. Research codebase.
7. Create requirement alignment report.
8. Create development specification.
9. Create implementation plan.
10. Implement scoped tasks.
11. Run validation.
12. Generate manual self-test checklist.
13. Create Draft PR.
14. Stop.

## Branch Naming Rules

- If Jira ticket exists: `feature/<jira-id-lowercase>-<summary-slug>`
- If Jira ticket does not exist (POC/experiment/etc): `experimental/<summary-slug>`
- Jira ID must be lowercase in branch name.
- Use summary from ticket title or concise task summary.

Examples:

- Jira: `GZ-1234` + `Implementation Feature Flag` -> `feature/gz-1234-implementation-feature-flag`
- No Jira: `POC implementation live sale` -> `experimental/poc-implementation-live-sale`

Helper command:

```bash
scripts/create_work_branch.sh --jira GZ-1234 --summary "Implementation Feature Flag"
scripts/create_work_branch.sh --summary "POC implementation live sale"
```

## Stop Conditions

Stop and ask for human input when:

- Jira Acceptance Criteria are missing or ambiguous.
- Figma and Jira conflict.
- BE contract and Jira conflict.
- API-related task has no accessible backend contract.
- A new dependency is required.
- A shared/core module must be changed.
- Validation repeatedly fails.
