# TownBoss Platform Charter

**Status:** Canonical foundation v1
**Scope:** TownBoss portfolio

## Purpose

TownBoss is to be developed as a capability company: products deliver domain-specific experiences while reusable technical and operational capabilities accumulate beneath them.

This charter defines architectural boundaries now without forcing premature migration, service extraction, or GlenTown Beta scope expansion.

## Architectural layers

### 1. Platform Core
Broadly reusable foundations whose contracts must not depend on a specific product's domain semantics. Initial candidates include Identity & Trust, Organizations/Tenancy, Authorization, Location/Geography, Messaging, Notifications, Payments/Credits, Media, Search/Discovery foundations, Evidence/Provenance, Orchestration, Scenario/Constraint foundations, Feature Flags/Experimentation, Audit/Observability, and the shared Glen AI foundation.

### 2. Shared Domain Capabilities
Specialized capabilities that can serve multiple related products without becoming universal infrastructure. Examples include Spatial Intelligence, Property Intelligence, 3D/Blender visualization, CRM, Travel Intelligence, and Professional Verification workflows.

### 3. Product Capabilities
Behavior whose meaning and lifecycle belong primarily to one product. Examples include GlenTown Community and Pre-Loved, GeoPlotter parcel technical-description interpretation, RealWise brokerage workflows, TownTraveler consumer travel experiences, and TownDeveloper development-project workflows.

## Dependency rule

The preferred dependency direction is:

`Product -> Shared Domain -> Platform Core`

Platform Core must not depend on GlenTown-, GeoPlotter-, RealWise-, TownTraveler-, or TownDeveloper-specific semantics. Shared capabilities may expose generic contracts; consuming products own the domain meaning.

## Logical boundary before physical extraction

Classification as shared does not require an immediate repository, package, service, database, or deployment split. Establish ownership and contracts first. Extract only when real reuse, independent lifecycle, scaling, security, reliability, or operational evidence justifies it.

## Capability reuse rule

Before substantial new implementation, determine whether the capability already exists in the TownBoss Capability Registry. Reuse or extend an existing capability where appropriate. If none exists, classify the proposed work as Platform Core, Shared Domain, or Product before implementation.

## Strategic product relationship

- GlenTown supplies people, business, local, community, commerce, and local-life platform capabilities.
- Glen AI supplies intelligence, interface, orchestration, and skill routing.
- GeoPlotter develops spatial/property intelligence.
- RealWise commercially applies real-estate capabilities.
- TownTraveler applies local/place capabilities to travel.
- TownDeveloper can later turn property intelligence into physical-development workflows.
- Forex Quant Lab remains more independent while sharing evidence, experimentation, simulation, risk, and agent-supervision methodology where appropriate.
- Development Supervisor is engineering operating-system infrastructure across projects.

## Non-goals

This charter does not authorize a rewrite of GlenTown, a microservice conversion, a mass code migration, or implementation of post-Beta features merely to satisfy the future platform architecture.
