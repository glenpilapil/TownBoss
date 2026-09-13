# TownBoss Project Implementation Strategy Template

**Status:** CANONICAL TEMPLATE

Use this template when establishing or upgrading `plans/projects/<project>/`.

## Required core files
- `<PROJECT>_IMPLEMENTATION_PLAN.md`
- `<PROJECT>_CURRENT_STATE.md`
- `<PROJECT>_ACCEPTANCE_CRITERIA.md`
- `<PROJECT>_DECISIONS_AND_RULES.md`
- `<PROJECT>_MEMORY.md`
- `<PROJECT>_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`

## Required for sufficiently complex or release-bearing projects
- `<PROJECT>_AUTHORITY_MATRIX.md`
- `<PROJECT>_CAPABILITY_MATRIX.md`
- `<PROJECT>_BLOCKER_REGISTER.md`
- `<PROJECT>_VALIDATION_PROFILES.md`
- `<PROJECT>_RISK_REGISTER.md`
- `<PROJECT>_OPERATIONAL_ACCEPTANCE_TEST.md`
- `<PROJECT>_RELEASE_EVIDENCE_MANIFEST_TEMPLATE.md`

## Mandatory inheritance declaration
Every project Decisions & Rules document should state that the project inherits:
- `governance/DEVELOPMENT_RULES.md`
- `governance/PROJECT_GOVERNANCE_STANDARD.md`
- `governance/PROJECT_EXECUTION_STANDARD.md`
- `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`
- `governance/TASK_COMPLETION_COMPLIANCE_POLICY.md`
- `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`

Project-specific rules may only add constraints or explicit operator-approved exceptions.

## Implementation Plan shape
Use explicit phases/milestones. For each phase define:
- goal;
- checklist/deliverables;
- dependencies;
- gate criteria;
- validation/evidence required;
- blocker/deferral handling;
- documentation/Memory update obligation.

## Status promotion
Unless a stricter vocabulary is approved:
PLANNED → IMPLEMENTED → INTEGRATED → TEST_VERIFIED → RUNTIME_VERIFIED → PHYSICAL_VERIFIED → RELEASE_READY.

Projects without a physical-device concern may mark PHYSICAL_VERIFIED as not applicable through explicit project authority rather than silently skipping it.

## Task contract rule
Every substantial write-capable task must include the minimum contract and mandatory safe-abort/recovery protocol in `PROJECT_EXECUTION_STANDARD.md`.

## Completion rule
A project is not operational/release-ready because all code exists. It is ready only when applicable capability, blocker, validation, risk, operational-acceptance and release-evidence gates are satisfied or explicitly approved as non-blocking.
