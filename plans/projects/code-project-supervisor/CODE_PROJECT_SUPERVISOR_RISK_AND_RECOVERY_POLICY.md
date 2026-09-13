# Code Project Supervisor — Risk and Recovery Policy

**Status:** CANONICAL / INITIAL  
**Purpose:** Bound autonomous action, failure recovery, retry behavior, and escalation.

## Risk Classes

- `R0` — read-only research/audit; no mutation.
- `R1` — low-risk scoped repository/documentation change.
- `R2` — normal feature implementation with bounded code/config changes.
- `R3` — security, tenancy, data/schema, infrastructure, money, auth, recovery, or major architecture change.
- `R4` — production, destructive, irreversible, externally published, or externally committed action.

Risk class is determined by impact, not by task size.

## Default Authority

- R0: autonomous within scope.
- R1: autonomous within task contract; verify before checkpoint.
- R2: autonomous implementation; required validation and checkpoint gates.
- R3: independent review required; material exceptions require operator decision.
- R4: explicit operator approval before action unless a standing approved policy specifically covers it.

## Recovery Principles

Recovery exists to complete product work safely, not to create infinite retry loops.

Every recoverable task should have bounded budgets for relevant dimensions such as:

- maximum recovery attempts;
- maximum recoveries without progress;
- maximum wall-clock duration;
- maximum no-progress duration;
- provider/tool retry ceiling.

## Recovery Decision Order

When a worker fails:

1. classify the failure;
2. preserve session/process/evidence state;
3. determine whether the failure is transient, task-specific, provider-specific, environment-specific, or systemic;
4. retry only when policy permits and there is a reasonable progress expectation;
5. use exact-session resume where safe and supported;
6. do not reset counters merely to continue trying;
7. trip a circuit breaker when the bounded budget is exhausted;
8. request human attention only when a genuine decision remains.

## Common Failure Policies

### Provider quota/service exhaustion
Stop wasteful retries when the provider/resource budget is exhausted. Preserve evidence and block/defer until reauthorized or an approved provider-switch policy applies.

### No-progress loop
If repeated attempts do not materially change evidence/state, stop. Further action requires a different strategy or explicit decision.

### Failing tests
Diagnose and classify. Never delete/weaken valid tests to obtain green status. Obsolete contracts may be updated only with evidence.

### Dirty worktree/unrelated changes
Do not overwrite or absorb unrelated work. Isolate, reconcile, or stop for review.

### Merge conflict
Resolve only when intent is unambiguous and within task scope; otherwise stop and preserve both sides for review.

### Stale/missing documentation
Do not proceed on assumptions that materially affect scope/architecture. Refresh the source or report the stale/missing authority.

### Environment dependency failure
Separate project defect from workstation/provider/environment defect. Do not mutate product code to compensate for an unrelated environment problem without evidence.

## Circuit Breaker Rule

A circuit breaker is a safety state, not an inconvenience. It cannot be silently cleared by a worker. Clearing/re-authorizing requires the condition defined by policy or an explicit operator decision.

## Recovery Evidence

Material recovery incidents must record:

- original failure;
- classification;
- attempts made;
- evidence of progress or no progress;
- final state;
- operator decision if required;
- impact on next work.

Significant incidents/lessons belong in project Memory.