# Draft PR Rules

- Create pull requests as Draft only.
- Do not mark PR as Ready for Review.
- Do not request reviewers automatically unless explicitly configured by the engineer.
- Do not merge PR.
- Before creating Draft PR, check `.github` for an existing PR template.
- If PR template exists, use that template and only edit PR description content.
- Ensure PR description contains `Key Changes Section` and `Technical Solution Section`.
- Add `Impact Analysis Section` only when changes may have meaningful system or behavioral impact.
- Skip `Impact Analysis Section` when changes are minor bug fixes, cosmetic/UI-only, non-significant, isolated, and non-critical.
- Include Jira reference, requirement alignment summary, implementation summary, validation report, manual self-test checklist, risk areas, assumptions, and reviewer notes.
- Stop after Draft PR creation.
