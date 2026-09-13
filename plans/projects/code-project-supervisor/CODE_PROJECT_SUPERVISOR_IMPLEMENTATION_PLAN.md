# Code Project Supervisor — Implementation Plan

**Status:** FOUNDATION ADOPTION / PLANNED  
**Primary upstream candidate:** `Untrivial-ai/agent-orchestrator`  
**Legacy reference:** existing CodeBisor repository and TownBoss `plans/projects/codebisor/`

## Implementation objective

Reach operational usefulness as quickly as possible by inheriting mature upstream orchestration and adding only the minimum TownBoss-specific governance needed to supervise real product development.

## Phase 0 — Adoption audit

### Goal
Prove that Agent Orchestrator is the right chassis before forking.

### Deliverables
- capability-by-capability comparison;
- license and dependency review;
- Windows/runtime verification;
- adapter inventory for Kilo, Codex, Cline and other intended workers;
- CLI/desktop/daemon architecture review;
- data/event/persistence model review;
- migration map from legacy CodeBisor capabilities.

### Classification
Every intended capability must be classified:

`INHERIT | CONFIGURE | EXTEND | PORT_FROM_LEGACY | NEW | DROP`

### Gate
No implementation fork until the audit returns GO.

## Phase 1 — Establish fork and baseline

- Fork approved upstream into a clean Code Project Supervisor repository.
- Preserve upstream Apache-2.0 license/NOTICE obligations.
- Configure upstream remote strategy for future synchronization.
- Establish Code Project Supervisor branding in an isolated layer.
- Run upstream tests and record the clean baseline.
- Do not port legacy CodeBisor yet.

### Gate
Upstream baseline passes on the primary Windows development environment.

## Phase 2 — Operator and project baseline

- Configure/register first TownBoss projects.
- Verify daemon lifecycle and CLI/desktop attachment.
- Verify repository/worktree discovery and isolation.
- Verify worker sessions can be started, attached, stopped and resumed according to upstream capabilities.
- Verify at least Kilo and Codex adapters or nearest supported paths.

### Gate
One synthetic project can be supervised end-to-end without TownBoss-specific extensions.

## Phase 3 — TownBoss governance extensions

Add only gaps proven necessary by the adoption audit:

- completion contracts;
- evidence-backed validation/status promotion;
- operator decision/authority extensions;
- provider/resource budgets;
- no-progress circuit breakers;
- project validation profiles;
- independent-review policy;
- checkpoint governance.

Prefer adapters/plugins/extensions to core forks when possible.

### Gate
Governance tests prove the supervisor cannot promote incomplete work or bypass mandatory decisions.

## Phase 4 — Planning corpus integration

- Link TownBoss Master Development Plan and project implementation plans.
- Resolve project/milestone/task identifiers without treating planning docs as implementation evidence.
- Support task creation from approved project objectives.
- Preserve repository-local instructions as authoritative within scope.

### Gate
A planning objective can be materialized into supervised work with traceable source authority.

## Phase 5 — Real product canary

Use a bounded real development objective from one active project.

Acceptance flow:

1. Operator supplies objective to Code Project Supervisor.
2. Supervisor resolves project and current repository state.
3. Supervisor plans/decomposes the work.
4. Supervisor selects an eligible coding agent.
5. Worker executes in an isolated workspace.
6. Supervisor handles progress/recovery.
7. Validation gates run.
8. Independent review runs if policy requires it.
9. Genuine operator decisions are surfaced with recommendation.
10. Supervisor returns verified checkpoint readiness or a bounded block.

The operator must not manually prompt the worker during the normal flow.

### Gate
Real canary passes with evidence.

## Phase 6 — Multi-project operations

- Verify concurrent independent projects.
- Verify same-repository/worktree conflict prevention.
- Verify queueing and worker capacity.
- Verify provider outage/quota handling.
- Verify restart/state reconstruction.

### Gate
Two projects can be supervised without cross-project state or workspace contamination.

## Phase 7 — Operationalization

- Establish startup/background service policy.
- Document operator workflows.
- Add backup/recovery procedures for supervisor state.
- Establish upstream update process.
- Establish security review cadence.
- Define minimum telemetry/log retention.

### Gate
Supervisor is safe for routine portfolio use.

## Deferred until proven necessary

- custom TUI framework;
- custom desktop client replacing upstream UI;
- remote internet-exposed control plane;
- mobile app;
- broad project-management/ERP features;
- autonomous production deployment.

## Implementation discipline

Each phase must be independently testable and reversible until final cutover. A later capability must not be pulled forward merely because it is interesting or convenient.

## Legacy migration rule

Do not copy legacy CodeBisor code by default. For each candidate capability:

1. verify upstream does not already solve it;
2. verify it is still required by the acceptance target;
3. prefer concept/test/spec porting over code porting;
4. port implementation code only when that is the lowest-risk path.

## Definition of first operational release

The first release is operational when a real product development objective can be supervised from intake through verified checkpoint with normal worker interaction hidden behind the supervisor and with human involvement limited to genuine decisions/authorizations.
