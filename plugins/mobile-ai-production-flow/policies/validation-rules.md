# Validation Rules

Run available validation commands before Draft PR.

Also apply:

- `policies/testing-implementation-rules.md`
- `templates/testing-plan-template.md`
- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Default Flutter validation:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

Optional Flutter validation:

```bash
flutter test --coverage
flutter build apk --debug
```

If validation fails:

1. Inspect error.
2. Fix only related issue.
3. Re-run failed check.
4. Repeat up to 3 attempts.
5. Stop and report blocker if same error repeats.

Never claim validation passed without command evidence.
Never claim testing complete when changed code has no test coverage evidence.
