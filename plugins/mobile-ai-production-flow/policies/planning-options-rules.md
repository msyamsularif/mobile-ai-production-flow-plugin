# Planning Options Rules

Use this policy during implementation planning phase before writing code.

## Objective

- Present multiple viable implementation options from simplest to more advanced.
- Make tradeoffs explicit so human can choose implementation direction.
- Enforce a human gate before implementation starts.

## Mandatory Behavior

1. Generate multiple options (minimum 3)
- Order options from simplest to most advanced.
- Each option must be executable within project constraints.

2. Each option must include
- Philosophy (maximum 15 words)
- Pros
- Cons
- Comparison matrix against alternatives

3. Jira full-context retrieval when ticket reference exists
- Fetch Jira description, comments, linked context, and attachments via MCP Atlassian.
- For video attachments, extract representative frames and summarize key behavior.

4. Human gate (mandatory)
- Do not proceed to implementation until human selects one option.
- If no option is selected, stop and request decision.

5. Atomic task planning after option selection (mandatory)
- Break selected option into atomic tasks before coding.
- Atomic task criteria:
  - one clear goal/outcome
  - minimal file scope
  - independently testable/validatable
  - explicit dependency order
- Avoid bundling unrelated changes in one task.

## Output Contract

Output must follow `templates/planning-options-template.md`.
Apply token governance with `policies/token-governance-rules.md` and compress planning context when threshold is reached.
