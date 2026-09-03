# Platform API Boundary v1

Status: canonical-design-v1
Classification: Platform Core
Current canonical home: TownBoss
Initial consumer: GlenTown
Future consumers: GeoPlotter, RealWise, TownTraveler, TownDeveloper, Glen AI, Development Supervisor

## Purpose

Platform API Boundary defines the portfolio-wide rules for separating internal application interfaces, intentionally exposed product/public interfaces, inter-capability contracts, and external integration adapters. The purpose is to prevent accidental coupling to implementation details, make versioning and compatibility explicit, preserve authorization and tenancy boundaries, and keep third parties from depending on undocumented internals.

Core rule:

`reachable endpoint != supported API != authorized capability`

A route, controller, class, database table, event, internal service, or serialized field is not automatically a supported integration surface merely because it is technically reachable or observable.

## Boundary classes

Every API or machine-consumable interface should be classified into one of the following classes.

### 1. Internal application API

Used by a TownBoss-owned product client or service and allowed to evolve with that product's release lifecycle.

Examples:
- GlenTown mobile/web client to GlenTown-API
- internal admin surfaces
- same-product backend modules

Internal application APIs still require authentication, authorization, validation, compatibility discipline, and observability. They are not automatically public integration contracts.

### 2. Versioned public/product API

An intentionally supported interface for approved external consumers or portfolio consumers with a documented compatibility commitment.

Requirements include:
- explicit version
- documented authentication and authorization model
- stable request/response contract
- lifecycle and deprecation policy
- rate and abuse controls
- consumer registration where appropriate
- observable usage and errors

### 3. Capability contract

A logical TownBoss contract between reusable capabilities and product adapters. A capability contract may be implemented as in-process calls, events, HTTP, queues, or another transport.

The semantic contract is canonical; transport is secondary.

### 4. External integration API / adapter

An interface to a third-party, provider, government platform, operator system, public data source, payment provider, messaging provider, calendar provider, or other external authority.

Provider-specific schemas and credentials remain behind adapters. Internal products should consume normalized TownBoss/product contracts rather than spread provider schemas throughout domain code.

## Ownership

Platform API Boundary owns:
- interface classification semantics
- versioning and compatibility expectations
- supported-vs-internal contract distinction
- request/response boundary discipline
- public API lifecycle and deprecation semantics
- adapter boundary requirements
- cross-capability interface principles
- API error-envelope expectations
- pagination and filtering consistency expectations
- idempotency-key placement expectations for retry-sensitive mutations
- API authentication/authorization boundary requirements
- API observability and correlation expectations
- webhook trust-boundary rules
- schema-change governance

It does not own:
- domain business rules
- product-specific authorization policy
- identity source of truth
- capability-specific payload semantics
- payment-provider authority
- government authority
- provider-specific credentials
- infrastructure routing or DNS
- service-mesh implementation
- whether a logical capability is physically extracted into a microservice

## Versioning

Externally supported APIs must be explicitly versioned. Path versioning such as `/v1/...` is acceptable and is already the dominant GlenTown pattern.

Versioning rules:
- breaking externally observable behavior requires a versioning decision
- additive fields should be preferred over destructive changes where consumers can safely ignore unknown fields
- changing a field's meaning is breaking even if its name and type remain unchanged
- enum expansion must be treated according to the declared consumer contract
- removing or renaming fields/endpoints requires deprecation unless the interface is explicitly internal and coordinated
- version identifiers describe contract compatibility, not merely deployment generation

Internal APIs may move faster, but production clients must still be protected from incompatible server changes during rollout windows.

## Supported surface vs implementation detail

The following are not automatically supported interfaces:
- framework routes discovered by inspection
- database schemas
- ORM models
- internal service classes
- queue names
- event payloads not declared as contracts
- log formats
- undocumented JSON fields
- storage paths
- feature-flag keys
- provider callback payloads

Third parties and future products must not depend on these unless TownBoss or the owning product explicitly promotes them to a supported contract.

## Request contracts

Supported request contracts should define, where applicable:
- method and route
- authentication requirements
- authorization scope
- tenancy/organization context
- required and optional fields
- validation constraints
- content type
- idempotency behavior
- pagination/filter/sort semantics
- locale/timezone semantics
- expected error classes
- rate-limit expectations

Server-side validation remains authoritative. Client-side validation is user experience, not a trust boundary.

## Response contracts

Responses should distinguish:
- resource data
- relationships or references
- pagination metadata
- warnings/degraded-state metadata when relevant
- errors

Response resources should avoid leaking:
- internal database structure
- hidden authorization state
- secrets or credentials
- unnecessary PII
- internal provider identifiers unless intentionally exposed
- moderation/security signals that would aid abuse

Serialization resources or explicit response DTOs are preferred over returning raw persistence models for supported interfaces.

## Error semantics

Supported APIs should use deterministic error categories. Exact product envelopes may differ, but consumers should be able to distinguish at least:
- validation failure
- authentication failure
- authorization failure
- not found / visibility filtered
- conflict / stale state
- rate limited
- dependency unavailable
- retryable server failure
- non-retryable business-rule rejection

Error payloads must not leak stack traces, SQL, secret material, provider credentials, private identifiers, or internal topology.

Authorization failures should not unnecessarily disclose existence of resources a caller cannot access.

## Authentication and authorization

Authentication establishes identity or client principal; it does not grant access to every interface.

Every protected resource requires explicit authorization appropriate to the resource and action. API classification does not bypass Authorization.

Publicly documented APIs may still require authentication, client registration, scopes, tenancy checks, consent, subscription/entitlement, or other policy gates.

Core invariant:

`authenticated != authorized != entitled`

## Tenancy

Tenant or organization context must not be inferred solely from client-provided identifiers without server-side membership/authorization validation.

Cross-tenant identifiers in requests must be treated as untrusted input.

Where a resource is tenant-scoped, serialization, lookup, filtering, mutation, events, cache keys, and async jobs must preserve the tenant boundary.

## Retry-sensitive mutations and idempotency

Important mutation interfaces such as checkout, payments/credits, bookings, reservations, invitations, verification actions, listings, withdrawals, external submissions, and other retry-sensitive operations should expose or internally enforce an idempotency contract.

An idempotency key:
- is scoped to an actor/client and operation domain
- cannot be reused with materially different payload semantics
- must return/reconcile the original outcome where appropriate
- does not bypass authorization or current-state validation

Transport retries must not create duplicate consequential side effects.

## Concurrency and conflicts

APIs modifying shared state should define conflict behavior where races are possible. Depending on domain requirements, mechanisms may include:
- transactional locking
- optimistic concurrency/version fields
- compare-and-set semantics
- unique constraints
- idempotency records
- reservation/hold semantics

A successful stale client request must not silently overwrite newer authoritative state where that would be consequential.

## Pagination, filtering, and sorting

Collection interfaces should use deterministic pagination and documented limits. Cursor pagination is preferred where datasets are volatile or large; offset pagination may be acceptable for bounded stable collections.

Filtering/sorting must:
- operate only on authorized/visible records
- avoid exposing hidden record existence through counts or timing where consequential
- use explicit supported fields
- define deterministic tie-breaking where stable traversal matters

Search & Discovery owns search semantics; ordinary API list filtering must not grow into an undocumented duplicate search system.

## API resources and serialization

Products should prefer deliberate response resources/DTOs instead of raw model serialization.

Benefits:
- stable external field names
- explicit visibility
- relationship control
- compatibility management
- reduced accidental PII exposure
- easier versioning

Persistence models remain implementation details unless explicitly declared otherwise.

## Internal capability interfaces

TownBoss capability contracts define semantics independent of transport.

Products implement thin adapters that map product domain state into capability contracts. Products must not fork capability semantics because local storage or framework details differ.

A future physical extraction from in-process module to service must preserve the canonical contract rather than force every consumer to adopt a new semantic model.

## External adapters

External provider/platform integrations should be isolated behind adapters that handle:
- provider authentication/credentials
- provider request/response schema
- retries and rate limits
- provider-specific errors
- webhooks/callbacks
- reconciliation identifiers
- provider version upgrades

Domain code should depend on normalized interfaces whenever practical.

Provider acceptance does not automatically mean domain success. For example:
- payment provider acceptance != order fulfillment
- government submission receipt != government approval
- message provider acceptance != user read
- calendar provider write != authoritative local booking validity

## Webhooks and callbacks

Inbound webhooks are untrusted external input until validated.

Requirements where applicable:
- signature/authentication verification
- replay resistance
- timestamp/nonce validation when provider supports it
- payload size limits
- schema validation
- duplicate tolerance
- out-of-order event tolerance
- correlation to known provider objects
- idempotent processing
- audit/observability

Webhook possession of an identifier is not authorization to mutate arbitrary internal state.

## Outbound public APIs

If TownBoss intentionally exposes APIs to third parties, those APIs require explicit governance before launch:
- consumer/use-case registration
- data classification and privacy review
- authentication/client identity
- scopes/permissions
- quotas/rate limits
- acceptable-use and abuse controls
- version/deprecation policy
- documentation
- support/incident path
- auditability

No current GlenTown route should be treated as a third-party public API merely because it can be called over HTTPS.

## Deprecation

Supported external/public interfaces require a deprecation path proportional to consumer impact.

A deprecation should define:
- replacement interface where applicable
- migration guidance
- announcement date
- end-of-support date
- removal date
- telemetry to identify remaining usage where privacy permits

Emergency retirement is allowed for active security or legal risk but must be documented and communicated where possible.

## Schema evolution

Schema evolution must distinguish:
- additive compatible change
- conditionally compatible change
- breaking change

Potentially breaking examples include:
- field removal/rename
- type change
- semantic meaning change
- narrowing accepted input
- changing default behavior materially
- new mandatory authorization requirement without migration path for a supported public contract
- changing currency/timezone/unit semantics

For internal interfaces, coordinated client/server rollout may permit faster change, but compatibility windows still matter for deployed mobile clients.

## Mobile-client compatibility

Mobile applications can remain installed after backend deployment. Therefore GlenTown and future mobile products should not assume every client updates simultaneously.

API changes should support a defined compatibility window, graceful handling of unknown fields, and explicit forced-upgrade policy only when required by security, correctness, or unsupported-old-client constraints.

## Security Baseline integration

All APIs inherit Security Baseline v1.

This includes:
- authentication and authorization
- tenancy isolation
- input validation
- rate limiting and abuse controls
- secrets management
- sensitive-data minimization
- upload/media security
- integration trust boundaries
- audit/logging discipline

API documentation never overrides security controls.

## AI Authority and Glen AI

Tool/API availability does not grant AI authority.

Glen AI may discover or call approved APIs only within Portfolio AI Authority and Authorization constraints.

A3 bounded execution must use explicitly allowed operations and exact scopes. AI cannot infer permission from the existence of an endpoint or tool.

Core invariant:

`tool access != permission != authority`

API schemas exposed to AI should minimize unnecessary sensitive fields and should clearly distinguish read/query operations from consequential mutations.

## Orchestration integration

Orchestration may coordinate capability/product APIs but does not redefine their domain semantics.

A successful HTTP response does not by itself prove task completion. Completion uses the owning domain's completion semantics and, where required, Evidence & Provenance.

## Evidence and provenance

API payloads that represent external/public/authoritative information should preserve source/provenance semantics where required by the owning capability.

A normalized API response does not erase the distinction between:
- first-party TownBoss records
- user-supplied data
- external provider state
- public/government source data
- derived/AI-generated output

## Audit and observability

Important API telemetry should support:
- request/correlation ID
- authenticated principal/client where appropriate
- route/interface identifier
- API version
- outcome/status class
- latency
- rate-limit decisions
- authorization denials in appropriate audit channels
- idempotency/replay decisions for consequential mutations
- external dependency correlation

Do not log secrets, full auth tokens, passwords, payment credentials, or unnecessary PII.

## Feature flags

Feature flags may control rollout of optional routes or behavior only when compatibility and safety permit.

Flags must not:
- bypass authorization
- silently change financial balances
- turn an internal interface into a supported public API
- remove mandatory security checks
- create incompatible response semantics for an established external contract without versioning/deprecation consideration

## Government and public-sector integrations

Government Service Interoperability uses external integration adapters. Government systems remain authoritative for government records and decisions.

TownBoss/GlenTown may expose product APIs that orchestrate or track a government-service task, but those APIs must not imply that TownBoss is the issuing authority.

## Public Data Gateway integration

Public Data Gateway owns ingestion/normalization/source-authority semantics for approved external/public data. Platform API Boundary governs how consumers interact with that capability and how external source adapters are isolated.

## Payments & Credits integration

Payment APIs must distinguish intent, attempt, confirmation, settlement/reconciliation, refunds, payouts, withdrawals, and credit-ledger effects according to Payments & Credits.

A generic `200 OK` or provider callback does not override canonical financial state semantics.

## Messaging and Notifications integration

Messaging and Notifications may expose product APIs, but transport/provider details must remain behind capability/provider adapters where applicable.

Notification delivery endpoints do not establish message truth; messaging endpoints do not establish transaction truth.

## Implementation truth: GlenTown

Current GlenTown-API master demonstrates several useful boundary patterns:
- API routes are explicitly prefixed with `v1`
- controllers are namespaced under `Api\\V1`
- routes are separated into unauthenticated, optionally authenticated, and `auth:sanctum` protected groups
- named throttles exist on several sensitive routes
- signed middleware is used for email verification
- Laravel Sanctum is the current authentication mechanism
- domain policies exist across numerous resources
- explicit `app/Http/Resources` serializers exist across many domains
- server-side request classes/validation are used across the application

These are real implemented patterns.

Current inspection did not establish:
- a separately governed third-party public API program
- OAuth2 client/scopes for external developers
- a developer portal
- an OpenAPI contract treated as canonical
- a generic webhook framework
- a generic external integration SDK
- a centralized API gateway product
- physical service extraction for TownBoss capabilities

Therefore Platform API Boundary v1 is a canonical architecture and governance contract. It does not relabel every existing GlenTown `v1` route as a public third-party API, and it does not require new pre-Beta infrastructure.

## Non-goals

Platform API Boundary v1 does not:
- require microservices
- require an API gateway vendor
- require GraphQL
- mandate REST for every capability
- mandate one pagination method for every bounded collection
- expose existing internal routes to third parties
- replace Authorization or Security Baseline
- make provider APIs authoritative for TownBoss domain state
- create a public developer program before product need exists
- introduce new GlenTown Beta features
