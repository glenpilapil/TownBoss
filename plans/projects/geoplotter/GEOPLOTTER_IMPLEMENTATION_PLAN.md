# GeoPlotter Implementation Plan

**Status:** ACTIVE IMPLEMENTATION  
**Evidence reconciliation:** 2026-09-12

## Mission

Geospatial real-estate and development-project platform for parcels, hazards/elevation, project inventory, sales workflows and RealWise operations.

## Architecture Baseline

- Laravel/API + Next.js web + Python geospatial service direction.
- PostgreSQL.
- Local infrastructure and geospatial-service boundaries are documented in the repository.
- Docker support exists in repository history, but the current Windows development machine has virtualization constraints; local services must remain independently runnable.

## Repository AS-IS Baseline — `glenpilapil/GeoPlotter-Real-Estate`

### Remote GitHub evidence currently visible

The connected repository's `main` branch currently ends at PASS 0B (`bde5a05`), which established the executable development foundation. Repository history confirms:

- canonical project/system/domain documentation;
- local environment contract;
- local infrastructure compose stack;
- scaffolded Python geospatial package;
- geospatial health endpoint and test;
- geospatial-service containerization;
- baseline web/geospatial CI quality gates;
- development/infrastructure boundary documentation.

### Reported local checkpoint beyond remote `main`

A later PASS 0I checkpoint was reported from local development on branch `feat/pass-0e-projects-foundation`, commit `33435d3`, with:

- immutable `inventory_status_history`;
- explicit inventory transition rules;
- service-only atomic status transitions;
- PATCH status routes for lots/units;
- tenant/role enforcement and cross-tenant 404 behavior;
- database constraints and migration;
- 15 new HTTP/database tests;
- lifecycle/audit behavior documented.

**Evidence status:** this PASS 0I checkpoint is treated as **reported local implementation evidence**, not remote-GitHub verification. The connected GitHub repository does not currently resolve commit `33435d3`, and branch discovery does not expose the reported later branch. It must be pushed/reconciled before TownBoss can classify it as repository-verified.

## Current Capability Classification

| Capability | Classification | Evidence note |
|---|---|---|
| Architecture/domain documentation | IMPLEMENTED / remote-evidenced | Present before PASS 0B |
| Local environment/infrastructure foundation | IMPLEMENTED / remote-evidenced | PASS 0B history |
| Python geospatial service scaffold | IMPLEMENTED / remote-evidenced | Package + health endpoint/test |
| Baseline CI quality gates | IMPLEMENTED / remote-evidenced | PASS 0B history |
| Inventory status history/state transitions | IMPLEMENTED REPORTED / remote verification pending | PASS 0I local checkpoint |
| Tenant-safe lot/unit status routes | IMPLEMENTED REPORTED / remote verification pending | PASS 0I local checkpoint |
| Full parcel/title plotting workflow | PLANNED / partial foundation | Requires implementation evidence |
| Hazards/elevation integration | PLANNED / partial foundation | Requires data/provenance and runtime evidence |
| OCR/document extraction | PLANNED | Human-verification workflow required |
| Horizontal/vertical project inventory | ACTIVE IMPLEMENTATION | Later local passes reported; remote reconciliation required |
| CRM/routing/commission operations | PLANNED | Requires implementation evidence |
| RealWise operational integration | PLANNED | Contract/pilot work required |

## Major Workstreams

### Geospatial core
- title/parcel plotting;
- cadastral/geographic base layers;
- hazards and elevation;
- OCR/document extraction with human verification;
- provenance/confidence handling;
- accuracy validation and exception workflows.

### Development projects/inventory
- horizontal phases/blocks/lots;
- vertical buildings/floors/units;
- site-plan polygon generation/import;
- inventory lifecycle/history;
- concurrency-safe state transitions;
- reservation/payment semantics after explicit domain design;
- sample computation generation;
- later 3D selector.

### CRM/sales routing
- lead/customer records;
- agent -> manager -> director -> broker routing;
- tripping/appointments;
- commissions/payouts;
- listing submissions and approvals.

### Content/marketing
- blog/content management;
- property/project publishing;
- social-content support and webinar funnel.

### Integration
Follow GeoPlotter/GlenTown Integration Guidelines. Prefer API contracts/events over direct database coupling. RealWise is a primary operating consumer but does not erase GeoPlotter's product/domain boundaries.

## Immediate Gap Register

- [ ] Push/reconcile the reported PASS 0I branch/commit to the canonical GitHub repository or identify the correct remote repository/ref.
- [ ] Run current tests against the actual latest development branch and record commit-bound evidence.
- [ ] Reconcile PASS 0C through PASS 0I artifacts against remote history.
- [ ] Complete foundational domain passes with explicit migration/test receipts.
- [ ] Establish geospatial accuracy/provenance validation gate.
- [ ] Establish inventory concurrency/state-machine gate.
- [ ] Implement CRM/routing operations.
- [ ] Define RealWise operational pilot contract.
- [ ] Complete security/privacy/legal review.
- [ ] Define production deployment architecture and backup/recovery controls.

## Validation Gates

1. Canonical repository synchronization gate.
2. Database migration and tenant-isolation gate.
3. Inventory lifecycle/concurrency gate.
4. Geospatial accuracy/provenance gate.
5. Document/OCR human-verification gate.
6. CRM/routing integration gate.
7. RealWise operational pilot gate.
8. Security/privacy/legal gate.
9. Production deployment/readiness gate.

## Evidence Rule

Local agent/checkpoint reports are valuable working evidence but are not equivalent to canonical repository evidence. A capability is `VERIFIED` only when the implementation, tests and relevant migrations/runtime checks can be tied to a canonical commit/ref.
