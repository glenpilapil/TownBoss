# Code Project Supervisor — Current State

**Status:** FOUNDATION ADOPTION  
**Date:** 2026-09-13  
**Purpose:** Fast, current-state entry point for humans and agents.

## Current Position

Code Project Supervisor (CPS) is defined as the TownBoss portfolio development supervisor. Its preferred implementation foundation is `Untrivial-ai/agent-orchestrator`, subject to a bounded adoption audit before customization.

The prior CodeBisor implementation is preserved as legacy/reference evidence. It is not the default foundation for continued development.

## Completed Foundation Work

- Project mission, duties, product specification, architecture, implementation plan, decisions/rules, acceptance criteria, and upstream adoption strategy established.
- Portfolio-wide `governance/DEVELOPMENT_RULES.md` established.
- Durable CPS Memory ledger established.
- Upstream-first rule established.
- Agent Orchestrator selected as preferred chassis pending audit.
- Documentation compliance is required at planning, execution re-check, and final review/report stages.

## Current Workstream

**Next bounded milestone:** `CODE_PROJECT_SUPERVISOR_AO_FORK_ADOPTION_AUDIT`

The audit must map every required CPS capability against Agent Orchestrator and classify it as:

`INHERIT | CONFIGURE | EXTEND | PORT_FROM_LEGACY | NEW | DROP`

No broad implementation or customization should begin before this audit returns GO.

## Current Blockers

None known at project-governance level.

## Deferred Work

- Fork/customization of Agent Orchestrator.
- Porting selected CodeBisor governance concepts.
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

## Update Rule

This file describes present truth, not history. Update it whenever the active milestone, blockers, completed foundation, or next action materially changes. Historical changes belong in Memory.