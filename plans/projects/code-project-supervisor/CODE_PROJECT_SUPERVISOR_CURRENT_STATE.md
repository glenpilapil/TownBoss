# Code Project Supervisor — Current State

**Status:** FOUNDATION ADOPTION — PHASE 0 COMPLETE
**Date:** 2026-09-13  
**Purpose:** Fast, current-state entry point for humans and agents.

## Current Position

Code Project Supervisor (CPS) is defined as the TownBoss portfolio development supervisor. Its implementation foundation is `Untrivial-ai/agent-orchestrator`, selected after a bounded Phase 0 adoption audit.

The prior CodeBisor implementation is preserved as legacy/reference evidence. It is not the default foundation for continued development.

## Completed Foundation Work

- Project mission, duties, product specification, architecture, implementation plan, decisions/rules, acceptance criteria, and upstream adoption strategy established.
- Portfolio-wide `governance/DEVELOPMENT_RULES.md` established.
- Durable CPS Memory ledger established.
- Upstream-first rule established.
- Phase 0 Agent Orchestrator adoption audit completed.
- Adoption decision: **CONDITIONAL GO — ACCEPTED**.
- Agent Orchestrator selected as upstream chassis.
- Documentation compliance is required at planning, execution re-check, and final review/report stages.

## Current Workstream

**Next bounded milestone:** `CPS_PHASE_1_AO_FORK_BASELINE`

Phase 0 is complete. Phase 1 — Establish Fork and Baseline is the current active phase.

## Current Blockers

None at project-governance level. Phase 1 entry prerequisites:
- Go 1.25.7 must be installed on the Windows development workstation.
- Untouched upstream backend build and test verification on Windows must be completed and recorded.

## Deferred Work

- Establish CPS fork from upstream commit `cadde8c9fd2079d0decca654004760ad8439328e`.
- Port selected CodeBisor governance concepts (recovery budgets, circuit breakers, completion contracts, authority model).
- Production worker-adapter implementation.
- CPS operational acceptance test against a real bounded product task.

## Canonical Reading Order

1. `README.md`
2. `CODE_PROJECT_SUPERVISOR_CURRENT_STATE.md`
3. `CODE_PROJECT_SUPERVISOR_DUTIES_AND_RESPONSIBILITIES.md`
4. `CODE_PROJECT_SUPERVISOR_PRODUCT_SPEC.md`
5. `CODE_PROJECT_SUPERVISOR_ARCHITECTURE.md`
6. `CODE_PROJECT_SUPERVISOR_IMPLEMENTATION_PLAN.md`
7. `CODE_PROJECT_SUPERVISOR_DECISIONS_AND_RULES.md`
8. `CODE_PROJECT_SUPERVISOR_ACCEPTANCE_CRITERIA.md`
9. `CODE_PROJECT_SUPERVISOR_UPSTREAM_ADOPTION_PLAN.md`
10. `CODE_PROJECT_SUPERVISOR_CAPABILITY_MATRIX.md`
11. `CODE_PROJECT_SUPERVISOR_TASK_CONTRACT.md`
12. `CODE_PROJECT_SUPERVISOR_AUTHORITY_MATRIX.md`
13. `CODE_PROJECT_SUPERVISOR_VALIDATION_AND_EVIDENCE_STANDARD.md`
14. `CODE_PROJECT_SUPERVISOR_RISK_AND_RECOVERY_POLICY.md`
15. `CODE_PROJECT_SUPERVISOR_WORKER_ADAPTER_CONTRACT.md`
16. `CODE_PROJECT_SUPERVISOR_UPSTREAM_SYNC_POLICY.md`
17. `CODE_PROJECT_SUPERVISOR_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`
18. `CODE_PROJECT_SUPERVISOR_OPERATIONAL_ACCEPTANCE_TEST.md`
19. `CODE_PROJECT_SUPERVISOR_MEMORY.md`
20. `CODE_PROJECT_SUPERVISOR_AO_ADOPTION_AUDIT.md` (Phase 0 audit)
21. `CODE_PROJECT_SUPERVISOR_AO_CAPABILITY_GAP_MATRIX.md` (Phase 0 audit)
22. `CODE_PROJECT_SUPERVISOR_RULE_ENFORCEMENT_MATRIX.md` (Phase 0 audit)
23. `CODE_PROJECT_SUPERVISOR_LEGACY_CODEBISOR_MIGRATION_MAP.md` (Phase 0 audit)

## Update Rule

This file describes present truth, not history. Update it whenever the active milestone, blockers, completed foundation, or next action materially changes. Historical changes belong in Memory.