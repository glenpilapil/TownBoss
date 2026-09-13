# TownBoss Project Governance Standard

**Status:** CANONICAL / PORTFOLIO-WIDE

Every active TownBoss project must maintain a minimum governance corpus so humans and agents can enter the project, understand current truth, perform bounded work under the portfolio development rules, and leave durable evidence.

## Required project documents

Each active project must have, at minimum:

1. **Implementation Plan / Dashboard** — phased checklist of work, deliverables, gates, acceptance and current phase. Checkboxes are the authoritative completion markers.
2. **Memory** — append-oriented historical ledger of material decisions, implementations, incidents, verification, checkpoints, lessons and handoffs.
3. **Current State** — concise present-state summary: current phase, completed work, current work, blockers, next action and evidence status.
4. **Decisions & Rules** — project-specific decisions and stricter rules that supplement `governance/DEVELOPMENT_RULES.md`.
5. **Acceptance Criteria** — project and milestone finish lines; implementation is not complete until relevant criteria are verified.
6. **Documentation Compliance Protocol** — required planning, execution re-check and final review of relevant documentation, including a Documentation Compliance Receipt in substantial final reports.

Projects may add architecture, product-specification, capability, authority, risk/recovery, validation/evidence and integration documents when complexity requires them.

## Implementation Plan dashboard rule

The implementation plan is the operator's primary development dashboard. Every phase, task, deliverable and gate must be represented as a checklist item where practical. Do not mark an item complete without evidence. Status annotations such as `IN PROGRESS`, `ATTENTION`, `BLOCKED` and `DEFERRED` may supplement but do not replace checkboxes.

## Documentation compliance cycle

Every substantial development task must perform:

- **Planning gate:** identify and read all relevant TownBoss, project and repository-local documentation before planning or acting.
- **Execution gate:** re-check relevant documents if scope, architecture, dependencies, risk, authority or acceptance interpretation materially changes.
- **Final review gate:** re-read governing documentation before the final report/checkpoint and verify the result against scope, decisions, architecture, acceptance and Memory requirements.

The final report must contain a Documentation Compliance Receipt listing planning documents consulted, execution re-checks, final-review documents, conflicts, approved exceptions, and documents/Memory updated.

## Task checkpoint commit rule

Every write-capable task that produces repository changes must create a final task-scoped Git checkpoint before its final report. The checkpoint must follow `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`.

The commit subject begins with the canonical identifiers:

`[P<phase>][D<deliverable-id>][T<task-id>] <summary>`

The checkpoint is created only after required validation, documentation updates, Memory updates, and final documentation review. It must contain only task-owned changes. Permission to commit does not imply permission to push, merge, publish, release, or deploy.

If no repository changes were produced, no empty commit is required; the final report records `NO_COMMIT_REQUIRED`.

## Memory rule

Memory records what actually happened and why; it is not raw terminal output. Failed and superseded approaches remain visible and are marked rather than erased.

## Current-state rule

Current State is present truth, not historical narrative. It must remain short enough to serve as the default orientation page for a new worker or supervisor.

## Inheritance

All projects inherit `governance/DEVELOPMENT_RULES.md` and `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`. Project-specific rules may be stricter but may not silently weaken portfolio rules. Exceptions require explicit recorded authorization.
