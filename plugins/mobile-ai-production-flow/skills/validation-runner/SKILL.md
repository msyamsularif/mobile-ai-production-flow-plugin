---
name: validation-runner
description: Run formatter, analyzer, linter, tests, and fix related failures.
---

# Validation Runner

Run validation before Draft PR.

Apply testing policy/template:

- `policies/testing-implementation-rules.md`
- `templates/testing-plan-template.md`

Apply token governance for validation summaries:

- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Default Flutter commands:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

If validation fails:

1. Inspect error.
2. Fix only related issue.
3. Re-run failed check.
4. Stop after 3 repeated failures and report blocker.

Never suppress warnings without documented reason.
