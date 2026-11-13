# Incident Learning and Preventive Controls

**Status:** Proposed portfolio-wide governance addition — draft review pending  
**Applies to:** TownBoss-governed repositories, development agents and supervisors  
**Purpose:** Capture repeatable engineering lessons without turning `AGENTS.md` into an unverified troubleshooting log.

## Existing authority

This procedure operationalizes—not replaces—`governance/DEVELOPMENT_RULES.md` (evidence-based root cause analysis, safe-abort, Memory, deterministic controls), `governance/TASK_CLOSEOUT_SEQUENCE.md`, `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`, and `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`. Project-specific directives and approved design decisions remain governed by their established authority hierarchy.

## Trigger and ownership

At a **material incident**, repeated blocker, security/infrastructure hazard, data-integrity failure, build/release provenance failure, or task closeout with a newly established reusable lesson, the owning agent must run a short **incident-learning review**. A single harmless transient failure does not require a new repository rule.

One writer owns each bounded remediation. Before modifying instructions, inspect relevant `AGENTS.md`, canonical governance, project runbooks, task documents, open PRs and active dirty worktrees. Do not use document edits as a substitute for the actual engineering fix.

## Evidence classification

Document the event using explicit states:

| State | Meaning | Allowed claim |
| --- | --- | --- |
| `OBSERVED` | Failure or unexpected behavior reproduced and evidenced. | Symptom, environment, exact reproduction. |
| `ROOT_CAUSE_VERIFIED` | Cause distinguished from plausible alternatives with direct evidence. | Verified root cause in the tested scope. |
| `REMEDIATED` | Controlled corrective action performed and recorded. | Actual fix, not prevention guarantee. |
| `REGRESSION_VERIFIED` | Relevant tests/physical/runtime evidence confirm the corrected behavior. | Scope of verified result and known limits. |
| `BLOCKED / UNRESOLVED` | Missing permission, evidence, ownership or dependency. | Known limitation, safe stop condition, next owner/action. |

Do not describe a suspected cause as verified. A resolved symptom alone does not prove prevention. Preserve relevant evidence and avoid recording secrets or sensitive user data.

## Decide where the lesson belongs

1. **`AGENTS.md`** — Add or refine a *short behavior-changing instruction* only if future agents need the rule during preflight, work execution, risk handling, or closeout. Link to the canonical procedure; do not append a full incident chronology.
2. **Runbook / first-party skill** — Store reproducible prerequisites, supported commands, recovery steps, authorization boundaries, validation and rollback. Mark operations requiring operator approval. Prefer maintained shared procedures over duplication.
3. **Project Memory / incident artifact** — Record observed conditions, source/evidence IDs, investigative attempts, verified cause, impact, remediation, test results, unresolved risks and handoff.
4. **TownBoss canonical governance** — Promote a rule only when cross-project in scope, evidence-backed, consistent with prior rules and separately reviewed. Project-specific restrictions should remain local unless broadly justified.
5. **Automated control** — Where deterministic, propose a test/lint/checklist/CI gate or artifact manifest to prevent recurrence. Documentation alone does not prove enforcement.

For an **unresolved** incident, document recognition and safe stop/escalation rather than presenting a speculative repair recipe.

## Mandatory closeout questions

Before a material write-capable task is described as fully complete, include a concise, evidence-backed decision:

- Did we encounter a material incident, recurring blockage or failure mode?
- Is its cause verified, remediated and regression-tested, or still unresolved?
- Does a future agent need a new or revised instruction? If yes, is it linked to an owned procedure instead of repeated across many repositories?
- Can a deterministic guard prevent or detect recurrence?
- Have the appropriate project documentation, Memory and task-status records been reconciled?
- Was the proposed rule checked for conflict against existing approved authority and active branches?

Record `LESSONS_LEARNED=NOT_APPLICABLE | DOCUMENTED | OPEN_BLOCKER` and link artifacts when material. `OPEN_BLOCKER` cannot be represented as a completed remediation. Do not silently expand unrelated work merely to add optional controls.

## Protected-worktree and build-artifact safeguards

- Matching Git commit SHAs do **not** imply synchronization of dirty/untracked local work. Before checkpointing a heavily dirty worktree, reconcile exact paths, ownership and staged allowlists; unknown files are not implicitly task-owned.
- GitHub-only access cannot examine uncommitted files on a developer's workstation. State that limit clearly and route local inventory to an authorized local owner.
- Build artifacts must be paired with an evidence record appropriate to the risk: source SHA **and relevant dirty input manifest**, exact build options/environment, artifact hash, signing identity and test/acceptance state. Preserve reviewed candidates with unique names before rebuilding shared output paths.
- A permission-denied sandbox command is an access-context finding, **not** evidence that the host service or data is broken. Do not bypass sandbox controls, terminate unknown processes, alter Windows security settings, clear app data or destroy database volumes without explicit authority.
- Separate automated, device, browser, deployment and runtime verification. Do not promote one evidence level into another.

## Gate and rollout

This policy is a **proposed review change** until its PR is accepted and merged. Updating `AGENTS.md` or runbooks on a draft branch does not change the rules read by active local agents. At integration, reconcile any uncommitted conflicting instruction files with their owners first.

The owner of the relevant task must provide the documentation/Memory receipt and approved checkpoint ID required by existing TownBoss policies. Do not claim a governed task is fully `DONE` solely because a draft governance PR exists.
