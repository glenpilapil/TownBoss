# TownBoss Adapter Roadmap v1

Status: canonical-roadmap-v1  
Classification: portfolio architecture / implementation planning  
Canonical home: TownBoss  

## Purpose

This roadmap defines when TownBoss products should implement adapters to canonical capabilities, external systems, providers, and shared services.

It is deliberately implementation-led. It does **not** instruct teams to build every conceivable adapter now.

Core rule:

`canonical capability != required physical adapter today`

An adapter should exist only when a real product behavior, external dependency, or reuse boundary requires it and the relevant contract is stable enough to enforce.

## Portfolio rule

TownBoss owns canonical capability contracts. Products implement thin adapters where real behavior exists. External providers and authoritative systems remain behind explicit integration boundaries.

Adapters must not:

- fork or redefine canonical capability semantics
- silently transfer authority from an external system into TownBoss
- turn provider-specific behavior into portfolio-wide policy
- bypass Authorization, AI Authority, Security Baseline, Reliability, Evidence & Provenance, or Audit & Observability
- create a new microservice merely because an architecture boundary exists
- be built solely to make the architecture appear more complete

## Adapter classes

### 1. Product-to-capability adapter

Maps product-specific behavior into a TownBoss canonical capability contract.

Examples:

- GlenTown AI actions -> Portfolio AI Authority Model
- CodeBisor supervisor actions -> Portfolio AI Authority Model
- future GeoPlotter geospatial runtime -> Spatial Intelligence Core
- future GlenTown planner behavior -> shared Orchestration/Scheduling contracts where reuse becomes real

### 2. Provider adapter

Encapsulates a replaceable commercial or technical provider behind a canonical capability.

Examples may eventually include:

- AI model providers
- payment providers
- notification delivery providers
- search/index providers
- feature-flag/experimentation providers
- storage/media providers
- mapping/geocoding providers

Provider adoption is not implied by this roadmap. A provider must independently pass security, privacy/legal/compliance, cost, reliability, authority/provenance, and architecture evaluation.

### 3. Authoritative external-system adapter

Integrates a source that remains authoritative outside TownBoss.

Examples:

- eGovPH / eGovDX / eLGU
- agency or LGU systems
- PAGASA or other official weather/hazard sources
- PSA or official demographic/public datasets
- transport operator/LGU feeds
- public registries where permitted

These adapters preserve source authority, source identity, freshness, provenance, and reconciliation semantics.

### 4. Product-to-product adapter

Used only when one product legitimately consumes another product's capability without ownership transfer.

If repeated product-to-product integration becomes broadly reusable, extract a shared TownBoss contract rather than creating a mesh of private dependencies.

## Adapter lifecycle

Every adapter should move through explicit states:

1. `candidate` — need identified; no architectural approval implied.
2. `evaluating` — provider/source/product boundary is being assessed.
3. `approved` — architecture and governance gates passed; implementation may proceed when product priority permits.
4. `implemented` — code exists behind the intended boundary.
5. `verified` — contract, security, reliability, authority, and failure behavior have been tested against the actual integration.
6. `deprecated` — no new consumers; migration/removal plan exists.
7. `retired` — adapter is no longer active.

`approved != implemented != verified`

## Entry gates

An adapter should not be implemented unless all applicable questions have answers:

- Which product behavior requires it now?
- Which canonical TownBoss capability owns the contract?
- Is the dependency internal, provider-backed, or authoritative external?
- What system remains source of truth?
- What permissions and tenant context are required?
- What AI authority level applies, if AI is involved?
- What important mutations require idempotency, retry, reconciliation, or outbox semantics?
- What provenance and freshness must be preserved?
- What data classifications and privacy restrictions apply?
- What failure states must fail closed versus degrade gracefully?
- What operational signals, audit events, metrics, and alerts are required?
- Can the adapter be disabled or replaced without corrupting canonical state?
- Are provider terms, cost, quotas, rate limits, and exit constraints understood?

## Verification gates

Before an adapter is classified `verified`, evidence should cover the applicable subset of:

- contract conformance tests
- authentication and authorization tests
- tenant-boundary tests
- request/response validation
- timeout, retry, rate-limit, and unknown-outcome handling
- idempotency and duplicate suppression for consequential writes
- webhook signature and replay protection where applicable
- source freshness/provenance preservation
- data-loss and partial-response behavior
- reconciliation after temporary provider/source failure
- secrets handling and logging redaction
- PII/privacy controls
- audit and observability events
- disable/kill-switch behavior
- provider/source schema-change handling
- fallback behavior without false authority claims

## Current implementation truth

The implementation-truth audit establishes that no canonical TownBoss capability has yet been physically extracted into a shared portfolio runtime.

Verified adapter-style enforcement currently includes:

- GlenTown-API -> AI Authority Model v2 through `AiAuthorityGate`
- CodeBisor -> AI Authority Model v2 through its thin authority adapter/policy

Product-local patterns also exist in GlenTown for scheduling/orchestration and reliability semantics, but these are not yet shared adapters to a physically extracted engine.

GeoPlotter currently has a geospatial FastAPI service boundary, but the audited main branch exposes only health behavior; this is not yet a Spatial Intelligence adapter implementation.

## Roadmap priority model

The roadmap is trigger-based rather than calendar-based.

Priority is determined by:

1. active product delivery need
2. consequential risk reduction
3. reuse evidence across products
4. external dependency or partnership readiness
5. cost of delaying the adapter
6. operational maturity required for Beta/production

An adapter with no active trigger remains deferred even if architecturally attractive.

## Wave 0 — preserve existing verified thin adapters

### AI Authority adapters

**State:** implemented / verified at thin-enforcement level  
**Products:** GlenTown-API, CodeBisor  

Maintain these as thin mappings to the canonical AI Authority Model. Do not let either product redefine A0-A4 semantics locally.

Next work is only required when new AI-enabled consequential operations are introduced.

## Wave 1 — GlenTown Beta implementation adapters

These are the highest-priority adapter families **only when corresponding GlenTown Beta behavior is physically implemented or being prepared for release**.

### Messaging

**Trigger:** real backend messaging/conversation implementation begins.  
**Adapter target:** Messaging v1.  
**Current status:** no backend messaging runtime verified.

Do not build provider/channel adapters before the core conversation/message runtime exists.

### Notifications

**Trigger:** real server-side notification delivery/preferences/deduplication behavior begins.  
**Adapter target:** Notifications v1.  
**Current status:** client surface exists; dedicated backend runtime not verified.

Provider-specific push/email/SMS adapters follow only after canonical notification intent and delivery-state behavior is implemented.

### Reviews & Reputation

**Trigger:** Review/Rating backend begins.  
**Adapter target:** Reviews & Reputation v1.  
**Current status:** no dedicated backend runtime verified.

Search ranking and AI summaries must consume reputation as a governed signal rather than inventing their own rating semantics.

### Search & Discovery

**Trigger:** GlenTown moves beyond simple domain-local queries into cross-domain discovery, indexing, ranking, or provider-backed search.  
**Adapter target:** Search & Discovery v1.

Do not adopt a search vendor until product requirements justify it.

### Media

**Trigger:** sensitive/private media, signed access, processing variants, scanning, or reuse across multiple domains requires a common media boundary.  
**Adapter target:** Media v1.  
**Current status:** partial product media behavior exists.

Extraction should be incremental; existing local media behavior need not be rewritten merely for purity.

### Payments & Credits

**Trigger:** external payment provider, wallet/credit ledger, refund, payout, withdrawal, or automated top-up behavior becomes real.  
**Adapter target:** Payments & Credits v1.  
**Current status:** partial order/payment-status behavior and manual-credit direction only.

A provider adapter must preserve the distinction between intent, provider acceptance, confirmation, settlement, and reconciliation.

### Scheduling & Orchestration

**Trigger:** planner/booking behavior becomes shared across two or more domains or needs a single resource calendar/execution lifecycle.  
**Adapter targets:** Scheduling v1 and Orchestration Engine v1.  
**Current status:** useful Travel-domain patterns exist.

Prefer adapting proven Travel behavior into the canonical contracts over rewriting it prematurely.

### Glen AI Foundation

**Trigger:** GlenTown adds a real assistant runtime with skill routing, model invocation, grounding, context assembly, or action proposals.  
**Adapter targets:** Glen AI Foundation v1 + AI Authority v2 + Authorization + Audit/Observability.

Model-provider adapters belong behind the Glen AI Foundation and must never become the authority boundary themselves.

## Wave 2 — official public/government data and interoperability

These adapters become eligible when an approved source, official API, partnership, or concrete product use case is available.

### PAGASA / weather / hazard data

**Trigger:** approved official access or a reliable authorized source plus a GlenTown feature requiring official weather/hazard data.  
**Adapter target:** Public Data Gateway v1.

Preserve official source, observation/effective time, severity, jurisdiction, freshness, and attribution.

### PSA / official demographic or public datasets

**Trigger:** approved lawful dataset access and concrete product requirement.  
**Adapter target:** Public Data Gateway v1.

Do not replicate personal records merely because data is publicly accessible.

### eGovPH / eGovDX / eLGU / agency or LGU systems

**Trigger:** post-Beta partnership, supported API, or formal integration opportunity.  
**Adapter targets:** Public Data Gateway for reference/public data; Orchestration + API Boundary + Authorization + AI Authority for consequential service flows.

TownBoss may preflight, explain, route, link, submit when authorized, track, and reconcile. Government systems remain authoritative.

### Transit data

**Trigger:** real transport telemetry/feed source is available.  
**Sources may include:** GlenTown-native driver/operator GPS, operator fleet APIs, LGU/public feeds, dedicated vehicle GPS hardware, or schedule/route fallback.

Live telemetry, estimated positions, scheduled service, and stale data must remain distinguishable.

## Wave 3 — GeoPlotter / Spatial Intelligence proving adapters

### GeoPlotter -> Spatial Intelligence Core

**Trigger:** GeoPlotter main gains material deterministic GIS, parcel geometry, terrain, hazard, OCR/CV, imagery, or related spatial runtime beyond the current health scaffold.  
**Current status:** scaffold-only on audited main.

When triggered:

- map real GeoPlotter behaviors to Spatial Intelligence contracts
- preserve CRS, units, source, observation date, transformation lineage, and uncertainty
- integrate Evidence & Provenance where claims matter
- integrate Constraint Engine only for explicit constraints
- do not present computed geometry or hazard inference as professional/government authority

### GeoPlotter parcel technical-description interpretation

**Trigger:** actual parcel-bearing/distance interpretation runtime is implemented.  
**Adapter target:** product-specific parcel capability first; promote shared spatial components only when reuse evidence exists.

Do not extract speculative reusable libraries before the real parser/geometry workflow is proven.

## Wave 4 — RealWise and TownTraveler adapters

These remain deferred until their physical product runtimes exist and expose actual integration needs.

### RealWise

Likely future adapter areas include Identity/Tenancy, Search, Messaging, Reviews, Scheduling, Payments, Evidence, Spatial Intelligence, and GeoPlotter usage. Actual adapters must follow repository evidence rather than this prediction.

RealWise's preferential GeoPlotter usage arrangement does not transfer GeoPlotter/TownBoss capability ownership into RealWise.

### TownTraveler

Likely future adapter areas include shared Places/Experiences/Stays/Events/Food discovery, Scheduling, Orchestration, Messaging, Payments, Reviews, and Glen AI. The first implementation should consume existing canonical contracts rather than fork them.

## Wave 5 — later portfolio products

TownDeveloper, Forex Quant Lab, and future products should adopt shared capabilities only when their real behavior reaches the boundary. No adapters should be created merely because the products are listed as future consumers.

## Provider-specific candidates

The following are architecture candidates, not automatic dependencies:

- GrowthBook for feature flags/experimentation
- external AI model providers for Glen AI
- payment processors/wallet providers
- push/email/SMS delivery providers
- search/index providers
- object storage/media-processing providers
- mapping/geocoding providers

Each provider requires separate approval. Approved upstream/reference repositories and API-discovery lists may identify candidates but do not make them production dependencies.

## Adapter ownership

Every implemented adapter must name:

- canonical owning capability
- product consumer
- external provider/source, if any
- source of truth
- code owner/team
- configuration owner
- secrets owner
- operational owner
- deprecation owner

Ownership ambiguity is a release risk for consequential integrations.

## Anti-corruption boundary

Adapters are anti-corruption layers. Provider/source-specific fields, states, errors, and quirks should be translated at the boundary rather than leaking throughout product code.

However, normalization must not erase meaningful distinctions. Unknown, stale, partial, pending, failed, rejected, confirmed, settled, and authoritative states must remain semantically distinct where they matter.

## Migration and replacement

A provider adapter should be replaceable without rewriting canonical domain semantics.

Replacement plans should account for:

- identifier mapping
- dual-read/dual-write risks where applicable
- pending operations
- webhook overlap
- reconciliation
- historical provenance
- cached projections
- rollback
- user-visible continuity

Provider portability is a design goal, not a reason to over-engineer multiple providers before one is needed.

## Relationship to Feature Flags

Feature flags may control adapter rollout, provider migration, geographic/cohort exposure, fallback activation, or kill switches.

Feature flags must not override Authorization, AI Authority, privacy, security, source rights, government authority, professional authority, or financial reconciliation requirements.

## Relationship to implementation truth

`capabilities/IMPLEMENTATION_TRUTH_MATRIX.yaml` is the authoritative portfolio snapshot for what is physically implemented at a given audit point.

This roadmap describes **what should be implemented next when triggers occur**.

If roadmap intent and implementation truth differ, implementation truth wins for statements about current behavior.

## Completion criteria for this roadmap

This roadmap is complete when:

- adapter classes and lifecycle are explicit
- implementation/verification gates are defined
- current verified adapters are recorded
- near-term GlenTown adapter triggers are prioritized
- government/public-data/transit adapters remain authority-safe and trigger-based
- GeoPlotter extraction remains evidence-driven
- later-product adapters remain deferred until real runtime evidence exists
- provider candidates are not misrepresented as dependencies

The next architecture step after this roadmap is the **Final TownBoss Architecture Baseline v1**.
