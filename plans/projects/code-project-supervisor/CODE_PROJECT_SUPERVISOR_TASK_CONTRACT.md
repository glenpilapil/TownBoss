# Code Project Supervisor — Task Contract

**Status:** CANONICAL  
**Purpose:** Required structure for substantial CPS-supervised development work.

## Rule

A substantial task should not begin until its scope, evidence requirements, and completion conditions are defined.

## Required Fields

Every substantial task must define:

1. **Task ID** — stable unique identifier.
2. **Project / repository / worktree** — exact target and expected baseline when relevant.
3. **Objective** — one bounded outcome.
4. **Why now** — relationship to active milestone and acceptance criteria.
5. **Relevant documentation read-set** — portfolio rules plus project-specific plans, architecture, decisions, acceptance criteria, Memory, and repository-local instructions.
6. **Baseline evidence** — current git/status/test/runtime state needed to interpret the work.
7. **In-scope deliverables** — explicit expected changes or artifacts.
8. **Prohibited scope** — adjacent work that is not part of this task.
9. **Dependencies** — task, upstream, or environment prerequisites.
10. **Risk class** — per CPS risk policy.
11. **Permitted actions** — what may be done within this task without further decision.
12. **Worker requirements** — required capabilities or provider constraints.
13. **Resource/recovery budgets** — retry, no-progress, or time ceilings where applicable.
14. **Validation gates** — exact evidence required.
15. **Independent review requirement** — whether a separate review is required.
16. **Completion contract** — conditions for IMPLEMENTED, TESTED, VERIFIED, and CHECKPOINTED.
17. **Documentation update requirement** — documents affected by the resulting reality.
18. **Memory update requirement** — durable knowledge that must be recorded.
19. **Checkpoint policy** — expected commit/PR/checkpoint shape if authorized.
20. **Final report contract** — required evidence and Documentation Compliance Receipt.

## Task Lifecycle

`PROPOSED -> READY -> RUNNING -> VALIDATING -> REVIEWING -> VERIFIED -> CHECKPOINTED -> DONE`

Exceptional states:

`WAITING | BLOCKED | ATTENTION_REQUIRED | FAILED | DEFERRED | CANCELLED`

A task does not become DONE merely because implementation was produced when validation or review remains outstanding.

## Scope Change Rule

If execution uncovers work outside the contract:

- stop that new work;
- record the finding;
- determine whether it is strictly required for the current completion contract;
- if not required, propose a future task;
- if required and it materially changes scope or risk, amend the task contract before continuing.

## Documentation Compliance Receipt

Every substantial final report must state:

- planning documents consulted;
- documents re-checked during execution and why;
- final-review documents re-read;
- conflicts or ambiguities found;
- approved exceptions, if any;
- documentation updated;
- Memory updated.

A missing receipt prevents promotion to VERIFIED unless the task was explicitly classified as trivial or read-only.