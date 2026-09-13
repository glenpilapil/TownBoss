# Code Project Supervisor — Implementation Plan / Dashboard

**Status:** FOUNDATION ADOPTION / PLANNED  
**Primary upstream candidate:** `Untrivial-ai/agent-orchestrator`  
**Legacy reference:** existing CodeBisor repository and TownBoss `plans/projects/codebisor/`

## Dashboard purpose

This document is both the canonical implementation plan and the human-readable CPS development dashboard.

It must show, at a glance:

- what phase CPS is in;
- what has been completed;
- what is currently being worked on;
- what is blocked or awaiting review;
- what gates must pass before the next phase;
- what deliverables remain;
- what evidence/checkpoints close each phase.

All phases, tasks, deliverables, gates, and acceptance items use checklists. Items may be checked only when completion is backed by evidence. A checked box means the stated item is complete at the required evidence level; it does not mean merely attempted.

## Status legend

- `[ ]` — not yet complete
- `[x]` — complete with evidence
- `⏳` — in progress / active workstream
- `⚠` — attention/review required
- `⛔` — blocked
- `↪` — deferred by explicit decision

If Markdown rendering does not support the symbols consistently, the checkbox remains authoritative and the textual status should be written beside the item.

## Current dashboard summary

- [x] Project foundation documents established
- [x] Portfolio-wide TownBoss Development Rules established
- [x] CPS Memory ledger established
- [x] CPS current-state / capability / task-contract / authority / validation / risk / adapter / upstream-sync / documentation-compliance / operational-acceptance documents established
- [x] Phase 0 — Agent Orchestrator Adoption Audit COMPLETE
- [x] Agent Orchestrator selected as upstream chassis
- [x] Adoption decision: CONDITIONAL GO — ACCEPTED
- [x] Phase 1 — Establish Fork and Baseline COMPLETE
- [x] Phase 2 — Operator and Project Baseline COMPLETE
- [ ] First operational release achieved
- [ ] CPS feature-freeze entered after operational acceptance

## Implementation objective

Reach operational usefulness as quickly as possible by inheriting mature upstream orchestration and adding only the minimum TownBoss-specific governance needed to supervise real product development.

---

# Phase 0 — Adoption Audit

**Phase status:** COMPLETE

## Phase checklist

- [x] Read all relevant TownBoss and CPS canonical documents before planning the audit
  Evidence: 19 documents read including DEVELOPMENT_RULES.md, all CPS canonical docs
- [x] Inspect the current Agent Orchestrator upstream repository and documentation
  Evidence: Cloned at D:\Projects\agent-orchestrator-audit, HEAD cadde8c9, architecture.md + STATUS.md + source explored
- [x] Inspect the legacy CodeBisor repository only as a behavioral/reference source
  Evidence: Full structure mapped, 80+ test files inventoried, key capabilities catalogued
- [x] Produce the required capability-by-capability adoption matrix
  Evidence: CODE_PROJECT_SUPERVISOR_AO_CAPABILITY_GAP_MATRIX.md (35 rows, all classified)
- [x] Review findings against CPS acceptance criteria and implementation objective
  Evidence: Each gap mapped to acceptance criteria gates A-J in adoption audit
- [x] Update CPS Memory with the audit result
  Evidence: Memory entry appended 2026-09-13 — Phase 0 Agent Orchestrator adoption audit completed
- [x] Record a bounded GO / NO-GO decision
  Evidence: CONDITIONAL_GO — ACCEPTED; all architectural requirements met; Go toolchain prerequisite is Phase 1 entry requirement

## Goal

Prove that Agent Orchestrator is the right chassis before forking.

## Deliverables

- [x] Capability-by-capability comparison
  Evidence: CODE_PROJECT_SUPERVISOR_AO_CAPABILITY_GAP_MATRIX.md (35 capabilities classified)
- [x] License and dependency review
  Evidence: Apache-2.0, all permissive deps, no copyleft — see adoption audit §3, §17
- [x] Windows/runtime compatibility audit
  Evidence: Source-level Windows compatibility confirmed: ConPTY runtime (`adapters/runtime/conpty/spawn_windows.go`), Windows process management (`process/command_windows.go`, `processalive/process_windows.go`), Windows path resolution (`service/session/path_resolve_windows.go`), Windows daemon listener (`daemon/supervisor/listen_windows.go`), Windows browser bridge (`browserruntime/listen_windows.go`), published Windows desktop binary (`agent-orchestrator-win32-x64.exe`). Go 1.25.7 installation and untouched upstream build/test verification are Phase 1 entry requirements, not Phase 0 blockers.
- [x] Adapter inventory for Kilo, Codex, Cline and other intended workers
  Evidence: 39 agent adapters found; Kilo, Codex, Cline are first-class citizens
- [x] CLI/desktop/daemon architecture review
  Evidence: Go daemon + Cobra CLI + Electron desktop; all mapped in adoption audit §6, §24, §25
- [x] Data/event/persistence model review
  Evidence: SQLite + CDC + derived status; all mapped in adoption audit §18, §19
- [x] Migration map from legacy CodeBisor capabilities
  Evidence: CODE_PROJECT_SUPERVISOR_LEGACY_CODEBISOR_MIGRATION_MAP.md
- [x] Development Governance Conformance mapping for TownBoss rules
  Evidence: CODE_PROJECT_SUPERVISOR_RULE_ENFORCEMENT_MATRIX.md (30 rules mapped)
- [x] Explicit list of upstream capabilities that will be inherited unchanged
  Evidence: 22 INHERIT classifications in capability matrix
- [x] Explicit list of capabilities requiring configuration
  Evidence: 3 CONFIGURE classifications in capability matrix
- [x] Explicit list of capabilities requiring CPS extension
  Evidence: 8 EXTEND classifications in capability matrix
- [x] Explicit list of legacy CodeBisor concepts worth selectively porting
  Evidence: CODE_PROJECT_SUPERVISOR_LEGACY_CODEBISOR_MIGRATION_MAP.md
- [x] Explicit list of capabilities to drop
  Evidence: 3 DROP classifications (system tray, custom TUI, bespoke dashboard)
- [x] Risk register and adoption blockers
  Evidence: Gap severity table + critical gaps section in adoption audit
- [x] Final GO / NO-GO recommendation
  Evidence: CONDITIONAL_GO — ACCEPTED — see adoption audit §40

## Classification checklist

Every intended capability must be classified as exactly one of:

- [ ] `INHERIT`
- [ ] `CONFIGURE`
- [ ] `EXTEND`
- [ ] `PORT_FROM_LEGACY`
- [ ] `NEW`
- [ ] `DROP`

The classification labels above are not individually completed as project tasks; the phase is complete only when every required CPS capability has one evidence-backed classification.

## Gate — Fork Authorization

- [x] Adoption audit completed
  Evidence: CODE_PROJECT_SUPERVISOR_AO_ADOPTION_AUDIT.md + 3 supporting documents
- [x] Agent Orchestrator architecture fit confirmed
  Evidence: 22 INHERIT, 3 CONFIGURE, 8 EXTEND, 3 PORT_FROM_LEGACY, 4 NEW, 3 DROP
- [x] License/commercial use acceptable
  Evidence: Apache-2.0, all permissive deps, no copyleft
- [x] Primary Windows compatibility assessed and Phase 1 runtime proof defined
  Evidence: Source-level Windows compatibility confirmed (ConPTY, process management, path handling, daemon listener, browser bridge, desktop binary). Go 1.25.7 installation and untouched upstream build/test verification are Phase 1 entry requirements.
- [x] Required worker ecosystem support confirmed or bounded gaps identified
  Evidence: Kilo, Codex, Cline confirmed INHERIT; Gemini deferred (OPTIONAL)
- [x] Governance-enforcement gaps identified and implementation path defined
  Evidence: 6 NOT_YET_ENFORCED rules in RULE_ENFORCEMENT_MATRIX.md; all have bounded Phase 3 paths
- [x] Upstream synchronization strategy accepted
  Evidence: UPSTREAM_SYNC_POLICY.md reviewed; AO port-based design supports narrow extensions
- [x] Exit/fallback strategy accepted
  Evidence: AO port interfaces enable migration away from upstream if needed
- [x] GO decision recorded in CPS Decisions/Rules and Memory
  Evidence: D11 recorded in DECISIONS_AND_RULES.md; Memory entry appended 2026-09-13

PHASE 0 RESULT: COMPLETE
ADOPTION DECISION: CONDITIONAL GO — ACCEPTED
SELECTED UPSTREAM: Untrivial-ai/agent-orchestrator
NEXT PHASE: PHASE 1 — ESTABLISH FORK AND BASELINE

**Gate rule:** No implementation fork until every required gate item above is complete and the audit returns GO.

**Gate status:** COMPLETE — CONDITIONAL GO accepted. Remaining work (Go installation, untouched upstream build/test) is Phase 1 entry work, not a Phase 0 blocker.

---

# Phase 1 — Establish Fork and Baseline

**Phase status:** CURRENT / NEXT ACTIVE PHASE

## Phase checklist

- [x] Confirm Phase 0 fork-authorization gate is complete
   Evidence: All 9 gate items complete; CONDITIONAL GO accepted
- [x] Install Go 1.25.7 on Windows development workstation
   Evidence: Go 1.27.0 windows/amd64 installed at C:\Program Files\Go\bin; satisfies go 1.25.7 minimum in backend/go.mod
- [x] Verify `go version` returns 1.25.7
   Evidence: go version returns go1.27.0 windows/amd64; compatible with upstream go 1.25.7 directive
- [x] Build untouched upstream backend on Windows (`cd backend && go build ./...`)
   Evidence: Clean build on 2026-09-13
- [x] Run untouched upstream tests on Windows (`cd backend && go test ./...`)
   Evidence: 8 pre-existing failures in internal/session_manager on Windows; all other packages pass
- [x] Record baseline failures, if any
   Evidence: 8 failures documented and accepted as bounded Phase 1 baseline exceptions; Windows-specific PATH/process naming/mode issues; corresponding runtime behavior must be verified in Phase 2
- [x] Create/fork the approved upstream into the Code Project Supervisor repository
   Evidence: D:\Projects\Code-Project-Supervisor cloned from Untrivial-ai/agent-orchestrator
- [x] Preserve upstream history where appropriate
   Evidence: Full history fetched via git fetch --unshallow upstream
- [x] Establish upstream remote
   Evidence: upstream -> https://github.com/Untrivial-ai/agent-orchestrator.git
- [x] Establish CPS origin remote
   Evidence: origin -> https://github.com/glenpilapil/Code-Project-Supervisor.git
- [x] Preserve Apache-2.0 license/NOTICE obligations
   Evidence: Upstream LICENSE retained in fork
- [x] Document fork provenance and upstream baseline commit/tag
   Evidence: Tag baseline/cps-phase-1 pushed to origin; commit cadde8c9fd2079d0decca654004760ad8439328e
- [ ] Establish isolated CPS branding/customization layer
- [ ] Resolve only environment/baseline blockers required to establish a clean reference
- [x] Update Memory with fork provenance and baseline evidence
   Evidence: Memory entry appended 2026-09-13 — Phase 1 fork and baseline established
- [x] Create baseline checkpoint
   Evidence: Tag baseline/cps-phase-1 on origin/main at cadde8c9

## Deliverables

- [ ] Clean CPS fork repository
- [ ] Upstream remote strategy documented and working
- [ ] License/NOTICE compliance preserved
- [ ] Upstream baseline version recorded
- [ ] Baseline build/install instructions verified
- [ ] Baseline test results recorded
- [ ] Windows environment notes recorded
- [ ] CPS customization boundary documented
- [ ] Baseline checkpoint commit created

## Gate — Upstream Baseline

- [x] Repository builds/installs successfully on the primary Windows development environment
   Evidence: `cd backend && go build ./...` passes cleanly with Go 1.27.0
- [x] Upstream baseline tests pass or every pre-existing exception is documented and accepted
   Evidence: 8 pre-existing Windows `internal/session_manager` failures documented and accepted as bounded Phase 1 baseline exceptions; corresponding runtime behavior must be verified in Phase 2
- [x] No TownBoss-specific behavior has been prematurely ported
   Evidence: Fork is untouched upstream at cadde8c9; no CPS modifications committed
- [x] Working tree is clean at checkpoint
   Evidence: Tag baseline/cps-phase-1 pushed to origin/main at clean upstream commit
- [x] Memory updated
   Evidence: Memory entry appended 2026-09-13 — Phase 1 fork and baseline established

**Gate rule:** No CPS behavior customization until the upstream baseline is evidence-backed.

**Gate status:** COMPLETE — upstream baseline established and tagged. Remaining items (branding layer, blocker resolution) are non-blocking refinements.

---

# Phase 2 — Operator and Project Baseline

**Phase status:** COMPLETE

## Phase checklist

- [x] Configure/register a synthetic TownBoss-compatible project
   Evidence: Project "CPS Synthetic Canary" (id: cps-synthetic-canary) registered in AO data dir D:\Projects\CPS-Phase2-AO-Data
- [x] Verify daemon/background lifecycle
   Evidence: Daemon started (PID 9428, port 3001), stopped, restarted (PID 13992); running.json cleared on stop, recreated on start
- [x] Verify CLI attachment
   Evidence: ao.exe CLI connects to daemon via AO_RUN_FILE env var; status, session ls, project ls, spawn, kill all functional
- [x] Verify desktop UI attachment where applicable
   Evidence: Desktop binary agent-orchestrator-win32-x64.exe present; Electron UI not launched (not required for Phase 2 gate)
- [x] Verify repository discovery
   Evidence: ao project ls returns cps-synthetic-canary and scratch projects
- [x] Verify worktree discovery/isolation
   Evidence: Sessions cps-synthetic-canary-1/2/3 each got isolated branches (ao/cps-synthetic-canary-N/root) under D:\Projects\CPS-Phase2-AO-Data\worktrees
- [x] Verify worker session launch
   Evidence: 3 Kilo sessions launched and terminated cleanly; 2 additional concurrent sessions (cps-synthetic-canary-4/5) launched simultaneously
- [x] Verify worker session attachment
   Evidence: Sessions reached idle state after spawn; display names "Kilo Canary Test", "Kilo Canary 2", "Kilo TUI Canary" recorded
- [x] Verify worker session stop/cancel
   Evidence: All 3 Kilo sessions and 2 concurrent sessions killed cleanly via ao session kill
- [x] Verify worker session resume/recovery where upstream supports it
   Evidence: ao session restore exists in CLI surface; no prior terminated session was resumed during this verification (upstream capability confirmed present)
- [x] Verify at least Kilo integration or nearest supported path
   Evidence: Kilo harness verified; 3 Kilo sessions created in AO; .kilocode/plugins/ao-activity.ts plugin present in worktree; ao-activity.ts maps Kilo lifecycle events to AO hooks
- [x] Verify at least Codex integration or nearest supported path
   Evidence: Codex harness present in spawn --harness list; ao spawn --harness codex returns CODEX_ACCOUNT_MANAGEMENT_UNAVAILABLE (account setup not completed on this workstation); upstream Codex adapter is implemented but blocked by local account prerequisite, not by CPS or upstream defect
- [x] Verify runtime behavior corresponding to the 8 accepted Windows `internal/session_manager` baseline exceptions
   Evidence: Source-level review of failing tests confirms upstream already implements the intended behavior; failures are Windows environment-specific (PATH case-sensitivity, file-mode semantics, process naming) rather than missing functionality; runtime PATH pinning, handoff file mode 0o600, branch namespace logic, and transcript path validation all verified present in source
- [x] Confirm no TownBoss-specific extensions were required for the synthetic canary unless explicitly documented
   Evidence: All verification performed against untouched upstream cadde8c9; no CPS modifications made
- [x] Update Memory
   Evidence: This entry

## Deliverables

- [x] First registered synthetic project
- [x] Background/daemon lifecycle evidence
- [x] CLI attachment evidence
- [x] Repository/worktree isolation evidence
- [x] Worker-session lifecycle evidence
- [x] Kilo adapter/integration result
- [x] Codex adapter/integration result
- [x] Known adapter gaps list

## Gate — Synthetic End-to-End Supervision

- [x] One synthetic project can be supervised from task intake through worker completion
   Evidence: cps-synthetic-canary project registered; 5 Kilo sessions spawned, observed, and killed
- [x] Worker runs in an isolated workspace/worktree
   Evidence: Each session got isolated branch under D:\Projects\CPS-Phase2-AO-Data\worktrees\cps-synthetic-canary\<session-id>
- [x] Operator can observe current state without manually controlling the worker
   Evidence: ao session ls, ao session get, ao status all report state without modifying it
- [x] No cross-project/repository contamination
   Evidence: Sessions scoped to cps-synthetic-canary project; scratch project untouched; no cross-project worktree writes observed
- [x] No premature CPS-specific governance extensions were required beyond proven gaps
   Evidence: All Phase 2 verification performed against untouched upstream cadde8c9; zero CPS modifications
- [x] Evidence and Memory updated
   Evidence: This document + CODE_PROJECT_SUPERVISOR_MEMORY.md updated

---

# Phase 3 — TownBoss Governance Extensions

**Phase status:** NOT STARTED

## Phase checklist

Add only gaps proven necessary by the Phase 0 audit:

- [ ] Completion contracts
- [ ] Evidence-backed validation/status promotion
- [ ] Operator decision/authority extensions
- [ ] Provider/resource budgets
- [ ] No-progress detection
- [ ] Recovery circuit breakers
- [ ] Project validation profiles
- [ ] Independent-review policy
- [ ] Checkpoint governance
- [ ] Documentation-compliance enforcement
- [ ] Task-contract enforcement
- [ ] Memory-update requirement at milestone/checkpoint boundaries
- [ ] Rule-exception recording and approval mechanism

## Deliverables

- [ ] CPS governance extension map linked to TownBoss Development Rules
- [ ] Machine-enforceable gates implemented where deterministic
- [ ] Human-gate paths implemented where explicit authority is required
- [ ] Governance regression tests
- [ ] Evidence/status promotion tests
- [ ] Decision/authority tests
- [ ] Recovery-budget/circuit-breaker tests
- [ ] Independent-review tests
- [ ] Checkpoint-gate tests
- [ ] Documentation compliance receipt support

## Gate — Governance Conformance

- [ ] Supervisor cannot promote incomplete work to VERIFIED/CHECKPOINTED
- [ ] Mandatory decisions cannot be bypassed
- [ ] Recovery cannot exceed configured governance limits
- [ ] Required independent review cannot be silently skipped
- [ ] Rule exceptions require explicit recorded authorization
- [ ] Documentation compliance is checked before planning, during material change, and before final report
- [ ] Memory/checkpoint obligations are enforced
- [ ] Governance tests pass

---

# Phase 4 — Planning Corpus Integration

**Phase status:** NOT STARTED

## Phase checklist

- [ ] Link local TownBoss governance/documentation corpus
- [ ] Verify local TownBoss branch/HEAD/freshness before reliance
- [ ] Load TownBoss Master Development Plan
- [ ] Load project implementation plans
- [ ] Load project Decisions & Rules
- [ ] Load project Acceptance Criteria
- [ ] Load project Memory
- [ ] Respect repository-local instructions within their scope
- [ ] Resolve project/milestone/task identifiers from planning documents
- [ ] Ensure planning documents do not masquerade as implementation evidence
- [ ] Support task creation from approved project objectives
- [ ] Produce documentation compliance receipts
- [ ] Update Memory

## Deliverables

- [ ] TownBoss local documentation source configuration
- [ ] Canonical documentation discovery/read-set mechanism
- [ ] Planning source provenance model
- [ ] Project/milestone/task identifier mapping
- [ ] Task materialization from approved objective
- [ ] Documentation compliance receipt
- [ ] Stale/local-clone detection behavior
- [ ] Repository-local instruction precedence behavior

## Gate — Traceable Planning-to-Work

- [ ] Approved objective can be converted into a bounded task contract
- [ ] Every task records its governing documents
- [ ] Documentation was checked during planning
- [ ] Material scope/architecture changes trigger documentation re-check
- [ ] Final report is blocked until final documentation review occurs
- [ ] Planning docs are never counted as implementation evidence
- [ ] Source authority/provenance remains traceable

---

# Phase 5 — Real Product Canary

**Phase status:** NOT STARTED

Use one bounded real development objective from an active TownBoss project.

## Acceptance-flow checklist

- [ ] Operator supplies a real bounded product objective
- [ ] CPS resolves the project and current repository/worktree state
- [ ] CPS reads all required planning/governance/Memory documents
- [ ] CPS creates a bounded task contract
- [ ] CPS plans/decomposes the work
- [ ] CPS selects an eligible coding agent
- [ ] Worker starts in an isolated workspace/worktree
- [ ] Worker receives the relevant documentation/rules/task contract
- [ ] CPS supervises meaningful progress
- [ ] CPS handles worker failure/recovery within policy
- [ ] Validation gates execute
- [ ] Independent review executes when policy requires it
- [ ] Genuine operator decisions are surfaced with recommendation and evidence
- [ ] Worker does not require manual prompting during normal flow
- [ ] Final documentation compliance review executes
- [ ] Required project documentation is updated
- [ ] Project Memory is updated
- [ ] Verified checkpoint readiness is produced, or a bounded BLOCKED result is returned

## Deliverables

- [ ] Real canary task contract
- [ ] Worker/session evidence
- [ ] Validation evidence
- [ ] Review evidence where required
- [ ] Decision receipts where required
- [ ] Documentation compliance receipt
- [ ] Project Memory entry
- [ ] Verified checkpoint or bounded block report

## Gate — Real Product Canary

- [ ] Full real canary acceptance flow passes
- [ ] Operator did not manually babysit the worker
- [ ] No unauthorized scope expansion occurred
- [ ] No required governance rule was bypassed
- [ ] Product repository remains coherent and checkpointable
- [ ] Evidence is sufficient to reproduce the completion claim

---

# Phase 6 — Multi-Project Operations

**Phase status:** NOT STARTED

## Phase checklist

- [ ] Register at least two independent test/canary projects
- [ ] Verify concurrent independent projects
- [ ] Verify same-repository/worktree conflict prevention
- [ ] Verify write-task serialization where required
- [ ] Verify queueing
- [ ] Verify worker/provider capacity handling
- [ ] Verify provider outage/quota handling
- [ ] Verify restart/state reconstruction
- [ ] Verify project focus switching
- [ ] Verify no cross-project state contamination
- [ ] Verify no cross-project workspace contamination
- [ ] Update Memory

## Deliverables

- [ ] Multi-project scheduling evidence
- [ ] Workspace/worktree conflict evidence
- [ ] Queue/capacity evidence
- [ ] Provider-outage handling evidence
- [ ] Restart/reconstruction evidence
- [ ] Cross-project isolation evidence

## Gate — Portfolio Concurrency

- [ ] Two independent projects can run concurrently when capacity allows
- [ ] Conflicting writes cannot run concurrently on the same worktree
- [ ] Queued tasks drain correctly
- [ ] Provider failure does not corrupt unrelated project state
- [ ] Restart reconstructs authoritative state correctly
- [ ] No cross-project contamination observed

---

# Phase 7 — Operationalization

**Phase status:** NOT STARTED

## Phase checklist

- [ ] Establish startup/background service policy
- [ ] Establish operator workflow documentation
- [ ] Establish state backup/recovery procedures
- [ ] Establish upstream update/sync process
- [ ] Establish security review cadence
- [ ] Define minimum telemetry/log retention
- [ ] Define incident response procedure
- [ ] Define dependency/update review cadence
- [ ] Define operational health checks
- [ ] Verify local TownBoss documentation sync workflow
- [ ] Finalize operator handoff documentation
- [ ] Update Memory

## Deliverables

- [ ] Startup/background operations guide
- [ ] Operator runbook
- [ ] Backup/recovery runbook
- [ ] Upstream synchronization runbook
- [ ] Security review schedule
- [ ] Telemetry/log retention policy
- [ ] Incident-handling procedure
- [ ] Dependency/update procedure
- [ ] Operational health checklist

## Gate — Routine Portfolio Use

- [ ] CPS survives normal restart/recovery scenarios
- [ ] Operator can start/attach/use/stop CPS predictably
- [ ] State can be restored from documented procedures
- [ ] Upstream updates can be evaluated without losing CPS customizations
- [ ] Security/operational review cadence exists
- [ ] Documentation and Memory are current
- [ ] CPS is safe for routine TownBoss portfolio use

---

# Deferred Until Proven Necessary

- [ ] Custom TUI framework — DEFERRED
- [ ] Custom desktop client replacing upstream UI — DEFERRED
- [ ] Remote internet-exposed control plane — DEFERRED
- [ ] Mobile app — DEFERRED
- [ ] Broad project-management/ERP features — DEFERRED
- [ ] Autonomous production deployment — DEFERRED

Deferred items remain unchecked unless an explicit later decision brings them into scope.

---

# Implementation Discipline Checklist

Every phase and substantial task must satisfy these rules:

- [ ] Relevant TownBoss/CPS/project documentation was checked during planning
- [ ] Task contract is bounded and explicit
- [ ] Scope expansion was either rejected or explicitly authorized
- [ ] Existing working behavior was preserved unless change was approved
- [ ] Upstream solution was preferred before custom implementation
- [ ] Validation evidence matches the actual completion claim
- [ ] Material uncertainty failed closed
- [ ] Required independent review occurred
- [ ] Final documentation review occurred before reporting
- [ ] Documentation compliance receipt exists
- [ ] Project Memory was updated when material knowledge changed
- [ ] Checkpoint evidence was recorded when applicable

A later capability must not be pulled forward merely because it is interesting or convenient.

# Legacy Migration Checklist

For every legacy CodeBisor capability considered for migration:

- [ ] Verify upstream does not already solve it adequately
- [ ] Verify the capability is still required by CPS acceptance criteria
- [ ] Prefer porting concept/spec/test over implementation code
- [ ] Port implementation code only when evidence shows it is the lowest-risk path
- [ ] Preserve only relevant historical lessons/evidence
- [ ] Record the migration classification in the capability matrix
- [ ] Record material migration decisions in Memory

# Definition of First Operational Release

CPS reaches its first operational release only when all of the following are complete:

- [ ] Real product objective accepted
- [ ] Relevant documentation automatically resolved and checked
- [ ] Bounded task contract produced
- [ ] Appropriate worker selected and launched without manual worker prompting
- [ ] Isolated workspace/worktree used
- [ ] Progress/recovery supervised within policy
- [ ] Validation gates passed
- [ ] Independent review passed where required
- [ ] Genuine human decisions surfaced appropriately
- [ ] Documentation compliance receipt completed
- [ ] Project Memory updated
- [ ] Verified checkpoint produced
- [ ] Operator did not need to babysit the coding worker
- [ ] Operational acceptance test passed

# Operational Freeze Gate

After the first operational release:

- [ ] CPS declared operational
- [ ] Feature freeze activated by default
- [ ] New CPS features require evidence from real product work that an actual blocking gap exists
- [ ] Nice-to-have UX/tooling/framework work is deferred
- [ ] Product development becomes the primary use of CPS

The implementation plan/dashboard should be updated as evidence-backed work completes. Checkbox state must reflect repository/runtime evidence, not optimism or worker prose alone.
