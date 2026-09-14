# Code Project Supervisor — Target Structure

## Architectural principle

Code Project Supervisor is a **development control plane above coding agents**. It should inherit proven orchestration infrastructure from the selected upstream foundation and add only TownBoss-specific governance where necessary.

## Preferred upstream chassis

Preferred foundation: `Untrivial-ai/agent-orchestrator` (Apache-2.0), subject to the accepted formal adoption audit and remaining Phase 1 baseline validation.

Reason: it already implements the same broad product category—project-level orchestration of multiple coding agents, persistent daemon operation, task delegation, isolated workspaces/worktrees, worker/session lifecycle, review/CI feedback and operator interfaces.

## Layered upstream reference model

AO is the **runtime chassis**, not the sole source of CPS design patterns. CPS also maintains a layered upstream-reference architecture in `CODE_PROJECT_SUPERVISOR_UPSTREAM_REFERENCE_ARCHITECTURE.md`.

Current high-priority layers are:

- `github/spec-kit` — specification, cross-artifact analysis and convergence patterns;
- Kiro — controlled spec-driven execution, permissions, hooks and reviewer loops;
- `revfactory/harness` — team-topology patterns;
- `twaldin/harness` — normalized heterogeneous worker request/result contracts;
- `jzjzzzzzzz/agent-me` — typed evidence, verification, deterministic evaluation and abstention patterns.

These references do not outrank TownBoss planning authority and do not automatically become dependencies. Before importing a subsystem, prove that AO plus narrow CPS extensions cannot satisfy the requirement.

## High-level structure

```text
Operator
   |
   v
Code Project Supervisor UI / CLI / Desktop Client
   |
   v
Persistent Supervisor Daemon / Control Plane
   |
   +-- Portfolio & Project Registry
   +-- Planning / Task Graph
   +-- Specification / Artifact Consistency Gates
   +-- Team-Topology Policy
   +-- Scheduler / Queue / Worktree Isolation
   +-- Authority & Decision Gates
   +-- Worker Adapter Layer
   +-- Typed Result / Evidence Contracts
   +-- Recovery / Resource Governance
   +-- Validation / Convergence Contracts
   +-- Independent Review / Verification
   +-- Checkpoint / PR / Merge Governance
   +-- Events / Evidence / Audit Trail
   |
   +----------------+----------------+----------------+
   v                v                v                v
 Kilo             Codex            Cline          Other approved agents
```

## Responsibility boundaries

### Upstream foundation should own where adequate

- daemon/process lifecycle;
- project/session persistence;
- task/worker orchestration primitives;
- Git branch/worktree isolation;
- worker adapter framework;
- worker terminal/session attachment;
- event infrastructure;
- CLI/desktop operator surfaces;
- CI/PR observation and feedback loops;
- safe worker lifecycle operations.

### Code Project Supervisor extensions should own

- TownBoss portfolio/project policy integration;
- feature/change contracts beneath canonical plans;
- cross-artifact consistency and coverage gates;
- team-topology selection policy;
- typed completion/evidence contracts;
- explicit completion and convergence contracts;
- evidence-backed status promotion;
- operator decision model and authority levels where upstream behavior is insufficient;
- provider/resource budgets and no-progress circuit breakers;
- project-specific validation profiles;
- independent review/verification policy;
- checkpoint governance rules;
- TownBoss planning-corpus linkage;
- cross-project operating rules not already supplied upstream.

### Worker agents own

- scoped implementation/review work delegated by the supervisor;
- tool use allowed by their task/permission contract;
- reporting typed evidence and completion claims.

Workers do not own canonical project/task authority.

## Core domain model

Target conceptual hierarchy:

`Portfolio -> Project -> Objective/Milestone -> Feature/Change Contract -> Task -> Subtask/Worker -> Evidence -> Review/Verification -> Convergence -> Checkpoint`

Supporting concepts:

- dependency;
- team topology;
- worktree/repository lease;
- provider/session;
- resource budget;
- attention/decision;
- validation criterion;
- event/evidence record;
- checkpoint/PR state.

## Persistence

Prefer upstream persistence and event models. Add new stores only when an approved Code Project Supervisor requirement cannot be represented safely in upstream state.

Avoid parallel truth sources.

## Git/workspace model

- Each write-capable worker should operate in an isolated branch/worktree where upstream supports it.
- Same workspace conflicting writes are prohibited.
- Independent read-only review may run concurrently where safe.
- Repository baseline and resulting commits/diffs must remain attributable to a task lineage.

## Multi-project scheduling

The daemon is portfolio-capable. It may run independent projects concurrently when:

- dependencies are satisfied;
- provider/worker capacity exists;
- repository/worktree locks do not conflict;
- resource policies allow it;
- authority gates pass.

## Event and evidence model

Use structured durable events rather than scraping terminal text. Events should support reconstruction of:

- task lifecycle;
- worker lifecycle;
- recovery;
- decisions;
- validation;
- review/verification;
- convergence;
- checkpoints;
- failures and blocks.

A worker's prose assertion is not evidence when machine-verifiable evidence exists. Insufficient evidence must remain explicitly unverified/blocked rather than being promoted to success.

Human-facing interfaces are projections of authoritative state/events. Operational traces and evidence may be exposed; private model chain-of-thought is not a CPS dependency or artifact.

## Operator interface principle

Adopt upstream CLI/desktop interfaces before creating custom presentation stacks. Code Project Supervisor-specific UI changes should be narrow adapters/components over the existing daemon rather than a second control plane.

## Security/authority boundary

The supervisor is not granted unlimited authority merely because it can execute agents. Operations must be classified and governed by project policy. Sensitive/destructive/production actions require explicit authorization as defined by the project.

Secrets remain outside prompts/logs/state where possible and are supplied through approved secret mechanisms.

## Integration with TownBoss planning corpus

The TownBoss master plan and project implementation plans define planning authority. The supervisor may ingest/link that hierarchy, but must distinguish:

- planning decision;
- specification/change contract;
- implementation state;
- machine-verified evidence.

Documentation alone never proves implementation.

## Legacy CodeBisor relationship

The existing Python CodeBisor implementation is a read-only reference source for tests, policies and lessons learned. Port only capabilities that are both valuable and absent/inadequate upstream. Do not transplant legacy architecture wholesale or create new CodeBisor work items.
