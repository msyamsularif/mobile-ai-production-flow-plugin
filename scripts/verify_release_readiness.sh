#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

pass() {
  echo "[PASS] $1"
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Missing required command: $1"
}

require_file() {
  [ -f "$1" ] || fail "Missing required file: $1"
}

require_cmd jq
require_cmd bash

require_file "plugin.json"
require_file ".codex-plugin/plugin.json"
require_file ".claude-plugin/plugin.json"
require_file ".mcp.json"
require_file "hooks/hooks.json"
require_file "README.md"
require_file "INSTALL.md"

jq . plugin.json >/dev/null || fail "Invalid JSON: plugin.json"
jq . .codex-plugin/plugin.json >/dev/null || fail "Invalid JSON: .codex-plugin/plugin.json"
jq . .claude-plugin/plugin.json >/dev/null || fail "Invalid JSON: .claude-plugin/plugin.json"
jq . .mcp.json >/dev/null || fail "Invalid JSON: .mcp.json"
jq . hooks/hooks.json >/dev/null || fail "Invalid JSON: hooks/hooks.json"
pass "All manifest JSON files are valid."

bash -n scripts/create_work_branch.sh || fail "Shell syntax error: scripts/create_work_branch.sh"
bash -n scripts/ensure_work_branch_context.sh || fail "Shell syntax error: scripts/ensure_work_branch_context.sh"
bash -n scripts/ensure_draft_pr_boundary.sh || fail "Shell syntax error: scripts/ensure_draft_pr_boundary.sh"
bash -n scripts/validate_workflow_context.sh || fail "Shell syntax error: scripts/validate_workflow_context.sh"
bash -n scripts/detect_pr_template.sh || fail "Shell syntax error: scripts/detect_pr_template.sh"
pass "All core scripts pass shell syntax checks."

for d in skills agents policies templates workflows scripts hooks; do
  [ -d "$d" ] || fail "Missing required directory: $d"
done
pass "Required directories exist."

for f in \
  policies/automation-boundary.md \
  policies/jira-deep-scan-rules.md \
  policies/source-priority-rules.md \
  policies/draft-pr-rules.md; do
  [ -f "$f" ] || fail "Missing required policy file: $f"
done
pass "Required policy files exist."

jq -e '.mcpServers.atlassian.url == "https://mcp.atlassian.com/v1/sse"' .mcp.json >/dev/null \
  || fail "Expected Atlassian MCP endpoint v1/sse in .mcp.json"
jq -e '.mcpServers.figma.url == "https://mcp.figma.com/mcp"' .mcp.json >/dev/null \
  || fail "Expected Figma MCP endpoint in .mcp.json"
jq -e '.mcpServers.github.url == "https://api.githubcopilot.com/mcp/"' .mcp.json >/dev/null \
  || fail "Expected GitHub MCP remote endpoint in .mcp.json"
pass "MCP baseline config is production-ready."

echo
echo "Release readiness check completed successfully."
