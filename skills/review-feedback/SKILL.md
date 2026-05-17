---
name: review-feedback
description: Handle PR review feedback only when engineer explicitly requests it.
---

# Review Feedback

Use only when engineer explicitly asks to handle PR review feedback.

Flow:

1. Read all reviewer comments.
2. Classify each comment.
3. Create fix plan first.
4. Wait for approval unless engineer says to fix directly.
5. Address only reviewer comments.
6. Avoid unrelated refactor.
7. Re-run validation.
8. Summarize resolved comments.

Keep PR as Draft unless engineer explicitly says otherwise.
