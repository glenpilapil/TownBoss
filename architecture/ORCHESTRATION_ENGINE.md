# TownBoss Orchestration Engine v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

The Orchestration Engine is the reusable TownBoss capability for turning an intended goal into an observable, resumable, policy-gated execution lifecycle across tasks, dependencies, validations, resources, schedules, side effects, exceptions, and completion evidence.

It formalizes the approved lifecycle:

`Goal -> Tasks -> Requirements -> Dependencies -> Validation Gates -> Resources -> Schedule -> Execution -> Exceptions -> Completion`

The engine coordinates work. It does not manufacture authority, decide professional truth, author domain policy, or make simulation results authoritative.

## Capability-company rule

TownBoss owns the generic orchestration contract. Products and shared-domain capabilities own their domain-specific task types, requirements, constraints, resources, schedules, approvals, and completion semantics.

Logical boundary comes before physical extraction. GlenTown may remain an implementation/proving ground while reuse evidence accumulates; this contract does not require a new service, repository, database, or Beta feature.

## Core entities

### Goal
The desired outcome and its owner/context. A goal may be user-, organization-, system-, or authorized-operator initiated. Goals must not imply permission to perform every task needed to pursue them.

### Plan
A versioned decomposition of a goal into tasks and relationships. Replanning creates a new plan revision or attributable amendment; it must not silently rewrite completed history.

### Task
A bounded unit of work with explicit inputs, outputs, dependencies, requirements, execution semantics, authority needs, retry/idempotency properties, and completion criteria where applicable.

### Requirement
A prerequisite fact, artifact, state, eligibility condition, consent, document, resource, or external dependency needed by a task.

### Dependency
An ordering or state relationship between tasks or external conditions. Dependencies may block readiness but do not themselves authorize execution.

### Validation Gate
A deterministic or attributable evaluation that must reach an allowed state before a task advances. Gates may consume authorization, constraints, evidence, human verification, availability, policy, or domain-specific validation.

### Resource Binding
A reference to a person, professional, organization, asset, place, budget, time window, capacity, tool, or external service needed for execution. Orchestration coordinates resource state; resource-owning capabilities remain authoritative.

### Schedule Binding
A planned time/window/deadline for a task. Scheduling is not execution authority and must be revalidated when time-sensitive prerequisites can change.

### Execution Attempt
An attributable attempt to perform a task, including actor/executor, authority context, idempotency identity where needed, start/end state, result, and failure/recovery information.

### Exception
A condition that prevents normal progression or invalidates assumptions: failed gate, unavailable resource, external rejection, stale evidence, conflict, timeout, partial side effect, revoked approval, or other domain-defined interruption.

### Completion Record
Evidence that a task or goal met explicit completion criteria. Completion is not inferred merely from a process returning success.

## Lifecycle and state model

A generic orchestration run progresses through states such as:

- `draft`
- `planned`
- `blocked`
- `ready`
- `awaiting_approval`
- `awaiting_verification`
- `scheduled`
- `executing`
- `paused`
- `exception`
- `completed`
- `cancelled`
- `failed`

Products may add domain states but must map them to the generic lifecycle when consuming this capability.

Task readiness is derived from current prerequisites; it is not a durable permission. A task that was ready can become blocked if evidence expires, approval is revoked, availability changes, a dependency changes, or a hard constraint becomes unknown/failed.

## Canonical progression

1. **Goal intake** — capture intended outcome, initiator, context, scope, and known limits.
2. **Task decomposition** — produce a bounded plan with explicit tasks and completion criteria.
3. **Requirement resolution** — identify missing information, documents, eligibility, resources, permissions, or external prerequisites.
4. **Dependency evaluation** — determine which tasks/conditions must precede others.
5. **Validation** — evaluate applicable authorization, constraints, evidence quality, human verification, approvals, availability, and domain rules.
6. **Resource coordination** — bind or reserve resources through their authoritative capability where applicable.
7. **Scheduling** — select feasible windows while retaining time-sensitive revalidation requirements.
8. **Execution** — perform only tasks whose current execution gates pass and whose executor has sufficient authority.
9. **Exception handling** — stop, retry, compensate, replan, escalate, request human input, or cancel according to explicit policy.
10. **Completion** — verify completion criteria and persist attributable evidence/outcomes.

## Readiness and execution are separate

The engine MUST distinguish:

- planning eligibility;
- readiness to attempt;
- authorization to access/modify a resource;
- AI authority to act autonomously;
- human approval/delegation;
- professional/government authority;
- actual successful execution;
- verified completion.

No one of these implies another.

## Integration with Portfolio AI Authority

Orchestration never upgrades AI authority.

- A0/A1 AI may explain, inspect, decompose, recommend, and draft within allowed data access.
- A2 AI may prepare consequential tasks for attributable approval.
- A3 execution is allowed only when the canonical AI Authority gates and domain-specific execution gates pass.
- A4 actions remain prohibited for autonomous AI execution even if orchestration can technically invoke the underlying tool/API.

Tool availability, successful simulation, task readiness, or a previous approval cannot be used to launder authority.

## Integration with Constraint Engine

Constraints provide structured evaluations; orchestration decides how those results affect lifecycle progression according to domain policy.

- failed hard constraint -> blocked/exception;
- unknown hard constraint -> fail closed unless policy explicitly defines a safe non-executing path;
- advisory constraint -> may inform planning or require acknowledgement;
- override -> must be separately authorized and attributable.

The Orchestration Engine does not author or reinterpret authoritative constraints.

## Integration with Scenario Engine

Scenario runs may help compare plans, schedules, costs, routes, tradeoffs, or alternatives. A selected scenario is still a proposal until required gates pass.

`simulation != approval` and `preferred scenario != execution authority`.

Orchestration may instantiate a plan from a scenario outcome while preserving scenario lineage and assumptions.

## Integration with Evidence & Provenance

Important gate inputs, external observations, approvals, verification outcomes, execution results, and completion claims should link to Evidence & Provenance where applicable.

Time-sensitive evidence must retain observation/effective/recorded dates. Stale or superseded evidence may invalidate readiness and trigger revalidation.

## Integration with Human Verification

When a task cannot safely advance because evidence, authority, confidence, qualification, or professional judgment is insufficient, orchestration may create or await a Human Verification request.

A verification outcome may satisfy a gate only for its declared scope and validity period. It does not grant unrelated authorization or AI authority.

## Authorization and approvals

Authorization remains owned by the Authorization capability/domain policies. Orchestration consumes authorization decisions and approval/delegation records.

Consequential actions must not execute merely because they appear in an approved plan. Approval must be sufficiently scoped to the actual operation/resource/time/context required by policy.

Approval revocation or expiry invalidates affected readiness.

## External authoritative systems

Government platforms, financial providers, booking providers, payment processors, professional registries, and other external systems remain authoritative for their own records and decisions.

Orchestration may preflight, prepare, link, submit when authorized, poll/receive status, reconcile, and route exceptions. It must not convert a local prepared/submitted state into an authoritative external approval.

External rejection, timeout, partial completion, or conflicting state must remain visible and reconcilable.

## Side effects, idempotency, and retries

Retry-sensitive mutations must use stable idempotency/operation identities where the target supports them or an equivalent duplicate-prevention mechanism where it does not.

A retry is a new execution attempt against the same logical operation, not permission to bypass a failed gate.

Before retrying a consequential task, the engine must re-evaluate gates that may have changed.

Partial side effects require an explicit recovery posture: retry, compensate, reconcile, manual intervention, or terminal failure. The engine must not report goal completion while unresolved consequential partial effects remain unless the domain's completion semantics explicitly allow it and expose the exception.

## Replanning

Replanning is permitted when assumptions, resources, constraints, user intent, external state, or exceptions change.

Replanning must:
- preserve completed execution history;
- preserve provenance of superseded plan revisions;
- not erase failed/rejected attempts;
- re-evaluate dependencies and gates;
- not reuse expired/revoked approvals outside their scope;
- not transform a prohibited action into an allowed one by task splitting or tool chaining.

## Cancellation

Cancellation is a first-class lifecycle operation. It may itself be consequential and require authorization/authority.

Cancellation must distinguish:
- stopping future unstarted work;
- cancelling external reservations/orders/bookings where supported;
- compensating already-completed side effects;
- non-reversible completed actions.

A local `cancelled` state must not falsely imply successful cancellation in an external authoritative system.

## Exception routing

Exceptions should be typed and actionable. Generic classes include:

- `requirement_missing`
- `dependency_blocked`
- `constraint_failed`
- `constraint_unknown`
- `authorization_missing`
- `approval_required`
- `authority_insufficient`
- `verification_required`
- `resource_unavailable`
- `schedule_conflict`
- `external_rejected`
- `external_timeout`
- `partial_side_effect`
- `evidence_stale`
- `recovery_exhausted`

Exception policy may route to automated safe recovery, user decision, qualified reviewer, operator attention, replan, or terminal failure.

## Observability and audit

An orchestration run should expose enough state to answer:

- What goal is being pursued?
- What plan revision is current?
- Which tasks are complete, ready, blocked, executing, or exceptional?
- Why is each blocked task blocked?
- Which gates passed, failed, or are unknown?
- What authority/approval allowed each consequential attempt?
- What external side effects occurred?
- What retries/recovery/compensation happened?
- What evidence supports completion?

Important transitions must be attributable and auditable. Observability must not expose secrets or unnecessary PII.

## Fail-closed rules

The engine MUST NOT autonomously execute a consequential task when:

- required authorization is missing or unclear;
- required AI authority/approval/delegation is insufficient;
- a required hard constraint failed or is unresolved;
- required verification is missing, expired, revoked, or out of scope;
- required evidence is stale where freshness is material;
- the operation cannot be bounded to the intended resource/scope;
- duplicate-prevention requirements are unmet for retry-sensitive writes;
- a prior partial side effect is unresolved and a retry could duplicate harm;
- the authoritative external state conflicts materially with local assumptions;
- execution would cross an A4 autonomous boundary.

Ambiguity resolves to no consequential autonomous execution.

## Security and tenancy

Every orchestration run and task must retain the relevant identity/tenant/organization context. Cross-tenant task composition must not bypass resource authorization or data-isolation rules.

The engine must not place credentials, secrets, or unrestricted privileged tokens into plan/task payloads. Tool credentials are resolved by controlled execution infrastructure.

## Product adapters

Consumers should provide thin adapters declaring domain-specific:

- task types and schemas;
- requirements and completion criteria;
- constraint/gate bindings;
- authorization and approval requirements;
- AI Authority operation mapping;
- resource/schedule semantics;
- external-system adapters;
- idempotency/recovery behavior;
- exception handling and escalation rules.

Adapters must not fork the canonical orchestration lifecycle or weaken platform invariants.

## Current implementation truth

GlenTown contains implemented domain orchestration patterns, including Travel `BookingOrchestrator`, availability validation, conflict detection, itinerary generation, and calendar synchronization. These are implementation evidence and proving-ground patterns, not proof that the complete portfolio Orchestration Engine contract is implemented.

The canonical v1 status is therefore `canonical-design-v1`, with extraction remaining logical-boundary-defined until reuse and implementation evidence justify a physical shared component.

## Non-goals

This contract does not:

- create a new orchestration microservice;
- rewrite existing GlenTown planners;
- implement Day Planner or other post-Beta features merely for architecture alignment;
- replace domain state machines;
- own authorization, AI authority, professional judgment, government authority, payments, or external system truth;
- make scenarios, AI recommendations, or constraint evaluations authoritative decisions;
- guarantee that every product uses identical task granularity.
