# Automation Boundary

The AI workflow may run from Jira ticket intake until Draft Pull Request creation, with required human gates where defined by policy.

After Draft PR creation, the workflow must stop.

## AI may do automatically

- Project and ticket screening
- Fetch Jira subtask and parent story
- Scan Jira descriptions, comments, attachments, and linked issues
- Discover Figma, BE TRD, API contract, and supporting docs
- Research design and backend contract if accessible
- Run design breakdown with YAGNI
- Run deep codebase understanding and mobile-focused analysis
- Create requirement alignment report
- Generate technical requirements document (TRD)
- Propose planning options and recommendation
- Create implementation plan after option selection
- Implement scoped tasks
- Run formatter, analyzer, linter, and tests
- Fix validation failures related to the current task
- Generate manual self-test checklist
- Create Draft PR

## Human-gated actions

- Selecting planning option (human gate) before implementation
- Manual validation
- Marking PR as Ready for Review
- Requesting reviewers
- Reviewing PR
- Approving PR
- Merging PR
- Handling PR feedback unless explicitly requested
