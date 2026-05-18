# Token Governance Rules

Use this policy across all workflow phases to prevent context bloat and control token costs.

## Objective

- Keep prompts compact and reusable across phases.
- Enforce per-phase token budgets.
- Compress context before budget overrun.

## Phase Budget Baseline

These are logical caps. Adapters should map to provider-native token counters.

| Phase | Input Budget (soft cap) | Output Budget (soft cap) |
|---|---:|---:|
| Project Screening | 5000 | 900 |
| Ticket Screening | 2500 | 700 |
| Analysis (design/backend/codebase/mobile/alignment) | 7000 | 1200 |
| TRD Generation | 4500 | 1400 |
| Planning Options + Implementation Plan | 3000 | 1200 |
| Validation + Testing Summary | 2200 | 800 |
| Draft PR Description | 1400 | 600 |

## Mandatory Runtime Checks

1. Before each phase
- Read last budget status.
- Carry only minimum required context for that phase.

2. During phase
- If estimated usage reaches >= 85% of soft cap, run context compression.
- Continue from compressed context only.

3. After phase
- Record:
  - `estimated_input_tokens`
  - `estimated_output_tokens`
  - `compression_applied`
  - `carryover_context_size`

## Minimum Required Context by Phase

- Screening: ticket/project metadata + AC + source ids only.
- Analysis: screening outputs + relevant references only.
- TRD: alignment summary + analysis outputs + required source links.
- Planning: TRD summary + key constraints + key risks.
- Validation: selected implementation plan + changed files + test scope.
- Draft PR: implementation summary + validation summary + required links.

## Output Contract

- Use `templates/context-compression-template.md` whenever compression is applied.
- Never carry full raw artifacts to next phase when compressed summary exists.

