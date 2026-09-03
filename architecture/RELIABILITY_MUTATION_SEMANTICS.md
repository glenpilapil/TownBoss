# Reliability & Mutation Semantics v1

Status: canonical-design-v1
Classification: Platform Core
Current home: TownBoss
Initial consumer: GlenTown

## Purpose

Reliability & Mutation Semantics defines the portfolio-wide rules for retry-safe writes, duplicate suppression, transaction boundaries, concurrency control, durable side effects, uncertain outcomes, recovery, and mutation observability.

It exists so important state changes do not become unsafe merely because clients retry, workers restart, providers time out, messages arrive twice, or concurrent actors race.

## Core invariants

`request retry != permission to duplicate effect`

`database commit != external side-effect completion`

`provider timeout != provider failure`

`accepted command != completed workflow`

`retryable != safe-to-replay without idempotency`

`at-least-once delivery != exactly-once effect`

`lock acquired != authorization granted`

Reliability controls never replace authentication, authorization, AI Authority, business validation, professional authority, payment authority, or government authority.

## Scope

This capability owns shared semantics for:

- mutation classification
- idempotency requirements
- idempotency-key handling
- duplicate request suppression
- transaction-boundary guidance
- concurrency-control expectations
- optimistic/pessimistic conflict handling
- transactional outbox compatibility
- retry classification and retry budgets
- unknown-outcome semantics
- compensating/reversal actions
- partial-failure recovery
- background job replay safety
- webhook/event duplicate tolerance
- ordering and stale-message handling
- mutation correlation and observability
- recovery-state durability
- dead-letter/manual-review escalation semantics

It does not own domain business rules, authorization decisions, product workflow state, provider truth, infrastructure vendor choice, queue vendor choice, database vendor choice, or distributed-consensus implementation.

## Mutation classes

Every important write should be classified before implementation.

### Class M0 — Local reversible mutation
Examples: preference changes, draft edits, non-consequential presentation state.

Requirements are lighter, but concurrent overwrites and stale clients still require deliberate handling where material.

### Class M1 — Durable domain mutation
Examples: publishing a listing, changing organization membership, accepting a request, changing booking state.

Requires explicit validation, authorization, durable state transition, stable error semantics, and conflict handling.

### Class M2 — Retry-sensitive consequential mutation
Examples: checkout, reservation, credit posting, payment/refund request, withdrawal, voucher consumption, inventory decrement, approval, verification, invitation acceptance.

Requires idempotency or an equivalent uniqueness guarantee, concurrency safety, durable auditability where applicable, and defined retry/unknown-outcome behavior.

### Class M3 — Cross-system consequential mutation
Examples: payment-provider submission, government-service submission, external booking confirmation, provider webhook processing, external calendar write, payout transfer.

Requires M2 controls plus provider correlation, external-reference preservation, replay protection, reconciliation, and explicit unknown-outcome handling.

## Idempotency

Idempotency means repeated delivery of the same logical mutation does not create additional unintended effects.

Important rules:

1. Idempotency keys are scoped to an actor/account/tenant and operation boundary; a globally reusable opaque key is unsafe without scope.
2. Reuse of the same key with semantically different payloads must fail deterministically rather than silently perform a different mutation.
3. A successful prior result should be recoverable/replayable when practical rather than creating a duplicate record.
4. Keys should have a documented retention period long enough for realistic retries and delayed callbacks.
5. Server-generated deduplication based only on timestamps or random identifiers is not equivalent to caller-supplied idempotency where the caller may retry.
6. Database uniqueness constraints should back critical deduplication guarantees where feasible.
7. Idempotency is separate from authorization; replaying an authorized old request must not bypass current revocation rules when policy requires re-evaluation.

Mandatory or equivalent protection is expected for checkout, orders, bookings/reservations, payments/credits, refunds, payouts, withdrawals, voucher consumption, approvals, verification transitions, listing publication where duplicate side effects exist, webhook ingestion, reconciliation imports, and other retry-sensitive writes.

## Transactions

Use database transactions for groups of local writes that must succeed or fail together.

Transactions should include the authoritative local state changes necessary to preserve invariants, but should not hold locks while waiting on avoidable external network calls.

A transaction does not make external calls atomic. If local commit and external side effects must stay coordinated, use a durable handoff such as a transactional outbox/event record or an equivalent persisted work item.

## Transactional outbox / durable side-effect handoff

For important side effects triggered by a committed mutation, prefer:

1. validate and authorize
2. commit domain state plus an outbox/work record in the same local transaction
3. asynchronously dispatch/process the side effect
4. mark delivery/processing state durably
5. retry safely using idempotent consumer semantics
6. escalate exhausted or ambiguous work for recovery/reconciliation

The architecture does not require one physical outbox implementation before Beta where no such side effect exists. It requires compatibility when important asynchronous effects are implemented.

## Concurrency control

Concurrency must be treated explicitly when two actors can mutate the same scarce or consequential resource.

Approved techniques include:

- pessimistic row locking such as `SELECT ... FOR UPDATE`
- optimistic version checks / compare-and-swap
- unique constraints
- atomic increments/decrements
- serialized domain commands
- reservation/hold records with deterministic ownership

The chosen mechanism must protect the actual invariant, not merely make a race less likely.

Examples of invariants requiring protection include stock, capacity, slot availability, one-time invitation acceptance, one-time verification approval, balance posting, reservation conversion, voucher usage limits, and status transitions that must not occur twice.

## State transitions

Consequential entities should use explicit transitions rather than arbitrary field mutation where lifecycle matters.

A transition should evaluate, as applicable:

- current state
- requested next state
- actor/tenant/resource authorization
- prerequisites and constraints
- idempotency or duplicate status
- concurrency/version condition
- downstream obligations
- audit/evidence requirements

Invalid stale transitions should fail deterministically rather than silently overwrite newer state.

## Retry semantics

Retries are allowed only for failures classified as retryable.

Potentially retryable examples:
- transient network failure
- provider 5xx where provider semantics allow retry
- lock timeout/deadlock with bounded retry
- temporary dependency unavailability
- queue worker interruption before durable completion

Generally non-retryable without correction:
- validation failure
- authorization denial
- hard constraint failure
- unsupported transition
- malformed request
- idempotency-key conflict with different payload

Retries must be bounded. Retry exhaustion becomes an explicit state requiring recovery, reconciliation, dead-letter handling, or operator attention depending on consequence.

## Unknown outcomes

An unknown outcome is distinct from success and failure.

Typical case: an external payment or government submission times out after the remote system may have accepted it.

Rules:

- do not guess success
- do not blindly replay a non-idempotent external call
- preserve the request correlation/external reference if available
- query/reconcile authoritative external state when possible
- mark the local operation as `unknown`, `pending-reconciliation`, or an equivalent explicit state
- block unsafe duplicate execution until the ambiguity is resolved

## Partial failure and compensation

When a multi-step operation cannot be atomic, define forward recovery or compensation.

Compensation is not deletion of history. For financially, legally, professionally, or operationally material actions, prefer reversal/adjustment/supersession records that preserve accountability.

Examples:
- release a reservation after downstream payment failure
- restock after a cancelled order when business rules permit
- reverse a credit posting with an attributable corrective entry
- mark an external-calendar sync pending instead of pretending it succeeded

## Events, jobs, and webhooks

Consumers must assume duplicate delivery unless a transport explicitly guarantees otherwise and that guarantee is relied upon safely.

Important event/job/webhook processors should be:

- idempotent
- duplicate-tolerant
- attributable to a stable message/event identifier where possible
- ordering-aware when order matters
- able to reject stale superseded events
- safe after worker restart
- observable for retries, failures, and dead-letter state

Webhook authentication and provider trust remain governed by Security Baseline and Platform API Boundary.

## Ordering

Do not assume arrival order equals causal order across asynchronous boundaries.

Where sequence matters, use an explicit provider sequence/version, domain version, effective timestamp plus conflict rule, or authoritative re-query.

A late stale event must not silently regress a newer durable state.

## Recovery

Recovery state must be durable for important operations.

A robust recovery record may include:

- operation/correlation ID
- idempotency key
- actor/tenant/resource
- current phase
- attempt count
- last failure classification
- next retry eligibility
- external reference
- local transaction reference
- unresolved side effects
- reconciliation status
- required human decision

Recovery should prefer completing or reconciling a known operation over creating a fresh duplicate operation.

## AI Authority and Orchestration

AI or an orchestrator may prepare, sequence, retry, and recover mutations only within existing authority.

They may not:

- convert a non-idempotent action into a safe autonomous retry by assumption
- replay a consequential mutation after an unknown outcome without reconciliation policy
- bypass approval because the prior attempt failed technically
- suppress evidence of partial execution
- increase retry budgets to force eventual success against policy
- interpret timeout as authorization to execute again

A3 bounded execution remains subject to AI Authority Model v2, exact authorization, deterministic constraints, idempotency, auditability, recovery, and stop conditions.

## Payments & Credits

Financial mutations inherit the stronger Payments & Credits rules.

Duplicate callbacks, webhook retries, top-up approvals, refunds, payouts, withdrawals, adjustments, and reconciliation imports must not post value twice.

Unknown provider outcomes become reconciliation-required rather than guessed success/failure.

## Scheduling and availability

Reservations, holds, capacity, and slot conversion require concurrency safety.

Availability checks are advisory unless performed inside a protected mutation boundary or backed by an authoritative reservation/hold mechanism.

`availability checked == true` does not guarantee the slot remains available at commit time.

## Media and evidence

Media uploads may use content hashes for integrity/deduplication, but hash equality must not merge ownership, tenancy, privacy, consent, or provenance boundaries automatically.

Evidence supersession and verification history should be append-oriented where accountability matters.

## API behavior

Platform API Boundary owns where idempotency keys and mutation contracts are exposed. Reliability & Mutation Semantics owns what retry-safe behavior means.

For supported APIs, consequential mutation responses should expose enough stable identity/correlation for clients to recover after timeout without blindly repeating side effects.

## Observability

Operational telemetry should support diagnosis of:

- duplicate suppression
- idempotency conflicts
- transaction failures
- deadlocks/lock contention
- retry attempts/exhaustion
- outbox lag/backlog
- webhook duplicates
- unknown outcomes
- compensation/reversal
- reconciliation backlog
- dead-letter/manual-review queues

Telemetry does not replace durable domain state or audit evidence.

## GlenTown implementation truth

Verified current GlenTown patterns include:

- cart checkout receives an `Idempotency-Key` header
- carts persist `checkout_idempotency_key`
- repeated checkout with the same key can return existing orders
- conflicting idempotency keys on an already-used cart are rejected
- checkout executes inside `DB::transaction`
- checkout locks the cart, cart items, products, and variants using `lockForUpdate`
- stock decrement, order creation, order-item creation, order status history, and cart conversion occur in the same transaction

These are real reliability primitives and a strong implementation reference for future consequential mutations.

Not verified as a shared GlenTown runtime:

- generic portfolio idempotency middleware/store
- transactional outbox table/runtime
- generic event bus abstraction
- generic retry-policy service
- dead-letter queue management layer
- generic operation/recovery record
- distributed lock service
- universal optimistic concurrency/version field

The absence of those generic mechanisms does not invalidate existing domain-local safeguards.

## Beta posture

This architecture does not require building a generic reliability platform before GlenTown Beta.

Implementation remains demand-led: consequential GlenTown mutations should adopt these semantics as they are built or hardened. Existing safe domain-local mechanisms may remain until reuse or operational evidence justifies extraction.

## Extraction principle

TownBoss owns the semantics. Products implement local adapters/patterns until multiple consumers or repeated evidence justify a shared physical runtime.
