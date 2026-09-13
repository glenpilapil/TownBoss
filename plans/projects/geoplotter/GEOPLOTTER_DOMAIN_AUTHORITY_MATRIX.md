# GeoPlotter Domain Authority Matrix

**Status:** CANONICAL / PROJECT-SPECIFIC

| Domain | Authoritative owner | Notes |
|---|---|---|
| Geometry | SpatialRecord / PostGIS | UI/map state is a projection only |
| Project identity | Project domain | Development-project identity/context |
| Horizontal inventory | Phase / Block / Lot | Canonical lot identity and structure |
| Vertical inventory | Building / Floor / Unit | Canonical unit identity and structure |
| Availability | Inventory lifecycle | Current status + immutable transition history |
| Commercial offer | Listing | Listing is not the property/inventory record |
| Channel exposure | Publication | Per-channel publication lifecycle and history |
| Buyer search intent | BuyerRequirement | Independent from future Lead/Opportunity |
| Candidate fit | Matching service | Deterministic, explainable evaluation only |
| Verification assertions | Verification/Evidence domain | Attribute + source + date + state |
| Extracted document facts | Document/OCR domain | Not authoritative until reviewed where uncertain |
| Hazard/elevation/context | Property Intelligence | Sourced assertions with dataset provenance |
| Real-estate operations | GeoPlotter | Brokerage-specific workflow semantics |
| RealWise | Consumer/operator surface | Consumes GeoPlotter contracts; does not replace authority |
| GlenTown | Downstream consumer | Uses approved public-safe/versioned contracts |
| TownBoss | Portfolio governance | Governs development/orchestration, not property truth |

## No-duplicate-truth rule
Do not introduce parallel authoritative stores for geometry, availability, listing state, publication state, buyer intent or verification simply because a client/integration is easier to build that way. Derived caches and projections must declare their source authority and freshness.
