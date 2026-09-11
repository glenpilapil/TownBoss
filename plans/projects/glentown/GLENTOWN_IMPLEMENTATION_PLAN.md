# GlenTown Implementation Plan

**Portfolio:** TownBoss  
**Current state:** ACTIVE DEVELOPMENT / substantial implementation verified  
**Evidence reconciliation:** 2026-09-12  
**Pilot:** Puerto Princesa City, Palawan  
**Rollout:** Nationwide access with capability/readiness-based availability and nationwide pre-Beta seeding.

## 1. Product Scope

GlenTown is the Digital Town Operating System for residents, businesses, professionals and local discovery/transactions. The MVP/near-term product includes community/social, pre-loved, marketplace, services, food, messaging, reviews, orders/checkout, seller/business experiences, geographic discovery and shared orchestration-based planners.

## 2. Repository AS-IS Baseline

### Backend — `glenpilapil/GlenTown-API`

Repository evidence confirms the Laravel API has progressed materially beyond the earlier baseline.

**IMPLEMENTED / repository-evidenced:**

- Identity and Access API foundation, including registration/login/logout, password recovery, email verification, profile/password/token management and rate-limiting controls.
- PostgreSQL migration/checkpoint work previously completed; fresh full-suite execution is still required before treating historical pass counts as current.
- Accommodation availability and booking orchestration with transaction/locking, server-authoritative pricing and authorization/tenancy controls.
- Geographic/event discovery filtering.
- Community taxonomy/feed filtering, including viewer-scoped following feeds and explicit feed-filter contracts.
- Versioned Community Advisory acknowledgement persistence/API.
- Organization setup/actor discovery and bounded self-employment enrollment contracts.
- Messaging backend foundation merged into the main API history at `c90a643`, building on `5d38926`: direct messages, groups, chatrooms, requests, participant management, acting-identity safeguards and participant-resource contracts.
- Messaging contract alignment includes conversation detail, participant mute state and send-idempotency persistence.

**Historical verification evidence:**

- A prior checkpoint reported 1074 passing Laravel tests / 3235 assertions.
- The Identity & Access implementation commit recorded 340 tests / 1050 assertions at that earlier stage.

These counts are historical evidence only. A fresh full test run against current default-branch HEAD remains a release gate.

### Flutter application — `glenpilapil/GlenTown-App`

**IMPLEMENTED / repository-evidenced:**

- Riverpod application architecture.
- Android/iOS primary targets with adaptive web/Windows work previously merged.
- Explore/location-scope and adaptive-layout implementation.
- Commerce/service trust flows from prior implementation passes.
- Trip Planner real-API integration merged by PR #15 (`e83c961`), including authoritative repository mapping and integration tests.
- Event discovery/planning real-API integration merged by PR #16 (`fa15502`), replacing synthetic event state with authoritative API data and contract tests.
- Financial Planner real-API integration merged by PR #17 (`9ff2443`), including domain models, API repository, planner route/screen, nationwide Home entry and mutation/mapping tests.

**Historical verification evidence:**

- A recorded checkpoint reported 369/369 Flutter tests passing with `flutter analyze` at zero issues.

That test/analyzer result predates later integrations and must be rerun at current HEAD. Physical-device onboarding/auth UX and connectivity remain active Beta-readiness work.

## 3. Status Reclassification of Major Product Directions

| Capability | Current classification | Evidence note |
|---|---|---|
| Trip Planner | IMPLEMENTED; current verification pending | Real API integration merged in GlenTown-App PR #15 |
| Event Planner / Events | IMPLEMENTED; current verification pending | Real API integration merged in PR #16 |
| Financial Planner | IMPLEMENTED; current verification pending | Real API integration merged in PR #17 |
| Messaging backend | IMPLEMENTED; current verification pending | Foundation merged in GlenTown-API `c90a643` |
| Community advisory acknowledgements | IMPLEMENTED | API/model/test history present |
| Organization actor/setup discovery | IMPLEMENTED | API/model/test history present |
| Day Planner | DECIDED / PLANNED unless newer repository evidence is found | Requires reconciliation |
| Achieve | DECIDED / PLANNED unless newer repository evidence is found | Requires reconciliation |
| Glen AI / Ask Glen | DECIDED / PLANNED | TownBoss architecture exists; GlenTown production implementation must be evidenced separately |
| Government-service adapters | DECIDED / PLANNED | Production access/integration evidence required |
| Nationwide pre-Beta seeding | ACTIVE WORKSTREAM | Seed/readiness evidence must be tracked by province |
| PMS multi-unit evolution | DECIDED / PLANNED unless newer repo evidence is found | Requires domain/repo reconciliation |
| Transport/transfers and event-venue/rentals | DECIDED / PLANNED | Requires implementation evidence |

## 4. Deployable Application Registry

| Surface | Purpose | Plan |
|---|---|---|
| Android/iOS GlenTown | Primary downloadable consumer app | `apps/GLENTOWN_MOBILE.md` |
| `glentown.com` | Consumer Flutter Web platform | `apps/GLENTOWN_WEB.md` |
| `app.glentown.com` | Downloadable-app product/download website | `apps/APP_GLENTOWN_COM.md` |
| `biz.glentown.com` | Business/provider portal | `apps/BIZ_GLENTOWN_COM.md` |
| `admin.glentown.com` | Administrative portal | `apps/ADMIN_GLENTOWN_COM.md` |
| `api.glentown.com` | Laravel production API host | `apps/API_GLENTOWN_COM.md` |
| `help.glentown.com` | Help Center/support knowledge | `apps/HELP_GLENTOWN_COM.md` |
| `dev.glentown.com` | Developer/API portal | `apps/DEV_GLENTOWN_COM.md` |

`glentown.com` is canonical; `www.glentown.com` redirects to it.

## 5. Immediate Gap Register

### Beta readiness

- [ ] Fresh current-HEAD Laravel test suite and database verification.
- [ ] Fresh current-HEAD Flutter analyzer/test suite.
- [ ] Auth/connectivity reliability on physical Android device.
- [ ] Onboarding/auth visual corrections using official brand assets.
- [ ] Comprehensive realistic demo-data seeding and claimable-business semantics.
- [ ] Messaging end-to-end frontend/backend physical-device verification.
- [ ] Trip/Event/Financial Planner end-to-end regression pass after real-API integrations.
- [ ] Commerce/order/payment/deposit boundary audit.
- [ ] Nationwide location/data readiness and Province Ready scoring/seeding.
- [ ] Accessibility/responsive/edge-case review.
- [ ] Security/privacy/compliance gate.
- [ ] Final physical-device visual audit.

### Shared application platform

Define/reconcile reusable packages/services for:

- GlenTown design system and Lucide icon policy;
- identity/session/auth clients;
- API client/contracts;
- location/geographic entities;
- localization;
- ISO currency/money representation;
- analytics/telemetry;
- feature flags/experimentation;
- error/reporting conventions.

Shared code must not force every surface into Flutter when SEO/content/documentation requirements favor another stack.

## 6. Release Gates

1. Current-state repository test/audit gate.
2. API contract and authorization verification.
3. Flutter analyzer/test gate.
4. Critical journey integration tests.
5. Responsive/browser verification for web.
6. Android/iOS physical-device verification.
7. Security/privacy/compliance gate.
8. Seed/readiness gate for nationwide Beta.
9. Production deployment verification.

## 7. Evidence Rule

Repository commit history proves implementation existence, not current runtime correctness. `VERIFIED` status requires fresh test/build/runtime evidence tied to a specific commit or release candidate.
