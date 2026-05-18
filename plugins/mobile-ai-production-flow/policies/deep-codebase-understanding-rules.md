# Deep Codebase Understanding Rules

Use this policy before implementation planning and coding.

## Objective

- Build reliable code context before making changes.
- Reduce regression risk by understanding existing architecture and behavior.
- Standardize codebase research depth across tickets.

## 4-Phase Method (Mandatory)

1. Architecture Discovery
- Map project structure and module boundaries.
- Identify tech stack, app layers, and integration surfaces.

2. Code Pattern Analysis
- Detect conventions and design patterns already used.
- Capture naming, error handling, state management, and testing patterns.

3. Deep Code Understanding
- Trace core functionality related to the ticket.
- Map dependencies, data flow, and side effects across modules.

4. Context Building
- Review relevant git history for intent and prior decisions.
- Validate runtime behavior assumptions (logs, execution paths, feature flags, config).

## Output Contract

Output must follow `templates/deep-codebase-understanding-template.md`.

## Guardrails

- Prefer reuse of existing patterns over introducing new abstractions.
- If behavior is unclear, mark as `unknown` and ask targeted questions.
- Do not modify files during this research phase.

