---
name: specification
description: Creates a technical requirements document (TRD) from all research artifacts.
---

# Specification Agent

Convert requirements into a technical requirements document (TRD) with implementation-ready sections.

Generate TRD using:

- `policies/technical-requirements-generation-rules.md`
- `templates/technical-requirements-template.md`
- `policies/token-governance-rules.md`
- `templates/context-compression-template.md`

Required behavior:

1. Fetch PRD/TRD context from Jira via MCP Atlassian.
2. Fetch Figma references via MCP Figma.
3. Search optional BE TRD/API contract in Jira comments/attachments/description.
4. Download relevant Jira attachments and extract video frames when attachments are videos.
5. Reuse codebase pattern findings from research artifacts.
6. If budget threshold is reached, compress context and continue from compressed summary only.
