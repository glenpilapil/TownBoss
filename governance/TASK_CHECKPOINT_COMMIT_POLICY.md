# TownBoss Task Checkpoint Commit Policy

**Status:** CANONICAL / PORTFOLIO-WIDE  
**Applies to:** Every TownBoss-governed project, agent, worker, and development supervisor  
**Purpose:** Ensure every completed write-capable task leaves a durable, attributable Git checkpoint tied to its phase, deliverable, and task.

## Mandatory rule

Every write-capable task that produces repository changes must end with a task-scoped Git commit after required validation, documentation updates, Memory updates, and final documentation review are complete, and before the agent sends its final task report.

A task with task-owned repository changes is not `CHECKPOINTED` until this commit exists.

If a task produces no repository changes, no empty commit is required. The final report must state `NO_COMMIT_REQUIRED`.

## Canonical commit-message prefix

Every task checkpoint commit subject must begin with:

`[P<phase>][D<deliverable-id>][T<task-id>] <summary>`

Examples:

- `[P0][D-AO-AUDIT][T-GOV-CLOSEOUT] docs: close Phase 0 governance`
- `[P1][D-UPSTREAM-BASELINE][T-WINDOWS-BUILD] build: verify upstream Windows baseline`
- `[P3][D-GOVERNANCE][T-DOC-COMPLIANCE] feat: enforce documentation compliance gates`

Use the phase, deliverable, and task identifiers from the canonical Implementation Plan / Dashboard and task contract. If work is portfolio governance outside a numbered product phase, use a stable named phase such as `[P-GOV]` rather than inventing a product phase.

## Commit scope

The task checkpoint commit must contain only changes owned by the bounded task.

Before committing, the agent must:

1. verify repository/worktree identity;
2. run the task's required validation;
3. complete the final documentation-compliance review;
4. update required project documentation and Memory;
5. inspect `git status`, `git diff`, and `git diff --check` where applicable;
6. stage only task-owned files;
7. verify no secrets, credentials, environment files, generated garbage, or unrelated changes are included.

Blind staging such as `git add .` or `git add -A` is prohibited unless an explicit project policy authorizes it for the exact repository/workflow.

## Blocked and failed tasks

If a task is `BLOCKED` or `FAILED` but has legitimate durable changes/evidence that must be preserved, those changes may be committed using the same phase/deliverable/task prefix. The commit summary and Memory must clearly state the blocked/failed condition.

Do not create a commit merely to make the worktree appear clean.

## Intermediate commits

Intermediate commits are allowed when technically useful, but the task must still end with a clearly identifiable final task checkpoint commit unless the repository's approved PR/merge workflow defines another equivalent reviewed checkpoint.

## Push/merge authority

Permission to commit does not imply permission to push, merge, publish, release, or deploy. Those remain separate authorities governed by project policy and the operator.

## Final-report receipt

Every final report for a write-capable task must include:

- phase identifier;
- deliverable identifier;
- task identifier;
- commit hash;
- branch;
- exact committed scope/files;
- validation evidence;
- post-commit `git status`;
- whether the commit was pushed (`NO` unless separately authorized).

The Documentation Compliance Receipt must be completed before the checkpoint commit, not reconstructed afterward.

## Supervisor enforcement target

CPS should eventually machine-enforce:

- no `VERIFIED -> CHECKPOINTED` transition without a valid task checkpoint commit when task-owned changes exist;
- commit subject matches the canonical phase/deliverable/task prefix;
- checkpoint commit is on the expected repository/worktree/branch;
- committed paths are within task scope;
- required validation and documentation receipts exist before checkpointing;
- final report cites the verified commit hash.
