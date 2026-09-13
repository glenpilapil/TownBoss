# Code Project Supervisor — Operational Acceptance Test

**Status:** CANONICAL / FINAL OPERATIONAL GATE  
**Purpose:** Define the real end-to-end scenario that proves CPS is operational enough to supervise actual product development.

## Success Statement

CPS is operational when the operator can provide a real bounded development objective and CPS can:

1. identify the correct project and repository context;
2. read and comply with relevant TownBoss/project documentation;
3. convert the objective into a bounded task contract;
4. determine dependencies, risk, authority, validation, and review requirements;
5. select and launch a suitable worker;
6. supervise execution without duplicate/conflicting work;
7. recover or stop safely when failures occur;
8. validate the implementation against the completion contract;
9. obtain independent review where required;
10. request operator input only for genuine decisions;
11. produce a verified checkpoint when authorized;
12. update affected documentation and project Memory;
13. return a concise evidence-backed final report and compliance receipt.

## Acceptance Scenario

Use one real but bounded product-development task from an active TownBoss project. The task must be valuable enough to exercise the supervisor but small enough to verify deterministically.

The scenario should include at least one code/configuration change, meaningful tests, repository evidence, and a real checkpoint path. It should not be a synthetic CPS-only demo unless no safe product task is available.

## Required Gates

### A. Documentation Compliance

- Planning read-set identified and consulted.
- Local TownBoss governance source freshness checked.
- Execution re-checks occur when triggers arise.
- Final review against governing documents completed.
- Compliance receipt produced.

### B. Task Contract

- Objective bounded.
- Scope and prohibited scope explicit.
- Dependencies evaluated.
- Risk/authority assigned.
- Validation and review requirements defined before execution.

### C. Worker Supervision

- Suitable worker selected through adapter/capability policy.
- Correct repository/worktree targeted.
- No duplicate conflicting worker launched.
- Session/evidence identity preserved.

### D. Execution and Recovery

- CPS observes task progress.
- Routine technical decisions resolved without unnecessary operator interruption.
- Any failure follows bounded recovery policy.
- No-progress or provider failures stop according to budget.

### E. Validation

- Required static/test/build/integration gates run.
- Worker self-report is not treated as sufficient verification.
- Any required independent review is completed and blocking findings resolved.

### F. Checkpoint

- Diff reviewed for scope and unrelated changes.
- Repository state tied to validation evidence.
- Checkpoint/commit/PR created only under approved policy.
- Checkpoint identifier recorded.

### G. Memory and Reporting

- Material decisions, incidents, lessons, and checkpoint evidence appended to project Memory.
- Current-state/project docs reconciled if reality changed.
- Final report states what happened, evidence, remaining limitations, and next eligible work.

## Failure Conditions

The acceptance test fails if any of the following occurs:

- operator must directly babysit or prompt the worker to complete ordinary execution;
- CPS launches duplicate/conflicting workers;
- wrong repository/worktree is modified;
- required governing documents are ignored;
- scope silently expands;
- task is declared done without required evidence;
- valid failing tests are weakened merely to pass;
- required independent review is skipped;
- material decision is made outside the authority matrix;
- recovery loops continue beyond policy;
- Memory/compliance receipt is omitted;
- CPS development itself expands during the test instead of focusing on the product task, unless a blocking CPS defect is exposed.

## Operational Freeze Rule

Once this acceptance test passes and all REQUIRED capability-matrix items are satisfied, CPS is declared operational.

From that point, CPS feature development freezes by default. New CPS work is justified only when a real product-development task reveals a blocking defect, security issue, compatibility requirement, or clearly approved operational need.

UX polish and convenience features do not automatically reopen the operational milestone.

## Required Acceptance Report

The final acceptance record must include:

- product project/task used;
- task contract;
- worker/provider selected;
- documentation compliance receipt;
- execution timeline summary;
- recovery incidents, if any;
- validation results;
- independent review result, if required;
- checkpoint identifier;
- Memory update reference;
- operator interruptions requested and why;
- capability gaps exposed;
- final determination: `PASS` or `FAIL`.