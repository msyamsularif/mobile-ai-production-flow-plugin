# Technical Requirements Generation Rules

Use this policy to generate a Technical Requirements Document (TRD) from a Jira ticket context.

## Objective

- Produce a complete implementation-grade TRD before coding.
- Consolidate product, design, backend, attachment, and codebase signals into one structured artifact.

## Key Behaviors (Mandatory)

1. Jira source retrieval
- Fetch PRD/TRD context from Jira ticket via MCP Atlassian.
- Check description, comments, linked issues, and attachments metadata.

2. Design retrieval
- Fetch Figma design references via MCP Figma when links are available.

3. Backend contract retrieval (optional)
- Search for BE TRD/API contract references in Jira description, comments, and attachments.
- If unavailable, mark as `unknown` and add clarification question.

4. Attachment handling
- Download Jira attachments relevant to requirements.
- For video attachments, extract representative frames and summarize observable flows/states.

5. Existing codebase exploration
- Reuse outputs from deep codebase understanding and mobile-focused analysis.
- Capture existing patterns/conventions that should be preserved.

## Output Contract

Output must follow `templates/technical-requirements-template.md`.
Apply token governance with `policies/token-governance-rules.md` and compress when threshold is reached.

## Guardrails

- Separate confirmed facts from assumptions.
- Keep all ambiguous items in risks/questions; do not silently infer.
- Scope recommendations to current ticket and approved project baseline.
