# TownBoss Task Completion Compliance Policy

**Status:** CANONICAL / PORTFOLIO-WIDE  
**Applies to:** Every substantial TownBoss-governed development task  
**Purpose:** Make documentation review, checkpoint commits, concise reporting, and Memory updates enforceable completion conditions rather than optional conventions.

## Required completion gates

A substantial task may be reported as `DONE` only when every applicable gate passes:

1. **Documentation Compliance** — planning, execution re-checks, and final review completed under `governance/DEVELOPMENT_RULES.md` and the project's compliance protocol.
2. **Validation Compliance** — required tests/builds/reviews/evidence support the completion claim.
3. **Checkpoint Compliance** — repository changes are committed under `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`, or the task legitimately reports `NO_COMMIT_REQUIRED`.
4. **Memory Compliance** — material details, decisions, evidence, limitations, lessons, checkpoint, and handoff state are recorded in project Memory or a linked governed artifact.
5. **Reporting Compliance** — the final operator-facing report follows `governance/TASK_REPORTING_AND_MEMORY_POLICY.md` and is short enough to preserve all mandatory fields without truncation.
6. **Dashboard/Current-State Compliance** — required Implementation Plan and Current State changes are complete when task reality changed them.

## Canonical compliance receipt

Every substantial final report must contain this concise receipt:

- `DOCUMENTATION_COMPLIANCE: PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`
- `VALIDATION_COMPLIANCE: PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`
- `CHECKPOINT_COMPLIANCE: PASS | NO_COMMIT_REQUIRED | PASS_WITH_APPROVED_EXCEPTION | FAIL`
- `MEMORY_COMPLIANCE: PASS | NOT_APPLICABLE | FAIL`
- `REPORTING_COMPLIANCE: PASS | FAIL`
- `DASHBOARD_STATE_COMPLIANCE: PASS | NOT_APPLICABLE | FAIL`

Any `FAIL` prevents `DONE`.

## Checkpoint identifier compliance

For write-capable tasks, the task contract must define Phase ID, Deliverable ID, and Task ID before execution. The final task commit must begin with:

`[P<phase>][D<deliverable-id>][T<task-id>] <summary>`

The final report must cite the exact commit hash and branch.

## Output-limit protection

The agent must treat output truncation as a completion risk.

Before final reporting:

- write detailed findings to Memory or a governed artifact;
- reduce repeated explanations to counts and references;
- keep mandatory compliance fields, commit hash, blockers, decisions, and next action near the beginning/end of the report;
- do not emit exhaustive inventories already preserved elsewhere;
- if detailed output is necessary, split it into a durable artifact rather than relying on the chat response.

A task whose response is truncated before required completion evidence is delivered has `REPORTING_COMPLIANCE=FAIL` until a concise corrective closeout is issued.

## Memory compliance

`MEMORY_COMPLIANCE=PASS` requires that material details omitted from the concise final report remain durably recoverable.

Where applicable, Memory or a linked artifact must preserve:

- what was attempted and why;
- what actually changed;
- important implementation or architecture decisions;
- significant validation evidence;
- incidents/root causes;
- limitations/deferred work;
- checkpoint/commit identifier;
- resulting state and next action.

Raw logs do not satisfy Memory compliance.

## Supervisor enforcement target

CPS should block `CHECKPOINTED -> DONE` unless all required compliance fields pass. The supervisor should validate commit-message structure, commit existence, required documentation receipts, Memory update status, and concise final-report schema automatically where deterministic.
