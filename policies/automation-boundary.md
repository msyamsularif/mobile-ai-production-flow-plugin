# Automation Boundary

The AI workflow is allowed to run automatically from Jira ticket intake until Draft Pull Request creation.

After Draft PR creation, the workflow must stop.

## AI may do automatically

- Fetch Jira subtask and parent story
- Scan Jira descriptions, comments, attachments, and linked issues
- Discover Figma, BE TRD, API contract, and supporting docs
- Research design and backend contract if accessible
- Research codebase
- Create requirement alignment report
- Create development spec
- Create implementation plan
- Implement scoped tasks
- Run formatter, analyzer, linter, and tests
- Fix validation failures related to the current task
- Generate manual self-test checklist
- Create Draft PR

## Human-gated actions

- Manual validation
- Marking PR as Ready for Review
- Requesting reviewers
- Reviewing PR
- Approving PR
- Merging PR
- Handling PR feedback unless explicitly requested
