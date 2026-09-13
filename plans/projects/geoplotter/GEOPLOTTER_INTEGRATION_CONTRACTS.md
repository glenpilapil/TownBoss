# GeoPlotter Integration Contracts

**Status:** CANONICAL / PROJECT-SPECIFIC

## Core principle
GeoPlotter remains authoritative for real-estate-specific domain truth. Integrations consume explicit, versioned contracts; they do not gain authority by copying GeoPlotter data.

## GeoPlotter ↔ RealWise
- RealWise is an operator/consumer surface over GeoPlotter capabilities.
- RealWise may use GeoPlotter property, inventory, listing, publication, matching, CRM and transaction-readiness services.
- RealWise must not maintain a competing authoritative geometry, inventory-status, listing/publication or verification store.
- Caches/projections must declare source and freshness.
- Operational failures in RealWise must not corrupt canonical GeoPlotter state.

## GeoPlotter ↔ GlenTown
- GlenTown consumes only approved public-safe/versioned real-estate contracts.
- Publication eligibility and public-field whitelisting remain GeoPlotter responsibilities.
- No direct database coupling for normal integration.
- GlenTown must not infer hidden verification/legal claims from public projection fields.
- Changes in inventory/publication state must propagate through contract/freshness semantics rather than duplicate business rules.

## GeoPlotter ↔ TownBoss
- TownBoss governs development, portfolio orchestration and shared infrastructure decisions.
- TownBoss does not become the real-estate domain database.
- Generic CRM/platform primitives may migrate to shared infrastructure only when semantic equivalence is proven and GeoPlotter-specific authority remains explicit.

## External government/data providers
- Access through adapters where practical.
- Preserve source, dataset/version/date, retrieval time and limitations when material.
- External authoritative datasets remain authoritative for their stated source facts, but GeoPlotter owns its derived workflow state and provenance links.
- Provider failure/staleness must be visible and must not silently rewrite canonical truth.

## Professional-service workflows
- Broker, appraiser, lawyer, geodetic engineer and other professional conclusions remain attributable to the qualified professional/source.
- GeoPlotter may orchestrate evidence and handoff but must not transform automated inference into a professional certification.

## Contract requirements
Every production integration should define:
- version/schema
- authentication/authorization
- tenant/public scope
- authoritative source
- fields/projection
- freshness/cache semantics
- provenance requirements
- failure/retry behavior
- idempotency where mutations exist
- deprecation/change policy
- privacy/security expectations

## Prohibited patterns
- downstream direct DB writes to canonical GeoPlotter tables
- public clients reproducing publication eligibility rules independently
- duplicated inventory status authorities
- silent currency conversion or pricing derivation
- stripping provenance when it changes interpretation
