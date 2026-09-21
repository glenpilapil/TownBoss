# TownBoss Governance Bootstrap

This repository is the mandatory portfolio authority for TownBoss-governed work under `D:\Projects`.

Before a substantial task, read `governance/DEVELOPMENT_RULES.md`, `governance/PROJECT_GOVERNANCE_STANDARD.md`, `governance/PROJECT_EXECUTION_STANDARD.md`, `governance/TASK_CLOSEOUT_SEQUENCE.md`, `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`, `governance/TASK_COMPLETION_COMPLIANCE_POLICY.md`, and `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`, then the target project's plan, current state, decisions, acceptance criteria, and Memory. Reconcile repository-local documentation first, then TownBoss authority; later explicit supersession wins.

For UI work, also read the canonical `TOWNBOSS_UX_ENGINE_REFERENCE_AUDIT.md` and the project's UX/design authority. Product authority outranks external references. Record reference lifecycle and implementation SHA, use explicit fixture/real-data state, collect governed rendered evidence, and obtain independent visual review; tests or golden images alone are not visual acceptance.

Preflight repository, worktree, branch, HEAD SHA, upstream, status, active Git operations, and task Phase/Deliverable/Task IDs. Work only in operator-established `D:\Projects` paths. One writer owns one bounded scope; preserve unrelated dirty work and evidence. Do not use reset, clean, restore, force push, destructive recovery, or unverified process termination without explicit authority and the safe-abort protocol.

Canonical TownBoss/project documentation is authority. Persistent rules operationalize it; first-party Skills encode repeatable procedures; approved third-party Skills/MCPs provide bounded capability; deterministic gates verify compliance. No lower layer may silently supersede canonical authority.

Use the applicable validation profile. Automated, browser, physical-device, deployed, and operational acceptance are distinct. Cite exact implementation and evidence SHAs. Before checkpointing, update affected project documentation and Memory, then reconcile TownBoss documents when project truth changed. Stage task-owned files only; use `[P<phase>][D<deliverable>][T<task>]` commits; verify normal push and remote SHA. Do not declare DONE while closeout, documentation, Memory, validation, or remote-checkpoint compliance is pending. On interruption, preserve state and leave a bounded handoff.
