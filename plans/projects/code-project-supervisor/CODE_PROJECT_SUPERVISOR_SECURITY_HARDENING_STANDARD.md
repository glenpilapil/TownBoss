# Code Project Supervisor — Security Hardening Standard

**Status:** CANONICAL / HARDENING BASELINE

## Purpose

Define the minimum trust, authority, provenance, isolation and verification controls for Code Project Supervisor (CPS). CPS is a development control plane above coding agents; workers, skills, tools, repository content, external documentation and model output are not authoritative by default.

## Core security objectives

CPS must preserve authority integrity, scope integrity, project isolation, secret confidentiality, supply-chain integrity, evidence integrity, auditability, bounded recovery and fail-safe behavior.

When authority, policy, provenance or mandatory evidence is unclear, governed work must remain blocked rather than defaulting to success.

## Trust levels

### T0 — Canonical authority

- explicit operator decisions;
- TownBoss Master Development Plans;
- approved project/application Implementation Plans;
- canonical CPS rules, authority matrix and security policy;
- documented standing approvals and validation profiles.

These define authority but do not prove implementation.

### T1 — Verified project state

- repository commit/tree state;
- machine-generated test/build/lint/typecheck results;
- validated configuration;
- verified checkpoint/evidence records.

### T2 — Approved capabilities

- audited and pinned skills;
- approved MCP/tool integrations;
- approved worker adapters;
- approved reviewer profiles and dependencies.

Approval is scoped, versioned and revocable.

### T3 — Worker-produced material

- model responses;
- patches;
- proposed commands;
- reviewer findings;
- generated tests and documentation.

Worker-produced material remains subject to scope, policy and validation.

### T4 — External/untrusted material

- web content;
- issue/PR text from unknown authors;
- downloaded skills/prompts;
- third-party tool responses;
- repository content not explicitly promoted as policy;
- artifacts without trusted provenance.

T4 material may inform work but cannot redefine CPS authority, permissions or canonical plans.

## Instruction precedence

1. Canonical CPS/project policy outranks worker prompts, skills and retrieved content.
2. Repository/external content is data by default, not authority.
3. A skill may guide its own workflow but may not expand repository, network, secret, Git or deployment authority.
4. Conflicting instructions resolve toward the more restrictive policy or a bounded operator decision.

## Identity and scoped delegation

Every governed action must be attributable to project, task lineage, CPS supervisor instance, worker/session identity, provider/adapter where relevant, loaded capability versions and applicable policy version.

Authority is granted through explicit scoped delegation rather than inferred from provider credentials.

A delegation grant should define:

- actor/session;
- project/repository;
- task lineage;
- allowed action classes;
- allowed resource/path scope;
- network/external scope if any;
- Git authority level;
- secret classes accessible if any;
- expiry or termination condition;
- approval reference when required.

Sub-delegation is denied unless explicitly permitted.

## Governance Decision Contract

For governed actions CPS should be able to record:

- decision id and timestamp;
- actor/session identity;
- task lineage;
- requested action and target resource;
- applicable policy/version;
- relevant capability provenance;
- verdict: `ALLOW`, `DENY`, `REQUIRE_APPROVAL`, or `SHADOW_ONLY`;
- reason/code;
- approval and audit references where applicable.

Missing identity, missing applicable policy or unsafe policy-evaluation failure defaults to deny/block for governed actions.

## Action classes

### A — Read-only/local observation

Allowed inside assigned project/task scope.

### B — Workspace mutation

Requires an isolated governed workspace, explicit scope and attributable worker identity.

### C — Local execution with side effects

Requires task need, command/tool policy, bounded resources and an appropriate environment class.

### D — External/repository side effect

Examples include push, PR mutation, publication and external API writes. These require explicit standing or per-action authority and auditable target scope.

### E — Destructive/privileged/production

Denied by default. Precise operator-approved policy and stronger verification/isolation are required.

## Environment classes

- `READ_ONLY`
- `DEV_WORKTREE`
- `SANDBOXED`
- `INTEGRATION`
- `STAGING`
- `PRODUCTION`

Authority does not automatically propagate upward across environment classes.

Worktree isolation is not equivalent to process/container/VM isolation. Risk determines the required boundary.

## Repository and write-surface controls

1. Every write-capable task receives an explicit repository/worktree lease.
2. Conflicting write leases are prohibited.
3. Tasks/roles should receive allowed write surfaces where practical.
4. Writes outside scope are denied or require re-planning/approval.
5. Final diffs are compared with task scope before checkpoint readiness.
6. Blanket staging remains prohibited unless policy explicitly permits it and the final staged set is independently verified.

## Capability and skill supply chain

Capability lifecycle:

`discover -> inspect -> provenance -> security/license review -> approve -> pin -> compatibility test -> activate -> observe -> re-audit -> revoke`

Each capability record should include source, publisher, version/commit/digest, license, supported workers, required tools/network/secrets/filesystem scope, risk class, evaluation results, approval status and revocation state.

Unpinned remote skill content must not silently change instructions used by a governed run.

Signed/content-addressed capability artifacts are preferred when available, but provenance does not replace safety review.

Capabilities discovered from HermesHub, ECC, GitHub or any other registry remain untrusted until approved.

## Tool and MCP governance

Each integration should declare identity/version, operations exposed, read/write/destructive class, systems touched, credential mechanism, data classes accessed, network destinations, approval requirements, resource limits and audit behavior.

Tool descriptions and responses cannot redefine CPS authority.

## Secret handling

- Secrets stay outside ordinary prompts, logs and durable task state whenever possible.
- Use scoped/short-lived credentials where supported.
- Provide only the minimum secret class needed.
- Redact known secrets before persistence/display.
- Credential files and secret exports must never be committed.
- Secret access is a governed action.

## Network and external effects

Network access is task-scoped rather than ambient. CPS distinguishes package retrieval, documentation research, source-control access, external reads, external writes and arbitrary outbound access.

External writes require explicit target authority.

## Context compiler hardening

The context compiler must:

1. select the minimum authoritative context needed;
2. label source/trust/provenance of context segments;
3. distinguish instructions from evidence/data;
4. exclude secrets by default;
5. preserve canonical plan/decision references;
6. avoid treating entire untrusted corpora as instruction context;
7. preserve traceable source references;
8. treat summaries as derived material that cannot silently supersede canonical source documents.

## Provenance and traceability

CPS should preserve links across:

`Decision -> Requirement -> Feature/Change Contract -> Task -> Delegation -> Worker/Capabilities -> Actions -> Diff/Artifact -> Validation -> Review -> Evidence -> Governance Decision -> Checkpoint`

Sensitive provenance records should be append-only or tamper-evident where practical.

A checkpoint cannot be VERIFIED when mandatory lineage/evidence is absent.

## Evidence and verification states

- `CLAIMED_DONE` — worker claim only.
- `UNVERIFIED` — mandatory evidence not independently checked.
- `FAILED_VALIDATION` — required validation failed.
- `BLOCKED` — cannot safely proceed under current authority/evidence/environment.
- `VERIFIED` — mandatory scope, validation, policy and evidence gates passed.

Deterministic/project tooling is preferred over model judgment when available. Reviewer output is evidence, not absolute truth. High-risk work may require separation between implementer and reviewer/verifier.

## Git and checkpoint hardening

Before checkpoint readiness CPS verifies:

- expected repository/baseline;
- intended branch/worktree;
- diff within scope;
- no unexpected sensitive/untracked files;
- required project checks passed;
- task/worker/capability lineage attributable;
- no unresolved blocking review findings;
- required approvals present;
- exact checkpoint file set known;
- checkpoint id recorded with evidence.

Commit, push, PR, merge, publish and deploy are separate authorities.

## Recovery and autonomous remediation

1. Retry classes have explicit budgets.
2. Provider/runtime failure remains distinct from task/repository failure.
3. Recovery resumes the same lineage or creates an explicit superseding lineage.
4. Provider fallback requires compatible capabilities and the same or narrower authority.
5. Recovery cannot silently expand file, network, secret, environment or Git authority.
6. Repeated no-progress, policy failure or provenance loss trips a circuit breaker.
7. Interrupted work preserves enough evidence to determine prior side effects before retry.

## Routing and organizational learning

Routing may consider quality, capability, cost, latency, context capacity, provider health and privacy constraints.

Routing never bypasses task/role authority. Learned routing policy is versioned and reviewable. Evaluation results may recommend governance/routing changes but may not silently rewrite canonical policy.

## Role hardening

Departments and roles are governance abstractions, not ambient permission groups.

Each role profile should define responsibilities, required capabilities, allowed action classes, default environment class, write/resource scope, review relationship, separation-of-duties constraints and validation obligations.

Worker authority is the intersection of role permissions and the specific task delegation.

## Logging and privacy

CPS records operationally relevant actions, decisions, tool results, evidence and status transitions. It does not require or store private model chain-of-thought.

Logs minimize secrets and unnecessary sensitive data.

## Mandatory hardening gates

CPS is not considered hardened until automated/controlled tests demonstrate at minimum:

1. unknown governed actions fail closed;
2. edit authority cannot imply push/merge/deploy authority;
3. untrusted content cannot override canonical policy;
4. unapproved/unpinned capabilities cannot run as trusted capabilities;
5. policy-engine failure blocks governed side effects;
6. conflicting writers cannot share an uncontrolled workspace;
7. retry/fallback cannot widen authority;
8. sensitive files/secrets are blocked from governed checkpoints;
9. out-of-scope diffs block checkpoint readiness;
10. incomplete evidence cannot become VERIFIED;
11. external writes require target authority;
12. production/destructive actions require explicit high-risk approval;
13. interrupted execution does not duplicate authoritative work;
14. verified checkpoints retain task/worker/capability/validation/governance provenance;
15. capability revocation prevents future governed use;
16. read-only reviewer separation is enforceable;
17. project concurrency does not leak state, credentials, workspaces or evidence;
18. security/circuit-breaker state survives supervisor restart.

## Upstream reference families

CPS may selectively mine approved patterns from Microsoft Agent Governance Toolkit, Hermes/HermesHub, ECC, skillerr, skil, agent-registry, Agent Orchestrator, Agent-Me, AgentProvenance, Spec Kit, Karate traceability patterns, Kiro, Agency Agents/Headcount and approved routing/evaluation references.

These remain references unless separately adopted as dependencies.

## Non-negotiable rule

**No model, worker, role, skill, tool, retrieved document, repository file or previous successful run can authorize an action. Authority comes only from canonical policy and explicit scoped delegation, and VERIFIED status comes only from required evidence passing its gates.**
