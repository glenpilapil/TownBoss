# Glen AI — DeerFlow 2 Adoption Audit

**Status:** ACTIVE / POC REQUIRED  
**Parent audit:** `../code-project-supervisor/DEERFLOW_2_ADOPTION_AUDIT.md`

## Purpose

Evaluate DeerFlow 2 specifically as a runtime substrate for Glen AI without allowing it to replace Glen AI authority, user consent boundaries, GlenTown domain logic, or the shared Orchestration Engine.

## Initial decision

**SELECTIVE ADOPTION CANDIDATE — NOT A PRODUCTION DEPENDENCY YET.**

Promising runtime capabilities include:

- persistent run/thread state;
- restart/resume;
- scoped sub-agents;
- tool and MCP plumbing;
- sandboxed execution;
- browser automation;
- context compaction;
- model/provider abstraction;
- optional memory backend interface;
- tool/sub-agent receipts and tracing.

## Authority boundary

DeerFlow must remain below Glen AI and the GlenTown Orchestration Engine.

```text
User
  |
  v
Glen AI authority / consent / policy
  |
  v
GlenTown shared Orchestration Engine
  |  Goal -> Tasks -> Requirements -> Dependencies -> Validation Gates
  |       -> Resources -> Schedule -> Execution -> Exceptions -> Completion
  v
TownBoss DeerFlow adapter (candidate)
  |
  +-- runtime state
  +-- sub-agents
  +-- tools / MCP
  +-- sandbox
  +-- context plumbing
  +-- selected memory plumbing
  +-- receipts / traces
```

DeerFlow does not own:

- whether an action is authorized;
- whether user memory may be stored, corrected, shared, or deleted;
- what GlenTown domain requirements are authoritative;
- whether a government/business/professional source is authoritative;
- what counts as plan completion;
- whether a transaction or consequential action requires user approval;
- which native GlenTown experience should remain source-of-truth.

## Memory position

DeerFlow memory is a runtime/reference capability, not the canonical Glen AI memory contract.

Before adoption, Glen AI memory still requires explicit TownBoss rules for:

- consent-based ingestion;
- provenance/source linkage;
- user inspection and correction;
- temporal facts and supersession;
- conflicting claims;
- confidence/evidence;
- forgetting/deletion;
- user/account/organization isolation;
- sensitive-data boundaries;
- retention and export.

Agent-Me remains a high-priority reference for these memory/evidence/verification concepts. DeerFlow may supply plumbing beneath them if the POC proves suitable.

## Required Glen AI POC

Scenario: **Puerto Princesa Saturday planner**.

The POC must demonstrate all of the following:

1. user-scoped conversation/thread creation;
2. explicit consented context persisted and recalled;
3. one typed GlenTown-style tool call;
4. one bounded sub-agent with isolated context;
5. a TownBoss-owned orchestration contract containing tasks, requirements, dependencies, and validation gates;
6. interruption and process restart;
7. exact resume without losing TownBoss task state;
8. evidence/tool/sub-agent receipts visible to the audit layer;
9. correction or deletion of one stored fact with scope isolation verified;
10. denial of an unauthorized/destructive action even if requested by the model;
11. no DeerFlow completion claim may mark the Glen AI orchestration complete unless TownBoss validation passes.

## Security defaults for POC and production candidate

- no unrestricted host execution;
- isolated container/remote sandbox preferred;
- sandbox network egress defaults to isolated or allowlist;
- credentials kept outside general-purpose sandbox mounts wherever possible;
- MCP servers explicitly registered and tool-scoped;
- destructive tools require TownBoss approval gates;
- prompt-injection tests cover web, files, memory, and tool outputs;
- traces containing prompts/tool arguments are treated as potentially sensitive;
- user memory must fail closed on missing/ambiguous identity.

## Exit criteria

This audit can advance from `POC_REQUIRED` only when evidence proves:

- persistent resume;
- user isolation;
- controlled tool execution;
- model portability;
- sub-agent isolation;
- observable receipts;
- memory correction/deletion behavior;
- TownBoss-controlled authority and completion;
- acceptable latency/cost/operational complexity.

The final decision must be one of:

- `ADOPT_CORE_RUNTIME`
- `SELECTIVE_ADOPTION`
- `REFERENCE_ONLY`
- `REJECT`
