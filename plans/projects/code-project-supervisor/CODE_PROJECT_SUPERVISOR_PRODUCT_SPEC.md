# Code Project Supervisor — Intended Features

## Product objective

Provide one supervisory interface for TownBoss development work across multiple repositories and coding agents.

The operator should normally interact with Code Project Supervisor, not directly with Kilo, Codex, Cline, Gemini or other worker agents.

## Core operator experience

### Project and portfolio context

- Detect the current repository/project automatically where possible.
- Support portfolio view across registered TownBoss projects.
- Show active, queued, blocked, attention-required and completed work.
- Permit project focus changes without spawning duplicate authorities or tasks.

### Development job intake

- Accept explicit commands and natural-language development objectives.
- Produce a structured proposed job before execution where governance requires it.
- Show target project, scope, exclusions, dependencies, validation plan, worker policy and authority/risk level.
- Allow approve, edit, reject or defer decisions.

### Planning and decomposition

- Convert approved jobs into bounded tasks/subtasks.
- Maintain dependency graphs and eligibility.
- Preserve stable task and execution-lineage identity.

### Worker orchestration

- Support multiple coding agents through adapters.
- Target initial worker coverage should include Kilo, Codex, Cline and other upstream-supported agents that pass adoption testing.
- Select workers based on task requirements, availability, provider health and policy.
- Support parallel workers across independent projects/worktrees.

### Workspace isolation

- Prefer isolated branches/worktrees for concurrent write-capable work.
- Prevent conflicting writers on the same workspace.
- Track repository baseline and resulting changes.

### Live supervision

- Show current jobs, workers, progress, queue and attention state.
- Allow attachment to active worker/session terminals or conversations where the upstream chassis supports it.
- Preserve useful activity history without flooding the primary operator view with telemetry noise.

### Recovery and resilience

- Detect process failure, provider exhaustion, no-progress cycles and stale sessions.
- Apply bounded recovery budgets.
- Resume exact sessions where supported and safe.
- Stop retrying when policy limits are exhausted.
- Preserve evidence and surface a decision rather than entering uncontrolled retry loops.

### Validation and completion contracts

- Define mandatory criteria for DONE.
- Verify machine-checkable criteria independently of the worker report.
- Support project-specific validation profiles.
- Classify criteria as PASS, FAIL, UNVERIFIED or NOT_APPLICABLE.
- Generate bounded correction work when implementation is nearly complete but criteria fail.

### Independent review

- Support policy-triggered read-only second-agent review.
- Keep reviewer permissions narrower than implementer permissions when appropriate.
- Reconcile review findings with machine evidence before checkpoint readiness.

### Decisions and attention

- Surface decisions with problem, recommendation, rationale, options and evidence.
- Distinguish informational attention from explicit authorization requirements.
- Record operator decisions durably.

### Checkpoint governance

- Verify intended diff, tests and project gates before checkpoint.
- Stage only intended changes.
- Respect project rules on commit, push, PR, merge and deployment.
- Record checkpoint evidence.

### Background operation

- Run as a persistent supervisor/daemon independent of a single terminal client.
- Allow clients to attach/detach without killing active work.
- Prevent duplicate authorities.

### User interfaces

Adopt upstream interfaces before building custom interfaces. Desired surfaces may include:

- CLI/TUI for development operators;
- upstream desktop application if it materially reduces implementation work;
- system tray/background controls on Windows where useful;
- optional later remote/control-plane interface only after security review.

## Worker/provider features

- Adapter registry with capability metadata.
- Provider availability/health signals.
- Configurable resource and retry budgets.
- Worker session identity and evidence.
- Explicit permissions/capability boundaries.
- Provider fallback only when policy permits it.

## Project knowledge features

- Repository-local instructions remain authoritative within scope.
- TownBoss planning corpus can supply portfolio/project goals and sequencing.
- ADRs/specifications/implementation plans should be linkable to tasks.
- Historical conversation memory must not silently override current repository/project authority.

## Evidence features

- Structured event history.
- Worker stdout/session references where needed.
- Repository before/after state.
- Validation receipts.
- Review findings.
- operator decisions.
- checkpoint/PR evidence.

## Deferred features

Unless required by the operational acceptance target, defer:

- custom bespoke TUI frameworks;
- broad web-based project management;
- analytics dashboards;
- mobile client;
- billing/accounting functions;
- general business ERP capabilities;
- autonomous production deployment without explicit project authorization.

## Guiding product rule

Every feature must justify itself by improving one or more of these outcomes: development throughput, supervision burden, correctness, safety, recoverability, evidence quality or multi-project coordination.
