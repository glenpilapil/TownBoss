# TownBoss Architecture Baseline v1

Status: `canonical-baseline-v1`  
Canonical home: `glenpilapil/TownBoss`  
Baseline source commit: `09d0be6d6a07dccfb85779d4d5f28e974812ffed`  
Established: 2026-09-04

## Purpose

This document freezes the first coherent TownBoss portfolio architecture baseline after completion of the capability-contract, dependency, implementation-truth, consistency, and adapter-roadmap sequence.

It is the architectural starting point for implementation-led development. It is not a claim that every canonical capability has a physically extracted shared runtime.

Core rule:

`canonical architecture != physical implementation`

The portfolio should now prefer implementing real product needs against this baseline over continuing architecture for its own sake.

## Portfolio model

TownBoss is treated as a capability company. Reusable semantics live in TownBoss; products implement or consume those semantics through bounded local implementations and adapters when real behavior requires them.

Dependency direction remains:

`product -> shared-domain -> platform-core`

Logical boundaries come before physical extraction. A capability may remain implemented inside a product monolith until reuse, operational, ownership, scaling, or isolation evidence justifies extraction.

## Baseline invariants

The following invariants are portfolio-wide unless a later approved version explicitly supersedes them:

- `dependency != ownership`
- `integration != authority transfer`
- `data access != permission`
- `authenticated != authorized`
- `confidence != authority`
- `tool access != permission`
- `orchestration != authority`
- `scenario output != approval`
- `constraint pass != execution authority`
- `review != verification != authority != evidence truth`
- `audit record != evidence source truth != domain state`
- `derived projection != authoritative record`
- `public government data != government transaction authority`
- `cached != current`
- `payment intent != payment confirmation != settlement`
- `schedule != availability truth != reservation confirmation != execution authority`
- `media blob != domain record != evidence truth`
- `delivery != read != acknowledgment != source-domain completion`
- `request retry != permission to duplicate effect`
- `database commit != external side-effect completion`
- `provider timeout != provider failure`
- `at-least-once delivery != exactly-once effect`
- `canonical capability != required physical adapter today`

## Canonical capability set

The root Capability Registry is the canonical machine-readable catalog. At this baseline, the 20 capability-contract directories audited as complete are:

1. AI Authority
2. Audit & Observability
3. Constraint Engine
4. Evidence & Provenance
5. Feature Flags & Experimentation
6. Glen AI Foundation
7. Human Verification
8. Media
9. Messaging
10. Notifications
11. Orchestration Engine
12. Payments & Credits
13. Platform API Boundary
14. Public Data Gateway
15. Reliability & Mutation Semantics
16. Reviews & Reputation
17. Scenario Engine
18. Scheduling & Shared Resource Calendar
19. Search & Discovery
20. Security Baseline

The registry also contains existing implemented/foundational entries such as Identity & Trust, Organizations & Tenancy, Authorization, and Location & Geography, plus approved/emerging product and shared-domain directions such as Spatial Intelligence, Property Intelligence, 3D/visualization, Community, Pre-Loved, and Parcel Technical Description Interpretation.

A registry entry does not imply a physically shared service.

## Ownership model

### Identity, tenancy, and permission

- Identity & Trust owns actor/subject identity truth.
- Organizations & Tenancy owns organization and tenant context.
- Authorization consumes those contexts and owns permission decisions and resource-scope enforcement.
- No AI layer, feature flag, internal API, or orchestration flow may bypass Authorization.

### Evidence, audit, and verification

- Evidence & Provenance owns source, claim, artifact, lineage, observation/effective/recorded time, confidence, assessment, and supersession semantics.
- Audit & Observability records attributable actions, outcomes, logs, metrics, traces, alerts, and incidents without becoming source-domain truth.
- Human Verification owns governed review workflow and reviewer attribution; Identity & Trust remains identity source of truth and Evidence & Provenance remains evidence/lineage source of truth.

### Authority

Authorization, AI Authority, professional authority, government/external authority, and orchestration are distinct.

AI Authority Model v2 defines:

- A0 — Inform / Explain
- A1 — Recommend / Draft
- A2 — Prepare for Approval
- A3 — Bounded Execution
- A4 — Prohibited Autonomous Authority boundary

Consequential behavior defaults to A2 unless a specific bounded A3 operation is authorized and all required gates pass. A4 autonomous authority remains prohibited.

### Orchestration

Orchestration owns execution lifecycle coordination:

`Goal -> Tasks -> Requirements -> Dependencies -> Validation Gates -> Resources -> Schedule -> Execution -> Exceptions -> Completion`

It does not own the authority to perform an action, professional judgment, government authority, financial custody, or source-domain business truth.

## Cross-cutting composition rules

### Security

Security Baseline is the minimum portfolio security floor. Capability-specific rules may strengthen but never weaken it.

Protected behavior requires server-side authorization, tenant isolation where applicable, explicit input validation, secret hygiene, safe upload handling, transport/session/token protection, sensitive-data minimization, abuse controls, production-safe error handling, and security observability appropriate to risk.

### Reliability

Reliability & Mutation Semantics owns generic retry-safe effect semantics. Platform API Boundary owns supported interface placement, versioning, request/response/error contracts, idempotency-key interface semantics, and webhook boundaries. Domain capabilities may impose stricter mutation profiles.

Important retry-sensitive mutations should be idempotent and concurrency-safe. Asynchronous side effects should be compatible with transactional-outbox/event patterns when reliability requires them.

### API boundaries

TownBoss distinguishes:

1. internal application APIs
2. intentionally supported versioned public/product APIs
3. TownBoss capability contracts
4. external integration adapters

`reachable endpoint != supported API != authorized capability`

Undocumented internals are not a public integration contract.

### Feature flags

Feature Flags & Experimentation controls exposure, rollout, targeting, experiments, and kill switches. It cannot grant Authorization, entitlement, consent, professional authority, government authority, or AI Authority.

### Search

Search & Discovery consumes eligible projections from source domains. Discoverability does not create publication rights, permission, verification, availability, endorsement, or authority.

### Public data and external sources

Public Data Gateway owns approved source-adapter, ingestion, normalization, freshness, provenance, cache, reconciliation, and serving contracts.

External sources remain authoritative for their own records. Government-service state remains authoritative in the relevant government system.

### Payments

Payments & Credits owns payment/credit financial semantics and reconciliation while product order/booking fulfillment remains separate. Provider acceptance, provider settlement, local financial confirmation, and product completion must not be conflated.

### Scheduling

Scheduling owns shared temporal/resource availability, holds, reservations, conflict, capacity, recurrence, timezone, and calendar semantics. Source domains retain booking/business completion and authoritative resource state.

## AI foundation

Glen AI Foundation is the reusable interaction layer for intent interpretation, skill routing, authorized context assembly, grounding, model-provider abstraction, typed output, action-proposal handoff, and AI interaction observability.

`action proposal != execution`

Character/personality selection is presentation behavior only:

`character/personality != capability != authorization != AI authority`

Glen remains the global default character. Anji is an approved selectable character subject to the existing likeness/voice consent and provenance requirements. Character style cannot change truth, evidence, authority, constraints, or permission.

## Government and transit interoperability

Government Service Interoperability remains an approved architectural principle. eGovPH, eGovDX, eLGU, agency systems, and LGU systems are authoritative external systems. TownBoss products may orchestrate, preflight, explain, link, submit when explicitly authorized and supported, track, and reconcile, but must not imply government authority.

Transit Data Interoperability remains an approved future capability using a common interface capable of consuming trustworthy live telemetry from native driver/operator mobile GPS, operator fleet APIs, LGU/public feeds, and dedicated hardware, with routes/schedules/status as fallbacks. Source and freshness must remain explicit.

## Adapter policy

The Adapter Roadmap governs physical integration work.

Adapter classes:

1. product-to-capability
2. provider
3. authoritative external-system
4. product-to-product

Adapter lifecycle:

`candidate -> evaluating -> approved -> implemented -> verified -> deprecated -> retired`

`approved != implemented != verified`

Provider and API-discovery references may generate candidates, but each real provider still requires security, privacy/legal/compliance, cost, reliability, authority/provenance, and architectural evaluation.

## Implementation truth at baseline

Implementation truth is recorded separately in `capabilities/IMPLEMENTATION_TRUTH_MATRIX.yaml`.

The baseline does not promote architecture status to implementation status.

Important audited facts include:

- No canonical TownBoss capability was verified as physically extracted into a shared portfolio runtime.
- GlenTown-API implements Identity & Trust, Organizations/Tenancy, Location/Geography, partial Authorization, and partial/local patterns for several other capabilities.
- GlenTown and CodeBisor have thin AI Authority adapter/enforcement implementations.
- GlenTown checkout has real idempotency, transactional, and row-locking/concurrency behavior, but there is no verified generic portfolio reliability/outbox runtime.
- GlenTown contains product-level Travel scheduling/orchestration patterns but no verified shared Scheduling or Orchestration runtime.
- No GlenTown messaging, reviews/reputation, generic public-data gateway, general Glen AI runtime, Scenario Engine, Constraint Engine, or Human Verification runtime was verified in the audited snapshots.
- GeoPlotter has a FastAPI geospatial service boundary, but the audited main branch exposes health-only behavior and remains scaffold-level for Spatial Intelligence / parcel interpretation.

These gaps are expected implementation work, not architecture failures.

## Product application rule

When implementing a substantial new feature, teams should ask:

1. Is this purely product-specific?
2. Does an existing TownBoss capability already own the semantics?
3. If reusable, should the product implement a thin adapter now or is logical conformance sufficient?
4. Is there actual reuse/extraction evidence, or would extraction create premature complexity?

Products may extend product-specific business semantics but must not fork canonical authority, authorization, security, reliability, provenance, or interface invariants.

## Change-control rule

This baseline is versioned, not immutable.

A future architecture change should amend or supersede this baseline only when at least one of the following is true:

- implementation evidence contradicts a current assumption
- a new product creates genuine reuse pressure
- an external partnership/provider creates a real integration requirement
- a security, legal, privacy, reliability, or authority requirement changes
- capability ownership becomes materially ambiguous
- the current contract blocks necessary implementation

Minor product implementation details do not require a new portfolio architecture version.

Any `v2` baseline must state what it supersedes, why, and which invariants changed.

## Completed baseline evidence

This baseline rests on the completed sequence of:

- Platform/capability foundation
- Evidence & Provenance v1
- Scenario Engine v1
- Constraint Engine v1
- AI Authority Model v2
- Human Verification Workflow v1
- Orchestration Engine v1
- Glen AI Foundation v1
- Character Profiles v1
- Feature Flags & Experimentation v1
- Audit & Observability v1
- Search & Discovery v1
- Messaging v1
- Notifications v1
- Payments & Credits v1
- Media v1
- Reviews & Reputation v1
- Scheduling & Shared Resource Calendar v1
- Public Data Gateway v1
- Security Baseline v1
- Platform API Boundary v1
- Reliability & Mutation Semantics v1
- Capability Dependency / Integration Matrix v1
- Portfolio Capability Registry completeness audit
- Cross-contract consistency audit
- Implementation-truth audit across products
- Adapter Roadmap v1

## Baseline outcome

**Architecture Baseline v1 is complete.**

The portfolio now has a coherent canonical capability model, authority model, integration/dependency model, security/reliability/API floor, implementation-truth separation, and trigger-based adapter roadmap.

From this point, the default mode is **implementation-led**:

- GlenTown Beta requirements determine near-term adapters and runtime work.
- GeoPlotter provides the proving ground for future Spatial Intelligence extraction once material runtime exists.
- TownTraveler, RealWise, TownDeveloper, Forex Quant Lab, and other products provide additional reuse evidence over time.
- TownBoss architecture evolves when implementation evidence demands it, not merely to add conceptual completeness.
