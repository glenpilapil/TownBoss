# GlenTown Implementation Plan

**Portfolio:** TownBoss  
**Current state:** ACTIVE DEVELOPMENT / substantial implementation evidenced  
**Evidence reconciliation:** 2026-09-12  
**Pilot:** Puerto Princesa City, Palawan  
**Rollout:** Nationwide access with capability/readiness-based availability and nationwide pre-Beta seeding.

## 1. Product Scope

GlenTown is the Digital Town Operating System for residents, businesses, professionals and local discovery/transactions. The MVP/near-term product includes community/social, pre-loved, marketplace, services, food, messaging, reviews, orders/checkout, seller/business experiences, geographic discovery and shared orchestration-based planners.

## 2. Repository AS-IS Baseline

### Backend — `glenpilapil/GlenTown-API`

**Canonical default branch:** `master`  
**Current default-branch HEAD:** `5d9f812` — organization setup/actor-discovery merge.

**IMPLEMENTED on canonical `master` / repository-evidenced:**

- Identity and Access API foundation.
- PostgreSQL migration/checkpoint work from prior verified passes.
- Accommodation availability and booking orchestration.
- Geographic/event discovery filtering.
- Community taxonomy/feed filtering and viewer-scoped following feeds.
- Versioned Community Advisory acknowledgement persistence/API.
- Organization setup/actor discovery and bounded self-employment enrollment.

**IMPLEMENTED in repository history but NOT YET ON CURRENT DEFAULT-BRANCH HEAD:**

- Messaging backend foundation at `5d38926`, with later integration commit `c90a643`.
- Messaging participant/mute/idempotency and Flutter-contract alignment work.

The Messaging code therefore exists in the repository, but it must not be described as merged into current `master` until its lineage is integrated and verified there.

**Historical verification evidence:**

- Prior checkpoint: 1074 Laravel tests / 3235 assertions passing.
- Identity & Access implementation checkpoint: 340 tests / 1050 assertions at that stage.

These are historical results only. The connected GitHub status/PR-workflow lookup exposes no fresh current-HEAD CI receipt, so a full local/CI suite tied to `5d9f812` or its successor remains required.

### Flutter application — `glenpilapil/GlenTown-App`

**Canonical default branch:** `main`  
**Current default-branch HEAD:** `9ff2443` — Financial Planner real-API merge.

**IMPLEMENTED on canonical `main`:**

- Riverpod application architecture.
- Android/iOS primary targets with adaptive web/Windows work from prior passes.
- Explore/location-scope and adaptive-layout implementation.
- Commerce/service trust flows from prior implementation passes.
- Trip Planner real-API integration merged by PR #15 (`e83c961`).
- Event discovery/planning real-API integration merged by PR #16 (`fa15502`).
- Financial Planner real-API integration merged by PR #17 (`9ff2443`).

**Historical verification evidence:**

- Earlier checkpoint: 369/369 Flutter tests passing and `flutter analyze` with zero issues.

That result predates later integrations. No fresh current-HEAD CI receipt is exposed through the connected GitHub status lookup, so analyzer/tests must be rerun at `9ff2443` or a newer release candidate. Physical-device onboarding/auth corrections discussed after September 4 are not evidenced on current `main` and must be reconciled before being classified implemented.

## 3. Status Reclassification

| Capability | Current classification | Evidence note |
|---|---|---|
| Trip Planner | IMPLEMENTED on current Flutter `main`; fresh verification pending | PR #15 |
| Event Planner / Events | IMPLEMENTED on current Flutter `main`; fresh verification pending | PR #16 |
| Financial Planner | IMPLEMENTED on current Flutter `main`; fresh verification pending | PR #17 / current HEAD |
| Messaging backend | IMPLEMENTED on non-default repository history; DEFAULT-BRANCH INTEGRATION PENDING | `5d38926` / `c90a643` not on current `master` |
| Community advisory acknowledgements | IMPLEMENTED on API `master` | API/model/test history |
| Organization actor/setup discovery | IMPLEMENTED on API `master` | current API HEAD lineage |
| Day Planner | DECIDED / PLANNED unless newer evidence is found | Reconcile before promotion |
| Achieve | DECIDED / PLANNED unless newer evidence is found | Reconcile before promotion |
| Glen AI / Ask Glen | DECIDED / PLANNED | Production implementation requires evidence |
| Government-service adapters | DECIDED / PLANNED | Production integration evidence required |
| Nationwide pre-Beta seeding | ACTIVE WORKSTREAM | Track Province Ready evidence |
| PMS multi-unit evolution | DECIDED / PLANNED unless newer evidence is found | Reconcile before promotion |
| Transport/transfers and event-venue/rentals | DECIDED / PLANNED | Implementation evidence required |

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

`glentown.com` is canonical; `www.glentown.com` should redirect to it.

## 5. Immediate Gap Register

- [ ] Decide/integrate Messaging lineage into canonical API `master`, then run full API suite.
- [ ] Fresh Laravel suite and database verification at canonical HEAD.
- [ ] Fresh Flutter analyzer/test suite at canonical HEAD.
- [ ] Reconcile post-September-4 onboarding/auth changes with Flutter `main`.
- [ ] Auth/connectivity reliability on physical Android device.
- [ ] Comprehensive realistic demo-data seeding and claimable-business semantics.
- [ ] Messaging end-to-end frontend/backend physical-device verification after default-branch integration.
- [ ] Trip/Event/Financial Planner regression pass.
- [ ] Commerce/order/payment/deposit boundary audit.
- [ ] Nationwide location/data readiness and Province Ready scoring/seeding.
- [ ] Accessibility/responsive/edge-case review.
- [ ] Security/privacy/compliance gate.
- [ ] Final physical-device visual audit.

## 6. Release Gates

1. Canonical-branch reconciliation gate.
2. Current-state repository test/audit gate.
3. API contract and authorization verification.
4. Flutter analyzer/test gate.
5. Critical journey integration tests.
6. Responsive/browser verification for web.
7. Android/iOS physical-device verification.
8. Security/privacy/compliance gate.
9. Seed/readiness gate for nationwide Beta.
10. Production deployment verification.

## 7. Evidence Rule

Repository history proves implementation existence. Default-branch ancestry proves canonical integration. `VERIFIED` requires fresh test/build/runtime evidence tied to a concrete canonical ref or release candidate.
