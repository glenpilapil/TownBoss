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
19. **Checkpoint policy** — expected commit/PR/checkpoint shape, including canonical phase/deliverable/task identifiers.
20. **Final report contract** — required evidence, Documentation Compliance Receipt, and checkpoint-commit receipt.
21. **Source-integrity / safe-edit policy** — for applicable web/structured-source work, the task must inherit `governance/WEB_SOURCE_INTEGRITY_AND_SAFE_EDIT_GATE.md`, identify any allowed whole-file/generated transformations, and prohibit unsafe blanket source replacement unless explicitly justified and reviewed.

## Task Lifecycle

`PROPOSED -> READY -> RUNNING -> VALIDATING -> REVIEWING -> VERIFIED -> CHECKPOINTED -> DONE`

Exceptional states:

`WAITING | BLOCKED | ATTENTION_REQUIRED | FAILED | DEFERRED | CANCELLED`

A task does not become DONE merely because implementation was produced when validation or review remains outstanding.

## Task Checkpoint Commit

Every write-capable CPS-supervised task that produces repository changes must create a final task checkpoint commit before reporting completion, following `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`.

Canonical commit subject prefix:

`[P<phase>][D<deliverable-id>][T<task-id>] <summary>`

The phase, deliverable, and task identifiers must come from the Implementation Plan / Dashboard and this task contract. The commit is created after required validation, documentation updates, Memory update, and final documentation review.

A task is not `CHECKPOINTED` while task-owned changes remain uncommitted. If the task produces no repository changes, the final report states `NO_COMMIT_REQUIRED` instead of creating an empty commit.

The checkpoint commit does not authorize push, merge, release, publish, or deployment.

## Scope Change Rule

If execution uncovers work outside the contract:

- stop that new work;
- record the finding;
- determine whether it is strictly required for the current completion contract;
- if not required, propose a future task;
- if required and it materially changes scope or risk, amend the task contract before continuing.

## Web / Structured-Source Safe-Edit Rule

For applicable web tasks, the worker must follow `governance/WEB_SOURCE_INTEGRITY_AND_SAFE_EDIT_GATE.md` throughout execution.

At minimum:

- inspect a structured source file before materially editing it;
- prefer bounded edits;
- do not perform recursive/file-tree text replacement that can alter syntax or semantics unless the task contract explicitly authorizes and validates the transformation;
- immediately review unexpected large diffs or whole-file churn;
- validate parser/type integrity after material structural JSX/TSX edits before continuing across additional structural files;
- treat earlier lint/typecheck/test/build output as stale after a later material source edit;
- recheck transient dev-server parse errors against the final saved file before classifying them as defects or dismissing them;
- include source-integrity evidence in the final report.

A source-integrity failure blocks `VERIFIED` and `CHECKPOINTED` until repaired or explicitly excepted by the operator.

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

## Checkpoint Commit Receipt

Every final report for a write-capable task that produced changes must state:

- phase identifier;
- deliverable identifier;
- task identifier;
- final checkpoint commit hash;
- branch;
- exact committed file scope;
- validation evidence associated with the checkpoint;
- source-integrity/safe-edit receipt when applicable;
- confirmation that final validation evidence postdates the final material edit;
- post-commit `git status`;
- push status.

CPS should eventually verify this receipt and the corresponding Git object before promoting `VERIFIED -> CHECKPOINTED`.