# Code Project Supervisor — Target Structure

## Architectural principle

Code Project Supervisor is a **development control plane above coding agents**. It should inherit proven orchestration infrastructure from the selected upstream foundation and add only TownBoss-specific governance where necessary.

## Preferred upstream chassis

Preferred foundation: `Untrivial-ai/agent-orchestrator` (Apache-2.0), subject to a formal adoption audit.

Reason: it already implements the same broad product category—project-level orchestration of multiple coding agents, persistent daemon operation, task delegation, isolated workspaces/worktrees, worker/session lifecycle, review/CI feedback and operator interfaces.

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
   +-- Scheduler / Queue / Worktree Isolation
   +-- Authority & Decision Gates
   +-- Worker Adapter Layer
   +-- Recovery / Resource Governance
   +-- Validation / Completion Contracts
   +-- Independent Review
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
- explicit completion contracts;
- evidence-backed status promotion;
- operator decision model and authority levels where upstream behavior is insufficient;
- provider/resource budgets and no-progress circuit breakers;
- project-specific validation profiles;
- independent review policy;
- checkpoint governance rules;
- TownBoss planning-corpus linkage;
- cross-project operating rules not already supplied upstream.

### Worker agents own

- scoped implementation/review work delegated by the supervisor;
- tool use allowed by their task/permission contract;
- reporting evidence and completion claims.

Workers do not own canonical project/task authority.

## Core domain model

Target conceptual hierarchy:

`Portfolio -> Project -> Objective/Milestone -> Task -> Subtask/Worker -> Evidence -> Review -> Checkpoint`

Supporting concepts:

- dependency;
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
- review;
- checkpoints;
- failures and blocks.

Human-facing interfaces are projections of authoritative state/events.

## Operator interface principle

Adopt upstream CLI/desktop interfaces before creating custom presentation stacks. Code Project Supervisor-specific UI changes should be narrow adapters/components over the existing daemon rather than a second control plane.

## Security/authority boundary

The supervisor is not granted unlimited authority merely because it can execute agents. Operations must be classified and governed by project policy. Sensitive/destructive/production actions require explicit authorization as defined by the project.

Secrets remain outside prompts/logs/state where possible and are supplied through approved secret mechanisms.

## Integration with TownBoss planning corpus

The TownBoss master plan and project implementation plans define planning authority. The supervisor may ingest/link that hierarchy, but must distinguish:

- planning decision;
- implementation state;
- machine-verified evidence.

Documentation alone never proves implementation.

## Legacy CodeBisor relationship

The existing Python CodeBisor implementation is a reference source for tests, policies and lessons learned. Port only capabilities that are both valuable and absent/inadequate upstream. Do not transplant legacy architecture wholesale.
