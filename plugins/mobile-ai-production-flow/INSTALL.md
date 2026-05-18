# Install Guide

## Preflight

Run:

```bash
scripts/verify_release_readiness.sh
```

Release is considered ready only when all checks pass.

## Required MCP dependencies

### Atlassian MCP (remote)

- Endpoint: `https://mcp.atlassian.com/v1/sse`
- OAuth flow is required in host client.

### Figma MCP (remote)

- Endpoint: `https://mcp.figma.com/mcp`
- OAuth flow is required in host client.

### GitHub MCP (remote)

- Endpoint: `https://api.githubcopilot.com/mcp/`

## Claude Code

Use the plugin folder as a Claude Code plugin. Claude Code reads `.claude-plugin/plugin.json` and shared components from the plugin root.

Configure credentials and MCP servers before running Jira/Figma/GitHub workflows.

## Codex

Use the plugin folder as a Codex plugin. Codex reads `.codex-plugin/plugin.json`.

If plugin hooks are disabled in your Codex setup, enable plugin hooks in Codex config:

```toml
[features]
plugin_hooks = true
```

Configure `.mcp.json` or your local Codex MCP settings with actual server commands and credentials.

## GitHub Copilot / VS Code Agent Plugins

Use the plugin folder as a VS Code Agent Plugin. VS Code reads `plugin.json` at the root and shared components.

If multiple plugin manifest formats exist in the same folder, VS Code/Copilot may prioritize `.claude-plugin/plugin.json` over root `plugin.json` depending on loader rules.
Keep shared paths (`skills/`, `agents/`, `hooks/`, `.mcp.json`) consistent across manifests.

Configure MCP servers in VS Code/Copilot as needed.

## Required credentials

This package does not include secrets. Provide credentials via your host's secret/env system:

- Jira base URL/email/API token
- Figma token if design research is needed
- GitHub/GitLab/Bitbucket token for Draft PR creation
- Docs/Confluence/Notion credentials if TRD is stored there

## UAT (minimum)

### Test A: Jira flow

Prompt:

```text
Run mobile production workflow for Jira ticket GZ-1234 until Draft PR.
```

Expected:

- Branch is created first with `feature/...`.
- Workflow stops after Draft PR.
- No auto-merge, no auto-ready-for-review.

### Test B: Experimental flow (no Jira)

Prompt:

```text
Run mobile production workflow for experimental task POC implementation live sale until Draft PR.
```

Expected:

- Branch uses `experimental/...`.

### Test C: Draft PR template behavior

Expected:

- If `.github` PR template exists, plugin uses template as PR body base.
- Adds `Key Changes Section` and `Technical Solution Section`.
- `Impact Analysis Section` appears only when change impact is significant.
