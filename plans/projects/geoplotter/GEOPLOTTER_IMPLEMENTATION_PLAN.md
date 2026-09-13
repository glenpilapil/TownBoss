# GeoPlotter Implementation Plan / Development Dashboard

**Status:** ACTIVE IMPLEMENTATION  
**Evidence reconciliation:** 2026-09-12  
**Dashboard rule:** checkboxes are authoritative completion markers; do not mark complete without evidence.

## Dashboard summary
- [x] PASS 0B — canonical/default-branch foundation evidenced.
- [ ] PASS 0C — remote feature-branch contents and completion contract reconciled.
- [ ] PASS 0D–0I — durable remote provenance reconciled and validated.
- [ ] Canonical full-suite verification complete after synchronization.
- [ ] Geospatial accuracy/provenance gate complete.
- [ ] Development inventory/state-machine gate complete.
- [ ] CRM/routing gate complete.
- [ ] RealWise operational pilot complete.
- [ ] Privacy/compliance review complete.
- [ ] Production deployment architecture complete.

## Mission
Geospatial real-estate and development-project platform for parcels, hazards/elevation, project inventory, sales workflows and RealWise operations.

## Architecture baseline
- [x] Laravel/API + Next.js web + Python geospatial-service direction established.
- [x] PostgreSQL selected.
- [x] Local services must remain independently runnable where virtualization/container tooling is unavailable.

## Repository AS-IS
**Canonical repository:** `glenpilapil/GeoPlotter-Real-Estate`  
**Default branch:** `main`  
**Reconciled default HEAD:** `bde5a05` — PASS 0B merge.

### PASS 0B — canonical/default-branch evidenced
- [x] Development foundations present.
- [x] Local environment/infrastructure contract present.
- [x] Python geospatial-service scaffold present.
- [x] Health endpoint/test present.
- [x] Baseline CI and architecture/domain documentation present.

### PASS 0C — remote feature branch; review pending
Remote branch `feat/pass-0c-persistence-tenancy-foundation` was reconciled at `47d5c1b`.
- [x] Remote branch located.
- [ ] Audit branch contents against PASS 0C completion contract.
- [ ] Verify intended PASS 0C tests/evidence.
- [ ] Approve controlled integration path.

### PASS 0D–0I — reported later implementation; provenance pending
A later PASS 0I checkpoint was reported locally at `33435d3`, but it was not resolved in the connected remote during the 2026-09-12 reconciliation.
- [ ] Locate durable repository refs for PASS 0D.
- [ ] Locate durable repository refs for PASS 0E.
- [ ] Locate durable repository refs for PASS 0F.
- [ ] Locate durable repository refs for PASS 0G.
- [ ] Locate durable repository refs for PASS 0H.
- [ ] Locate durable repository refs for PASS 0I.
- [ ] Reconcile associated schema/migrations/tests/checkpoints.
- [ ] Promote only evidence-backed work to canonical implementation status.

## Major workstreams

### Geospatial core
- [ ] Title/parcel plotting acceptance verified.
- [ ] Cadastral/geographic base-layer contract verified.
- [ ] Hazards/elevation integration verified.
- [ ] Document extraction includes human verification where uncertainty exists.
- [ ] Provenance/confidence handling verified.

### Development projects and inventory
- [ ] Horizontal phase/block/lot model verified.
- [ ] Vertical building/floor/unit model verified.
- [ ] Site-plan polygon generation/import verified.
- [ ] Inventory lifecycle/history verified.
- [ ] Sample-computation generation verified.
- [ ] Later 3D selector remains deferred until separately activated.

### CRM / sales routing
- [ ] Lead/customer model verified.
- [ ] Agent -> manager -> director -> broker routing verified.
- [ ] Tripping/appointment workflows verified.
- [ ] Commission/payout workflow boundaries verified.
- [ ] Listing submission/approval flow verified.

GeoPlotter owns real-estate-specific CRM semantics. Reusable generic CRM primitives may migrate toward TownBoss shared infrastructure only when semantic alignment is proven.

### Content / marketing
- [ ] Blog/content management scope defined and verified.
- [ ] Property/project publishing flow verified.
- [ ] Social-content support bounded.
- [ ] Webinar funnel requirements bounded.

### Integration
- [ ] GeoPlotter/GlenTown integration guidance followed.
- [ ] Versioned API/contracts/events used instead of direct database coupling where appropriate.
- [ ] RealWise consumption preserves GeoPlotter domain authority.

## Immediate gates
- [x] PASS 0B default-branch provenance established.
- [x] PASS 0C remote branch located.
- [ ] PASS 0C contents/tests audited.
- [ ] PASS 0D–0I remote provenance established.
- [ ] PASS 0D–0I tests/checkpoints bound to durable refs.
- [ ] Intended completed passes integrated through controlled branch/PR path.
- [ ] Fresh full suite passes after synchronization.
- [ ] Geospatial accuracy/provenance gate passes.
- [ ] Inventory concurrency/state-machine gate passes.
- [ ] CRM/routing implementation gate passes.
- [ ] RealWise operational pilot passes.
- [ ] Privacy/compliance review passes.
- [ ] Production deployment architecture approved.
- [ ] Memory and Current State updated for release candidate.

## Evidence rule
Repository history proves durable implementation provenance. Default-branch ancestry establishes canonical integration. `VERIFIED` requires test/build/runtime evidence tied to the canonical ref or release candidate.
