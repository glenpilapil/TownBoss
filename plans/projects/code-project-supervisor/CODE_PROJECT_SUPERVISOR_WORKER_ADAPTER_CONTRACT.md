# Code Project Supervisor — Worker Adapter Contract

**Status:** CANONICAL / INITIAL  
**Purpose:** Standardize how CPS launches, observes, resumes, limits, and evaluates coding agents without making any provider an architectural authority.

## Adapter Principle

Kilo, Codex, Gemini, Cline, and future workers are replaceable execution providers behind a common CPS contract. Provider-specific behavior must remain inside adapters wherever practical.

## Required Adapter Capabilities

Every production worker adapter should define:

- provider/agent identity;
- launch command/API;
- repository/worktree scoping;
- task/prompt delivery;
- session identifier capture;
- process/worker identity capture;
- stdout/stderr or structured event access;
- progress/evidence extraction;
- cancellation/termination;
- exact-session resume behavior where supported;
- provider-specific limits/quota/failure normalization;
- completion signal/receipt;
- capability declaration;
- security/permission requirements.

## Launch Contract

Before launch, CPS must know:

- task contract;
- exact target repository/worktree;
- provider selection rationale/capability match;
- resource/recovery budget;
- authority/risk boundary;
- expected validation/completion evidence.

The adapter must not broaden scope or infer a different repository.

## Ownership and Duplicate Prevention

A worker/session must have a durable lineage or equivalent identity sufficient to distinguish:

- new launch;
- exact resume;
- unrelated/ambient process;
- duplicate launch.

Adapters must not adopt arbitrary ambient provider processes as the owned task session.

## Resume Contract

Resume is permitted only when:

- the session identity belongs to the same execution lineage;
- repository/worktree identity still matches;
- task contract is still valid;
- recovery budget allows resume;
- preserved evidence indicates resume is safer than a fresh task.

Provider inability to resume must be normalized explicitly rather than simulated by silently starting unrelated work.

## Failure Normalization

Adapters should normalize provider-specific failures into a CPS vocabulary such as:

- `PROVIDER_QUOTA_EXHAUSTED`
- `PROVIDER_UNAVAILABLE`
- `AUTHENTICATION_REQUIRED`
- `PROCESS_CRASH`
- `SESSION_NOT_FOUND`
- `WORKSPACE_SCOPE_ERROR`
- `RATE_LIMITED`
- `TOOL_PERMISSION_ERROR`
- `UNKNOWN_PROVIDER_FAILURE`

Raw provider error text remains evidence but should not become the control-plane contract.

## Completion Boundary

A provider saying "done" is not CPS verification. The adapter reports worker completion/evidence; CPS then performs required validation, review, and checkpoint gates.

## Provider Selection

Selection should be capability/risk/resource driven. It must not depend solely on historical preference. Provider-specific strengths may be configured, but CPS owns the selection policy.

## Adapter Conformance Tests

Each adapter should have deterministic tests for:

- launch construction;
- repository scoping;
- session identity capture;
- duplicate prevention;
- resume ownership;
- cancellation;
- failure normalization;
- resource-budget interaction;
- completion receipt parsing;
- missing/unavailable provider behavior.

## Portability Rule

No core CPS task/state schema may require one provider's proprietary session or output format. Provider-specific data may be preserved as optional evidence.