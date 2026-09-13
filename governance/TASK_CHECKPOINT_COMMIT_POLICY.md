# TownBoss Task Checkpoint Commit Policy

**Status:** CANONICAL / PORTFOLIO-WIDE  
**Applies to:** Every TownBoss-governed project, agent, worker, and development supervisor  
**Purpose:** Ensure every completed write-capable task leaves a durable, attributable Git checkpoint tied to its phase, deliverable, and task, and normally pushes that checkpoint to the configured remote so it can be independently reviewed.

## Mandatory rule

Every write-capable task that produces repository changes must end with a task-scoped Git commit after required validation, documentation updates, Memory updates, and final documentation review are complete, and before the agent sends its final task report.

That checkpoint must normally be pushed to the configured remote branch before the final report so reviewers can inspect the actual committed diff and evidence remotely.

A task with task-owned repository changes is not `CHECKPOINTED` until its local commit exists. A completed governed task is not `REMOTE_CHECKPOINTED` until the expected remote branch points to the same verified checkpoint, unless an explicit governed exception applies.

If a task produces no repository changes, no empty commit or push is required. The final report must state `NO_COMMIT_REQUIRED`.

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

## Remote checkpoint rule

After the task checkpoint commit is validated, the agent should normally perform a standard fast-forward push to the configured remote branch before sending the final report.

Default authorization covers only the task checkpoint push. It does **not** authorize:

- force push;
- merge;
- release;
- publication;
- deployment;
- production change;
- rewriting unrelated remote history.

If the repository workflow uses a task branch, push that task branch. If the governed repository explicitly permits direct checkpoint pushes to its current branch, a normal fast-forward push to that branch is acceptable.

A push may be skipped only when there is a recorded reason, such as:

- offline/network failure;
- remote unavailable;
- credentials unavailable;
- branch protection prevents the push;
- project policy explicitly prohibits direct push;
- operator explicitly directs no push;
- the checkpoint contains material that requires local review before remote publication.

When push is skipped or fails, the final report must state the exact reason and set `REMOTE_CHECKPOINT_COMPLIANCE` accordingly. Local checkpoint completion must not be misrepresented as remote availability.

## Checkpoint compliance gate

Checkpoint compliance is mandatory for every write-capable task.

Before the task may be promoted to `CHECKPOINTED` or `DONE`, verify:

- a task-owned commit exists, or the task legitimately produced no repository changes and reports `NO_COMMIT_REQUIRED`;
- the commit subject begins with the canonical phase/deliverable/task prefix;
- the commit was created in the expected repository/worktree and branch;
- the committed file scope matches the bounded task;
- validation, documentation review, dashboard/current-state updates, and Memory updates required by the task occurred before the commit;
- `git status` after commit is clean for task-owned work, or every remaining change is explicitly identified as unrelated/pre-existing;
- the final report cites the exact commit hash.

For remote checkpoint compliance, additionally verify:

- a normal non-force push was attempted unless an approved exception exists;
- the expected remote branch points to the same checkpoint SHA;
- local HEAD and the reported remote checkpoint match;
- no merge/release/deploy authority was implicitly exercised.

If any required local checkpoint condition fails, set `CHECKPOINT_COMPLIANCE=FAIL`. If remote checkpoint requirements fail without an approved exception, set `REMOTE_CHECKPOINT_COMPLIANCE=FAIL`. The task cannot be reported as fully `DONE` until repaired or an explicit governed exception is approved.

## Blocked and failed tasks

If a task is `BLOCKED` or `FAILED` but has legitimate durable changes/evidence that must be preserved, those changes may be committed using the same phase/deliverable/task prefix. They may also be pushed when doing so improves evidence preservation and does not violate project policy. The commit summary and Memory must clearly state the blocked/failed condition.

Do not create or push a commit merely to make the worktree appear clean.

## Intermediate commits

Intermediate commits are allowed when technically useful, but the task must still end with a clearly identifiable final task checkpoint commit unless the repository's approved PR/merge workflow defines another equivalent reviewed checkpoint.

## Merge/release/deployment authority

Checkpoint push authority is separate from merge, release, publication, deployment, or production-change authority.

A worker may normally push the bounded task checkpoint under this policy. It must not infer permission to merge a pull request, merge to another protected branch, publish a package, create a release, deploy an application, or change production infrastructure unless that authority is explicitly granted by the relevant project policy or operator decision.

## Final-report receipt

Every final report for a write-capable task must include:

- phase identifier;
- deliverable identifier;
- task identifier;
- commit hash;
- local branch;
- remote branch;
- exact committed scope/files;
- validation evidence;
- post-commit `git status`;
- checkpoint compliance result: `PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`;
- remote checkpoint compliance result: `PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`;
- push result and remote SHA, or the exact approved reason no push occurred;
- whether local HEAD matches the remote checkpoint.

The Documentation Compliance Receipt must be completed before the checkpoint commit, not reconstructed afterward.

The final report must also comply with `governance/TASK_REPORTING_AND_MEMORY_POLICY.md` and remain concise; detailed evidence belongs in Memory or governed artifacts.

## Supervisor enforcement target

CPS should eventually machine-enforce:

- no `VERIFIED -> CHECKPOINTED` transition without a valid task checkpoint commit when task-owned changes exist;
- commit subject matches the canonical phase/deliverable/task prefix;
- checkpoint commit is on the expected repository/worktree/branch;
- committed paths are within task scope;
- required validation and documentation receipts exist before checkpointing;
- a normal remote push is attempted when required;
- expected remote branch SHA equals the verified checkpoint SHA;
- final report cites the verified local and remote checkpoint;
- no `CHECKPOINTED -> DONE` transition when `CHECKPOINT_COMPLIANCE != PASS` or `REMOTE_CHECKPOINT_COMPLIANCE != PASS` unless an approved exception exists.
