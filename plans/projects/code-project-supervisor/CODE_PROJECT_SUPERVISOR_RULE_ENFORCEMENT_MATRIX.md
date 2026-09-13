# Code Project Supervisor — TownBoss Development Rule Enforcement Matrix

**Status:** CANONICAL / AUDIT COMPLETE
**Source:** `D:\Projects\TownBoss\governance\DEVELOPMENT_RULES.md`
**Upstream:** `Untrivial-ai/agent-orchestrator` @ `cadde8c9fd2079d0decca654004760ad8439328e`
**Date:** 2026-09-13

---

## Enforcement Classification Vocabulary

| Class | Meaning |
|-------|---------|
| UPSTREAM_ENFORCED | AO already enforces or strongly supports the rule |
| CONFIGURATION | AO provides capability; CPS configures/policy-enforces it |
| CPS_EXTENSION | CPS must build explicit enforcement |
| CI_REPO_GATE | Enforced via repository/CI checks |
| HUMAN_GATE | Requires explicit human authorization |
| NOT_YET_ENFORCED | No enforcement exists yet; Phase 3 implementation required |
| NOT_APPLICABLE | Rule does not apply to this adoption context |

---

## Rule Enforcement Matrix

| Rule | Title | Enforcement | Upstream Evidence | CPS Gap | Implementation Need | Operational Blocker? |
|------|-------|-------------|-------------------|--------|---------------------|----------------------|
| 1 | Governing Principle | CPS_EXTENSION | None | No enforcement in AO | Document in CPS governance; enforce via task contract validation | No |
| 2 | Authority Hierarchy | CPS_EXTENSION | None | No hierarchy enforcement | Document hierarchy; enforce via task lifecycle gates | No |
| 3 | Required Project Foundation | CPS_EXTENSION | None | No foundation check | Pre-task foundation validation | No |
| 4 | Documentation Compliance Cycle | CPS_EXTENSION | None | No planning/execution/final review hooks | Three-stage gate + compliance receipt | **YES** |
| 5 | Canonical Doc Freshness | CPS_NEW | None | No freshness check | Stale-clone detection; fail-closed on stale docs | **YES** |
| 6 | Decisions Are Binding | CPS_EXTENSION | None | No decision store | Durable decision records with SUPERSEDED tracking | No |
| 7 | Upstream First | UPSTREAM_ENFORCED | AO inherits most capabilities | None | None | No |
| 8 | Build Product Not System | CONFIGURATION | CPS scope controls | None | Scope discipline in task contracts | No |
| 9 | Bounded Passes | CPS_EXTENSION | None | No bounded-pass enforcement | Task contract with entry/exit criteria | No |
| 10 | No Silent Scope Expansion | CPS_EXTENSION | None | No scope gate | Task contract + scope-change detection | No |
| 11 | Completion States | CPS_EXTENSION | AO has session states | No promotion gates | Evidence-backed promotion: PLANNED → IMPLEMENTED → TESTED → VERIFIED → CHECKPOINTED | No |
| 12 | Definition of Done First | CPS_EXTENSION | None | No acceptance gate | Acceptance criteria check before implementation | No |
| 13 | Preserve Working Behavior | CONFIGURATION | AO preserves behavior | None | Regression tests for CPS extensions | No |
| 14 | Diagnose Before Fixing | CONFIGURATION | CPS policy | None | Document in CPS | No |
| 15 | Fail Closed Under Uncertainty | CPS_EXTENSION | None | No fail-closed gate | Authority gate: unclear authority → no action | **YES** |
| 16 | Human Attention Scarce | CONFIGURE | AO attention states | Needs recommendation layer | Decision presentation with recommendation/evidence | No |
| 17 | Git Is Part of Control System | UPSTREAM_ENFORCED | AO worktree isolation, dirty-worktree protection | None | None | No |
| 18 | Never Destroy Evidence | UPSTREAM_ENFORCED | AO never force-deletes dirty worktrees; change_log is append-only | None | None | No |
| 19 | Security and Authority Are Architectural | CPS_EXTENSION | None | No security model | Security/authority design for CPS extensions | **YES** |
| 20 | Authoritative State Must Remain Authoritative | CPS_EXTENSION | None | No single-authority enforcement | Daemon as single authority; workers cannot determine privileged state | No |
| 21 | Tests Prove Contracts | CONFIGURATION | AO has extensive test suite | None | CPS contract tests for governance extensions | No |
| 22 | Independent Review | UPSTREAM_ENFORCED | AO review gateway, autoreview coordinator, 22 reviewer adapters | Policy extension needed | Review policy configuration; blocking/non-blocking classification | No |
| 23 | Temporary Means Temporary | CPS_EXTENSION | None | No workaround tracking | Temporary workaround registry with scope/risk/removal condition | No |
| 24 | Memory Is Mandatory | CPS_NEW | None | No Memory enforcement | Memory update gate at milestone/checkpoint boundaries | **YES** |
| 25 | Documentation Must Track Reality | CPS_EXTENSION | None | No doc-reality check | Doc compliance gate + reality reconciliation | No |
| 26 | External Dependency Adoption | UPSTREAM_ENFORCED | This audit satisfies it | None | None | No |
| 27 | Optimize for Replaceability | UPSTREAM_ENFORCED | AO port-based adapter design | None | None | No |
| 28 | Enforcement Is Part of Rule | CPS_EXTENSION | None | No automated gates | Machine-enforceable state-transition gates | **YES** |
| 29 | Rule Violations | CPS_EXTENSION | None | No violation handling | Violation classification + repair + Memory recording | No |
| 30 | Portfolio Completion Principle | CONFIGURATION | CPS scope controls | None | None | No |

---

## Operational Blocker Summary

**Rules marked as operational blockers (YES):**

| Rule | Reason | Phase |
|------|--------|-------|
| R4 — Documentation Compliance Cycle | No enforcement mechanism in AO; CPS must build three-stage gate | Phase 3 |
| R5 — Canonical Doc Freshness | No freshness detection; stale docs could drive wrong implementation | Phase 4 |
| R15 — Fail Closed Under Uncertainty | No fail-closed gate; ambiguous authority could proceed incorrectly | Phase 3 |
| R19 — Security and Authority Are Architectural | No security model for CPS extensions | Phase 3 |
| R24 — Memory Is Mandatory | No Memory enforcement; project continuity at risk | Phase 3 |
| R28 — Enforcement Is Part of the Rule | No automated gates; rules remain advisory | Phase 3 |

**Assessment:** None of these block Phase 0 GO/CONDITIONAL GO. They are bounded Phase 3/4 extensions with clear implementation paths. The audit can proceed to fork establishment.

---

## Enforcement Coverage Summary

| Enforcement Class | Count | Rules |
|-------------------|-------|-------|
| UPSTREAM_ENFORCED | 7 | R7, R17, R18, R22, R26, R27, + partial R17 |
| CONFIGURATION | 4 | R8, R13, R14, R16, R21, R30 |
| CPS_EXTENSION | 14 | R1, R2, R4, R6, R9, R10, R11, R15, R19, R20, R23, R25, R28, R29 |
| CPS_NEW | 3 | R5, R24, + partial R4 |
| CI_REPO_GATE | 0 | — |
| HUMAN_GATE | 0 | — |
| NOT_YET_ENFORCED | 6 | R4, R5, R15, R19, R24, R28 |
| NOT_APPLICABLE | 0 | — |

**Note:** Some rules span multiple enforcement classes (e.g., R4 is both CPS_EXTENSION and CPS_NEW for the receipt component).
