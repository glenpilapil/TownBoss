# GlenTown App Site Product Specification

**Status:** ACTIVE  
**Surface:** `https://app.glentown.com`  
**Repository:** `GlenTown-App-Site`

## 1. Product Role

The GlenTown App Site is the public product, acquisition, release-status, trusted-download, Beta-participation, and product-explanation website for GlenTown. It is not the authenticated GlenTown consumer web application; `glentown.com` remains the consumer Web surface.

The site must present GlenTown as one connected **Digital Town** whose capabilities span local discovery, participation, commerce, memories, planning, businesses, trusted identity, government/civic access, and platform integrations.

Public marketing copy should use **Digital Town**. Do not use `DTOS` or `Digital Town Operating System` in public-facing site copy unless later explicitly approved.

## 2. Primary Jobs

The site must help a visitor quickly understand:

1. what GlenTown is;
2. why it is useful in everyday local life;
3. how its connected capabilities fit together;
4. what capabilities matter to a Tourist, Resident, Business Organization, or Developer/Partner;
5. how GlenTown differs from a single-purpose marketplace, directory, social network, tourism site, or planner;
6. what is available now, in Beta, rolling out, or directional;
7. how Palawan Day-1 support and Puerto Princesa's deepest initial concentration relate to broader nationwide access;
8. how to join Beta, access current surveys, download supported clients, use GlenTown on the Web, and reach support/legal destinations.

## 3. Product Truth

Marketing must distinguish verified release truth from strategic direction.

Never fabricate or imply:

- app-store availability;
- Windows package availability;
- download counts;
- ratings;
- testimonials;
- partner endorsements;
- active-user statistics;
- merchant/provider density;
- government endorsement;
- unrestricted API access;
- artificial scarcity or waitlists.

Release/download CTAs must remain configuration-driven and fail safely when an authoritative URL/artifact is absent.

Government integration must be described as connection to or interoperability with authoritative government systems; GlenTown must not imply that it replaces government databases or exercises government authority.

## 4. Core Audience

Primary audiences include:

- Residents/citizens and everyday local participants;
- Tourists/visitors;
- local businesses, MSMEs, merchants, service providers, professionals, employers, tourism businesses, and other economically active organizations;
- Developers/business partners building approved specialized experiences on shared GlenTown capabilities.

The product has a broader general organization model, but the public `For Organizations` page is business-first.

## 5. Geography and Rollout

Approved public rollout framing:

- **Palawan is the Day-1 supported pilot province.**
- **Puerto Princesa is the deepest initial concentration and operational-density market.**
- Other Palawan locations may be supported from Day 1, but feature depth, local supply, and operational readiness can differ by location.
- Nationwide registration and selected capabilities may coexist with staged local depth outside Palawan.

Do not imply equal commercial density everywhere.

## 6. Information Architecture

Approved core routes:

- `/` — narrative Home, with concise summaries of Features, Beta, and Download.
- `/features` — complete capability hub.
- `/features/tourists` — Tourist feature + story page.
- `/features/residents` — Resident feature + story page.
- `/features/organizations` — business-organization feature + story page.
- `/features/developers` — Developer/Partner feature + integration-story page.
- `/beta` — Beta scope, access, surveys, expectations, and rollout context.
- `/download` — authoritative release-state and official access/distribution paths.

Developer/partner registration interest is handled by an accessible modal, not a separate registration page.

## 7. Global Navigation

Desktop target:

`Logo | Home | Features ▾ | Beta | Download | Open Web App | Theme`

Rules:

- Logo -> `/`.
- Features itself links to `/features`.
- Features submenu contains Tourists, Residents, Organizations, Developers.
- `Open Web App` is a persistent header utility action and points to the authoritative Web destination.
- Theme control lives in Header, not Footer.
- Desktop active route = active text + underline; preserve `aria-current`.
- Mobile navigation must remain accessible; Features remains expandable.

## 8. Homepage Narrative

Home is persuasive and concise, not exhaustive.

It should include, as appropriate:

- Header / navigation;
- Hero with `Join the Beta` and `Learn More`;
- Why GlenTown / fragmented local-life problem;
- real-life editorial stories;
- Discover / Connect / Get Things Done;
- concise Features summary -> `/features`;
- concise Digital Town summary;
- Trust & Verification / product proof;
- concise Beta summary -> `/beta`;
- concise Download summary -> `/download`;
- FAQ where useful;
- compact final CTA;
- Footer.

`Open Web App` should not compete in Hero; it belongs in Header and Download-related surfaces.

## 9. Features Overview

`/features` must be comprehensive enough to represent the Digital Town, while using progressive disclosure and availability semantics.

### 9.1 Explore Categories

Use current taxonomy:

- Products
- Foods
- Services
- Tourism
- Events
- Jobs
- Properties
- Suppliers
- Directory

Superseded labels such as `Shopping`, `Food & Dining`, and `Travel & Tours` must not return.

### 9.2 Capability Families

Public capability presentation should cover the connected model, including:

- Community / participation / messaging;
- Explore categories and local discovery;
- products, Pre-Loved, Foods, Services, orders/bookings/checkout where supported;
- reviews, reputation, Trust & Verification;
- Personal Timeline;
- private Diary;
- Memory Albums;
- Day Planner;
- Trip Planner;
- Event Planner;
- Financial Planner;
- Achieve;
- businesses and organization participation;
- government/civic-service discovery and authorized integrations;
- shared platform/developer capabilities where appropriate.

The Digital Town must not be reduced to the planner/orchestration features alone.

## 10. Audience Feature Pages

Every audience page must contain:

1. audience-specific feature groups;
2. an outcome-focused **story section** showing how multiple features connect in practice;
3. trust/availability notes where relevant;
4. a suitable CTA.

### 10.1 For Tourists

Primary story:

`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`

Focus on Tourism, Foods, Events, places/stays where supported, Products, local services/transport where supported, reviews/trust, Trip Planner, bookings, and memories.

### 10.2 For Residents

Primary story:

`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`

Represent multi-role identity and relevant Community, Products, Foods, Services, Jobs, Properties, Directory, Events/Tourism, messaging, trust, planners, Timeline/Diary/Memories, government/civic access, and goal/learning/economic pathways.

### 10.3 For Organizations

Marketing focus is **business organizations first**.

Primary story:

`Establish your presence -> Get discovered -> Receive an inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`

Represent current business-facing capabilities accurately; future workforce/CRM/analytics/operations capabilities require explicit maturity labeling.

### 10.4 For Developers

Primary story:

`Register interest -> Approved access when available -> Use shared GlenTown capabilities -> Build a specialized experience -> Respect domain authority and integration boundaries`

Do not imply unrestricted API access.

A modal form handles developer/partner interest. It must be accessible, validated, anti-abuse-ready before production, and must not promise immediate credentials.

## 11. Digital Town Scope

The public Digital Town idea should connect at least these dimensions:

- local discovery and participation;
- commerce and local economy;
- messaging and trusted interactions;
- personal history and memories;
- planning and goal execution;
- businesses and organizations;
- government/civic-service access and interoperability;
- shared platform services and approved ecosystem integrations.

### 11.1 Government Integration

Government-service integration is a first-class strategic story, subject to truth and availability.

Where authorized and production-ready, GlenTown may connect to authoritative systems/adapters such as DICT eGov ecosystem capabilities including eGov SSO, eVerify/PhilSys, eMessage, eGovPay, liveness, citizen reports, and DBM Compass.

Public copy must make clear:

- government systems remain authoritative;
- availability depends on approved integration/access;
- GlenTown can help users discover requirements, prepare, plan errands/appointments, and navigate official services;
- planned integration is not government endorsement.

## 12. Beta

`/beta` is the definitive Beta participation page.

It should cover:

- Palawan Day-1 support;
- Puerto Princesa deepest initial concentration;
- nationwide access / local depth;
- capability-based rollout;
- expectations of Beta participants;
- audience participation paths;
- feedback/reporting;
- `Help shape GlenTown` Survey Forms section with only current authoritative survey links.

## 13. Download

`/download` is the single source of acquisition truth.

Present four access surfaces:

- Android
- iOS
- Windows
- Web

Windows must appear because Windows deployment is planned/in development, but must remain non-downloadable until an authoritative artifact/source exists.

The page may include Version, Requires, Updated, platform status, official-source integrity guidance, and Help links where authoritative.

## 14. Media Strategy

The site must not become a wall of screenshots or cards. Use the medium appropriate to the story:

- real local-life photography;
- verified current-build screenshots;
- device frames only where useful;
- raw screenshot crops/UI fragments;
- iconography;
- typography;
- restrained illustrations/decorative graphics;
- story sequences on audience pages;
- horizontal gallery/lightbox for deeper product inspection.

Official GlenTown logos must be used unchanged. Current screenshots are replaceable audit-era assets and may be refreshed later.

## 15. Theme and Device Presentation

- Default theme follows system preference.
- User can select System / Light / Dark.
- Preference persists.
- Theme controls live in Header.
- Footer does not duplicate theme controls.
- Device-frame rules remain governed by accepted GlenTown presentation rules; do not distort screenshot geometry.

## 16. Non-Goals

The App Site is not:

- an authenticated GlenTown client;
- an administration portal;
- a pricing/subscription marketing site;
- a testimonial/social-proof site before evidence exists;
- a replacement for Help Center;
- a full developer documentation portal;
- a government portal;
- a promise that every roadmap feature is already available.

## 17. Success Standard

A successful site is truthful, coherent across routes, visually polished, fast, accessible, responsive, release-aware, and clearly recognizable as GlenTown.

The Home page must tell one story; supporting pages must deepen that story without feeling like unrelated microsites.

Engineering correctness and human visual acceptance remain independent gates.