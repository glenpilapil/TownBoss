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

- `CODE_PROJECT_SUPERVISOR_DUTIES_AND_RESPONSIBILITIES.md` — job description, authority and accountability.
- `CODE_PROJECT_SUPERVISOR_PRODUCT_SPEC.md` — intended operator-facing and supervisory capabilities.
- `CODE_PROJECT_SUPERVISOR_ARCHITECTURE.md` — target structural model and boundaries.
- `CODE_PROJECT_SUPERVISOR_IMPLEMENTATION_PLAN.md` — phased adoption and delivery plan.
- `CODE_PROJECT_SUPERVISOR_DECISIONS_AND_RULES.md` — starting decisions, non-negotiable rules and scope controls.
- `CODE_PROJECT_SUPERVISOR_ACCEPTANCE_CRITERIA.md` — definition of operational readiness and completion.
- `CODE_PROJECT_SUPERVISOR_UPSTREAM_ADOPTION_PLAN.md` — Agent Orchestrator fork/adoption strategy.

## Governing success statement

Code Project Supervisor is successful when the operator can provide a real development objective and the supervisor can plan/decompose it, select and launch suitable workers, manage concurrency and recovery, validate and review the work, request only genuine human decisions, and return a verified checkpoint without requiring the operator to babysit the worker agents.

## Relationship to legacy CodeBisor

`plans/projects/codebisor/` is retained as historical/reference material. Useful behavioral contracts may be selectively ported after evidence-based comparison, but previous implementation effort does not justify retaining duplicated infrastructure when the upstream foundation already provides a stronger implementation.
