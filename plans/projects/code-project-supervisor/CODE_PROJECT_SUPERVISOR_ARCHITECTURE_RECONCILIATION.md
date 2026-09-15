# Code Project Supervisor — Architecture-to-Implementation Reconciliation

**Status:** ACTIVE / CANONICAL RECONCILIATION LEDGER  
**Date:** 2026-09-15

## Purpose

Reconcile the Phase 7 operational CPS baseline with architecture, integration, UX-engine, governance, and security-hardening decisions approved after operational acceptance. This ledger separates documented intent from source-verified enforcement and prevents speculative reopening of CPS.

## Baseline

CPS completed Phase 7 operationalization and satisfied the first operational release criteria. GeoPlotter PASS 0L completed the real-product canary with required independent review and a verified checkpoint. Phase 6 demonstrated multi-project operation with GeoPlotter and GlenTown, conflict prevention, restart reconstruction, and no observed cross-project state contamination.

The operational freeze remains in force: new CPS implementation must be justified by a defect, measured bottleneck, explicit approved capability, or mandatory hardening/conformance gap.

## Status vocabulary

- `IMPLEMENTED` — implementation and acceptance evidence already recorded.
- `PARTIAL` — behavior exists but approved contract is not fully evidenced.
- `PLANNED` — canonical requirement exists without implementation evidence.
- `REFERENCE_ONLY` — approved upstream source/pattern, not a production dependency.
- `MISSING` — verified absent after source inspection.
- `BLOCKED` — prerequisite/access dependency unresolved.
- `DOCUMENTED_SOURCE_UNVERIFIED` — canonical design exists but current CPS source is not directly inspectable through the available connection.

`DOCUMENTED_SOURCE_UNVERIFIED` must never be silently promoted to `IMPLEMENTED`.

## Current reconciliation

| Capability / layer | Status | Disposition |
|---|---|---|
| Agent Orchestrator runtime chassis | IMPLEMENTED | Phase 1-7 operational baseline. Preserve AO ownership of daemon/session/worktree/adapter/event infrastructure. |
| Multi-project operation | IMPLEMENTED | Phase 6: GeoPlotter + GlenTown concurrency, conflict prevention, restart reconstruction, no observed state contamination. |
| Bounded recovery / circuit breaker | IMPLEMENTED | Operational canary exercised bounded recovery/circuit-breaker behavior; hardening still requires non-widening-authority conformance. |
| Completion-contract validation | IMPLEMENTED | Machine-verifiable completion/checkpoint gating established. |
| Independent review gate | IMPLEMENTED | Required-review promotion gate implemented and exercised by GeoPlotter PASS 0L. |
| Operational runbooks / recovery / security cadence | IMPLEMENTED | Phase 7 operationalization complete. |
| Spec Kit specification/convergence patterns | REFERENCE_ONLY | Approved beneath MDP/Implementation Plans; no duplicate planning truth source. |
| Kiro controlled-execution patterns | REFERENCE_ONLY | Approved patterns for context, permissions, hooks, isolation, reviewer loops and checkpoints. |
| ECC capability corpus | REFERENCE_ONLY | Approved capability source; wholesale installation prohibited. |
| Microsoft Agent Governance Toolkit | REFERENCE_ONLY | Approved governance/security patterns; narrow components may be evaluated. |
| Team topology / virtual development organization | DOCUMENTED_SOURCE_UNVERIFIED | Provider-neutral topology and role hardening approved; source enforcement requires inspection. |
| Capability Registry | DOCUMENTED_SOURCE_UNVERIFIED | Must include provenance, pinning, evaluation, approval and revocation. |
| Context Compiler trust boundaries | DOCUMENTED_SOURCE_UNVERIFIED | Minimum authoritative context, trust labels, data/instruction separation, secret exclusion and provenance required. |
| Governance Decision Contract | DOCUMENTED_SOURCE_UNVERIFIED | Actor, lineage, action/resource, policy/version, verdict, reason and approval/audit references required. |
| Scoped delegation / worker identity | DOCUMENTED_SOURCE_UNVERIFIED | Authority must be explicit, bounded, attributable and non-ambient. |
| Action interception / fail-closed policy | DOCUMENTED_SOURCE_UNVERIFIED | Mandatory for governed side effects. |
| Capability revocation enforcement | DOCUMENTED_SOURCE_UNVERIFIED | Revoked capability must not be usable in future governed work. |
| External-write target authority | DOCUMENTED_SOURCE_UNVERIFIED | Push/PR/publication/API writes require target/scope authority. |
| Secret/default-deny network controls | DOCUMENTED_SOURCE_UNVERIFIED | Canonical hardening rules exist; enforcement not directly verified. |
| Risk-based stronger isolation | DOCUMENTED_SOURCE_UNVERIFIED | Worktree isolation is not sufficient for every risk class. |
| Full provenance graph | DOCUMENTED_SOURCE_UNVERIFIED | Decision -> Requirement -> Contract -> Task -> Delegation -> Worker/Capabilities -> Actions -> Diff -> Validation -> Review -> Governance -> Checkpoint. |
| Security-state persistence | DOCUMENTED_SOURCE_UNVERIFIED | Circuit-breaker/security state required to survive restart. |
| UX Engine / rendered inspection | PARTIAL | Canonical capability and GlenTown App Site pilot exist; generalized CPS integration remains to be evidenced. |
| Agent/model routing and evaluation | DOCUMENTED_SOURCE_UNVERIFIED | Routing cannot bypass authority; learned policy must be versioned/reviewable. |
| Hermes/ECC/other skill discovery | REFERENCE_ONLY | Discovery only; capabilities remain untrusted until approved/pinned/evaluated. |

## Documentation convergence defects

1. `CODE_PROJECT_SUPERVISOR_IMPLEMENTATION_PLAN.md` contains stale dashboard items indicating first operational release and operational freeze are incomplete although Current State and Memory record Phase 7 completion.
2. `CODE_PROJECT_SUPERVISOR_CAPABILITY_MATRIX.md` still contains pre-adoption `UNKNOWN`, `Audit pending`, and `Planned` statuses for capabilities demonstrated during Phases 1-7.
3. Post-Phase-7 hardening adds Acceptance Gate K and 18 mandatory conformance tests. Earlier operational acceptance does not prove this later hardening gate.

These are documentation-convergence defects, not evidence that the Phase 7 operational baseline failed.

## Mandatory hardening conformance program

1. unknown governed actions fail closed;
2. edit authority cannot imply push/merge/deploy authority;
3. untrusted content cannot override canonical policy;
4. unapproved/unpinned capabilities cannot run as trusted capabilities;
5. policy-engine failure blocks governed side effects;
6. conflicting writers cannot share an uncontrolled workspace;
7. retry/fallback cannot widen authority;
8. sensitive files/secrets are blocked from governed checkpoints;
9. out-of-scope diffs block checkpoint readiness;
10. incomplete evidence cannot become VERIFIED;
11. external writes require target authority;
12. production/destructive actions require explicit high-risk approval;
13. interrupted execution does not duplicate authoritative work;
14. verified checkpoints retain task/worker/capability/validation/governance provenance;
15. capability revocation prevents future governed use;
16. read-only reviewer separation is enforceable;
17. project concurrency does not leak state, credentials, workspaces or evidence;
18. security/circuit-breaker state survives supervisor restart.

## Dependency-ordered program

### HR0 — Canonical documentation convergence
Reconcile Current State, Implementation Plan, Capability Matrix, Acceptance Criteria, Memory and this ledger. Preserve historical phase evidence and distinguish Phase 7 acceptance from later hardening.

### HR1 — Source-level hardening audit
Inspect current CPS source and map every hardening gate and source-unverified capability to exact packages/types/tests/configuration. Exit only when each becomes `IMPLEMENTED`, `PARTIAL`, or `MISSING` with evidence.

### HR2 — Minimal enforcement implementation
Implement only HR1-proven gaps, preserving AO boundaries. Priority: identity/scoped delegation; governance/action interception; capability provenance/revocation; context trust boundaries; Git/external authority; secret/network/environment controls; provenance persistence; security-state persistence.

### HR3 — Hardening conformance suite
Automate or deterministically control all 18 mandatory tests. Any mandatory failure blocks hardened status.

### HR4 — Hardened real-product canary
Run one bounded change through canonical plan -> feature/change contract -> context compilation -> capability/team selection -> scoped delegation -> governed isolated execution -> validation -> independent review when required -> convergence -> checkpoint -> provenance/memory reconciliation. Exercise at least one denied/blocked action and prove recovery cannot widen authority.

### HR5 — Operational freeze resumes
After HR3 and HR4 pass, return CPS to routine portfolio use. Further CPS work requires a real blocker, measured bottleneck, security defect or explicit approved capability.

## Access constraint

The connected GitHub installation currently exposes `glenpilapil/TownBoss` but not `glenpilapil/Code-Project-Supervisor`. HR1 therefore cannot truthfully complete through the current connector. This is an evidence/access constraint, not proof that source functionality is missing.

## Upstream-adoption rule

No new upstream repository becomes a CPS dependency merely because it is interesting. New references must close a currently identified gap better than an approved approach or remain research/reference-only. Capability does not confer authority.

## Current next action

Complete HR0 documentation convergence, then perform HR1 immediately when direct CPS source access is available. Do not start speculative CPS feature implementation before HR1 proves a gap.
