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
2. Run project-level screening with `policies/project-screening-rules.md` and output `templates/project-screening-template.json`.
3. Run ticket-level screening with `policies/ticket-screening-rules.md` and output `templates/ticket-screening-template.json`.
4. Fetch Jira subtask and parent story.
5. Scan descriptions, comments, attachments, and linked issues.
6. Discover Figma, BE TRD, API contract, and docs references.
7. Research design and backend contract if available.
8. Run design breakdown with YAGNI using `policies/design-breakdown-rules.md` and `templates/design-breakdown-template.md`.
9. Research codebase with mandatory 4-phase deep understanding using `policies/deep-codebase-understanding-rules.md` and `templates/deep-codebase-understanding-template.md`.
10. Run mobile-focused analysis using `policies/mobile-focused-analysis-rules.md` and `templates/mobile-focused-analysis-template.md`.
11. Create requirement alignment report.
12. Generate technical requirements document using `policies/technical-requirements-generation-rules.md` and `templates/technical-requirements-template.md`.
13. Generate planning options using `policies/planning-options-rules.md` and `templates/planning-options-template.md`, then wait for human option selection.
14. Create implementation plan based on selected option.
15. Implement scoped tasks.
16. Run validation and enforce testing mechanism using `policies/testing-implementation-rules.md` and `templates/testing-plan-template.md`.
17. Generate manual self-test checklist.
18. Create Draft PR.
19. Stop.

## Token Governance (Mandatory)

Apply token governance in every phase using:

- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Rules:

- Check phase budget before and after each phase.
- If budget reaches threshold, compress context and continue from compressed summary only.
- Carry forward only minimum required context defined by token governance rules.

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

- Project screening decision is `needs_input` or `stop`.
- Jira Acceptance Criteria are missing or ambiguous.
- Figma and Jira conflict.
- BE contract and Jira conflict.
- API-related task has no accessible backend contract.
- A new dependency is required.
- A shared/core module must be changed.
- Human has not selected planning option.
- Budget threshold reached and context compression is not applied.
- Validation repeatedly fails.
