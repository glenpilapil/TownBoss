# GeoPlotter Architecture

**Status:** CANONICAL / PROJECT-SPECIFIC

## System boundary
GeoPlotter is the authoritative real-estate/geospatial vertical system. Current implementation architecture is:

- Next.js + TypeScript web application
- Drizzle ORM
- PostgreSQL + PostGIS authoritative persistence
- Python geospatial service for specialized geospatial computation
- MapLibre GL JS as the approved interactive mapping foundation

Earlier Laravel assumptions are not authoritative where repository evidence shows the current stack above.

## Core architectural principles
1. PostGIS stores canonical geometry; UI map state is not a second spatial database.
2. `SpatialRecord` is the canonical spatial abstraction and carries provenance/validation state.
3. Frontends consume deliberate service/API projections, not raw database objects.
4. Tenant boundaries are enforced server-side.
5. Public output passes through explicit publication-safe projections.
6. Uncertain extraction or inferred geometry remains distinguishable from professionally verified evidence.
7. Domain state is separated by authority: inventory status, listing, publication, buyer intent and matching are distinct.

## Domain flow
Project -> Phase/Block/Lot or Building/Floor/Unit -> SpatialRecord -> Inventory lifecycle -> Listing -> Publication -> BuyerRequirement -> Matching -> Brokerage workflows.

## Mapping architecture
PostGIS/SpatialRecord -> spatial service -> GeoJSON-compatible projection -> authenticated/public-safe API -> MapLibre GL JS.

MapLibre is presentation/interaction infrastructure; it does not own geometry truth. 2D is the primary accurate selection surface. 2.5D/3D is deferred until separately activated.

## Geospatial correctness
- CRS/SRID must be explicit and appropriate to the operation.
- Distance/area calculations must not imply precision beyond source data.
- Closure/misclosure and transformation assumptions must be retained where material.
- Rendering success does not imply legal/survey authority.
- Hazard/elevation layers must preserve source, date, methodology and limitations.

## Service boundaries
- Web/API services own authorization, tenancy, workflow and public projection.
- PostGIS owns durable geometry.
- Python geospatial service owns bounded specialized computation where justified.
- External data providers are evidence sources, not authority over GeoPlotter workflow state.

## Integration boundaries
- RealWise consumes GeoPlotter real-estate capabilities and does not replace GeoPlotter domain authority.
- GlenTown consumes approved versioned/public-safe contracts.
- TownBoss governs portfolio development/orchestration but does not become a duplicate real-estate data store.

## Scaling path
GeoJSON is acceptable for bounded project/lot mapping. Vector tiles or other spatial delivery mechanisms require evidence of scale need before adoption.
