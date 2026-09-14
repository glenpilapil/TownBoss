# Code Project Supervisor — Upstream Reference Architecture

## Purpose

Canonical map of upstream projects and patterns studied, adopted, or retained for Code Project Supervisor (CPS). CPS remains the TownBoss development control plane. TownBoss Master Development Plans, project/application Implementation Plans, operator decisions, and CPS completion/checkpoint policy remain authoritative.

## Architectural ordering

`TownBoss governance -> MDP -> Implementation Plan -> feature/change specification -> executable plan/tasks -> team topology -> controlled worker execution -> evidence/review -> validation/convergence -> checkpoint`

No upstream project owns this complete chain.

## Reference map

| Upstream | CPS role | Status |
|---|---|---|
| `Untrivial-ai/agent-orchestrator` | Runtime/control-plane chassis: daemon, sessions, worktrees, adapters, lifecycle, events, PR/CI observation, operator surfaces | **SELECTED UPSTREAM CHASSIS — CONDITIONAL GO ACCEPTED** |
| `github/spec-kit` | Specification and implementation governance: constitution, specify, clarify, plan, checklist, tasks, analyze, implement, converge | **APPROVED HIGH-PRIORITY REFERENCE** |
| Kiro | Steering/context, permissions, hooks, isolated subagents, implementer/reviewer loops, checkpoints | **APPROVED HIGH-PRIORITY REFERENCE** |
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

Reference pipeline:

`constitution -> specify -> clarify -> plan -> checklist -> tasks -> analyze -> implement -> converge`

CPS adaptations:
- Constitution informs project invariant policy but does not outrank TownBoss MDP/Implementation Plans.
- Clarify becomes an ambiguity gate when requirements are materially underspecified.
- Checklist is a requirements-quality gate.
- Analyze inspires cross-artifact consistency/coverage checks before execution.
- Converge becomes a CPS principle: compare implementation with authoritative intent and create traceable remediation until material gaps are closed.
- Support brownfield/evolving specifications; do not assume greenfield work.

Do not copy Spec Kit into a parallel planning truth source. CPS should compile/link canonical plans into machine-actionable feature/change artifacts.

### Controlled execution — Kiro

Mine requirements->design->tasks discipline, steering/context compilation, capability-scoped agents, deny/ask/allow permissions, isolated/parallel subagents, implementer->reviewer loops, hooks/validation gates, persistent checkpoints, regression contracts for bug fixes, and separation of supervisor core from presentation surfaces. Combine these patterns with AO rather than replacing AO runtime infrastructure.

### Team topology — revfactory/harness

Its six patterns are useful as provider-neutral CPS task-graph policies:
- Pipeline: sequential dependencies.
- Fan-out/fan-in: parallel independent work followed by synthesis.
- Expert pool: selective specialist invocation.
- Producer-reviewer: creation separated from quality review.
- Supervisor: central dynamic task distribution.
- Hierarchical delegation: recursive decomposition for large objectives.

CPS should select the smallest topology justified by dependency, specialization, uncertainty and risk. More agents are not automatically better. Its dry-run and with-skill/without-skill comparisons also support baseline evaluation of new CPS capabilities.

### Worker normalization — twaldin/harness

Useful prior art: common worker request/result contracts, model/provider normalization, timeout semantics, capability/adapter matrices, per-agent quirks, and cost/token accounting where available.

AO already owns broad worker adapters plus workspace/session lifecycle. CPS must not introduce a second worker adapter/worktree layer unless a formal AO gap is proven.

### Evidence and verification — Agent-Me

Mine immutable typed artifacts between roles, bounded evidence, planner/researcher/critic/verifier separation, evidence gates, operational traces distinct from hidden reasoning, deterministic behavioral evaluation, failure injection, abstention when evidence is insufficient, and explicit provider trust boundaries.

CPS translation:
- workers submit typed completion evidence, not prose-only claims;
- reviewers/verifiers independently inspect evidence and repository state;
- machine-verifiable claims are checked deterministically where possible;
- insufficient evidence produces `UNVERIFIED` or `BLOCKED`, never fabricated success;
- dashboards expose operational traces/evidence, never hidden chain-of-thought.

## Combined execution model

1. Resolve canonical TownBoss/project authority.
2. Compile objective into a scoped feature/change contract.
3. Clarify material ambiguity.
4. Produce executable plan, tasks, dependencies and acceptance criteria.
5. Analyze artifact consistency and coverage.
6. Select minimum sufficient team topology.
7. Allocate isolated AO workers/worktrees under permission and budget policy.
8. Execute with typed task/result contracts.
9. Collect machine-verifiable evidence.
10. Apply reviewer/verifier gates according to risk.
11. Converge implementation against authoritative intent.
12. Repeat only bounded remediation work.
13. Verify scope, tests, secrets, repository cleanliness and checkpoint contract.
14. Commit/PR/push/merge only under applicable authority.
15. Persist checkpoint, evidence, decisions and resulting state.

## Anti-duplication rules

1. AO owns runtime/session/worktree infrastructure unless a documented adoption gap says otherwise.
2. TownBoss plans own portfolio/project intent; Spec Kit patterns refine intent rather than replace it.
3. Maintain one worker-adapter abstraction unless a proven gap requires another.
4. Team patterns create subordinate work, not competing authoritative task stores.
5. Validation, review, convergence and checkpoint evidence should share typed CPS records.
6. CPS core stays provider-neutral; provider-specific behavior belongs in adapters/capability profiles.
7. Choose team topology by task shape and risk, not agent count.
8. Worker assertions never substitute for available machine evidence.
9. Convergence is bounded by retry/no-progress budgets.
10. CPS records decisions, evidence, actions and operational traces, not private chain-of-thought.

## Adoption priorities

### P0 — Foundation
- Complete AO Phase 1 baseline validation on Windows.
- Preserve AO runtime/worktree/adapter/event boundaries.
- Keep CodeBisor archived/read-only as behavioral reference.

### P1 — Specification and evidence contracts
- Define CPS feature/change contract beneath canonical Implementation Plans.
- Define cross-artifact analysis gate.
- Define typed worker result/evidence contract.
- Define convergence result taxonomy and `UNVERIFIED`/`BLOCKED` semantics.

### P2 — Team topology and capability policy
- Represent the six team patterns as provider-neutral task-graph policies.
- Maintain an AO adapter capability matrix rather than hardcoded provider assumptions.
- Add cost/token/time budgets where reliable data exists.

### P3 — Evaluation
- Add baseline-vs-capability evaluation for new CPS skills/team patterns.
- Add failure-injection tests for provider failure, timeout, incomplete evidence, reviewer disagreement, dirty worktree and interrupted execution.
- Verify recovery preserves authoritative lineage and does not duplicate work.

## Review rule

Classify every proposed upstream project against this map first. If it duplicates an existing layer, document the specific capability gap or superior pattern before adoption. Research references may influence design without becoming dependencies. Architectural authority remains with approved TownBoss/CPS documentation and explicit operator decisions.
