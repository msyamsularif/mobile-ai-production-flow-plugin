# Example Prompts

## Full workflow until Draft PR

```text
Run mobile production workflow for Jira ticket VOILA-123 until Draft PR.

Context:
- Assignee: Muhammad Syamsul Arif
- Platform: Flutter
- Target branch: develop
- PR must be created as Draft
- Stop after Draft PR is created
- Do not mark PR as ready
- Do not merge
- Do not handle review feedback automatically
```

## Research only

```text
Run mobile workflow for VOILA-123 in research-only mode.
Include Jira, Figma, BE TRD/API contract, and codebase research.
Do not implement anything.
```

## Review feedback

```text
Handle PR review feedback for PR #456.
Create a fix plan first and wait for my approval before implementation.
```
