# Code Project Supervisor — Upstream Reference Architecture

## Purpose

Canonical map of upstream projects and patterns studied, adopted, or retained for Code Project Supervisor (CPS). CPS remains the TownBoss development control plane. TownBoss Master Development Plans, project/application Implementation Plans, operator decisions, and CPS completion/checkpoint policy remain authoritative.

## Architectural ordering

`TownBoss governance -> MDP -> Implementation Plan -> feature/change specification -> executable plan/tasks -> capability/team topology -> policy/authority gate -> controlled worker execution -> evidence/review -> validation/convergence -> checkpoint`

No upstream project owns this complete chain.

## Reference map

| Upstream | CPS role | Status |
|---|---|---|
| `Untrivial-ai/agent-orchestrator` | Runtime/control-plane chassis: daemon, sessions, worktrees, adapters, lifecycle, events, PR/CI observation, operator surfaces | **SELECTED UPSTREAM CHASSIS — CONDITIONAL GO ACCEPTED** |
| `github/spec-kit` | Specification and implementation governance: constitution, specify, clarify, plan, checklist, tasks, analyze, implement, converge | **APPROVED HIGH-PRIORITY REFERENCE** |
| Kiro | Steering/context, permissions, hooks, isolated subagents, implementer/reviewer loops, checkpoints | **APPROVED HIGH-PRIORITY REFERENCE** |
| `affaan-m/ECC` | Agent capability library: skills, specialized agents, hooks, rules, memory/context, continuous learning, verification and AgentShield security scanning across coding harnesses | **APPROVED HIGH-PRIORITY REFERENCE** |
| `microsoft/agent-governance-toolkit` | Deterministic agent governance: policy enforcement, identity/trust, audit, runtime controls, SRE, MCP security and compliance | **APPROVED HIGH-PRIORITY REFERENCE** |
| `revfactory/harness` | Team topology: pipeline, fan-out/fan-in, expert pool, producer-reviewer, supervisor, hierarchical delegation | **HIGH-PRIORITY RESEARCH REFERENCE** |
| `twaldin/harness` | Normalized coding-agent invocation and structured RunSpec/RunResult contracts | **HIGH-PRIORITY RESEARCH REFERENCE** |
| `jzjzzzzzzz/agent-me` | Typed inter-agent artifacts, evidence gates, critique/verification, deterministic evaluation, abstention | **HIGH-PRIORITY RESEARCH REFERENCE** |
| `danielmiessler/LifeOS` | Persistent supervisor/OS concepts | **APPROVED MAJOR REFERENCE** |
| `richhemsley3/claude-design-skills`, `nicohodt/claude-code-ui-ux-skill`, `szilu/ux-designer-skill` | `TOWNBOSS_UX_ENGINE` supporting references | **APPROVED SUPPORTING REFERENCES** |
| `JoyGhoshs/0install` | Security-tool discovery/catalog patterns | **APPROVED SUPPORTING REFERENCE** |

## Layer findings

### Runtime/control plane — Agent Orchestrator

AO remains the selected chassis. Preserve its ports/adapters, isolated worktrees, durable-facts/derived-status model, observation-vs-action separation, structured events, conservative recovery, thin clients, and adapter boundaries unless a documented gap proves otherwise. CPS adds TownBoss planning linkage, completion contracts, authority gates, budgets/circuit breakers, validation profiles, review policy, checkpoint governance and portfolio rules.

### Specification/governance — GitHub Spec Kit

Reference pipeline: `constitution -> specify -> clarify -> plan -> checklist -> tasks -> analyze -> implement -> converge`.

CPS adaptations: Constitution informs project invariant policy but does not outrank TownBoss MDP/Implementation Plans; clarification is an ambiguity gate; checklist is a requirements-quality gate; analyze inspires cross-artifact consistency checks; converge compares implementation with authoritative intent and creates bounded remediation. Support brownfield/evolving specifications. Do not copy Spec Kit into a parallel planning truth source.

### Controlled execution — Kiro

Mine requirements->design->tasks discipline, steering/context compilation, capability-scoped agents, deny/ask/allow permissions, isolated/parallel subagents, implementer->reviewer loops, hooks/validation gates, persistent checkpoints, regression contracts for bug fixes, and separation of supervisor core from presentation surfaces. Combine these patterns with AO rather than replacing AO runtime infrastructure.

### Capability and harness operations — ECC

ECC is a capability corpus rather than a CPS control-plane replacement. Its current architecture packages hundreds of reusable skills and dozens of specialized agents alongside hooks, selective rules, memory/context controls, continuous-learning/instinct mechanisms, verification workflows and AgentShield scanning. It supports multiple coding harnesses, but capability parity varies by harness.

CPS adaptations:
- establish a provider-neutral **Capability Registry** for reusable skills/reviewers rather than embedding giant prompts in supervisor core;
- classify capabilities by domain, required tools, supported worker/harness, risk, validation contract and version/provenance;
- load only task-relevant capabilities to protect context budgets;
- treat hooks as deterministic lifecycle controls where possible, not prompt suggestions;
- mine ECC verification, security, documentation-sync and Flutter/domain reviewer patterns into CPS capability profiles;
- preserve session summaries/learned operational knowledge outside the immediate context window, but require provenance and explicit promotion rules before learned material becomes durable project policy;
- use security scanning for agent files, hooks, MCP configuration, permissions and secrets as an input to CPS security gates.

Do **not** install ECC wholesale as a second supervisor, canonical rules system or worker runtime. Do not assume Claude-oriented features work identically under Codex/Kilo/Gemini. Individual ECC skills/agents must pass licensing, relevance, prompt-safety and baseline-vs-capability evaluation before production use.

### Deterministic authority/security — Microsoft Agent Governance Toolkit

AGT supplies the strongest upstream model in the CPS set for runtime governance. Its architecture separates policy decision, identity/trust, audit evidence, runtime isolation and SRE. Important patterns include fail-closed deterministic interception before actions execute; capability-based least privilege; explicit allow/deny/warn/approval-style verdicts; cryptographic agent identity and delegation chains; tamper-evident audit; policy shadow mode; framework adapters; MCP security controls; kill/termination controls; SLOs/error budgets/circuit breakers; and formal RFC-style behavioral specifications with conformance tests.

CPS adaptations:
- compile the canonical CPS Authority Matrix into machine-enforceable action policies where practical;
- introduce a normalized **Governance Decision Contract** containing actor/worker identity, task lineage, requested action, resource/scope, policy/version, verdict, reason, required approval and audit reference;
- fail closed when an action has no applicable authority or policy evaluation cannot complete safely;
- distinguish human/operator identity, CPS supervisor identity and worker/session identity; shared provider credentials must not erase action attribution;
- model delegated authority as scoped, bounded grants tied to task lineage rather than ambient worker permission;
- preserve tamper-evident or append-only decision/audit evidence for sensitive actions and checkpoints;
- evaluate new policies in shadow/dry-run mode before enforcement when migration risk warrants it;
- apply policy at intervention points such as filesystem writes, shell commands, Git commit/push/merge, secret access, external publication, deployment, destructive data operations and privileged MCP/tool calls;
- integrate governance with CPS retry budgets, provider-failure classification, circuit breakers and kill/stop controls;
- use formal conformance tests for high-value CPS governance contracts.

AGT's application-layer enforcement is **not equivalent to OS isolation**. CPS should retain AO worktree isolation and add process/container/VM boundaries according to risk. AGT is currently Public Preview and may introduce breaking changes before GA, so CPS should initially adopt its contracts/patterns and evaluate narrow components rather than making the whole toolkit a mandatory runtime dependency.

### Team topology — revfactory/harness

Its six patterns are useful as provider-neutral CPS task-graph policies: pipeline, fan-out/fan-in, expert pool, producer-reviewer, supervisor and hierarchical delegation. CPS should select the smallest topology justified by dependency, specialization, uncertainty and risk. More agents are not automatically better.

### Worker normalization — twaldin/harness

Useful prior art: common worker request/result contracts, model/provider normalization, timeout semantics, capability/adapter matrices, per-agent quirks, and cost/token accounting where available. AO already owns broad worker adapters plus workspace/session lifecycle. CPS must not introduce a second worker adapter/worktree layer unless a formal AO gap is proven.

### Evidence and verification — Agent-Me

Mine immutable typed artifacts between roles, bounded evidence, planner/researcher/critic/verifier separation, evidence gates, operational traces distinct from hidden reasoning, deterministic behavioral evaluation, failure injection, abstention when evidence is insufficient, and explicit provider trust boundaries. Workers submit typed completion evidence, reviewers/verifiers independently inspect evidence and repository state, and insufficient evidence produces `UNVERIFIED` or `BLOCKED`.

## Combined execution model

1. Resolve canonical TownBoss/project authority.
2. Compile objective into a scoped feature/change contract.
3. Clarify material ambiguity and analyze artifact consistency.
4. Select task-relevant capabilities and minimum sufficient team topology.
5. Compile task authority into an enforceable governance policy/grant.
6. Allocate isolated AO workers/worktrees with attributable identities under permission and budget policy.
7. Intercept governed actions before execution; allow, deny or require approval according to policy.
8. Execute with typed task/result contracts and relevant capability packs.
9. Collect machine-verifiable evidence plus governance/audit records.
10. Apply reviewer/verifier gates according to risk.
11. Converge implementation against authoritative intent with bounded remediation.
12. Verify scope, tests, secrets, repository cleanliness and checkpoint contract.
13. Commit/PR/push/merge only under applicable authority and policy.
14. Persist checkpoint, evidence, decisions, governance records and resulting state.

## Anti-duplication rules

1. AO owns runtime/session/worktree infrastructure unless a documented adoption gap says otherwise.
2. TownBoss plans own portfolio/project intent; Spec Kit patterns refine intent rather than replace it.
3. Maintain one worker-adapter abstraction unless a proven gap requires another.
4. ECC capabilities populate a CPS capability registry; they do not create a second rules/runtime authority.
5. AGT patterns strengthen enforcement of the existing CPS Authority Matrix; they do not create competing product authority.
6. Team patterns create subordinate work, not competing authoritative task stores.
7. Validation, review, convergence and checkpoint evidence should share typed CPS records.
8. CPS core stays provider-neutral; provider-specific behavior belongs in adapters/capability profiles.
9. Worker assertions never substitute for available machine evidence.
10. Governance and convergence are bounded by explicit failure/no-progress policies.
11. Application-layer governance does not substitute for OS/process/container isolation where risk requires it.
12. CPS records decisions, evidence, actions and operational traces, not private chain-of-thought.

## Adoption priorities

### P0 — Foundation
- Complete AO Phase 1 baseline validation on Windows.
- Preserve AO runtime/worktree/adapter/event boundaries.
- Keep CodeBisor archived/read-only as behavioral reference.

### P1 — Specification, capability, authority and evidence contracts
- Define CPS feature/change contract beneath canonical Implementation Plans.
- Define cross-artifact analysis gate.
- Define provider-neutral Capability Registry and capability provenance/evaluation contract.
- Define typed worker result/evidence contract.
- Define Governance Decision Contract and mapping from Authority Matrix actions to enforceable policies.
- Define convergence result taxonomy and `UNVERIFIED`/`BLOCKED` semantics.

### P2 — Team topology and enforcement
- Represent team patterns as provider-neutral task-graph policies.
- Maintain an AO adapter/capability matrix rather than hardcoded provider assumptions.
- Prototype fail-closed policy interception for high-value CPS actions.
- Prototype worker/session identity and scoped delegation grants.
- Add cost/token/time budgets where reliable data exists.

### P3 — Security, audit and evaluation
- Add baseline-vs-capability evaluation for new CPS skills/team patterns.
- Add AgentShield-inspired agent configuration/hook/MCP/secret scanning.
- Add tamper-evident/append-only governance evidence for sensitive actions where justified.
- Add policy shadow mode and conformance tests.
- Add failure-injection tests for provider failure, timeout, incomplete evidence, policy-engine failure, unauthorized action, reviewer disagreement, dirty worktree and interrupted execution.
- Verify recovery preserves authoritative lineage and does not duplicate work.

## Review rule

Classify every proposed upstream project against this map first. If it duplicates an existing layer, document the specific capability gap or superior pattern before adoption. Research references may influence design without becoming dependencies. Architectural authority remains with approved TownBoss/CPS documentation and explicit operator decisions.
