# GeoPlotter Decisions and Rules

**Status:** CANONICAL / PROJECT-SPECIFIC

Approved decisions remain binding until explicitly superseded. Amendments must record what changed, why, effective date/checkpoint and migration impact.

## Decisions
- **D1 — GeoPlotter authority:** GeoPlotter remains authoritative for real-estate-specific domain truth.
- **D2 — Spatial authority:** PostGIS + SpatialRecord remain the canonical geometry abstraction.
- **D3 — Provenance survives projection:** provenance/validation state must not disappear when geometry is transformed for APIs/UI.
- **D4 — No authority overclaim:** inferred/rendered geometry is not automatically survey-authoritative.
- **D5 — Listing separation:** Listing is a commercial offer and is not Property/Lot/Unit itself.
- **D6 — Publication separation:** publication state is separate from listing commercial state and is channel-specific.
- **D7 — Availability authority:** inventory lifecycle is authoritative for current availability.
- **D8 — Explainable matching:** matching is deterministic and based on explicit criteria/canonical facts.
- **D9 — No incentive bias:** commission, agent ownership or hidden commercial priority must not influence buyer matching.
- **D10 — Currency safety:** no silent FX conversion; unsupported comparisons are explicit.
- **D11 — Map foundation:** MapLibre GL JS is the approved interactive map foundation.
- **D12 — Visual selector sequence:** accurate 2D comes first; 2.5D/3D is later scope.
- **D13 — Human review:** uncertain OCR/document extraction requires human review before authoritative use.
- **D14 — RealWise boundary:** RealWise consumes GeoPlotter domain contracts and does not replace GeoPlotter authority.
- **D15 — GlenTown boundary:** GlenTown consumes approved public-safe/versioned GeoPlotter contracts.
- **D16 — No duplicate truth:** geometry/status/commercial/publication truth cannot be duplicated for convenience.
- **D17 — Bounded passes:** implementation proceeds through bounded PASSes with evidence-backed acceptance.
- **D18 — Recovery discipline:** interrupted work resumes from durable repository state without rerunning completed work by default.

## Project rules
1. Tenant isolation is mandatory at service/API boundaries.
2. Worker prose cannot promote a PASS when machine-verifiable gates fail or were not run.
3. Geospatial/legal uncertainty fails closed and must be surfaced.
4. New external dependencies require bounded architecture/security/licensing review.
5. Scope discovered during a PASS becomes future work unless necessary for its completion contract.
6. Commit/push/merge/deploy are separate authorities.
7. Material implementation changes must update canonical docs and Memory before checkpoint acceptance.
