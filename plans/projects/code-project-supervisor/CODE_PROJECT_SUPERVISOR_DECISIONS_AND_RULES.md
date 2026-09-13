# Code Project Supervisor — Starting Decisions and Rules

## Decision authority

This document records the initial non-negotiable decisions and operating rules for Code Project Supervisor. Changes require explicit portfolio-level approval and should be recorded as amendments rather than silently overwritten.

## Starting decisions

### D1 — Project identity

The new project name is **Code Project Supervisor**.

The prior **CodeBisor** implementation is retained as a legacy/reference system. It is not the default foundation for continued implementation.

### D2 — Upstream-first foundation

Preferred upstream chassis: `Untrivial-ai/agent-orchestrator`, subject to a formal adoption audit.

The project should inherit proven upstream daemon, worker orchestration, worktree, adapter, event and operator-interface capabilities before building custom equivalents.

### D3 — Supervisor, not worker

Code Project Supervisor is a control plane above coding agents. Kilo, Codex, Cline and similar systems are workers/adapters, not competing sources of project authority.

### D4 — Existing worker interfaces are preferred

Do not build custom worker execution protocols when an upstream adapter already provides a safe and sufficient integration.

### D5 — Evidence-backed completion

A worker's statement that work is complete is not sufficient when machine-verifiable evidence exists. Mandatory completion criteria must be independently checked by the supervisor or authoritative project tooling.

### D6 — Human authority remains explicit

AI systems may recommend actions but do not gain authorization merely by reasoning about them. Project policy determines which actions require explicit operator approval.

### D7 — No duplicate truth sources

Do not create parallel authoritative task/project/decision stores merely because integration is easier. Upstream state should remain canonical where sufficient; Code Project Supervisor extensions must have clear ownership.

### D8 — No custom UI unless necessary

Adopt upstream CLI/desktop/TUI surfaces first. Custom presentation infrastructure is deferred unless upstream interfaces cannot satisfy an operational requirement.

### D9 — Multi-project by design

The supervisor must support portfolio operation. Project state, workspaces, workers and evidence must remain isolated even when independent projects execute concurrently.

### D10 — Legacy effort is not sunk-cost authority

Existing CodeBisor code is preserved for evidence, tests and lessons, but previous investment does not justify retaining inferior duplicate infrastructure.

## Scope-control rules

### R1 — Outcome before infrastructure

Every new capability must be justified against the operational acceptance flow. Infrastructure that does not unblock or materially improve supervised delivery is deferred.

### R2 — No endless supervisor development

The project is considered operational enough once it can reliably supervise real development objectives through verified checkpoints. Cosmetic refinement and convenience features become backlog items unless they block normal work.

### R3 — Bounded passes

Implementation occurs in explicit phases with entry criteria, exit criteria and rollback paths. Do not turn a canary into unrelated product development.

### R4 — Upstream gap proof required

Before implementing a new core subsystem, document why upstream functionality cannot satisfy the requirement through configuration, extension or adaptation.

### R5 — Product repositories are not supervisor test beds by default

Use synthetic/fixture repositories for destructive or experimental testing. Real product repositories may be used only for bounded read-only audits or explicitly approved real canaries.

## Worker execution rules

### R6 — One authoritative lineage

A task must not have multiple uncontrolled workers claiming the same authoritative execution lineage.

### R7 — Workspace conflict prevention

Conflicting write-capable work must not share the same worktree. Prefer upstream worktree isolation.

### R8 — Safe concurrency

Different projects/workspaces may run concurrently when dependencies, capacity, locks and authority allow it.

### R9 — Provider failure is not task failure

Provider outages, quota exhaustion and process failures must be classified separately from repository/task defects. Preserve the distinction in state and evidence.

### R10 — Recovery is bounded

Retries and recoveries must have explicit budgets. Repeated failure/no-progress cycles escalate rather than loop indefinitely.

## Validation rules

### R11 — Project-specific gates

Validation is defined by project technology and risk. Do not hardcode one stack into supervisor core.

### R12 — Scope verification

Before checkpoint, verify the resulting changes match approved scope and do not contain unrelated modifications.

### R13 — Secret safety

Secrets, credentials and environment files must not be committed or unnecessarily exposed to worker prompts/logs.

### R14 — Independent review by policy

Second-agent review is required only when project/risk policy calls for it. Do not impose expensive review on every trivial task.

## Human-decision rules

### R15 — Ask only genuine questions

Do not escalate routine implementation choices that are already governed by project architecture, task scope or established policy.

### R16 — Decisions must be actionable

When operator input is required, present:

- the problem;
- why it matters;
- recommendation;
- alternatives;
- relevant evidence;
- consequences where material.

### R17 — Preserve decisions

Operator decisions that affect task/project state must be durable and attributable.

## Git/checkpoint rules

### R18 — No blind staging

Do not use blanket staging such as `git add .` or `git add -A` for governed checkpoints without explicit policy permitting it.

### R19 — Push is separate authority

Permission to modify or commit does not imply permission to push, merge, publish or deploy.

### R20 — Checkpoint before claiming delivery

Where project workflow uses Git checkpoints, record the checkpoint identifier together with validation evidence.

## Upstream maintenance rules

### R21 — Keep upstream relationship healthy

Prefer narrow extension points and adapters over invasive core rewrites. Maintain an upstream remote and periodically evaluate new upstream releases.

### R22 — Preserve license obligations

Retain required Apache-2.0 license/notice material and document significant upstream-derived changes where required.

## Naming/branding rule

The portfolio project is **Code Project Supervisor**. The final repository/product command name may be decided during adoption implementation. Do not assume the legacy `codebisor` name remains canonical merely for compatibility.

## Amendment rule

Any rule may be revised by explicit operator/portfolio decision, but the revision must record:

- what changed;
- why;
- effective date/checkpoint;
- migration impact if applicable.
