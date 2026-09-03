# TownBoss Search & Discovery v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Search & Discovery is the shared TownBoss capability for locating, filtering, ranking, and presenting eligible domain entities across products without becoming the source of truth for those entities or bypassing authorization, publication state, moderation, geography, entitlement, consent, or other domain constraints.

It provides a reusable contract for query interpretation, filters, facets, location-aware discovery, ranking, result grouping, pagination, indexing boundaries, and explainable result provenance while leaving domain ownership with the source capability.

## Core rule

`discoverable != authorized != endorsed != authoritative`

A result appearing in search means only that it was eligible for the current discovery context. Search must not imply professional endorsement, government approval, verified quality, legal eligibility, inventory/availability, or permission to transact unless those facts are separately supplied by the owning domain.

## Architectural posture

TownBoss owns canonical semantics. Products may implement discovery directly against relational storage, a search engine, vector retrieval, geospatial index, external provider, or a combination. The contract is provider-neutral.

Physical centralization is deferred. Current evidence supports a shared logical boundary because GlenTown already has product-specific discovery code, location-scoped discovery behavior, and multiple public/listing index surfaces, but there is no shared portfolio search runtime yet.

## Core entities

### Search Request
A normalized request containing query text where applicable, target domains/types, filters, sort/ranking policy, geographic context, pagination/cursor, locale, and authorized personalization context.

### Discovery Context
The bounded context used to decide eligibility and ranking, including product, user/anonymous state, location context, organization/tenant, feature exposure, locale, device/context needs, and domain-specific constraints.

### Searchable Entity Reference
A stable reference to an entity owned by a domain capability. Search may store indexed projections but does not own the authoritative entity.

### Search Document / Projection
A denormalized, provider-specific representation derived from authoritative source data for retrieval. It must be rebuildable and attributable to its source entity/version where practical.

### Filter / Facet
A structured restriction or aggregation over approved fields such as category, type, price band, status, geography, date, availability indicator, or other domain-approved dimensions.

### Ranking Signal
A bounded input to result ordering. Signals may include text relevance, recency, geographic proximity, quality/reputation indicators, popularity, availability, personalization, sponsored status, or product-specific business rules.

### Search Result
An attributable result containing entity reference, result type, display projection, ranking metadata where appropriate, and source/freshness information required by the consumer.

### Result Group
A grouping across result types/domains, such as products, services, places, events, food, jobs, properties, people/organizations where policy permits, or AI-grounding sources.

## Ownership boundaries

Search & Discovery owns:

- query normalization contract;
- cross-domain result envelope;
- filter/facet semantics;
- pagination/cursor semantics;
- ranking-policy interface;
- search-index/projection lifecycle contract;
- indexing freshness/rebuild expectations;
- location-aware discovery interface;
- search observability hooks;
- result-attribution/provenance interface;
- safe personalization inputs;
- fallback behavior when an index/provider is unavailable.

It does **not** own:

- source business records;
- publication/moderation state;
- authorization policy;
- entitlements;
- inventory or booking availability truth;
- payments/checkout state;
- professional verification;
- government authority;
- reviews/reputation source records;
- location source-of-truth;
- AI Authority;
- evidence truth;
- advertising billing;
- product-specific ranking policy authorship.

## Eligibility before ranking

Search must determine what is eligible before ranking it. Ineligible records must not be rescued by high relevance or popularity.

Eligibility may depend on publication state, soft-delete/archive state, moderation, tenancy, privacy/visibility, geography, product activation, feature flags, consent, age/safety restrictions, inventory/availability rules where required, and authorization.

Where access itself is sensitive, filtering must occur before information that would reveal the protected entity is returned.

## Location-aware discovery

Location is a first-class discovery dimension for TownBoss products.

The shared interface should support town/city/municipality, province, national scope, proximity where coordinates are appropriate, and product-defined fallback expansion.

Search does not redefine the canonical Location & Geography model. It consumes geographic entity identifiers and location context from that capability.

GlenTown's existing `LocationScopedDiscovery` and product-specific `ProductDiscovery` are implementation evidence for this boundary, not the final shared runtime.

## Query types

The capability should support:

- browse/discovery without free text;
- exact/structured lookup;
- keyword/full-text search;
- faceted filtering;
- geospatial/proximity discovery;
- category/type exploration;
- personalized ranking where approved;
- semantic/vector retrieval where justified;
- federated multi-domain search;
- external authoritative-directory lookup through adapters where permitted.

Not every product must implement every query type.

## Ranking

Ranking must be explicit enough to audit and evolve safely. Product domains may define their own weighting, but the platform should distinguish at least:

- eligibility gates;
- organic relevance signals;
- personalization signals;
- business-rule boosts;
- sponsored/paid placement;
- deterministic tie-breaking.

Sponsored results must be distinguishable from organic ranking when surfaced to users. Paid placement must not imply verification or authority.

Ranking changes may be feature-flagged or experimentally evaluated through Feature Flags & Experimentation, with guardrails and evidence.

## Personalization

Personalization may use only authorized, purpose-limited context. Prefer coarse preferences and bounded behavioral signals over unrestricted profile reconstruction.

Sensitive personal data should not be used as a ranking signal merely because it is technically available. Anonymous users should receive a sensible non-personalized fallback.

Users should not lose access to materially relevant results solely because a recommender inferred the wrong preference; browse/filter paths should remain available where practical.

## Search versus recommendation

Search is intent-led retrieval. Recommendation may be system-led suggestion. They can share ranking/index infrastructure but should remain semantically distinct because recommendation may require different consent, explanation, feedback, and experimentation rules.

This v1 contract covers discovery surfaces that combine both only at the interface/boundary level; it does not define a full recommendation-learning platform.

## Indexing

Search indexes are derived projections, not authoritative records.

Required principles:

- rebuildable from source-of-truth systems;
- source entity/type/version or updated-at attribution where practical;
- deletion/unpublication/moderation changes propagate promptly according to risk;
- retry/idempotency for indexing events;
- eventual-consistency state must be understood by consumers;
- stale protected data must not remain discoverable after its source becomes ineligible;
- reindex/migration paths must be operationally observable.

A transactional outbox/event approach is preferred for important asynchronous index updates where the source product supports it.

## Freshness

Freshness requirements vary by domain. Static places data can tolerate different lag from inventory, food availability, event status, property listing state, or urgent safety information.

Consumers must not infer real-time availability from a search index unless the domain explicitly guarantees that freshness. Transactional workflows should revalidate critical state against the owning domain before consequential action.

## Pagination and stability

The contract supports page-based or cursor-based pagination. Large/high-churn result sets should prefer stable cursors where practical.

Pagination must define deterministic ordering/tie-breaking sufficiently to reduce duplicates and omissions across requests. Consumers should tolerate benign changes caused by concurrent source updates.

## Federated search

A cross-domain search surface may query multiple indexes/providers and merge result groups. Federation must preserve source type, eligibility rules, attribution, and domain-specific ranking boundaries.

A global rank across unlike entity classes should be introduced only when the product can define defensible comparison semantics; otherwise grouped results are preferable.

## AI and Glen AI

Glen AI may use Search & Discovery to locate candidate context, records, places, services, listings, or evidence sources.

Retrieved content is data, not authority. Search ranking must not be treated as evidence quality, professional verification, government authority, or permission to act.

Glen AI context assembly must still apply authorization, grounding, evidence/provenance, privacy, AI Authority, and prompt-injection resistance after retrieval.

Semantic/vector retrieval may assist recall, but consequential outputs should preserve source references and should not rely on embedding similarity as proof of truth.

## Safety and moderation

Search must respect domain moderation, visibility, age/safety, and blocking rules. Known blocked/hidden content should not be reintroduced through alternate search indexes.

Safety-sensitive queries may require product-specific handling, but Search & Discovery does not itself become the moderation-policy owner.

## External sources

Government platforms, operator directories, maps, travel providers, or other external systems may be searched through adapters where legally/technically permitted.

External search results must retain source attribution and should not be copied into TownBoss as authoritative records without a separate ingestion/provenance policy.

## Privacy and security

Search endpoints can leak data through enumeration, counts, facets, autocomplete, or timing even when result payloads appear harmless. Authorization/visibility rules therefore apply to result counts and facets when those could disclose protected information.

Do not index raw secrets, credentials, private message bodies, unrestricted documents, or sensitive PII unless the product has an explicit search use case and appropriate protections.

Query logs should minimize PII and sensitive free-text retention. Retention and access should follow Audit & Observability/privacy policy.

## Abuse controls

Products should define rate limits and anti-enumeration controls for high-value or sensitive search surfaces. Autocomplete/suggest endpoints require the same visibility discipline as normal results.

## Observability

Search operations should support visibility into:

- query volume and latency;
- zero-result rate;
- provider/index errors;
- stale-index or indexing lag;
- result-type distribution;
- filter/facet usage;
- click/selection signals where privacy permits;
- authorization/eligibility filtering failures;
- reindex jobs and failures;
- ranking/experiment versions where relevant.

Operational telemetry is not a substitute for source-record audit.

## Feature flags and experiments

Ranking policies, new indexes/providers, semantic retrieval, result-group ordering, and discovery UI may be progressively rolled out through Feature Flags & Experimentation.

Experiment variants must preserve authorization, moderation, consent, and safety invariants. A variant may change ordering, not who is legally/technically allowed to see protected records.

## Product adapter responsibilities

Each consuming product/domain defines:

- searchable entity types;
- source fields eligible for indexing;
- publication/visibility rules;
- domain filters/facets;
- ranking signals and business-rule boosts;
- freshness requirements;
- indexing/update triggers;
- result projection fields;
- query limits and abuse controls;
- sponsored-result rules if used;
- personalization inputs;
- provider/index mapping;
- revalidation requirements before transactions.

## Initial implementation evidence

GlenTown-API currently exposes numerous list/index surfaces across products. Marketplace products use a dedicated `ProductDiscovery` service which restricts results to published/non-deleted products, supports category and geographic filtering, and delegates location scoping to a shared `LocationScopedDiscovery` service.

This is sufficient evidence to formalize the shared logical boundary, but not to claim a portfolio-wide search engine. There is no canonical cross-domain `/search` endpoint or shared TownBoss search runtime evidenced today.

## Initial consumers

Initial consumer: GlenTown.

Likely future consumers: Glen AI, TownTraveler, RealWise, GeoPlotter, TownDeveloper, and other portfolio products requiring entity discovery.

## Implementation truth

Status is `canonical-design-v1` with `logical-boundary-defined` extraction status.

Current GlenTown discovery remains product/domain implementation. No Elasticsearch, OpenSearch, Meilisearch, Algolia, vector database, or other dedicated provider is declared as the canonical production dependency by this contract.

## Non-goals

This contract does not:

- force a dedicated search engine before scale requires it;
- replace domain authorization or publication logic;
- create a single global ranking formula;
- define a full recommender-system/ML platform;
- make search indexes sources of truth;
- require semantic/vector search for GlenTown Beta;
- expose private records merely to improve recall;
- imply that search ranking equals quality, verification, endorsement, or authority.
