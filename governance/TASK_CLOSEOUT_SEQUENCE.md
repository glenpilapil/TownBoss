# TownBoss Task Closeout Sequence

**Status:** CANONICAL / PORTFOLIO-WIDE / MANDATORY

Every substantial write-capable TownBoss task must close out in this order:

1. Complete the bounded implementation or investigation.
2. Run the applicable validation profile.
3. Perform final documentation review against current authority.
4. Update the canonical Implementation Plan / Dashboard to the highest evidence-backed state reached.
5. Update other canonical project documents when material, including Current State, Capability Matrix, Blocker Register, Risk Register, Decisions/Rules and app-specific plans.
6. Update project Memory with the durable result, evidence, blockers and next handoff.
7. Complete the Documentation Compliance Receipt.
8. Inspect repository status and diff; stage only task-owned files.
9. Create the task checkpoint commit using `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`.
10. Verify post-commit status and checkpoint compliance.
11. Send a short operator-facing report under `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`.

## Implementation Plan rule
The Implementation Plan / Dashboard is not optional bookkeeping. If a task materially changes project truth, phase status, readiness, blockers, or next work, the dashboard must be updated before the checkpoint commit.

Do not mark an item complete merely because code exists. Record only the highest status justified by evidence.

If no dashboard change is required, the compliance receipt must state `IMPLEMENTATION_PLAN_UPDATE=NOT_APPLICABLE`.

## Documentation and commit rule
Required documentation updates are part of the task itself, not follow-up work after the code commit. Where repository boundaries permit, the task checkpoint should include both implementation changes and required canonical documentation updates.

Canonical checkpoint subject:

`[P<phase>][D<deliverable-id>][T<task-id>] <summary>`

For portfolio governance outside numbered product phases, use a stable phase such as `[P-GOV]`.

Permission to commit does not imply permission to push, merge, publish, release, or deploy.

## Concise report rule
The final report is a summary receipt, not the evidence archive. By default it should contain only:
- outcome/status;
- concise change summary;
- high-value validation result;
- commit hash, branch and push state;
- material blocker/attention, if any;
- next bounded action;
- documentation compliance result;
- Memory and Implementation Plan update confirmation.

Detailed evidence belongs in Memory or governed task artifacts.

## Completion gate
A substantial write-capable task cannot be reported `DONE` or `CHECKPOINTED` if required dashboard/documentation/Memory updates were skipped, the checkpoint format is non-compliant, or the final report omits required receipt fields, unless an explicit governed exception was approved.