# GeoPlotter Implementation Plan

**Status:** ACTIVE IMPLEMENTATION

## Mission

Geospatial real-estate and development-project platform for parcels, hazards/elevation, project inventory, sales workflows and RealWise operations.

## Architecture baseline

- Laravel/API + Next.js web + Python geospatial service direction.
- PostgreSQL.
- Docker currently constrained on the development machine by virtualization availability; local services must remain independently runnable.

## Implemented checkpoint evidence

Recent PASS 0I checkpoint includes:

- immutable `inventory_status_history`;
- explicit inventory transition rules;
- service-only atomic status transitions;
- PATCH status routes for lots/units;
- tenant/role enforcement and cross-tenant 404 behavior;
- database constraints and migration;
- new HTTP/database tests;
- lifecycle/audit behavior documented.

Status must be revalidated against current repository HEAD before release claims.

## Major workstreams

### Geospatial core
- title/parcel plotting;
- cadastral/geographic base layers;
- hazards and elevation;
- OCR/document extraction with human verification;
- provenance and confidence handling.

### Development projects/inventory
- horizontal phases/blocks/lots;
- vertical buildings/floors/units;
- site-plan polygon generation/import;
- inventory lifecycle/history;
- reservation/payment semantics only after explicit domain design;
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

## Next gates

- [ ] Current repo/test inventory.
- [ ] Complete foundational domain passes.
- [ ] Geospatial accuracy/provenance gate.
- [ ] Inventory concurrency/state-machine gate.
- [ ] CRM/routing implementation.
- [ ] RealWise operational pilot.
- [ ] security/privacy/legal review.
- [ ] production deployment architecture.
