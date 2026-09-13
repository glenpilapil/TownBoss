# GeoPlotter Capability Matrix

**Status:** CANONICAL / LIVING

| Capability | Domain owner | Status | PASS | Evidence / note | Scope / next action |
|---|---|---|---|---|---|
| Projects | Project | IMPLEMENTED | 0E | active-lineage implementation reported | reconcile canonical integration |
| Spatial records | SpatialRecord/PostGIS | IMPLEMENTED | 0F | provenance-aware spatial persistence | continue map/plotting acceptance |
| Horizontal inventory | Phase/Block/Lot | IMPLEMENTED | 0G | canonical hierarchy | integrate visual selectors |
| Vertical inventory | Building/Floor/Unit | IMPLEMENTED | 0H | canonical hierarchy | PASS 0S visual selector later |
| Inventory lifecycle | Inventory lifecycle | IMPLEMENTED | 0I | `33435d3`, migration 0006 reported | concurrency/release acceptance later |
| Listing | Listing | ACCEPTED | 0J | `da5604d` + `d991535` | extend only through canonical domain |
| Publication | Publication | ACCEPTED | 0J | per-channel/public-safe projection | rate-limit/public hardening later |
| Buyer requirements | BuyerRequirement | IMPLEMENTED | 0K | `7ce0926` | future CRM attachment |
| Matching | Matching service | IMPLEMENTED | 0K | deterministic/explainable | area/bedroom criteria deferred |
| Interactive project map | Spatial + Map UI | IN PROGRESS | 0L | MapLibre + real API required | complete active PASS |
| Parcel/technical plotting | Spatial/geospatial service | PLANNED | 0M | — | bearing/distance traverse + closure |
| OCR/document extraction | Document/OCR | PLANNED | 0N | — | add human review/confidence |
| Verification/evidence | Evidence | PLANNED | 0O | — | attribute/source/date/state |
| Hazards/elevation | Property Intelligence | PLANNED | 0P | — | sourced overlays/provenance |
| Public search/detail | Publication-safe public UX | PLANNED | 0Q | — | public property/project experience |
| Developer inventory selector | Inventory + spatial UX | PLANNED | 0R | — | interactive site-plan inventory |
| Floor/unit selector | Vertical inventory UX | PLANNED | 0S | — | accurate 2D first |
| Sample computations | Commercial computation | PLANNED | 0T | — | assumptions/effective-date audit |
| Leads/opportunities | Brokerage CRM | PLANNED | 0U | — | attach buyer requirements where appropriate |
| Unified inbox | Conversations | PLANNED | 0V | — | channel-normalized context |
| Viewing/tripping | Brokerage operations | PLANNED | 0W | — | lifecycle + itinerary/vehicle |
| Transaction readiness | Transaction workflow | PLANNED | 0X | — | document/professional handoff |
| CMA/valuation | Valuation intelligence | PLANNED | 0Y | — | evidence/range/confidence |
| Inventory import | Inventory ingestion | PLANNED | 0Z | — | Excel/PDF reconciliation |
| RealWise integration | GeoPlotter contract consumer | PARTIAL | 1A | integration guidance exists | versioned explicit contract |
| GlenTown integration | GeoPlotter public-safe contract | PLANNED | 1A | integration guidance exists | no direct DB coupling |
| Security/tenancy hardening | Cross-cutting | PLANNED | 1B | existing tenant tests are capability-level | production hardening gate |
| Performance/scaling | Cross-cutting | PLANNED | 1C | — | evidence-driven optimization |
| Observability | Operations | PLANNED | 1D | — | health/error/metrics |
| Deployment hardening | Operations | PLANNED | 1E | — | reproducible environment/recovery |
| End-to-end acceptance | Cross-cutting | PLANNED | 1F | — | run operational acceptance scenarios |
| Physical/visual audit | UX final gate | PLANNED | 1G | — | final gate only |

## Status rule
`IMPLEMENTED` means implementation evidence exists at the recorded lineage level. `ACCEPTED` means the bounded PASS also cleared its acceptance closure. Neither label automatically means merged to default branch. `VERIFIED` is reserved for evidence tied to the relevant canonical/release-candidate ref.
