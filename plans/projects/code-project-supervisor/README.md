# Code Project Supervisor

**Portfolio:** TownBoss  
**Project status:** DECIDED / FOUNDATION ADOPTION  
**Working name:** Code Project Supervisor  
**Role:** Portfolio development supervisor and engineering operations controller

## Mission

Code Project Supervisor exists to supervise software development work across TownBoss projects so the operator works primarily with one development-management layer rather than manually driving individual coding agents.

Its job is to accept development objectives, turn them into governed work, delegate to appropriate coding agents, supervise execution, verify completion, request human decisions only where genuinely necessary, and return evidence-backed checkpoints.

The project is intentionally defined as a **supervisor above coding agents**, not as another coding agent.

## Current foundation decision

The new implementation should start from the open-source `Untrivial-ai/agent-orchestrator` project as the preferred upstream chassis, subject to a bounded adoption audit before implementation. The existing CodeBisor repository is preserved as a behavioral reference and source of selected governance concepts; it is not the preferred foundation for continued greenfield development.

## Canonical documents

- `CODE_PROJECT_SUPERVISOR_CURRENT_STATE.md` — concise present truth: current milestone, completed foundation, blockers, and next action.
- `CODE_PROJECT_SUPERVISOR_DUTIES_AND_RESPONSIBILITIES.md` — job description, authority and accountability.
- `CODE_PROJECT_SUPERVISOR_PRODUCT_SPEC.md` — intended operator-facing and supervisory capabilities.
- `CODE_PROJECT_SUPERVISOR_ARCHITECTURE.md` — target structural model and boundaries.
- `CODE_PROJECT_SUPERVISOR_IMPLEMENTATION_PLAN.md` — phased adoption and delivery plan.
- `CODE_PROJECT_SUPERVISOR_DECISIONS_AND_RULES.md` — starting decisions, non-negotiable rules and scope controls.
- `CODE_PROJECT_SUPERVISOR_ACCEPTANCE_CRITERIA.md` — definition of operational readiness and completion.
- `CODE_PROJECT_SUPERVISOR_UPSTREAM_ADOPTION_PLAN.md` — Agent Orchestrator fork/adoption strategy.
- `CODE_PROJECT_SUPERVISOR_CAPABILITY_MATRIX.md` — required capabilities, ownership/adoption classification, status and evidence map.
- `CODE_PROJECT_SUPERVISOR_TASK_CONTRACT.md` — mandatory structure for bounded supervised development tasks.
- `CODE_PROJECT_SUPERVISOR_AUTHORITY_MATRIX.md` — defines what workers, CPS and the operator may decide or perform.
- `CODE_PROJECT_SUPERVISOR_VALIDATION_AND_EVIDENCE_STANDARD.md` — evidence classes and promotion gates from implementation through checkpoint.
- `CODE_PROJECT_SUPERVISOR_RISK_AND_RECOVERY_POLICY.md` — risk levels, recovery budgets, circuit-breaker and failure-handling rules.
- `CODE_PROJECT_SUPERVISOR_WORKER_ADAPTER_CONTRACT.md` — provider-neutral contract for launching, observing, resuming and evaluating coding agents.
- `CODE_PROJECT_SUPERVISOR_UPSTREAM_SYNC_POLICY.md` — fork/upstream provenance, customization and synchronization policy.
- `CODE_PROJECT_SUPERVISOR_DOCUMENTATION_COMPLIANCE_PROTOCOL.md` — required planning, execution re-check and final review documentation compliance cycle.
- `CODE_PROJECT_SUPERVISOR_OPERATIONAL_ACCEPTANCE_TEST.md` — final real product-task gate that determines when CPS is operational enough and feature work freezes.
- `CODE_PROJECT_SUPERVISOR_MEMORY.md` — durable, append-oriented development memory recording what was performed, decisions, incidents, verification evidence, lessons, checkpoints and handoffs across sessions and agents.

## Portfolio-wide governance

CPS is also governed by TownBoss `governance/DEVELOPMENT_RULES.md`. Project-specific rules may be stricter, but cannot silently waive portfolio rules.

## Project memory rule

Substantial development work must consult the project Memory before execution and append durable evidence before a completed milestone or handoff is considered closed. Memory complements the normative specifications: it records what actually happened and why, while the specifications and decisions documents define what currently governs.

## Documentation compliance rule

Substantial work must pass the three-stage documentation compliance cycle: planning read-set, execution-stage re-checks when material triggers occur, and final review against governing documents before reporting or verification. Final reports require a Documentation Compliance Receipt.

## Governing success statement

Code Project Supervisor is successful when the operator can provide a real development objective and the supervisor can plan/decompose it, select and launch suitable workers, manage concurrency and recovery, validate and review the work, request only genuine human decisions, and return a verified checkpoint without requiring the operator to babysit the worker agents.

## Relationship to legacy CodeBisor

`plans/projects/codebisor/` is retained as historical/reference material. Useful behavioral contracts may be selectively ported after evidence-based comparison, but previous implementation effort does not justify retaining duplicated infrastructure when the upstream foundation already provides a stronger implementation.
