# Testing Implementation Rules

Use this policy when adding or updating tests for ticket implementation.

## Objective

- Ensure tests align with existing project testing behavior and structure.
- Ensure all new/changed code paths are covered by tests.
- Keep validation reliable before Draft PR.

## Mandatory Steps

1. Discover existing test coverage types
- Check what exists in the project:
  - unit test
  - widget/UI test
  - integration/e2e test
- Record which levels are already used and relevant for the ticket.

2. Follow project testing conventions
- Match existing test code format and naming style.
- Follow existing folder structure and file organization for tests.
- Reuse existing helpers, fixtures, and test utilities when possible.

3. Cover all changed behavior
- Add tests to cover all new or modified logic lines and branches.
- Include happy path, error path, and critical edge cases relevant to AC.
- If full changed-line coverage cannot be achieved, explicitly document gaps and risk.

## Coverage Gate

- Target: complete coverage for changed lines/branches in ticket scope.
- Do not mark testing complete when changed code remains untested.
- If tooling supports coverage reports, include command evidence in validation report.

## Output Contract

Output must follow `templates/testing-plan-template.md`.
Apply token governance with `policies/token-governance-rules.md` for testing/validation summaries.
