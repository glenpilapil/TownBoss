# GeoPlotter Implementation Plan / Development Dashboard

**Status:** ACTIVE IMPLEMENTATION  
**Canonical planning role:** operator dashboard + implementation sequence  
**Evidence rule:** checkboxes are authoritative completion markers; do not mark complete without evidence.

## Status legend
- `[ ]` not complete
- `[x]` complete with evidence at the stated level
- `⏳` in progress
- `⚠` attention/review required
- `⛔` blocked
- `↪` explicitly deferred

## Current dashboard summary
- [x] PASS 0E — project foundation implemented on active GeoPlotter lineage.
- [x] PASS 0F — PostGIS/SpatialRecord provenance foundation implemented.
- [x] PASS 0G — horizontal inventory implemented.
- [x] PASS 0H — vertical inventory implemented.
- [x] PASS 0I — audited inventory lifecycle implemented.
- [x] PASS 0J — listing/publication foundation accepted (`da5604d`, closure `d991535`).
- [x] PASS 0K — buyer requirements + deterministic matching implemented (`7ce0926`).
- [x] PASS 0L — interactive project + lot map foundation accepted (`7b676f3`).
- [x] PASS 0M-PREP — structured technical-description plotting reconnaissance accepted.
- [x] PASS 0M-A — structured technical-description plotting contract is complete; checkpointed at 51f27e6.
- [ ] Canonical/default-branch integration of later active-lineage work reconciled.
- [ ] End-to-end operational acceptance complete.
- [ ] Physical + visual final gate complete.

> **Provenance note:** implementation/checkpoint evidence above does not by itself prove default-branch integration. The connected remote currently does not expose the active `feat/pass-0e-projects-foundation` branch; canonical integration remains a separate gate.

## Mission
GeoPlotter is the authoritative geospatial real-estate and development-project platform for parcel geometry, provenance/evidence, development inventory, commercial listings/publication, buyer matching, brokerage workflows and RealWise operations.

## Architecture baseline
- Next.js / TypeScript web application.
- Drizzle ORM.
- PostgreSQL/PostGIS authoritative spatial persistence.
- Python geospatial service for specialized geospatial computation.
- MapLibre GL JS approved interactive mapping foundation.
- Local services must remain independently runnable where container/virtualization tooling is unavailable.

## Workstream sequence

### PASS 0E — Project foundation
**Status:** `[x] IMPLEMENTED`  
**Objective:** tenant-scoped development-project identity and service/API foundation.  
**Gate:** project CRUD/domain behavior evidenced; tenant isolation preserved.

### PASS 0F — Spatial/PostGIS foundation
**Status:** `[x] IMPLEMENTED`  
**Objective:** authoritative SpatialRecord persistence with provenance and validation state.  
**Gate:** geometry stored through canonical spatial abstraction; provenance survives persistence.

### PASS 0G — Horizontal inventory
**Status:** `[x] IMPLEMENTED`  
**Objective:** Phase -> Block -> Lot.  
**Gate:** organization/project scoping and hierarchy integrity evidenced.

### PASS 0H — Vertical inventory
**Status:** `[x] IMPLEMENTED`  
**Objective:** Building -> Floor -> Unit.  
**Gate:** tenant-safe hierarchy and canonical unit identity evidenced.

### PASS 0I — Inventory lifecycle
**Status:** `[x] IMPLEMENTED`  
**Objective:** audited lot/unit availability transitions.  
**Gate:** immutable history, actor attribution, allowed transitions, cross-tenant denial.  
**Evidence:** checkpoint `33435d3` reported; migration `0006`.

### PASS 0J — Listing/publication
**Status:** `[x] ACCEPTED`  
**Objective:** listing != inventory, per-channel publication, eligibility, public-safe projection, immutable publication history.  
**Evidence:** implementation `da5604d`; closure `d991535`; full suite 130/130, lint/build/typecheck green at acceptance.

### PASS 0K — Buyer requirements + deterministic matching
**Status:** `[x] IMPLEMENTED`  
**Objective:** BuyerRequirement plus deterministic, explainable lot/unit matching.  
**Evidence:** `7ce0926`; typecheck/tests/lint/build green; migration `0008` coherent.  
**Deferrals:** area/bedroom criteria where canonical support remains incomplete; no public matching API.

### PASS 0L — Interactive project + lot map foundation
**Status:** `[x] ACCEPTED`  
**Objective:** PostGIS/SpatialRecord -> map projection API -> MapLibre -> selectable lot UI.  
**Required gate:** real backend projection + real API + frontend MapLibre; frontend-only mock is insufficient.  
**Checkpoint:** `7b676f3` (`[P0L][D-MAP-INTEGRATION][T-PASS-0L]`).
**Evidence:** 176/176 tests across 13 files; TypeScript pass; ESLint pass (0 errors; 6 pre-existing warnings); production build pass (14 routes); migration coherence pass on `geoplotter` and `geoplotter_test`; `git diff --check` pass; clean GeoPlotter worktree. The accepted foundation links `SpatialRecord` to lot subjects; supplies a tenant-safe canonical GeoJSON project-map API; renders project/lot geometry in MapLibre; exposes inventory-status visualization, lot selection, selected-lot context, provenance/validation projection, and loading/empty/error handling.
**Deferred:** cadastral overlays, hazards, elevation, parcel drawing/editing, vertical floor selector, 2.5D/3D.

### PASS 0M-PREP — Structured technical-description plotting reconnaissance
**Status:** `[x] ACCEPTED`
**Outcome:** scope and pipeline are bounded: structured/manual technical description -> deterministic traverse computation -> closure/validation -> candidate polygon -> review -> `SpatialRecord`/PostGIS -> PASS 0L map rendering. OCR/document ingestion and extraction/review remain PASS 0N scope.

### PASS 0M-A — Structured technical-description plotting contract
**Status:** `[x] ACCEPTED` — checkpoint `51f27e6`
**Objective:** Define the structured plotting contract for technical descriptions: machine-readable bearing, finite distance with explicit units, structured reference point, truthful known/unknown CRS, provenance, structured ERROR/WARNING/REVIEW_REQUIRED findings, candidate result distinct from canonical SpatialRecord, user confirmation distinct from professional verification. No persistence, no plotting UI, no 0M-B work.  
**Gate:** geometry provenance, CRS handling, closure evidence, uncertainty surfaced; no survey-authority overclaim.

### PASS 0N — Document ingestion + OCR review
**Status:** `[ ]`  
**Objective:** title/survey/site-plan ingestion, OCR extraction, confidence and human-review workflow.  
**Gate:** uncertain extraction cannot silently become authoritative property truth.

### PASS 0O — Property verification + evidence
**Status:** `[ ]`  
**Objective:** attribute + source + date + verification state assertions.  
**Gate:** conflicts/refresh requirements visible; generic verified-property shortcuts prohibited.

### PASS 0P — Property intelligence overlays
**Status:** `[ ]`  
**Objective:** sourced hazard, elevation and contextual overlays.  
**Gate:** source/date/method/limitations preserved; no unsupported safety claims.

### PASS 0Q — Public property/project experience
**Status:** `[ ]`  
**Objective:** public search/map/detail experience using publication-safe projections.

### PASS 0R — Interactive developer inventory
**Status:** `[ ]`  
**Objective:** site-plan/project inventory experience over canonical lot/unit data.

### PASS 0S — Vertical floor/unit selector
**Status:** `[ ]`  
**Objective:** Tower/Building -> Floor -> Unit visual selection.  
**Rule:** accurate 2D first; 2.5D/3D later.

### PASS 0T — Sample computation engine
**Status:** `[ ]`  
**Objective:** auditable pricing/payment scenario computation with effective assumptions and dates.

### PASS 0U — Lead / Opportunity foundation
**Status:** `[ ]`  
**Objective:** brokerage-specific lead/opportunity domain attached to existing BuyerRequirement where appropriate.

### PASS 0V — Unified inbox
**Status:** `[ ]`  
**Objective:** normalized conversations with lead/property context; channel adapters remain replaceable.

### PASS 0W — Viewing / tripping workflow
**Status:** `[ ]`  
**Objective:** request -> confirmation -> completion/follow-up plus itinerary/vehicle context.

### PASS 0X — Transaction readiness
**Status:** `[ ]`  
**Objective:** pre-transaction gates, document readiness and professional handoff.

### PASS 0Y — CMA / valuation workspace
**Status:** `[ ]`  
**Objective:** comparable evidence, ranges/confidence, adjustment provenance; no automated formal-appraisal overclaim.

### PASS 0Z — Developer inventory import
**Status:** `[ ]`  
**Objective:** Excel/PDF reconciliation, change review and controlled inventory updates.

### PASS 1A — Public-safe integration contract
**Status:** `[ ]`  
**Objective:** versioned GeoPlotter contracts for RealWise/GlenTown; no direct downstream authority duplication.

### PASS 1B — Security + tenancy hardening
**Status:** `[ ]`

### PASS 1C — Performance/scaling
**Status:** `[ ]`

### PASS 1D — Observability
**Status:** `[ ]`

### PASS 1E — Deployment hardening
**Status:** `[ ]`

### PASS 1F — End-to-end operational acceptance
**Status:** `[ ]`  
**Objective:** prove the canonical acceptance scenarios in `GEOPLOTTER_OPERATIONAL_ACCEPTANCE_TEST.md`.

### PASS 1G — Physical + visual audit
**Status:** `[ ] FINAL GATE`  
**Rule:** do not declare product visual readiness before preceding core gates are accepted.

## Cross-cutting gates
- [ ] Canonical repository provenance reconciled for all intended completed passes.
- [ ] Fresh full validation suite passes on release-candidate lineage.
- [ ] Geospatial accuracy/provenance gate passes.
- [ ] Inventory lifecycle/concurrency gate passes.
- [ ] Publication/privacy leakage gate passes.
- [ ] Matching correctness/explainability gate passes.
- [ ] CRM/routing gate passes.
- [ ] RealWise operational pilot passes.
- [ ] GlenTown/public-safe integration contract passes where activated.
- [ ] Privacy/compliance review passes.
- [ ] Production architecture/readiness approved.
- [ ] Memory and Current State updated for release candidate.

## Implementation discipline
Every substantial PASS must define baseline, objective, scope, dependencies, out-of-scope work, authority/risk boundary, validation, documentation updates and handoff. A PASS ends `DONE`, `BLOCKED`, `REVIEW_REQUIRED` or `FAILED`; it does not silently expand.

## Evidence rule
Planning documents record intended/current state; they are not implementation evidence. Repository history proves durable provenance. `VERIFIED` requires validation evidence tied to the candidate ref. `CHECKPOINTED` requires the applicable documentation/Memory obligations and task checkpoint policy to be satisfied.
