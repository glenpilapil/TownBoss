# GeoPlotter Validation Matrix

**Status:** CANONICAL / PROJECT-SPECIFIC

Worker prose never substitutes for machine-verifiable evidence. Apply the narrowest sufficient validation during implementation and the full applicable gate before acceptance/checkpoint.

| Capability / change | Required validation |
|---|---|
| TypeScript/web service change | `tsc --noEmit`, targeted tests, full suite before acceptance, ESLint, production build |
| Drizzle/schema change | generated additive migration, dev/test apply, migration-history coherence, schema/SQL match, DB-backed tests |
| Tenant/auth change | positive access, unauthorized denial, cross-tenant non-disclosure, role boundary tests |
| Spatial persistence | PostGIS type/SRID checks, tenant/project linkage, provenance/validation-state persistence, invalid geometry handling |
| Map projection/API | GeoJSON shape/validity, no raw DB leakage, lot/inventory linkage, empty/invalid geometry behavior |
| Map UI | loading/empty/error states, selection/hover/status legend, no WebGL/network dependency in CI tests, visual sanity check |
| Parcel plotting | parser/traverse tests, closure/misclosure, CRS transformation evidence, polygon validity, source/provenance, manual comparison fixtures |
| OCR/document extraction | extraction fixtures, confidence/uncertainty tests, human-review state, source-page traceability |
| Verification/evidence | attribute/source/date/state invariants, conflict handling, refresh/staleness behavior |
| Inventory lifecycle | transition matrix, history immutability, actor attribution, transaction/concurrency safety, tenant isolation |
| Listing/publication | eligibility gates, per-channel lifecycle, public whitelist leakage test, sold/withheld propagation |
| Matching | deterministic ordering, hard constraints, structured reasons, currency mismatch, no incentive/commission input |
| Hazards/elevation | source/date/method metadata, spatial overlay correctness, no unsupported safety claims |
| Valuation/CMA | comparable provenance, range/confidence behavior, no formal-appraisal overclaim |
| Imports | parse/reconciliation tests, duplicate/conflict handling, review-before-apply, rollback/error evidence |
| Public API | publication-safe projection, privacy leakage, abuse/rate-limit review before production |
| Integrations | contract/version tests, freshness semantics, failure isolation, no direct authority duplication |
| Deployment | environment reproducibility, migration/recovery procedure, health checks, secret/config review |

## Validation-state meanings
- **IMPLEMENTED:** code/data changes exist.
- **TESTED:** applicable targeted automated tests pass.
- **VERIFIED:** required completion contract and full applicable validation pass on the candidate ref.
- **CHECKPOINTED:** verified result has task-scoped commit plus required documentation/Memory updates.

## Consequential-review triggers
Require independent or deterministic secondary verification for migrations, tenancy/auth, public-data exposure, money/pricing, geospatial accuracy/CRS changes, destructive operations, recovery logic and major architecture changes.

## Final project gate
PASS 1F must execute the operational acceptance scenarios; PASS 1G then performs the final physical/visual audit. Neither may be substituted by unit-test counts alone.
