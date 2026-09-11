# CodeBisor Implementation Plan

**Status:** ACTIVE IMPLEMENTATION  
**Evidence reconciliation:** 2026-09-12

## Mission

CodeBisor is the TownBoss development supervisor: a persistent operational view of projects, tasks, agents, evidence, checkpoints, blockers and validation gates.

## Repository AS-IS Baseline — `glenpilapil/CodeBisor`

Recent repository history confirms that CodeBisor is beyond a static dashboard prototype and already contains governed multi-provider execution foundations.

**IMPLEMENTED / repository-evidenced:**

- Supervisor dashboard model with portfolio/project/task checklists and statuses.
- Current task and live subtask activity rendering.
- ANSI cursor-boundary rendering with persistent and transient regions plus fallback behavior.
- Portfolio attention, deferred-decision and event-log concepts.
- Capability-aware provider routing policy for approved workers.
- Provider selection persisted before live worker launch.
- Provider-specific autonomous resource budgets while preserving explicit legacy budget semantics.
- Deterministic provider-failure normalization and deferral handling.
- Explicit routed adapter identity binding for Codex, Gemini, Cline and Kilo.
- GeoPlotter onboarding canary/task support, including a bounded read-only Gemini onboarding path and non-autostart safety behavior.
- Repository/local-path adjustments for GeoPlotter audit/canary execution.

Key evidence includes commits `343d90f` (provider routing + GeoPlotter onboarding canary), `679bda6` (provider binding before launch), `30b90b0` (provider resource budgets), `a8d9b9b` (normalized provider failure handling), and `21606ac` (bounded GeoPlotter onboarding canary).

## Current Capability Classification

| Capability | Classification | Notes |
|---|---|---|
| Terminal supervisor rendering | IMPLEMENTED | Persistent/transient region model established |
| Multi-provider routing | IMPLEMENTED | Capability-aware routing and identity binding in repository history |
| Provider resource budgets | IMPLEMENTED | Provider-specific defaults with compatibility behavior |
| Provider failure normalization | IMPLEMENTED | Deterministic classification/deferral path present |
| GeoPlotter onboarding canary | IMPLEMENTED / bounded | Read-only and explicit safety contract |
| Masterplan ingestion | PLANNED | TownBoss planning corpus now exists; parser/schema not yet evidenced |
| Evidence-backed status promotion | PARTIAL / PLANNED | Principle exists; complete canonical implementation must be reconciled |
| Resumable sessions | PLANNED unless newer evidence is found | Requires repository pass |
| Remote-operation security model | PLANNED | Future gate |

## Target Architecture

### 1. Canonical plan ingestion
Consume the TownBoss masterplan hierarchy and project/application plans as roadmap authority. Parser output should preserve stable IDs, status vocabulary, dependencies, gates and evidence requirements.

### 2. Repository adapters
Git/GitHub/local-workspace adapters for branch, commit, dirty state, tests, PRs, issues and checkpoint evidence.

### 3. Agent execution
Provider-neutral worker interface for Codex, Gemini, Kilo/Cline and future approved agents, with explicit task contracts, routed provider identity, stdout/events, cancellation, bounded resources and receipts.

### 4. State model
`Portfolio -> Project -> Application -> Milestone -> Gate -> Task -> Subtask -> Evidence/Checkpoint`

### 5. Verification
Never mark DONE from worker prose alone when machine-verifiable evidence is required. Capture test/analyzer/build/git/runtime evidence and bind it to a concrete repository state.

### 6. Safety
Approval gates for destructive operations, production changes, secrets, irreversible migrations and external publication. Canary/onboarding tasks remain bounded until their safety contracts and provider routing are proven.

## Immediate Gap Register

- [ ] Run and record current full CodeBisor test suite at current default-branch HEAD.
- [ ] Inventory current supervisor state/schema and persistence behavior.
- [ ] Define and implement TownBoss masterplan Markdown parser/schema.
- [ ] Map existing supervisor checklist state to canonical plan/application/milestone IDs.
- [ ] Complete evidence-backed status-promotion rules and provenance receipts.
- [ ] Confirm checkpoint persistence survives process/session restart.
- [ ] Verify multi-project switching does not lose live worker or evidence state.
- [ ] Reconcile terminal rendering implementation against latest dashboard requirements.
- [ ] Implement/verify resumable supervisor sessions.
- [ ] Define security/permission model for any future remote operation.
- [ ] Add explicit synchronization strategy between TownBoss planning corpus and CodeBisor runtime state.

## Release/Operational Gates

1. Current test-suite green gate.
2. State persistence/restart gate.
3. Provider routing + failure-handling regression gate.
4. Canary safety-contract gate.
5. Masterplan ingestion correctness gate.
6. Evidence/status provenance gate.
7. Multi-project concurrency/state-isolation gate.
8. Terminal/non-ANSI rendering gate.
9. Security review before remote or autonomous mutation expansion.

## Evidence Rule

Commit history proves that a capability has existed in repository code. `VERIFIED` requires fresh tests or runtime evidence tied to the current commit used by the supervisor.
