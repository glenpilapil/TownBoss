# GlenTown Capability Boundary Audit — 2026-09-02

**Purpose:** Initial read-only classification of GlenTown as the first implementation source for future TownBoss capabilities.

## Evidence reviewed

The GlenTown API route surface shows implemented authentication, organizations/memberships, geography/location context, community, marketplace, food, events, jobs, services, real estate, trip-planning, cart/checkout, delivery, and other product/domain routes. The current route surface does not contain persisted messaging/conversation endpoints.

Existing GlenTown implementation-status documentation independently distinguishes architectural approval from implementation and records Messaging as planned/frontend mock with the persisted backend absent. It also records Notifications and Media as partial, Credits as planned, and several established domains as implemented or backend-ready.

## Initial classification

### Strong Platform Core candidates already evidenced in GlenTown

- Authentication / Identity & Trust
- Organizations / Memberships / Tenancy foundation
- Authorization infrastructure
- Geography / Location Context
- Audit logging foundation
- portions of Media infrastructure
- portions of Notifications infrastructure

### Platform Core candidates not yet sufficiently implemented

- Messaging — approved/planned, persisted backend absent
- Credits — approved/planned backend
- unified Evidence & Provenance — fragments exist, no portfolio-wide contract yet
- generalized Orchestration Engine — approved direction, requires bounded contract
- Scenario Engine / Constraint Engine — approved direction, not yet a shared implementation
- Glen AI shared foundation — approved direction, not yet extracted

### GlenTown product/domain capabilities that should not be automatically promoted to Platform Core

- Community posts/comments/feed behavior
- Pre-Loved marketplace presentation and rules
- Food-specific listing behavior
- Jobs-specific workflows
- Requests/Demand Matching product semantics
- Trip Planner product experience
- GlenTown-specific real-estate discovery semantics

Some of these may consume or reveal future shared-domain capabilities, but their complete domain models should not be generalized prematurely.

## Boundary risks identified

1. **Architectural approval vs implementation truth.** The registry must never label Messaging or other planned foundations as implemented solely because they are part of the approved Platform Core.
2. **GlenTown semantic leakage.** Shared Identity, Messaging, Payments, Evidence, and Orchestration contracts must not acquire GlenTown-specific marketplace/community/trip concepts.
3. **Premature extraction.** Current evidence supports logical boundaries and registry governance, not a wholesale migration out of GlenTown.
4. **Evidence fragmentation.** GlenTown already contains evidence/audit/trust-related concepts, making Evidence & Provenance the appropriate next design target, but these fragments require reconciliation rather than simple relocation.

## Decision

Do not migrate GlenTown code during this foundation pass. Treat GlenTown as the first implementation source. Establish TownBoss contracts and dependency rules, then extract only when a real second consumer or another extraction trigger exists.

## Next audit target

Perform a focused evidence/provenance inventory across GlenTown models, migrations, services, resources, policies, and relevant tests. Use the findings to design the TownBoss Unified Evidence & Provenance contract without breaking existing GlenTown behavior.
