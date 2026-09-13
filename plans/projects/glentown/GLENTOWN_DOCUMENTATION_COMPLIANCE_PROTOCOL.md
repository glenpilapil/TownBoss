# GlenTown Documentation Compliance Protocol

**Status:** CANONICAL / MANDATORY

All substantial GlenTown development must follow the TownBoss documentation compliance cycle.

## Planning gate
Before work begins, read the relevant portfolio rules, GlenTown Implementation Plan, Current State, Decisions and Rules, Acceptance Criteria, Memory, Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Risk Register, applicable app plans, and repository-local documentation for the code being changed.

The task contract must identify its governing documents, bounded scope, explicit exclusions, validation profile, completion evidence, and mandatory safe-abort/recovery protocol.

## Execution gate
Re-check governing documents whenever scope, architecture, dependencies, risk, release criteria, ownership assumptions, blocker classification, or canonical UX/product authority materially change. Update the Blocker Register and Capability Matrix when material truth changes rather than leaving the result only in a worker report.

## Final review gate
Before reporting or checkpointing, re-read the governing documents and compare the actual result against approved scope, authority, decisions, architecture, acceptance criteria, validation evidence, blockers, risks and Memory requirements.

## Documentation Compliance Receipt
Each substantial final report must include this structured receipt:

```text
DOCUMENTATION_COMPLIANCE_RECEIPT
Task:
Repository:
Branch:
HEAD:

Planning documents consulted:
Execution re-checks:
Final-review documents:

Conflicts: NONE / list
Approved exceptions: NONE / list
Canonical documents updated:
Blocker Register updated: YES/NO/NOT_APPLICABLE
Capability Matrix updated: YES/NO/NOT_APPLICABLE
Risk Register updated: YES/NO/NOT_APPLICABLE
Memory updated: YES/NO
Implementation dashboard updated: YES/NO

Validation profile used:
Evidence:
- focused tests/checks
- full-suite/checkpoint checks where required
- runtime evidence where required
- physical-device evidence where required
- independent review where required

Safe-abort/recovery events: NONE / describe
Final status:
```

A substantial task is not fully handed off until the receipt is complete or the task reports a bounded BLOCKED state explaining which required receipt evidence could not be obtained.
