# Public Data Gateway v1

Status: canonical-design-v1  
Classification: Platform Core  
Current canonical home: TownBoss  
Initial consumer: GlenTown  
Future consumers: TownTraveler, GeoPlotter, RealWise, TownDeveloper, Glen AI

## Purpose

Public Data Gateway is the shared TownBoss boundary for acquiring, normalizing, caching, attributing, validating, and serving data from public, government, institutional, civic, open-data, and other approved external sources without pretending that TownBoss owns the underlying authoritative record.

Core rule:

`ingested data != authoritative source != verified current truth`

A successful fetch, cached copy, transformed record, AI summary, or locally persisted projection does not transfer authority from the source system to TownBoss.

## Capability-company rule

TownBoss owns the reusable source-adapter, normalization, freshness, provenance, cache, reconciliation, and serving contract. Product domains define which external datasets they need and how those datasets affect product-specific behavior.

Logical boundary comes before physical extraction. GlenTown may remain the first proving ground. This contract does not require a new microservice, vendor, data lake, paid feed, or Beta feature.

## Scope

The gateway is intended for sources such as:

- government open-data APIs and downloadable datasets
- LGU and national-agency feeds
- weather, hazard, transport, geospatial, public-event, tourism, demographic, and civic data
- eGovPH/eGovDX/eLGU integration metadata where applicable
- public registries where terms and access rules permit
- standards-based feeds such as GTFS or similar future transit datasets
- approved external institutional APIs
- manually imported authoritative/public datasets when APIs are unavailable

It is not a generic web scraper and does not authorize bypassing access controls, contractual restrictions, privacy rules, or source terms.

## Core entities

### Data Source
An attributable external origin with source identity, owner/operator, authority class, terms, access method, expected update cadence, jurisdiction/scope, and reliability metadata.

### Source Adapter
A bounded integration component that understands one source protocol or dataset and converts source-native records into a canonical ingestion envelope.

### Source Record Reference
A stable reference to the source-native record, object, observation, file, endpoint response, or dataset row where available.

### Ingestion Run
An attributable attempt to fetch or import data, including source, time, request parameters, response metadata, success/failure, checkpoint/cursor, and reconciliation result.

### Canonical Data Envelope
The shared metadata wrapper around normalized payloads. It carries source identity, source record key, observed/effective/recorded timestamps, jurisdiction, freshness metadata, provenance, confidence where applicable, and transformation version.

### Derived Projection
A product- or capability-specific representation built from ingested source data. It is not the authoritative source record.

### Freshness Policy
Rules defining expected source cadence, stale thresholds, expiry, revalidation, and how stale/unknown data must be presented or blocked.

### Reconciliation Record
A record describing differences between local projections and newly observed source state, including supersession, correction, deletion, missing records, or conflict.

## Source classification

Every source should declare an authority class, for example:

- `authoritative-government`
- `authoritative-institutional`
- `official-publisher`
- `trusted-partner`
- `open-community-dataset`
- `commercial-provider`
- `manual-import`
- `derived-third-party`

Authority class informs presentation and downstream policy, but classification alone does not guarantee freshness, completeness, or correctness.

## Authority and source-of-truth

Where an agency, LGU, registry, transport operator, weather authority, mapping authority, or other external system is the authoritative system, TownBoss must preserve that boundary.

The gateway may:

- retrieve
- normalize
- cache
- index
- compare
- preflight
- explain
- link
- reconcile
- expose freshness and source attribution

The gateway must not silently convert a local copy into an authoritative decision or record.

For government-service workflows, authoritative application, eligibility, approval, identity, license, permit, tax, benefit, or registry state remains with the responsible government system.

## Government Service Interoperability

Public Data Gateway complements, but does not replace, Government Service Interoperability.

Government-service adapters may use eGovPH, eGovDX, eLGU, agency APIs, LGU APIs, or future approved interfaces. The gateway may provide reference data and normalized public records used for preflight, explanation, routing, or context.

Consequential government transactions remain governed by Authorization, AI Authority, Orchestration, and the authoritative external service.

`public government data != government transaction authority`

## Ingestion contract

Each adapter should define:

- source identifier
- source owner/operator
- endpoint/file/feed identity
- authentication requirements where permitted
- source terms/license
- request limits
- pagination/cursor semantics
- retry policy
- timeout policy
- expected cadence
- source timezone
- source schema/version
- source record identifier strategy
- incremental/full refresh behavior
- deletion/tombstone behavior
- rate-limit handling
- provenance mapping
- data-quality checks

Adapters must not hide unsupported or ambiguous source semantics behind a falsely uniform model.

## Normalization

Normalization should preserve meaning rather than merely rename fields.

Canonical transformations should retain:

- original source identifier
- source-native key
- original or attributable source payload reference where policy permits
- transformation version
- unit and coordinate-system transformations
- timezone conversion
- enumeration mapping
- null/unknown distinction
- jurisdiction/scope
- effective date
- observed date
- recorded/ingested date

Unknown, unavailable, not-applicable, and zero/false values must not be conflated.

## Provenance

Important external data should integrate with Evidence & Provenance.

At minimum, downstream consumers should be able to determine:

- where the data came from
- when it was observed or fetched
- when the source says it became effective, when applicable
- which adapter/transformation produced the local representation
- whether it has been superseded
- whether the source is authoritative for the specific claim

For consequential decisions, source citation and freshness must remain available to the decision path.

## Freshness and staleness

Every time-sensitive dataset must define freshness semantics.

Possible states include:

- `fresh`
- `aging`
- `stale`
- `expired`
- `unknown`
- `source-unavailable`

A cached response may be served after source failure only when product policy permits it. The user-facing surface must not imply current truth when freshness is materially uncertain.

Hard-gated workflows must fail closed when required authoritative data is stale or unavailable unless the owning domain explicitly defines a safe alternative.

## Caching

Caching is permitted for availability, resilience, latency, and rate-limit protection.

Cache entries should preserve:

- source identity
- fetch timestamp
- source effective timestamp where present
- expiry/freshness class
- ETag/version/hash where available
- transformation version
- jurisdiction/scope

Cache TTL is not equivalent to source validity. A record can remain technically cached while being too stale for a consequential decision.

## Reconciliation and supersession

When newly fetched data conflicts with a prior projection, the gateway should preserve enough history to explain the change.

Reconciliation classes may include:

- unchanged
- updated
- newly-observed
- removed-at-source
- superseded
- source-corrected
- locally-invalidated
- conflict-unresolved

Products should not silently preserve an old value merely because a new source value is inconvenient.

## Data quality

Adapters should support checks such as:

- schema validity
- required fields
- range and unit validation
- coordinate sanity
- duplicate detection
- chronology consistency
- jurisdiction consistency
- referential integrity where possible
- suspicious mass-change detection

A validation pass means the payload satisfies declared technical/data-quality checks. It does not prove the source itself is factually correct.

## Failure semantics

Failures should be typed rather than collapsed into generic unavailable states.

Examples:

- source-timeout
- source-auth-failed
- source-rate-limited
- source-schema-changed
- source-record-invalid
- source-partial-response
- source-unavailable
- source-data-stale
- transform-failed
- reconciliation-conflict
- license-or-policy-block

Partial ingestion must not be presented as complete coverage unless explicitly identified as partial.

## Idempotency and checkpoints

Ingestion runs should be restartable and duplicate-safe.

Where supported, adapters should use source cursors, timestamps, stable record IDs, hashes, or checkpoints. Replaying an ingestion should not create duplicate logical records.

Checkpoint advancement must occur only after the corresponding records are durably accepted or otherwise reconciled according to adapter policy.

## External rate limits

The gateway should centrally expose rate-limit awareness to adapters. Backoff, retry, and caching strategies must respect source requirements.

Rate-limit pressure must not encourage uncontrolled scraping, credential sharing, or circumvention of provider restrictions.

## Privacy and personal data

Public accessibility does not automatically make all data appropriate for unrestricted replication, aggregation, profiling, or AI use.

Adapters must account for:

- source terms
- applicable privacy law
- personal-data minimization
- sensitive personal information
- children/minors
- retention
- purpose limitation
- redisclosure restrictions
- right to correction/deletion where applicable

The gateway should avoid building unnecessary persistent copies of personal data merely because a source endpoint exposes it.

## Security

Source credentials and API keys must be stored through approved secret-management mechanisms and never embedded in product payloads, logs, repositories, or AI prompts.

Adapters must validate remote responses defensively. External data is untrusted input even when the provider is authoritative.

Where URLs or downloadable files are supplied by sources, downstream fetches must protect against SSRF, malicious files, path manipulation, decompression bombs, and unexpected content types.

## Search & Discovery

Search & Discovery may index normalized public-data projections only when the product has a legitimate discovery use case.

Search indexes remain derived projections. They must preserve source attribution/freshness where material and must not convert ranking into authority or endorsement.

## Location & Geography

Geographic public datasets should integrate through the Location & Geography or Spatial Intelligence boundaries where appropriate.

The gateway owns ingestion/provenance/freshness semantics, not canonical parcel geometry, routing, terrain, hazard analysis, administrative geography truth, or spatial computation.

Coordinate reference systems, geometry precision, source scale, and effective dates should be preserved when material.

## Transit Data Interoperability

Future transport feeds may enter through this gateway or a dedicated transport adapter layer while preserving the approved multi-source model:

- GlenTown-native driver/operator telemetry
- operator fleet APIs
- LGU/public transit feeds
- dedicated vehicle GPS hardware
- routes/schedules/status fallbacks

Telemetry freshness and source identity must remain explicit. Estimated or inferred positions must not be presented as authoritative live telemetry.

## Weather, hazards, and emergency data

Weather, hazard, and emergency/public-alert datasets require especially strict source, freshness, jurisdiction, and severity semantics.

TownBoss must distinguish:

- official alert issued by an authoritative source
- normalized local representation
- AI explanation or summary
- user-generated report
- inferred risk

An AI summary must not alter official severity, affected area, timing, or instructions.

## Glen AI

Glen AI may explain, summarize, compare, or retrieve authorized public data through approved gateway interfaces.

AI must receive source and freshness context sufficient to avoid presenting stale or derived information as current authoritative fact.

AI cannot:

- manufacture missing source records
- silently merge contradictory sources into false certainty
- upgrade a community/third-party source into government authority
- bypass source access restrictions
- autonomously perform consequential external transactions merely because related public data is available

## Orchestration Engine

Orchestration may use gateway outputs as requirements or validation inputs.

Time-sensitive requirements must be revalidated when freshness matters. A previously fetched value does not remain valid indefinitely.

For consequential execution, orchestration must distinguish:

- source data available
- source data fresh enough
- source data authoritative for the claim
- domain rule satisfied
- authorization present
- AI authority sufficient
- external transaction successfully completed

No one state implies the others.

## Constraint Engine and Scenario Engine

Public data may parameterize constraints or scenarios. The gateway supplies attributable inputs; it does not author domain constraints or make scenario outcomes authoritative.

Scenario outputs should retain the source version/date of important public-data inputs so analyses can be reproduced and compared later.

## Notifications

The gateway may emit data-change or source-health events. Notifications owns recipient/channel delivery.

A source update should not automatically notify every user; product policy determines relevance, location scope, urgency, user preference, and whether authoritative alert rules override ordinary preferences.

## Audit & Observability

Important events include:

- ingestion-started
- ingestion-completed
- ingestion-failed
- source-rate-limited
- source-schema-changed
- record-rejected
- record-superseded
- reconciliation-conflict
- freshness-expired
- source-credential-error
- source-policy-disabled

Operational metrics may include latency, success rate, stale-record count, source age, records processed, rejected records, retry count, checkpoint lag, schema drift, and reconciliation backlog.

Observability must not leak source credentials, sensitive personal data, or unrestricted raw payloads.

## Feature Flags

Feature Flags may control adapter rollout, dataset exposure, new transformation versions, or provider fallback.

A flag cannot make an unauthorized source permissible, override privacy/security rules, or make stale/unverified data authoritative.

## Product adapter responsibilities

Each consumer defines:

- datasets required
- legitimate purpose
- source priority/fallback policy
- authority requirements
- freshness thresholds
- jurisdiction rules
- product-specific normalization mappings
- data-quality gates
- retention
- user-visible attribution
- conflict presentation
- consequential-use policy
- cache tolerance
- source outage behavior

## Current GlenTown implementation truth

Current GlenTown-API inspection found no verified generic Public Data Gateway runtime, no generic external-source adapter framework, and no direct `Http::` or Guzzle integration surfaced by repository search on current `master`.

GlenTown does contain domain models and services that will eventually consume external/public data, and TownBoss has approved Government Service Interoperability and Transit Data Interoperability directions. These architectural directions are not implementation evidence for a centralized gateway.

Therefore Public Data Gateway is `canonical-design-v1` with `logical-boundary-defined` extraction status.

## Non-goals

Public Data Gateway v1 does not:

- create a new microservice
- mandate a vendor or data platform
- implement PAGASA, PSA, eGovPH, eGovDX, eLGU, GTFS, or any specific provider integration
- scrape websites by default
- bypass source terms or access controls
- own government authority
- own professional authority
- own domain business rules
- own Search & Discovery ranking
- own spatial analysis
- own AI authority
- turn cached or normalized data into authoritative truth
- add unnecessary pre-Beta integration work
