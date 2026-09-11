# RealWise Implementation Plan

**Status:** DECIDED / PLANNED with GeoPlotter integration requirements

## Mission

Operate a scalable Philippine real-estate brokerage and property business using GeoPlotter for geospatial and project-inventory intelligence and GlenTown where appropriate for broader local discovery and services.

## Business and product scope

- For Sale.
- For Rent, including commercial rentals.
- Rent-to-Own structures subject to explicit legal and commercial terms.
- Pasalo / Assume Balance subject to legal and compliance rules.
- development-project inventory and agent sales operations.
- CRM, lead routing, tripping, commissions, and payouts.
- content, blog, social, and webinar acquisition.

## Implementation principle

Do not build a second GeoPlotter inside RealWise. GeoPlotter owns the geospatial and project-inventory capabilities; RealWise owns brokerage operating workflows, branding, customer and agent experience, and business rules that are specifically RealWise.

## Phases

### Phase 0 — Operating model
- canonical roles and permissions;
- lead lifecycle;
- listing and project intake;
- compliance and document checklist;
- commission and payout rules;
- customer communication policy.

### Phase 1 — CRM operations
- leads and customers;
- agent and team routing;
- activities and follow-ups;
- tripping and appointments;
- pipeline dashboards.

### Phase 2 — Inventory integration
- consume GeoPlotter project, lot, and unit availability;
- preserve source-of-truth ownership;
- reservations and status changes through authorized contracts.

### Phase 3 — Marketing and content
- public property and project presentation;
- blog;
- campaign and source attribution;
- webinar and social funnels.

### Phase 4 — Business operations
- commissions;
- payout approval;
- expense and revenue reporting appropriate to brokerage needs;
- avoid uncontrolled ERP scope expansion.
