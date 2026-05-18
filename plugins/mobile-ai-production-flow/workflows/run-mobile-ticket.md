# Run Mobile Ticket Workflow

Use this workflow for the prompt:

```text
Run mobile production workflow for Jira ticket <TICKET_KEY> until Draft PR.
```

Follow the skill `run-mobile-ticket` and policies in `policies/`.

Artifacts to produce during a run:

1. Discovered References Report
2. Design Research Summary
3. Backend Contract Research Summary
4. Codebase Research Summary
5. Requirement Alignment Report
6. Development Specification
7. Implementation Plan
8. Implementation Summary
9. Validation Report
10. Manual Self-Test Checklist
11. Draft PR Description

The workflow ends after Draft PR creation.

Before starting artifacts generation, create a working branch from the current branch:

- With Jira ticket: `feature/<jira-id-lowercase>-<summary-slug>`
- Without Jira ticket (POC/experiment): `experimental/<summary-slug>`
