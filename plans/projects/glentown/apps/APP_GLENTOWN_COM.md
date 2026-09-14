# app.glentown.com — GlenTown App Website

**Status:** IMPLEMENTATION IN PROGRESS / MULTI-PAGE IA RECONCILIATION  
**Surface:** `https://app.glentown.com`  
**Role:** Public product, download, Beta, and acquisition website for GlenTown.  
**Not the consumer web app:** `glentown.com` remains the GlenTown Web experience.  
**Detailed planning package:** `./glentown-app-site/README.md`

## 1. Purpose

`app.glentown.com` is the canonical public website for GlenTown as an installable/downloadable application and connected **Digital Town** product. It explains the product, presents capabilities and audience-specific stories, provides trusted access/download paths, communicates Beta/rollout status, surfaces current survey/feedback opportunities, and routes users to Web, support, privacy, legal, business, and developer destinations.

Public marketing copy should use **Digital Town** rather than `DTOS` / `Digital Town Operating System`.

## 2. Current Implementation State

A dedicated implementation repository exists at `glenpilapil/GlenTown-App-Site`.

Latest verified implementation checkpoint reported before this planning reconciliation:

- branch: `feat/v1-typography-hero`
- SHA: `723264018a7b15721b9de95ab5e281bb9da1f910`
- lint: PASS
- typecheck: PASS
- tests: 13/13 PASS
- build: PASS
- local/remote SHA match: verified
- physical/human visual audit: OPEN

The previous one-page-only consolidation is now superseded by a connected multi-page information architecture. Existing one-page work remains useful as design/content material but is not the final site architecture.

## 3. Approved Site Architecture

### Global Header

Target desktop structure:

`Logo | Home | Features ▾ | Beta | Download | Open Web App | Theme`

Features submenu:

- For Tourists
- For Residents
- For Organizations
- For Developers

Theme control belongs in Header, not Footer.

Hero uses:

- Join the Beta
- Learn More

`Open Web App` is a persistent Header utility action rather than a Hero CTA.

### Primary Routes

- `/` — Home story + summaries
- `/features` — complete capability hub
- `/features/tourists`
- `/features/residents`
- `/features/organizations`
- `/features/developers`
- `/beta`
- `/download`

Developer/partner registration interest uses a modal rather than a standalone form route.

## 4. Home Role

Home tells the persuasive GlenTown story and summarizes deeper content rather than containing every feature.

Recommended narrative:

1. Header / navigation
2. Hero
3. Why GlenTown / local-life fragmentation
4. real-life editorial stories
5. Discover / Connect / Get Things Done
6. concise Features summary
7. concise Digital Town summary
8. Trust / product proof
9. concise Beta summary
10. concise Download summary
11. FAQ where useful
12. compact final CTA
13. Footer

## 5. Features Scope

The Digital Town story must be broader than the planner/orchestration layer.

Relevant capability families include:

- Community / participation / messaging
- current Explore taxonomy: Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory
- Pre-Loved / commerce / orders / bookings where supported
- reviews / reputation / Trust & Verification
- Personal Timeline
- private Diary
- Memory Albums
- Day Planner
- Trip Planner
- Event Planner
- Financial Planner
- Achieve
- businesses / organizations
- government/civic-service integration
- shared platform/developer capabilities

Current-vs-future maturity must remain explicit and truthful.

## 6. Audience Features Pages

Every audience page requires both feature groups and a story section showing connected capabilities in practice.

### Tourists

Story direction:
`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`

### Residents

Story direction:
`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`

### Organizations

The underlying taxonomy remains Organizations, but public marketing focus is business organizations first.

Story direction:
`Establish your presence -> Get discovered -> Receive an inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`

### Developers

Story direction:
`Register interest -> Approved access when available -> Use shared capabilities -> Build a specialized experience -> Respect domain authority`

Do not imply unrestricted API access.

## 7. Government / Civic Integration

Government services are a major Digital Town direction.

The site may explain integration with authoritative government information/services, requirements, planning, identity/verification, messaging, payments/reporting, and related workflows where authorized and implemented.

Government systems remain authoritative. GlenTown must not imply government authority or endorsement.

High-priority interoperability references include approved DICT eGov ecosystem capabilities such as eGov SSO, eVerify/PhilSys, eMessage, eGovPay, liveness, citizen reports, and DBM Compass, subject to access and implementation truth.

## 8. Geography / Beta

Approved public framing:

- Palawan is the Day-1 supported pilot province.
- Puerto Princesa is the deepest initial concentration / operational-density market.
- Other Palawan locations may be supported from Day 1 while local supply/feature depth varies.
- Nationwide registration/selected capabilities may coexist with staged local depth.

`/beta` must include a current Survey Forms / `Help shape GlenTown` section using only verified active form URLs.

## 9. Download

`/download` is the authoritative release/access page and must cover:

- Android
- iOS
- Windows
- Web

Windows is represented as planned/in development until an authoritative package/source exists. No false Windows download action is permitted.

Release/download actions remain configuration-driven.

## 10. Product Truth / Evidence Rules

Do not fabricate:

- app-store or Windows artifacts
- downloads/users
- ratings/reviews/testimonials
- social proof
- partner logos/endorsements
- government endorsement
- merchant/provider density
- unrestricted API availability
- scarcity/waitlist urgency

Future capability direction must not be promoted as current release truth.

## 11. UI/UX Cross-Check Authority

The detailed `GLENTOWN_APP_SITE_IMPLEMENTATION_PLAN.md` and `GLENTOWN_APP_SITE_ACCEPTANCE_CRITERIA.md` under `./glentown-app-site/` are the primary requirements against which the next human UI/UX audit should be cross-checked.

Engineering PASS does not equal visual PASS.

## 12. Immediate Next Actions

1. reconcile repository-local docs with the updated TownBoss package;
2. restore shared Header/nav/theme control;
3. recompose Home around story + summaries;
4. implement/restore dedicated Features/Beta/Download routes and audience subroutes;
5. implement audience story sections;
6. implement developer-interest modal;
7. update Beta geography/surveys;
8. add Windows release surface truthfully;
9. run engineering validation;
10. perform desktop/tablet/mobile human visual audit against the implementation plan and acceptance criteria;
11. do not checkpoint as visually accepted until the cross-check passes.