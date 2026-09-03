# Capability Dependency / Integration Matrix v1

Status: `canonical-design-v1`
Classification: portfolio architecture governance
Owner: TownBoss

## Purpose

This matrix makes capability relationships explicit so TownBoss remains a capability company rather than a set of product-specific copies. It defines permitted dependency direction, authority boundaries, integration contracts, and common interaction paths across the portfolio.

It is a logical architecture contract. It does not require physical service extraction, network calls, or new GlenTown Beta functionality.

## Core invariants

- `dependency != ownership`
- `integration != authority transfer`
- `data access != permission`
- `orchestration != source-of-truth ownership`
- `AI proposal != execution authority`
- `derived projection != authoritative record`
- `capability reuse != forced microservice extraction`
- Product capabilities may consume shared-domain and platform-core capabilities; they must not silently fork their semantics.
- Shared-domain capabilities may consume platform-core capabilities. Platform-core capabilities must not depend on product-specific business semantics.
- Cross-capability calls must preserve authorization, tenancy, provenance, reliability, and audit requirements appropriate to the operation.

## Dependency classes

| Class | Meaning |
|---|---|
| Required | Consumer cannot correctly perform the governed operation without the dependency. |
| Conditional | Required only when the associated behavior is used. |
| Projection | Consumer reads a derived view; source capability remains authoritative. |
| Coordination | Capabilities exchange state or intent while retaining separate ownership. |
| Adapter | Integration with an external or product-specific implementation behind a canonical contract. |
| Governance | Capability constrains or governs behavior but does not own the business record. |

## Canonical capability matrix

| Capability | Primary upstream dependencies | Key downstream consumers | Integration rule |
|---|---|---|---|
| Identity & Trust | — | Authorization, Organizations, Messaging, Reviews, Payments, Scheduling, Glen AI | Identity supplies actor/subject identity; consumers do not redefine legal/display identity semantics. |
| Organizations & Tenancy | Identity & Trust | Authorization, Search, Messaging, Payments, Scheduling, domain capabilities | Tenant/org context is preserved through every protected cross-capability operation. |
| Authorization | Identity & Trust, Organizations/Tenancy | All protected capabilities | Authorization decides resource permission. No downstream capability, AI layer, feature flag, or orchestration flow may bypass it. |
| Location & Geography | Authorization where protected | Search, Scheduling, Public Data Gateway, Orchestration, Spatial Intelligence | Supplies canonical geographic references/context; consumers own their domain interpretation. |
| Search & Discovery | Authorization, Location, source-domain projections | GlenTown, Glen AI, TownTraveler, RealWise | Search consumes eligible projections. Discoverability never creates authorization, availability, verification, or endorsement. |
| Media | Authorization, Organizations/Tenancy | Messaging, Reviews, Evidence, listings, Glen AI | Media owns generic asset lifecycle; attaching media does not make the containing claim true or public. |
| Messaging | Identity, Authorization, Media, Reliability | GlenTown, RealWise, TownTraveler, Glen AI | Messaging owns conversation/message state, not order, booking, payment, or workflow state. |
| Notifications | Identity, Authorization, Reliability | Orchestration, Scheduling, Messaging, Payments, product domains | Notification is a delivery projection of source-domain intent; delivery/read state does not mutate source-domain truth. |
| Payments & Credits | Identity, Authorization, Reliability, Audit, Evidence when proof-based | Orders, bookings, services, future portfolio commerce | Financial state remains separate from order/booking fulfillment; external provider state is reconciled, not assumed. |
| Reviews & Reputation | Identity, Authorization, source interaction eligibility, Media, Audit | Search, product profiles, Glen AI | Reputation is derived; it is not professional verification, government authority, evidence truth, or creditworthiness. |
| Scheduling / Shared Resource Calendar | Identity, Authorization, Organizations, Location, Reliability | Booking domains, Orchestration, planners, Notifications | Scheduling owns temporal/resource semantics; booking/domain completion remains with owning domain. |
| Public Data Gateway | Authorization where needed, Location, Evidence/Provenance, Reliability | Search, Orchestration, Glen AI, Spatial Intelligence, product domains | External/public sources remain authoritative for their own records. Gateway normalizes access and provenance without claiming authority. |
| Evidence & Provenance | Identity/actor references, Media where artifacts exist | Human Verification, AI, Scenario, Constraints, audit-linked workflows | Evidence records source/lineage/assessment; it does not manufacture approval, professional signoff, or government authority. |
| Audit & Observability | Identity/actor refs, correlation context | All consequential capabilities | Observes actions/outcomes. Audit does not become source-domain state or evidence source truth merely by recording it. |
| Feature Flags & Experimentation | Identity/targeting context, Audit/metrics | Product surfaces and capability implementations | Flags control exposure/configuration only; they cannot grant authorization, AI authority, consent, professional authority, or government authority. |
| Reliability & Mutation Semantics | Authorization context, Audit/Observability | All retry-sensitive mutations | Governs idempotency, transaction/outbox/retry/recovery semantics; domain capabilities still own business rules and state. |
| Platform API Boundary | Authorization, Reliability | All internal/public/external interfaces | Governs supported interface/version/error/idempotency/webhook boundaries without forcing microservices. |
| Orchestration Engine | Authorization, Scheduling, Constraints, Evidence, AI Authority, Human Verification, Reliability | Day/Trip/Event/Financial planners, Achieve, TownTraveler, TownDeveloper | Coordinates goal-to-completion flow but does not own domain authority, payment custody, professional judgment, or external authoritative state. |
| Scenario Engine | Constraints, Evidence, Location/Spatial as needed | GeoPlotter, GlenTown, RealWise, TownDeveloper, Forex Quant Lab | Produces simulations/comparisons. Scenario result is not approval or authority. |
| Constraint Engine | Evidence/source inputs, Authorization for overrides | Scenario, Orchestration, Glen AI, domain workflows | Represents/evaluates constraints; domain/government/professional sources author authoritative rules. |
| AI Authority Model | Authorization, Human approval/delegation, Constraints, Audit, Reliability | Glen AI, Development Supervisor, AI-enabled products | Defines maximum autonomous behavior. Tool access, confidence, or orchestration cannot increase authority. |
| Glen AI Foundation | Authorization, AI Authority, Search, Evidence, Constraints, Orchestration, Audit | GlenTown and future portfolio products | Interprets intent, routes skills, assembles context, produces typed outputs/proposals. Consequential execution remains governed externally. |
| Human Verification | Identity, Authorization, Evidence, Audit | AI, Orchestration, GeoPlotter, RealWise, product workflows | Routes insufficient machine confidence/authority to qualified humans; reviewer scope and qualification remain explicit. |
| Spatial Intelligence | Location, Evidence, Public Data Gateway, Constraints | GeoPlotter, GlenTown, RealWise, TownTraveler, TownDeveloper | Shared spatial semantics; physical extraction deferred until implementation evidence justifies it. |

## Critical integration paths

### Consequential AI action

`Glen AI Foundation -> AI Authority -> Authorization -> Constraint Engine -> Human Verification/approval when required -> Orchestration -> owning domain mutation -> Reliability -> Audit`

A3 execution is allowed only inside the exact bounded authority granted. A4 autonomous authority remains prohibited.

### Planner / shared calendar

`Planner -> Orchestration -> Scheduling -> owning booking/resource domain -> Reliability -> Notifications`

Location/travel-time constraints may be supplied by Location/Geography, Spatial Intelligence, Public Data Gateway, or Constraint Engine. Scheduling does not own travel policy or booking fulfillment.

### Commerce mutation

`Product/Cart/Order domain -> Authorization -> Payments where applicable -> Reliability -> Audit -> Notifications`

Payment confirmation and order fulfillment are separate states. Retries must not duplicate financial or inventory effects.

### Search and reputation

`Source domain -> eligibility/publication policy -> Search projection`

`Eligible completed interaction -> Reviews/Reputation -> Search ranking signal`

Search may consume reputation but must not reinterpret it as verification or endorsement.

### Evidence-backed verification

`Source/Media/Public Data -> Evidence & Provenance -> Human Verification -> owning domain decision`

Verification outcome does not replace the source record or government/professional authority.

### Government/public data

`Product/Orchestration/Glen AI -> Public Data Gateway or approved government adapter -> authoritative external system -> reconciliation/provenance -> product projection`

TownBoss products may preflight, explain, orchestrate, submit when explicitly authorized, and track. They must not imply that GlenTown or Glen AI is the government authority.

## Cross-cutting requirements

### Authorization and tenancy
Every protected integration carries actor, tenant/organization where relevant, resource scope, and authorization context. Internal calls are not trusted merely because they are internal.

### Reliability
Retry-sensitive mutations use explicit idempotency scope, concurrency protection appropriate to the invariant, deterministic duplicate behavior, bounded retry, and unknown-outcome reconciliation. Important async side effects should use transactional-outbox-compatible semantics.

### Audit and correlation
Consequential cross-capability operations carry correlation/causation identifiers and produce attributable audit events without leaking sensitive payloads into generic telemetry.

### Evidence and provenance
Derived data should retain enough source/provenance metadata to distinguish authoritative source, cached observation, user claim, AI inference, external review, and internal projection.

### Privacy
Consumers receive the minimum authorized data needed. Search indexes, logs, AI context, notifications, analytics, and calendar free/busy projections must not become alternate routes around privacy rules.

### Failure isolation
A downstream auxiliary failure must not silently reverse or corrupt an already committed source-domain mutation. For example, notification failure does not invalidate a booking; telemetry failure does not redefine transaction outcome. Critical dependencies fail closed when their unresolved state affects safety, authority, money, availability, or authorization.

## Product adapter rule

TownBoss owns canonical capability contracts. Product repositories implement thin adapters or local implementations when real behavior exists. A product may extend domain-specific semantics but must not fork canonical authority, authorization, provenance, reliability, or interface invariants.

Physical extraction is evidence-driven. A logical capability can remain inside a product monolith while still conforming to the TownBoss contract.

## Dependency-cycle prevention

1. Platform-core cannot depend on a product capability.
2. Shared-domain cannot require a product-specific implementation as its canonical source.
3. Product-to-product dependencies should be replaced by a shared contract or explicit external adapter when reuse is real.
4. Cross-capability callbacks must not create hidden authority escalation.
5. Derived projections must not become reverse dependencies that control their source of truth.
6. Circular workflow coordination belongs in Orchestration rather than mutual direct ownership.

## Implementation truth

This document describes the canonical logical dependency model. Capability status remains governed by implementation evidence in the Capability Registry and capability-local registry entries. Existing GlenTown implementations may satisfy portions of these contracts locally; that does not mean TownBoss has physically extracted shared services.

No new Beta feature is required by this matrix.

## Follow-up audits

This matrix is the input to:

1. Portfolio Capability Registry completeness audit.
2. Cross-contract consistency audit.
3. Implementation-truth audit across products.
4. Adapter roadmap.
5. Final TownBoss Architecture Baseline v1.
