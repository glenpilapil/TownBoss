# GlenTown Implementation Plan

**Portfolio:** TownBoss  
**Current state:** ACTIVE DEVELOPMENT / substantial implementation verified  
**Pilot:** Puerto Princesa City, Palawan  
**Rollout:** Nationwide access with capability/readiness-based availability and nationwide pre-Beta seeding.

## 1. Product Scope

GlenTown is the Digital Town Operating System for residents, businesses, professionals and local discovery/transactions. The MVP/near-term product includes community/social, pre-loved, marketplace, services, food, messaging, reviews, orders/checkout, seller/business experiences, geographic discovery and progressively the shared orchestration-based planners.

## 2. Verified/Implemented Baseline

### Backend — GlenTown-API

Known verified checkpoint baseline includes:

- Laravel REST API.
- PostgreSQL checkpoint/gate completed.
- Large automated test suite previously reported at 1074 passing / 3235 assertions at the recorded checkpoint.
- Accommodation availability and booking orchestration with transaction/locking, server-authoritative pricing and authorization/tenancy controls.
- Destination event geographic filtering.
- Messaging backend foundation subsequently implemented on `feature/messaging-backend-foundation`, including conversation/message endpoints; this supersedes the earlier audit that found no messaging backend.
- Permission/authorization foundations and seller/business domain capabilities already present across the API.

**Required reconciliation:** rerun repository tests and inventory current HEAD before treating old counts as current.

### Flutter application

Known verified checkpoint baseline includes:

- Riverpod architecture.
- Android/iOS primary targets; adaptive web/Windows work merged.
- Recorded checkpoint: 369/369 Flutter tests passing and `flutter analyze` with zero issues.
- Explore/location scope and adaptive-layout work implemented.
- Commerce/service trust flows implemented in prior feature branches.
- Physical-device onboarding/auth UX remains an active correction area.

**Required reconciliation:** rerun current analyzer/tests and physical-device gate.

## 3. Approved Product Direction Not Automatically Implemented

- Nationwide Day-1 Trip Planner.
- Event Planner.
- Day Planner.
- Financial Planner.
- Achieve.
- Glen AI / Ask Glen.
- Government-service adapters.
- Nationwide pre-Beta data/business seeding.
- PMS multi-unit accommodation evolution.
- Transport/transfers and event-venue/rental ecosystem.
- Omnichannel CRM capabilities where owned by the business platform.

Each requires repository evidence before promotion to IMPLEMENTED.

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

## 5. Shared GlenTown Workstreams

### Beta readiness

- Current repository verification.
- Auth/connectivity reliability on physical devices.
- Onboarding/auth visual corrections and official brand assets.
- Comprehensive demo data seeding.
- Messaging integration verification end-to-end.
- Commerce/order/payment/deposit boundary audit.
- Location readiness and nationwide seeding.
- accessibility/responsive/edge-case review.
- security and privacy review.
- physical-device visual audit final gate.

### Shared application platform

Define reusable packages/services for:

- GlenTown design system and Lucide icon policy;
- identity/session/auth clients;
- API client/contracts;
- location/geographic entities;
- localization;
- currency/ISO money representation;
- analytics/telemetry;
- feature flags/experimentation;
- error/reporting conventions.

Shared code must not force every surface into Flutter when SEO/content/documentation requirements favor another stack.

## 6. Release Gates

1. Current-state repository audit.
2. API contract and authorization verification.
3. Flutter analyzer/test gate.
4. Integration tests for critical journeys.
5. Responsive/browser verification for web.
6. Android/iOS physical-device verification.
7. Security/privacy/compliance gate.
8. Seed/readiness gate for nationwide Beta.
9. Production deployment verification.
