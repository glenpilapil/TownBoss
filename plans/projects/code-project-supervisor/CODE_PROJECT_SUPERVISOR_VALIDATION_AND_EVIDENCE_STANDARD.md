# Code Project Supervisor — Validation and Evidence Standard

**Status:** CANONICAL  
**Purpose:** Define what counts as acceptable evidence for implementation, verification, review, and checkpoint promotion.

## Evidence Classes

1. **Repository evidence** — files, schema, configuration, diff, branch/commit state.
2. **Static verification** — lint, analyze, typecheck, formatting, policy checks.
3. **Automated tests** — unit, integration, contract, regression, security, migration tests.
4. **Build/package evidence** — successful production/build/package generation.
5. **Database/migration evidence** — migration application, schema verification, idempotency, rollback/compatibility where required.
6. **Runtime evidence** — service startup, health, real request/response, process lifecycle, integration behavior.
7. **UI/device/browser evidence** — visual/responsive/physical-device acceptance when user experience matters.
8. **Security evidence** — auth/authorization/tenant boundaries, secret handling, dependency/application security checks.
9. **Independent review evidence** — separate reviewer findings and disposition.
10. **Checkpoint evidence** — coherent commit/PR/checkpoint tied to the verified state.
11. **Documentation evidence** — canonical documents and Memory reconciled with implementation.

## Promotion Rules

- `IMPLEMENTED`: required implementation exists.
- `TESTED`: required automated/static gates for the task have passed.
- `VERIFIED`: completion contract is satisfied with sufficient evidence and any required independent review is resolved.
- `CHECKPOINTED`: verified state is durably captured in the approved repository/checkpoint mechanism.

Worker narrative alone is never sufficient for VERIFIED when deterministic evidence is available.

## Risk-Weighted Evidence

### R0 — Read-only/research
Normally requires source/provenance review, factual reconciliation, and a clear report.

### R1 — Low-risk scoped change
Normally requires targeted tests/static checks plus diff review.

### R2 — Normal feature work
Requires relevant automated suites, integration evidence where appropriate, build/typecheck/lint as applicable, diff review, and checkpoint validation.

### R3 — High-impact/security/data/schema/infrastructure
Requires R2 evidence plus independent review and domain-specific verification such as migration/security/tenant/runtime gates.

### R4 — Production/destructive/external commitment
Requires explicit human authorization, R3 evidence, production/deployment safeguards, rollback or recovery plan where applicable, and post-action verification.

## Evidence Quality Rules

- Evidence must be tied to the repository state actually being accepted.
- Stale test output is historical, not current verification.
- A passing test suite is insufficient if the required contract is untested.
- Tests must not be weakened merely to produce green status.
- Manual evidence should be used only where automation is inadequate or where human visual/operational acceptance is inherently required.
- Unresolved contradictions between documentation, tests, and implementation block VERIFIED status.

## Final Verification Checklist

Before final report/checkpoint:

- Confirm target repo/worktree/branch/HEAD.
- Review diff and unrelated changes.
- Run required validation profile.
- Confirm no prohibited scope was introduced.
- Resolve or explicitly classify failures.
- Perform required independent review.
- Re-read governing documentation.
- Update Memory and affected docs.
- Produce Documentation Compliance Receipt.
- Record checkpoint identifier when created.