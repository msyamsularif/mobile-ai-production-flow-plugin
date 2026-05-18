# Run Mobile Ticket Workflow

Use this workflow for the prompt:

```text
Run mobile production workflow for Jira ticket <TICKET_KEY> until Draft PR.
```

Follow the skill `run-mobile-ticket` and policies in `policies/`.

Apply token governance across all phases:

- Policy: `policies/token-governance-rules.md`
- Template: `templates/context-compression-template.md`

Artifacts to produce during a run:

1. Project Screening Report (JSON Contract)
2. Ticket Screening Report (JSON Contract)
3. Discovered References Report
4. Design Research Summary
5. Design Breakdown (YAGNI Applied)
6. Backend Contract Research Summary
7. Deep Codebase Understanding Summary (4-Phase)
8. Mobile Focused Analysis Summary
9. Requirement Alignment Report
10. Technical Requirements Document (TRD)
11. Planning Options and Human Gate Decision
12. Implementation Plan
13. Implementation Summary
14. Testing Plan and Coverage Evidence
15. Validation Report
16. Manual Self-Test Checklist
17. Draft PR Description
18. Context Compression Summaries (as needed)

The workflow ends after Draft PR creation.

Before starting artifacts generation, create a working branch from the current branch:

- With Jira ticket: `feature/<jira-id-lowercase>-<summary-slug>`
- Without Jira ticket (POC/experiment): `experimental/<summary-slug>`

Before deep scan and multi-source research, run project and ticket screening in order:

- Project policy: `policies/project-screening-rules.md`
- Project template: `templates/project-screening-template.json`
- Ticket policy: `policies/ticket-screening-rules.md`
- Ticket template: `templates/ticket-screening-template.json`

Before implementation planning, run design breakdown:

- Policy: `policies/design-breakdown-rules.md`
- Template: `templates/design-breakdown-template.md`

Before requirement alignment and implementation planning, run deep codebase understanding:

- Policy: `policies/deep-codebase-understanding-rules.md`
- Template: `templates/deep-codebase-understanding-template.md`

After deep codebase understanding, run mobile-focused analysis:

- Policy: `policies/mobile-focused-analysis-rules.md`
- Template: `templates/mobile-focused-analysis-template.md`

Before implementation planning, generate TRD:

- Policy: `policies/technical-requirements-generation-rules.md`
- Template: `templates/technical-requirements-template.md`

During implementation planning, generate options and enforce human gate:

- Policy: `policies/planning-options-rules.md`
- Template: `templates/planning-options-template.md`

Before final validation status, enforce testing mechanism:

- Policy: `policies/testing-implementation-rules.md`
- Template: `templates/testing-plan-template.md`

Across all phases, if budget threshold is reached, compress context and continue from compressed summary only:

- Policy: `policies/token-governance-rules.md`
- Template: `templates/context-compression-template.md`
