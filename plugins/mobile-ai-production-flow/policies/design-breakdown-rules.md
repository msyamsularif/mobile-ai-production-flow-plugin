# Design Breakdown Rules

Use this policy after design research and before implementation planning.

## Objective

- Break UI/UX design into atomic implementation slices.
- Apply YAGNI so only required scope for current ticket is implemented.
- Produce a build order that minimizes rework and token usage.

## Input Requirements

- Ticket screening result (`go` only)
- Design research summary (Figma or equivalent)
- Requirement alignment report

If one input is missing, return `needs_input` and list missing artifacts.

## Breakdown Method

1. Decompose by user journey
- List only user flows directly tied to acceptance criteria.

2. Decompose by screen section
- Header, content body, actions, state views, feedback states.
- Keep sections independent when possible.

3. Decompose by state and behavior
- Loading, empty, error, success, disabled, retry.
- Include only states required by acceptance criteria.

4. Decompose by dependency
- Reusable existing component
- New component (only if unavoidable)
- API/data integration touchpoints

## YAGNI Decision Gate (Mandatory)

For each candidate item, classify:

- `now`: required to satisfy AC in this ticket
- `later`: useful but not required now
- `drop`: speculative/no clear user value for current scope

Rules:

- Implement `now` only.
- Move `later` items to follow-up backlog suggestions.
- Exclude `drop` items from plan and implementation.
- If unsure, default to `later`, not `now`.

## Output Contract

Output must follow `templates/design-breakdown-template.md`.
No extra narrative outside the template.

