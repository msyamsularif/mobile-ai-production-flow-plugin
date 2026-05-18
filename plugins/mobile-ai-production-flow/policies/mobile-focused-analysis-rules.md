# Mobile Focused Analysis Rules

Use this policy after deep codebase understanding and before requirement alignment.

## Objective

- Ensure analysis is explicitly mobile-oriented before planning and coding.
- Surface platform constraints, feature dependencies, and delivery risks early.
- Keep recommendations scoped to current ticket and project baseline.

## Required Coverage (Mandatory)

1. Platform and Technology
- Detect target platform: Android, iOS, Flutter, React Native, or mixed.
- Identify build/runtime stack and key SDK/toolchain constraints.

2. Mobile Architecture
- Identify architecture pattern (MVVM/MVI/Clean/etc.), navigation approach, and UI/UX conventions.

3. Mobile-Specific Features
- Assess impact of camera, location, push notifications, biometrics, storage, and permissions.
- Mark each feature as: required, not-required, or unknown.

4. Data and Networking
- Trace API integration points, offline behavior, caching strategy, and sync behavior.

5. Security and Quality
- Evaluate auth/session handling, sensitive data handling/encryption, and test readiness.

6. Performance and Build
- Evaluate memory/performance hotspots, app size impacts, and CI/CD/build pipeline constraints.

## Output Contract

Output must follow `templates/mobile-focused-analysis-template.md`.

## YAGNI Application

- Include only findings that affect current acceptance criteria or implementation risk.
- Mark speculative improvements as `later`.
- Exclude unrelated optimization work from current implementation scope.

