# GeoPlotter Operational Acceptance Test

**Status:** CANONICAL / FUTURE RELEASE GATE

PASS 1F executes these scenarios on an accepted release-candidate lineage. Planning documents do not count as implementation evidence.

## Scenario A — Land / Parcel Flow
- [ ] ingest a title/technical description or equivalent authoritative source
- [ ] extract/parse technical data with uncertainty represented
- [ ] perform required human review
- [ ] compute parcel geometry with explicit CRS/SRID
- [ ] record closure/misclosure and provenance where applicable
- [ ] persist through SpatialRecord/PostGIS
- [ ] render through the map projection/API
- [ ] expose validation/provenance state without implying survey authority
- [ ] attach sourced property-intelligence context where enabled
- [ ] create eligible listing/publication without leaking private evidence

## Scenario B — Development Project Flow
- [ ] create/select project
- [ ] represent horizontal phase/block/lot and vertical building/floor/unit inventory
- [ ] associate spatial/site-plan geometry where supported
- [ ] render interactive project inventory
- [ ] change inventory status through audited lifecycle
- [ ] create listing/publication from canonical inventory
- [ ] generate sample computation where enabled with assumptions/effective date
- [ ] confirm sold/withheld changes cannot remain publicly available

## Scenario C — Buyer Flow
- [ ] create explicit BuyerRequirement
- [ ] generate deterministic candidate matches
- [ ] show matched criteria/tradeoffs/disqualifiers
- [ ] preserve currency safety/no silent conversion
- [ ] create a shortlist/inquiry context
- [ ] proceed to viewing/tripping
- [ ] reach negotiation/transaction-readiness handoff

## Scenario D — RealWise Operations
- [ ] create/receive lead
- [ ] assign/reroute under brokerage rules
- [ ] preserve customer + property context in communications
- [ ] schedule/complete viewing/tripping
- [ ] surface unresolved verification/document blockers
- [ ] progress to transaction readiness
- [ ] maintain audit/tenancy boundaries throughout

## Scenario E — Integration Safety
- [ ] RealWise consumes explicit GeoPlotter contracts rather than duplicating domain authority
- [ ] GlenTown/public consumer receives only approved public-safe projections where activated
- [ ] private actor/audit/document fields do not leak
- [ ] version/freshness semantics are observable
- [ ] external provider failure does not corrupt canonical GeoPlotter truth

## Cross-scenario mandatory checks
- [ ] typecheck/test/lint/build gates green
- [ ] migrations coherent on candidate environment
- [ ] cross-tenant access denied
- [ ] geospatial provenance/precision assertions reviewed
- [ ] public projection leakage tests green
- [ ] recovery procedure tested for interrupted work/runtime where applicable
- [ ] Documentation Compliance Receipt PASS
- [ ] Memory/Current State/dashboard updated

## Acceptance result
The operational acceptance result is `PASS`, `BLOCKED` or `FAIL`. A partial scenario does not become a PASS through worker narrative.
