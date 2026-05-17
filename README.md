# Mobile AI Production Flow Plugin

A provider-compatible AI workflow plugin for mobile app development. It helps an AI coding agent work from a Jira ticket until **Draft Pull Request** creation.

This plugin is designed for hosts that support agent plugins/skills/hooks/MCP such as:

- Claude Code
- OpenAI Codex
- GitHub Copilot / VS Code Agent Plugins

## Automation Boundary

The automatic workflow may run until **Draft PR** creation only.

After a Draft PR is created, the workflow must stop.

Human-gated actions:

- Manual validation
- Updating PR from Draft to Ready for Review
- Requesting reviewers
- Reviewing PR
- Approving PR
- Merging PR
- Handling PR review feedback unless explicitly requested by the engineer

## What the workflow does

1. Create working branch from current checked out branch.
2. Fetch Jira subtask and parent story.
3. Deep-scan Jira descriptions, comments, attachments, and linked issues.
4. Discover Figma, BE TRD, API contract, and supporting docs.
5. Research Figma design and BE contract if accessible.
6. Research existing codebase.
7. Create Requirement Alignment Report.
8. Create Development Specification.
9. Create Implementation Plan.
10. Implement scoped tasks only.
11. Run validation loop.
12. Generate Manual Self-Test Checklist.
13. Create Draft Pull Request.
14. Stop.

## Branch naming convention

- With Jira ticket: `feature/<jira-id-lowercase>-<summary-slug>`
- Without Jira ticket (POC/experiment): `experimental/<summary-slug>`

Examples:

- `feature/gz-1234-implementasi-feature-flag`
- `experimental/poc-implementasi-live-sale`

## Main command prompt

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

## Review feedback prompt

```text
Handle PR review feedback for PR #456.

Rules:
- Read all reviewer comments.
- Classify feedback.
- Create fix plan first.
- Wait for my approval before implementation.
- Address only reviewer feedback.
- Re-run validation after fixes.
- Keep PR as draft unless I explicitly say otherwise.
```

## MCP setup

The bundled `.mcp.json` contains example server entries. You still need to install/configure the actual MCP servers and credentials in your environment.

Typical required MCP/tools:

- Jira
- Git/GitHub/GitLab/Bitbucket PR
- Shell/terminal
- Filesystem
- Figma, optional but recommended
- Docs/Confluence/Google Docs/Notion, optional
- GraphQL/OpenAPI contract reader, optional
- CI, optional

## Compatibility note

This plugin uses a multi-manifest structure:

- `plugin.json` for Copilot / VS Code Agent Plugins
- `.claude-plugin/plugin.json` for Claude Code
- `.codex-plugin/plugin.json` for Codex
- shared `skills/`, `agents/`, `hooks/`, `.mcp.json`, scripts, templates, and policies

## Production handoff

- Production setup and UAT guide: `INSTALL.md`
- Release readiness command:

```bash
scripts/verify_release_readiness.sh
```
