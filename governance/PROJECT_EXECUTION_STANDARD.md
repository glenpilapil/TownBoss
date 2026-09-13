# TownBoss Project Execution Standard

**Status:** CANONICAL / PORTFOLIO-WIDE / MANDATORY

This standard defines the common execution contract inherited by every active TownBoss project. Project-specific documents may strengthen these rules but may not silently weaken them.

## 1. Authority model
Every substantial task operates under three authority layers:
- **Worker** — may implement bounded work and make ordinary technical choices consistent with canonical architecture, product authority and task scope.
- **Project Supervisor** — may decompose approved objectives, select workers, resolve ordinary technical tradeoffs, classify blockers, run gates, and promote work only when evidence supports the promotion.
- **Operator** — retains authority for material product decisions, scope expansion, architectural supersession, destructive actions, external publication/deployment, meaningful risk acceptance and rule exceptions.

When authority is unclear, fail closed and reduce the issue to the smallest meaningful operator decision. Silence is never approval.

## 2. Status promotion model
Projects must distinguish implementation existence from verification and release readiness. Unless a stricter project vocabulary is approved, use:

PLANNED → IMPLEMENTED → INTEGRATED → TEST_VERIFIED → RUNTIME_VERIFIED → PHYSICAL_VERIFIED → RELEASE_READY

Historical commits prove implementation/integration only to the level evidenced. Worker prose is never sufficient evidence for status promotion.

## 3. Capability completeness
Each sufficiently complex project must maintain a capability/completeness map showing:
- capability/domain;
- release criticality;
- owning repository/surface;
- current status;
- blocker/dependency state;
- next required evidence;
- release/readiness condition.

A project must not declare operational/release readiness while release-critical capabilities are unknown, unverified, or blocked without an explicit approved deferral.

## 4. Canonical blocker/dependency register
Known blockers must be durable project state, not scattered agent-report notes. Use explicit classes where applicable:
- BLOCKED_API_CONTRACT
- BLOCKED_API_DATA
- BLOCKED_APP_DOMAIN_CONTRACT
- BLOCKED_ARCHITECTURE_CONTRACT
- BLOCKED_BY_DEMO_DATA
- BLOCKED_EXTERNAL
- BLOCKED_SECURITY_OR_COMPLIANCE
- DEFERRED_WITH_REASON

Before creating a new blocker, check whether the underlying dependency is already registered under another name. Closing or materially changing a blocker requires evidence and corresponding documentation updates.

## 5. Phase gates
Implementation plans must use explicit phases/milestones with gates. A phase may overlap another only when dependencies permit and no gate is bypassed. Later-phase work must not be pulled forward merely because it is interesting or convenient.

Every gate must define:
- completion criteria;
- required validation/evidence;
- known blockers/allowed deferrals;
- authority needed for exceptions;
- required documentation/Memory updates.

## 6. Validation profiles
Validation must match the claim being made. Each project should define reusable validation profiles for its common task classes, such as UI, API/domain, migrations/data, security, integrations, release candidate, and operational acceptance.

Focused validation proves focused behavior. Full-suite/runtime/physical/security evidence is required where the promoted status demands it.

## 7. Operational acceptance
For product projects, module-level tests are insufficient for release readiness. Each project that ships a usable product must maintain an operational acceptance test covering the critical end-to-end journeys, representative personas/environments, persistence/state continuity, failure states, and applicable security/readiness gates.

## 8. Risk register
Projects with material product, security, financial, privacy, external-integration, deployment or operational risk must maintain a living risk register. Critical/high risk cannot be silently accepted by workers or supervisors. Acceptance requires operator authority and a recorded scope/review condition.

## 9. Task contract minimum
Every substantial write-capable task contract must include:
- canonical project/repository baseline;
- governing documentation;
- objective;
- in-scope work;
- explicit out-of-scope work;
- authority/risk boundary;
- dependencies/blockers;
- validation profile;
- completion contract;
- documentation/Memory obligations;
- checkpoint/commit policy;
- **mandatory safe-abort and recovery protocol**.

The safe-abort/recovery protocol is never optional. It must forbid destructive recovery under uncertainty and define how to preserve unrelated work, active operations, audit evidence, and recovery refs before mutation.

## 10. Safe-abort and recovery rules
A substantial task must stop rather than guess when repository/data/authority state is materially uncertain. Unless explicitly authorized, workers must not use destructive reset/clean/force operations or delete state merely to match an expected baseline.

Before risky reconciliation or repository mutation:
- inspect branch, HEAD, status and active Git operations;
- preserve unrelated work;
- establish a recoverable safety reference where appropriate;
- distinguish stale metadata from active operations;
- do not terminate unverified processes that may belong to active IDE/device/session work;
- report bounded blockers with exact evidence.

## 11. Documentation compliance
Planning, execution re-check and final-review documentation gates are mandatory under `governance/DEVELOPMENT_RULES.md`. Final reports for substantial tasks must include a Documentation Compliance Receipt.

Material changes must update the appropriate project capability/blocker/risk/current-state/Memory/dashboard documents instead of leaving new truth only in chat or worker output.

## 12. Evidence and checkpoints
A checkpoint/commit is evidence of repository state, not proof of correctness. Completion status must reference the relevant test/runtime/review/physical evidence. Follow `governance/TASK_CHECKPOINT_COMMIT_POLICY.md` for write-capable task checkpoints.

## 13. Exceptions
Project-specific rules may be stricter. Any exception that weakens this standard must be explicit, scoped, justified, operator-approved and recorded with a review/expiry condition. No project document may silently supersede portfolio governance.
