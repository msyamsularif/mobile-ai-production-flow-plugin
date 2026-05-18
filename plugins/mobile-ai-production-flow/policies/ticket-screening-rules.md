# Ticket Screening Rules

Use these rules for an initial screening phase that is provider-agnostic (Claude, Copilot, Codex, or other LLM hosts).

## Objective

- Minimize token usage before deep research.
- Decide early whether a ticket is ready for implementation workflow.
- Produce a compact structured output for downstream steps.

## Mandatory Inputs (minimum)

- Ticket key or task identifier
- Title
- Description
- Acceptance criteria (or explicit note that it is missing)

If minimum inputs are missing, stop and request only missing fields.

## Screening Stages

1. Quick triage
- Check whether objective and scope are understandable.
- Detect hard blockers (missing AC, conflicting requirements, missing API contract for API tasks).
- Decide: `go`, `needs_input`, or `stop`.

2. Progressive context loading
- Start from smallest sources: metadata and summaries.
- Load linked docs only when relevance is confirmed.
- Avoid full document ingestion unless necessary.

3. Rolling summary
- Preserve only compact facts from each source.
- Remove duplicates and stale assumptions.

## Budget Policy (baseline)

- Total screening budget: `<= 2500` input tokens equivalent.
- Per-source soft cap: `<= 600` input tokens equivalent.
- Stop loading more sources when confidence is enough for decision.
- If budget is exceeded, summarize and continue from summary only.

Note: each provider calculates tokens differently. Keep these values as logical caps; adapters can map to platform-specific counters.

## Output Contract

Output must follow `templates/ticket-screening-template.json` fields only.

- No narrative paragraphs outside schema.
- Unknown data must be explicit with `unknown` or empty arrays.
- Questions must be concrete and answerable.

## Fail-Fast Conditions

Stop screening with `decision=needs_input` when:

- Acceptance criteria are missing or ambiguous.
- Scope cannot be bounded safely.
- API-related tasks lack discoverable API contract.
- Source conflicts cannot be resolved from available data.

Stop screening with `decision=stop` when:

- Task is out of workflow scope.
- Required permissions/access are unavailable.

