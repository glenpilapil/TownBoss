# Code Project Supervisor — Target Structure

## Architectural principle

Code Project Supervisor is a **development control plane above coding agents**. It should inherit proven orchestration infrastructure from the selected upstream foundation and add only TownBoss-specific governance where necessary.

Security/trust requirements are defined by `CODE_PROJECT_SUPERVISOR_SECURITY_HARDENING_STANDARD.md` and are part of the architecture, not a later operational add-on.

## Preferred upstream chassis

Preferred foundation: `Untrivial-ai/agent-orchestrator` (Apache-2.0), subject to the accepted formal adoption audit and remaining Phase 1 baseline validation.

Reason: it already implements the same broad product category—project-level orchestration of multiple coding agents, persistent daemon operation, task delegation, isolated workspaces/worktrees, worker/session lifecycle, review/CI feedback and operator interfaces.

## Layered upstream reference model

AO is the **runtime chassis**, not the sole source of CPS design patterns. CPS also maintains a layered upstream-reference architecture in `CODE_PROJECT_SUPERVISOR_UPSTREAM_REFERENCE_ARCHITECTURE.md`.

Current high-priority layers include:

- `github/spec-kit` — specification, cross-artifact analysis and convergence patterns;
- Kiro — controlled spec-driven execution, permissions, hooks and reviewer loops;
- ECC and Hermes/HermesHub — capability/skill lifecycle and progressive loading;
- Microsoft Agent Governance Toolkit — identity, delegation, policy enforcement and audit patterns;
- `context4ai/agent-graph` — context compilation/routing patterns;
- Agency Agents and Headcount — virtual-organization/role and write-surface patterns;
- Harness references — team topology and worker normalization;
- Agent-Me, Karate traceability patterns and AgentProvenance — evidence/provenance/verification;
- approved routing/evaluation references — provider selection and governed learning.

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
   +-- Virtual Development Organization / Role Registry
   +-- Capability Registry / Skill Supply Chain
   +-- Context Compiler / Trust Labels
   +-- Team-Topology / Staffing Policy
   +-- Identity / Scoped Delegation
   +-- Authority / Governance Decision Engine
   +-- Scheduler / Queue / Worktree Leases
   +-- Environment / Isolation Policy
   +-- Worker Adapter Layer
   +-- Typed Result / Evidence Contracts
   +-- Provenance / Traceability Graph
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
- virtual organization/role definitions and separation-of-duties policy;
- provider-neutral Capability Registry and capability provenance/revocation;
- minimum-authority Context Compiler with trust/provenance labeling;
- team-topology and staffing policy;
- worker/session identity and scoped delegation grants;
- Governance Decision Contract and fail-closed authority evaluation;
- environment classification and stronger isolation policy where required;
- typed completion/evidence contracts;
- provenance/traceability linkage from decision through checkpoint;
- explicit completion and convergence contracts;
- evidence-backed status promotion;
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

Workers do not own canonical project/task authority and cannot expand their own delegation.

## Core domain model

Target conceptual hierarchy:

`Portfolio -> Project -> Objective/Milestone -> Feature/Change Contract -> Task -> Role/Delegation -> Worker/Capabilities -> Action/Evidence -> Review/Verification -> Convergence -> Checkpoint`

Supporting concepts:

- dependency;
- department/role;
- capability/version/provenance;
- context source/trust label;
- team topology;
- worktree/repository lease;
- environment class;
- worker/session identity;
- governance decision;
- provider/session;
- resource budget;
- attention/decision;
- validation criterion;
- event/evidence record;
- provenance edge;
- checkpoint/PR state.

## Persistence

Prefer upstream persistence and event models. Add new stores only when an approved Code Project Supervisor requirement cannot be represented safely in upstream state.

Avoid parallel truth sources. Security/authority, capability and evidence records must have explicit ownership and version/provenance semantics.

## Git/workspace model

- Each write-capable worker operates under an explicit repository/worktree lease where upstream supports it.
- Same workspace conflicting writes are prohibited.
- Tasks/roles may receive bounded write surfaces/path scope.
- Independent read-only review may run concurrently where safe.
- Repository baseline and resulting commits/diffs remain attributable to task lineage.
- Worktree isolation is not treated as a complete security sandbox; stronger isolation is selected according to risk.

## Multi-project scheduling

The daemon is portfolio-capable. It may run independent projects concurrently when:

- dependencies are satisfied;
- provider/worker capacity exists;
- repository/worktree locks do not conflict;
- project/state/credential isolation is preserved;
- resource policies allow it;
- authority gates pass.

## Authority and trust model

Canonical TownBoss/CPS policy and explicit scoped delegation are the only sources of executable authority.

Workers, roles, models, skills, tools, repository content, retrieved content and previous successful runs do not grant authority.

Governed actions should be evaluated before execution using attributable worker/session identity, task lineage, target/resource scope, capability provenance and policy version. Missing or ambiguous authority fails closed.

Permission to edit does not imply permission to commit; commit does not imply push; push does not imply PR/merge; none imply publish or deploy.

## Capability and context model

Capabilities are discovered, reviewed, versioned/pinned where practical, evaluated, approved, observed and revocable. Registry discovery alone never equals trust.

The Context Compiler loads the minimum authoritative material needed for the task, preserves source/trust/provenance labels, excludes secrets by default and treats external/repository content as data unless canonical policy explicitly promotes it to instruction authority.

Derived summaries cannot silently supersede canonical documents.

## Event, evidence and provenance model

Use structured durable events rather than scraping terminal text. Events/evidence should support reconstruction of:

- task and delegation lifecycle;
- worker/capability identity;
- governed actions and policy decisions;
- workspace/environment state;
- recovery;
- decisions;
- validation;
- review/verification;
- convergence;
- checkpoints;
- failures and blocks.

Preserve traceability across:

`Decision -> Requirement -> Feature/Change Contract -> Task -> Delegation -> Worker/Capabilities -> Actions -> Diff/Artifact -> Validation -> Review -> Governance Decision -> Checkpoint`.

A worker's prose assertion is not evidence when machine-verifiable evidence exists. Insufficient evidence remains explicitly `UNVERIFIED`/`BLOCKED` rather than being promoted to success.

Human-facing interfaces are projections of authoritative state/events. Operational traces and evidence may be exposed; private model chain-of-thought is not a CPS dependency or artifact.

## Recovery and routing model

Retries and fallbacks are bounded, attributable and authority-preserving. A replacement worker/provider must meet required capability/risk constraints and receive the same or narrower delegation.

Routing may use capability, quality, cost, latency, context capacity, provider health and privacy constraints. Learned routing policy remains versioned/reviewable and cannot silently rewrite canonical governance.

## Operator interface principle

Adopt upstream CLI/desktop interfaces before creating custom presentation stacks. Code Project Supervisor-specific UI changes should be narrow adapters/components over the existing daemon rather than a second control plane.

## Security/authority boundary

The supervisor is not granted unlimited authority merely because it can execute agents. Operations are classified and governed by project policy. Sensitive/destructive/production actions require explicit authorization as defined by the project.

Secrets remain outside prompts/logs/state where possible and are supplied through approved scoped mechanisms.

The detailed mandatory baseline is `CODE_PROJECT_SUPERVISOR_SECURITY_HARDENING_STANDARD.md`; operational acceptance must include its hardening gates.

## Integration with TownBoss planning corpus

The TownBoss master plan and project implementation plans define planning authority. The supervisor may ingest/link that hierarchy, but must distinguish:

- planning decision;
- specification/change contract;
- implementation state;
- machine-verified evidence.

Documentation alone never proves implementation.

## Legacy CodeBisor relationship

The existing Python CodeBisor implementation is a read-only reference source for tests, policies and lessons learned. Port only capabilities that are both valuable and absent/inadequate upstream. Do not transplant legacy architecture wholesale or create new CodeBisor work items.
