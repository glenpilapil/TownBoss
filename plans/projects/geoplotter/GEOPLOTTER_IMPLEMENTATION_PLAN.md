# GeoPlotter Implementation Plan

**Status:** ACTIVE IMPLEMENTATION  
**Evidence reconciliation:** 2026-09-12

## Mission

Geospatial real-estate and development-project platform for parcels, hazards/elevation, project inventory, sales workflows and RealWise operations.

## Architecture baseline

- Laravel/API + Next.js web + Python geospatial service direction.
- PostgreSQL.
- Local services must remain independently runnable where Docker/virtualization is unavailable.

## Repository AS-IS

**Canonical repository:** `glenpilapil/GeoPlotter-Real-Estate`  
**Default branch:** `main`  
**Current default HEAD:** `bde5a05` — PASS 0B merge.

### PASS 0B — CANONICAL / DEFAULT-BRANCH EVIDENCED

Repository evidence includes executable development foundations, local environment/infrastructure contract, Python geospatial-service scaffold, health endpoint/test, baseline CI and architecture/domain documentation.

### PASS 0C — REMOTE FEATURE-BRANCH EVIDENCED / MERGE AND COMPLETENESS PENDING

Remote branch `feat/pass-0c-persistence-tenancy-foundation` exists at `47d5c1b`. Its current head includes accepted GeoPlotter CRM/TownBoss platform-boundary documentation. The branch is not merged into `main`; branch existence alone does not establish that every PASS 0C implementation/test requirement is complete or verified.

### PASS 0D–0I — REPORTED LOCAL / REMOTE PROVENANCE PENDING

A later PASS 0I checkpoint was reported from local development on `feat/pass-0e-projects-foundation`, commit `33435d3`, including immutable inventory-status history, explicit transition rules, service-only atomic status transitions, lot/unit status routes, tenant enforcement, database constraints and tests.

That commit does not resolve in the connected GitHub repository, and the connected remote branch inventory exposes no PASS 0D–0I refs. These capabilities must therefore remain **reported local implementation**, not canonical remote implementation, until synchronized and reconciled.

## Major Workstreams

### Geospatial core
- title/parcel plotting;
- cadastral/geographic base layers;
- hazards and elevation;
- document extraction with human verification;
- provenance and confidence handling.

### Development projects/inventory
- horizontal phases/blocks/lots;
- vertical buildings/floors/units;
- site-plan polygon generation/import;
- inventory lifecycle/history;
- sample computation generation;
- later 3D selector.

### CRM/sales routing
- lead/customer records;
- agent -> manager -> director -> broker routing;
- tripping/appointments;
- commissions/payouts;
- listing submissions and approvals.

GeoPlotter owns real-estate-specific CRM semantics while reusable generic CRM/omnichannel primitives should migrate toward TownBoss shared infrastructure where appropriate. TownBoss CRM is not a blocker for the GeoPlotter pilot.

### Content/marketing
- blog/content management;
- property/project publishing;
- social-content support and webinar funnel.

### Integration
Follow GeoPlotter/GlenTown integration guidelines. Prefer versioned API/contracts/events over direct database coupling. RealWise is a primary operating consumer but does not erase GeoPlotter's domain authority.

## Immediate Gates

- [x] PASS 0B default-branch provenance established.
- [x] PASS 0C remote branch located.
- [ ] Audit PASS 0C branch contents/tests against its intended checkpoint contract.
- [ ] Establish remote provenance for PASS 0D–0I.
- [ ] Bind PASS 0D–0I migrations/tests/checkpoints to canonical remote refs.
- [ ] Merge intended completed passes through controlled branch/PR path.
- [ ] Run fresh full suite after synchronization.
- [ ] Geospatial accuracy/provenance gate.
- [ ] Inventory concurrency/state-machine gate.
- [ ] CRM/routing implementation gate.
- [ ] RealWise operational pilot.
- [ ] Security/privacy/legal review.
- [ ] Production deployment architecture.

## Evidence Rule

Local checkpoints establish reported implementation context. Remote repository history establishes durable implementation provenance. Default-branch ancestry establishes canonical integration. `VERIFIED` requires tests/build/runtime evidence tied to the canonical ref or release candidate.
