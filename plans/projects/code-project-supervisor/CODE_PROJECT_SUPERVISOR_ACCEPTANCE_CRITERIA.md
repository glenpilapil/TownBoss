# Code Project Supervisor — Acceptance Criteria

## Purpose

Define when Code Project Supervisor is operational enough to supervise real TownBoss development work without becoming an endless infrastructure project.

## Primary acceptance scenario

A real development objective is submitted for an active TownBoss project.

The supervisor must be able to:

1. identify the correct project/repository;
2. understand or materialize the approved objective;
3. decompose it into bounded work when needed;
4. resolve dependencies and eligibility;
5. select an appropriate coding agent;
6. create/assign an isolated workspace where required;
7. launch the worker with authoritative scope and completion contract;
8. track progress and preserve session/evidence;
9. handle normal failures/recovery within bounded policy;
10. run applicable validation gates;
11. request independent review when policy requires it;
12. surface only genuine operator decisions;
13. prevent completion when mandatory evidence is missing/failing;
14. return a verified checkpoint or a clearly explained bounded block;
15. identify the next eligible work without rerunning completed work.

During the normal path, the operator must not need to manually open and prompt the coding-agent CLI.

## Mandatory operational gates

### A. Upstream foundation

- Adoption audit completed with explicit GO.
- Upstream license obligations documented.
- Clean upstream baseline runs on the primary Windows development environment.

### B. Worker orchestration

- At least two worker integrations verified where practical, including one primary implementation agent and one independent review option.
- Worker launch/stop/session identity is attributable.
- Duplicate execution of one authoritative lineage is prevented.

### C. Workspace isolation

- Conflicting writes cannot run in the same worktree uncontrolled.
- Independent cross-project work may proceed concurrently.
- Resulting changes can be traced to their task/worker.

### D. Persistence and restart

- Supervisor state survives daemon/client restart sufficiently to reconstruct active/queued/blocked/completed work.
- Completed work is not automatically rerun.
- Blocked state remains blocked until an allowed transition occurs.

### E. Recovery

- Worker/provider failure is detected.
- Retry/recovery is bounded.
- No-progress loops trip a circuit breaker or equivalent stop condition.
- Evidence is preserved when work stops.

### F. Validation

- Completion contracts support project-specific validation.
- Worker prose cannot bypass mandatory machine-verifiable gates.
- Scope/diff validation occurs before checkpoint readiness.
- Secrets/unintended files are guarded against.

### G. Human decisions

- Attention requests contain problem, recommendation, alternatives and evidence.
- Explicit authorization remains required for governed operations.
- Decisions are durable.

### H. Independent review

- A task can require a separate read-only reviewer.
- Blocking review findings prevent checkpoint readiness.
- Reviewer cannot silently become a second uncontrolled writer.

### I. Checkpoint governance

- Checkpoint readiness is distinct from worker-completion claims.
- Commit/push/merge/deploy permissions remain separate.
- Intended files can be verified before commit.

### J. Multi-project operation

- At least two independent projects can be represented without state contamination.
- Queue/worker capacity is understandable.
- Project focus/UI attachment does not create duplicate work.

### K. Security hardening

- Canonical policy and explicit scoped delegation are the only sources of executable authority.
- Missing/ambiguous identity or policy blocks governed side effects.
- Untrusted repository/external/capability content cannot override canonical authority.
- Capabilities used in governed work are approved, attributable, pinned/versioned where practical, and revocable.
- Task recovery or provider fallback cannot expand repository, network, secret, environment or Git authority.
- Worktree isolation is supplemented by stronger isolation when the task risk profile requires it.
- External writes require an authorized target/scope.
- Production/destructive actions remain denied unless explicitly authorized by the applicable high-risk policy.
- A task cannot become `VERIFIED` while mandatory scope, policy, provenance, validation or evidence gates are incomplete.
- A verified checkpoint can be traced to its task lineage, worker/session, relevant capability versions, governance decisions and validation evidence.
- Cross-project concurrency does not share uncontrolled credentials, workspaces, task state or evidence.
- Security/circuit-breaker state needed for safe recovery survives supervisor restart.

The detailed authority for this gate is `CODE_PROJECT_SUPERVISOR_SECURITY_HARDENING_STANDARD.md`.

## Operator UX acceptance

The exact UI is not a release blocker if upstream tooling already provides a usable operator surface. Minimum UX requirements:

- operator can see active/queued/blocked/attention work;
- operator can inspect worker/session status;
- operator can provide decisions/instructions;
- operator can access evidence/logs on demand;
- UI clients can attach/detach without destroying the daemon's supervised work where upstream architecture supports it.

Custom visual polish is explicitly secondary to the primary acceptance scenario.

## Performance/quality indicators

After operational release, track:

- percentage of jobs completed without manual worker babysitting;
- operator interventions per job;
- recovery success/failure rates;
- false DONE/prevented completion events;
- queue wait causes;
- average supervised job duration;
- test/validation failure categories;
- upstream merge/update burden.

These are improvement metrics, not prerequisites for first operational release unless a severe problem is discovered.

## Non-blocking deferred items

The first operational release does not require:

- custom-designed terminal UI;
- custom desktop application;
- remote mobile supervision;
- browser dashboard;
- general-purpose project-management features;
- fully autonomous production deployment;
- every possible coding-agent provider.

## Stop rule

Once the primary acceptance scenario and mandatory gates pass, Code Project Supervisor transitions from foundation development to **operational use**. Further supervisor development should be driven by defects, measured bottlenecks or clearly approved capabilities—not continuous speculative expansion.
