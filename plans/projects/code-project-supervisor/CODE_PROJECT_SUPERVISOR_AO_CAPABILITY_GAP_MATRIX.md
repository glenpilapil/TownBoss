# Code Project Supervisor — Agent Orchestrator Capability Gap Matrix

**Status:** CANONICAL / AUDIT COMPLETE
**Upstream:** `Untrivial-ai/agent-orchestrator` @ `cadde8c9fd2079d0decca654004760ad8439328e`
**Date:** 2026-09-13

---

## Classification Vocabulary

| Class | Meaning |
|-------|---------|
| INHERIT | AO satisfies requirement; no CPS rebuild needed |
| CONFIGURE | AO capability exists; needs configuration/policy |
| EXTEND | AO capability exists; needs narrow CPS extension |
| PORT_FROM_LEGACY | CodeBisor proven capability; port to CPS |
| NEW | Must be built; neither AO nor CodeBisor provides adequately |
| DROP | Intentionally not carried forward |
| UNKNOWN | Audit pending (all resolved in this audit) |

---

## Capability Matrix

| # | Capability | Required? | AO Evidence | Classification | Gap | Proposed Treatment | Risk | Adoption-Phase Impact | Verification Required |
|---|-----------|-----------|-------------|----------------|-----|-------------------|------|----------------------|----------------------|
| 1 | Persistent background supervisor/daemon | REQUIRED | `daemon/`, `cmd/ao/main.go`, `supervisor/` | INHERIT | G0 — none | Adopt upstream daemon | Low | Phase 1 | Verify daemon start/stop on Windows |
| 2 | Multi-project registry | REQUIRED | `service/project/`, `domain/project.go`, `ProjectKind` | INHERIT | G0 — none | Adopt upstream project model | Low | Phase 2 | Register 2+ projects |
| 3 | Repository/worktree resolution | REQUIRED | `adapters/workspace/gitworktree/`, `SessionWorktreeRecord` | INHERIT | G0 — none | Adopt upstream workspace adapter | Low | Phase 2 | Verify worktree creation per project |
| 4 | Natural-language job intake | REQUIRED | Orchestrator conversations, `ao spawn` CLI | EXTEND | G2 — AO has manual spawn + orchestrator conversation; CPS needs structured task contract generation from objectives | Build CPS task-materializer layer wrapping AO spawn/orchestrator | Medium | Phase 4 | Operator submits objective → bounded task contract |
| 5 | Task decomposition | REQUIRED | Orchestrator can plan conversationally | EXTEND | G3 — AO lacks explicit task graph with dependencies, eligibility, ordering | Build CPS task graph with explicit dependencies and eligibility rules | Medium | Phase 4 | Objective decomposes into traceable tasks |
| 6 | Dependency handling | REQUIRED | `TrackerIntakeConfig` for issue-driven spawn | EXTEND | G2 — AO has issue-driven spawn but not explicit task dependency graph | Extend with CPS task dependency model | Medium | Phase 4 | Blocked tasks wait; eligible tasks proceed |
| 7 | Worker adapter abstraction | REQUIRED | `ports/agent.go`, `adapters/agent/registry/` | INHERIT | G0 — none | Adopt upstream port-based adapter design | Low | Phase 1 | Verify adapter registration works |
| 8 | Kilo worker support | REQUIRED | `adapters/agent/kilocode/` | INHERIT | G0 — none | Adopt upstream Kilo adapter | Low | Phase 2 | Bounded task completes with evidence |
| 9 | Codex worker support | REQUIRED | `adapters/agent/codex/`, `chatdriver/codexappserver/` | INHERIT | G0 — none | Adopt upstream Codex adapter | Low | Phase 2 | Bounded task completes with evidence |
| 10 | Cline worker support | OPTIONAL | `adapters/agent/cline/` | INHERIT | G0 — none | Adopt upstream Cline adapter | Low | Phase 2 | Adapter can launch/resume safely |
| 11 | Gemini worker support | OPTIONAL | Not found | DROP | G0 — not in AO, not required by CPS | None | None | N/A | None |
| 12 | Same-worktree write isolation | REQUIRED | Git worktree per session, branch isolation | EXTEND | G2 — AO prevents conflicting branches at git level; no application-level cross-process write lease | Add CPS write lease (port from CodeBisor `WorktreeWriteLease` pattern) | Low | Phase 2 | No concurrent conflicting writers |
| 13 | Cross-project concurrency | REQUIRED | Independent sessions across projects | INHERIT | G0 — none | Adopt upstream concurrency model | Low | Phase 6 | Two projects run concurrently |
| 14 | Worker/session persistence | REQUIRED | SQLite sessions, daemon restart reconstruction | INHERIT | G0 — none | Adopt upstream persistence | Low | Phase 2 | Supervisor restart retains session truth |
| 15 | Exact-session resume where supported | REQUIRED | Chat resume, agent switching, interface transitions | INHERIT | G0 — Claude Code + Codex have proven interface handoff | Adopt upstream resume model | Low | Phase 2 | Resume does not adopt ambient process |
| 16 | Provider/resource budgets | REQUIRED | Usage/pricing collector (`service/usage/`) | PORT_FROM_LEGACY | G2 — AO tracks usage but lacks bounded recovery budgets, retry ceilings, no-progress detection | Port CodeBisor `agent_resource_governance.py` recovery budget pattern; integrate with AO lifecycle | Medium | Phase 3 | Recovery/resource ceilings enforced |
| 17 | Recovery/no-progress circuit breaker | REQUIRED | Runtime reaper, mass-death circuit breaker, lifecycle reducer | PORT_FROM_LEGACY | G2 — AO detects dead runtimes but lacks explicit no-progress budgets and circuit-breaker escalation | Port CodeBisor `resource_incident_control.py` circuit-breaker pattern | Medium | Phase 3 | Repeated no-progress stops automatically |
| 18 | Human attention/decision gate | REQUIRED | `waiting_input`, `blocked` activity states, notifications | EXTEND | G3 — AO has attention states but no recommendation layer, decision records, or approval-gate enforcement | Build CPS decision/authority extension with recommendation, rationale, options, evidence | High | Phase 3 | Only genuine decisions reach operator |
| 19 | Authority/risk classification | REQUIRED | Agent permission modes (normal, auto-edit, YOLO) | PORT_FROM_LEGACY | G3 — AO has permission modes but not CPS A0-A4 authority matrix | Port CodeBisor `ai_authority.py` A0-A4 model; integrate with task risk classification | High | Phase 3 | Task risk maps to allowed actions |
| 20 | Completion contract verification | REQUIRED | PR merge, worker exit, manual termination | PORT_FROM_LEGACY | G2 — AO has no completion contract; worker exit ≠ task completion | Port CodeBisor `completion_verifier.py` PASS/FAIL/UNVERIFIED model; integrate with task lifecycle | Medium | Phase 3 | Worker prose alone cannot mark DONE |
| 21 | Validation profiles | REQUIRED | CI checks, PR status | EXTEND | G2 — AO observes CI/PR but lacks project-specific validation profiles per task risk/type | Build CPS validation-profile engine with risk-weighted evidence requirements | Medium | Phase 3 | Required gates run per task risk/type |
| 22 | Independent review | REQUIRED | `reviewgateway/`, `autoreview/`, 22 reviewer adapters | EXTEND | G1 — AO has review infrastructure but no explicit blocking/non-blocking finding classification or policy-based requirement | Configure review policy (auto/manual, required for R3+ tasks); add blocking-finding classification | Low | Phase 3 | Implementer cannot self-approve high-risk work |
| 23 | Checkpoint/commit/PR handling | REQUIRED | PR actions, merge, resolve-comments, SCM observer | CONFIGURE | G1 — AO handles PRs but lacks CPS checkpoint governance (diff review, staged file verification, checkpoint evidence) | Configure PR handling policy; add diff-scope validation before checkpoint readiness | Low | Phase 3 | Verified work yields coherent checkpoint |
| 24 | Documentation compliance gate | REQUIRED | None | NEW | G3 — No planning/execution/final review doc-check hooks in AO | Build three-stage documentation compliance gate with compliance receipts | High | Phase 3 | Planning/execution/final doc checks evidenced |
| 25 | Project Memory update | REQUIRED | None | NEW | G3 — No durable append-only project Memory in AO | Build CPS Memory ledger (append-only, conflict-resilient) | High | Phase 3 | Milestone handoff appends durable memory |
| 26 | Portfolio status/current-state view | REQUIRED | Kanban, SSE events, session list | INHERIT | G0 — none | Adopt upstream UI projection | Low | Phase 2 | Operator can see current work/attention |
| 27 | Detailed event/history view | REQUIRED | change_log, CDC, SSE with Last-Event-ID replay | INHERIT | G0 — none | Adopt upstream event model | Low | Phase 2 | Meaningful events available without noise |
| 28 | System tray | OPTIONAL | None | DROP | G0 — not in AO, not required by CPS | None | None | N/A | N/A |
| 29 | Custom terminal rendering engine | NO | None | DROP | G0 — explicitly dropped in CPS | None | None | N/A | N/A |
| 30 | Bespoke dashboard framework | NO | None | DROP | G0 — explicitly dropped in CPS | None | None | N/A | N/A |
| 31 | Remote/cloud operation | OPTIONAL | LAN listener for mobile only | DEFER | G0 — CPS defers remote until security review | None | None | N/A | N/A |
| 32 | TownBoss plan ingestion | REQUIRED | None | EXTEND | G3 — AO has no planning corpus linkage | Build CPS planning-doc resolver with freshness checks | High | Phase 4 | CPS can resolve canonical project docs/tasks |
| 33 | Documentation freshness/local clone checks | REQUIRED | None | NEW | G2 — No stale-clone detection | Build freshness checker for local TownBoss clone | Medium | Phase 4 | Stale governance source detected/fails closed |
| 34 | Compliance receipt generation | REQUIRED | None | NEW | G2 — No compliance receipt support | Build receipt generator as part of documentation compliance gate | Medium | Phase 3 | Final report includes documented compliance receipt |
| 35 | Operational freeze after acceptance | REQUIRED | None | CONFIGURE | G1 — AO has no freeze mechanism; CPS enforces via rules | Configure CPS rules; no upstream change needed | Low | Phase 7 | No CPS feature work unless real product blocker |

---

## Summary Statistics

| Classification | Count |
|---------------|-------|
| INHERIT | 22 |
| CONFIGURE | 3 |
| EXTEND | 8 |
| PORT_FROM_LEGACY | 3 |
| NEW | 4 |
| DROP | 3 |
| DEFER | 1 |

| Severity | Count |
|----------|-------|
| G0 | 22 |
| G1 | 5 |
| G2 | 8 |
| G3 | 4 |
| G4 | 1 |
| G5 | 0 |

---

## Critical Gaps Detail

### G3 Gaps (Moderate CPS Extension — Phase 3/4)

1. **Task decomposition with dependency graph** (EXTEND)
   AO orchestrator plans conversationally. CPS needs machine-verifiable task structures with explicit dependencies, eligibility checks, and bounded task contracts.

2. **Authority/risk classification** (PORT_FROM_LEGACY)
   AO has agent permission modes but not CPS's A0-A4 authority matrix. Port CodeBisor's proven model.

3. **Human attention/decision gate with recommendations** (EXTEND)
   AO has `waiting_input`/`blocked` states but no recommendation layer, decision records, or approval-gate enforcement at supervisor level.

4. **Documentation compliance gate** (NEW)
   No hooks in AO for three-stage documentation compliance. Must be built as CPS extension.

5. **Project Memory update** (NEW)
   No durable append-only Memory in AO. Must be built.

6. **TownBoss plan ingestion** (EXTEND)
   No planning corpus linkage in AO. Must be built.

### G2 Gaps (Small Extension — Phase 2/3)

1. Same-worktree write lease (EXTEND)
2. Task queue with dependencies (EXTEND)
3. Recovery budgets (PORT_FROM_LEGACY)
4. Circuit-breaker escalation (PORT_FROM_LEGACY)
5. Completion contract verification (PORT_FROM_LEGACY)
6. Validation profiles (EXTEND)
7. Documentation freshness check (NEW)
8. Compliance receipt generation (NEW)

### G4 Gap (Major — Requires Proof)

1. **Natural-language job intake → structured task contract** (EXTEND)
   AO's orchestrator conversation is informal. CPS needs deterministic task contract generation. This requires a bounded proof in Phase 4 before it blocks operational acceptance.
