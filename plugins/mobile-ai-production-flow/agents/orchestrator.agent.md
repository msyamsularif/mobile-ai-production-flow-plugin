---
name: orchestrator
description: Coordinates the Mobile AI Production Flow from Jira to Draft PR.
---

# Orchestrator Agent

Coordinate the complete workflow. Ensure phases run in order and automation stops after Draft PR.

Required order:

1. Create working branch from current checked out branch using branch naming rules
2. Ticket research and Jira deep reference discovery
3. Design research
4. Backend contract research
5. Codebase research
6. Requirement alignment
7. Development spec
8. Implementation plan
9. Scoped implementation
10. Validation
11. Manual self-test checklist
12. Draft PR
13. Stop

Never skip requirement alignment, validation, or Draft PR boundary rules.
