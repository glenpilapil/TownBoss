# GlenTown App Site Current State

**Status date:** 2026-09-14  
**Overall:** IMPLEMENTED FOUNDATION / MULTI-PAGE IA RECONCILIATION APPROVED / HUMAN VISUAL AUDIT OPEN

## Repository

- Implementation repo: `glenpilapil/GlenTown-App-Site`
- Local path: `D:\Projects\GlenTown\GlenTown-App-Site`
- Latest verified implementation checkpoint reported: `723264018a7b15721b9de95ab5e281bb9da1f910`
- Branch: `feat/v1-typography-hero`
- Local/remote checkpoint equality was verified before the current documentation reconciliation.
- Engineering validation at that checkpoint: lint PASS, typecheck PASS, tests 13/13 PASS, build PASS, `git diff --check` PASS.
- Physical/human visual audit remains OPEN.

## Current Strategic Change

The one-page-only experiment is superseded.

Approved site architecture is now a connected multi-page product website:

- Home — narrative + concise summaries
- Features — complete capability hub
- For Tourists
- For Residents
- For Organizations
- For Developers
- Beta
- Download

The change responds to the fact that GlenTown genuinely spans multiple connected domains; the website should reveal that breadth through clear routes and shared navigation rather than compressing all detail into one very long page.

## Header / Navigation Decision

Restore a global Header with:

`Logo | Home | Features ▾ | Beta | Download | Open Web App | Theme`

Features submenu:

- For Tourists
- For Residents
- For Organizations
- For Developers

Theme controls move from Footer back to Header.

Hero CTA becomes:

- Join the Beta
- Learn More

`Open Web App` returns to Header as a persistent utility action.

## Public Terminology

- Public marketing uses `Digital Town`.
- Do not use `DTOS` / `Digital Town Operating System` in public App Site copy.
- Current Explore labels:
  - Products
  - Foods
  - Services
  - Tourism
  - Events
  - Jobs
  - Properties
  - Suppliers
  - Directory
- `Achieve` remains the approved public name.

## Digital Town Scope Correction

The Digital Town must not be reduced to orchestration/planners.

Current documentation now requires representation, where truthful, of:

- Community / participation / messaging
- Explore categories / local economy / transactions
- Trust & Verification / reviews / reputation
- Personal Timeline
- private Diary
- Memory Albums
- Day Planner
- Trip Planner
- Event Planner
- Financial Planner
- Achieve
- business organizations and business participation
- government/civic-service integration
- shared platform/developer integration capabilities

Timeline/Diary/Memory privacy distinctions must remain accurate.

## Government / Civic Services

Government-service interoperability is now an explicit App Site requirement.

Public content should explain that GlenTown can progressively connect users to authoritative government information/services and help with requirements, planning, verification, messaging, payments/reporting where authorized.

Government systems remain authoritative. Planned or approved DICT eGov integrations must not be represented as government endorsement or as already live without evidence.

## Audience Pages / Story Requirement

Every Features audience page must include an audience-specific story showing connected capabilities in practice.

Approved story directions:

### Tourists

`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`

### Residents

`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`

### Organizations

Business organizations are the primary marketing focus.

`Establish your presence -> Get discovered -> Receive an inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`

### Developers

`Register interest -> Approved access when available -> Use shared capabilities -> Build a specialized experience -> Respect domain authority`

Developer/partner registration interest uses an accessible modal rather than a dedicated form page.

## Geography / Beta Decision

Public pilot language is updated:

- Palawan is the Day-1 supported pilot province.
- Puerto Princesa is the deepest initial concentration / operational-density market.
- Other Palawan locations may be supported from Day 1, while feature depth and local supply vary by readiness.
- Nationwide access/registration and selected capabilities may coexist with staged local depth.

Beta must include a Survey Forms / `Help shape GlenTown` section using only current authoritative form URLs.

## Download Decision

Download must cover:

- Android
- iOS
- Windows
- Web

Windows is roadmap/in-development until a real authoritative package/distribution source exists.

No false Windows download button is permitted.

## Documentation Status

TownBoss App Site planning package updated on 2026-09-14 to reflect the new IA and UI/UX requirements:

- Implementation Plan — updated
- Product Specification — updated
- Decisions and Rules — updated
- Acceptance Criteria — updated
- Architecture — updated
- Current State — updated

Parent `APP_GLENTOWN_COM.md` and project Memory should also remain aligned with these decisions.

## Immediate Next Gate

Before implementation resumes:

1. reconcile repository-local documentation with the updated TownBoss package;
2. implement the shared Header/navigation/theme relocation;
3. recompose Home to story + summaries;
4. restore/build dedicated Features/Beta/Download routes and new audience routes;
5. implement audience story sections;
6. implement developer-interest modal;
7. reconcile Palawan/Survey/Windows release presentation;
8. run full engineering validation;
9. perform human desktop/tablet/mobile visual audit against `GLENTOWN_APP_SITE_IMPLEMENTATION_PLAN.md` and `GLENTOWN_APP_SITE_ACCEPTANCE_CRITERIA.md`;
10. do not claim UI/UX acceptance until the cross-check passes.

## Blockers / Attention

- Current survey URLs must be verified before public rendering.
- Current minimum OS requirement strings remain release-verification items.
- Windows must remain non-downloadable until authoritative distribution exists.
- Government integration claims require implementation/access evidence.
- Current screenshots remain replaceable and should be disregarded as structural authority during the next visual audit.
- Do not fabricate social proof, app-store availability, partner status, government endorsement, API availability, or rollout density.