#!/usr/bin/env bash
set -euo pipefail
# This script is intentionally conservative. It reminds the host/model about the boundary.
# Hosts differ in how much hook output they surface to the agent.
cat <<'EOF'
Mobile AI Production Flow boundary reminder:
- Create PR as Draft only.
- Do not mark PR as Ready for Review.
- Do not request reviewers automatically unless explicitly configured.
- Do not merge.
- Do not handle PR feedback unless engineer explicitly requests it.
EOF
