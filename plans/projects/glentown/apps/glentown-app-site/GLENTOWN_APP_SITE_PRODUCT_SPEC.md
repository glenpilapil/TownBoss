# GlenTown App Site Product Specification

**Status:** ACTIVE  
**Surface:** `https://app.glentown.com`  
**Repository:** `GlenTown-App-Site`

## 1. Product Role

The GlenTown App Site is the public product, acquisition, release-status, and trusted-download website for the downloadable GlenTown application. It is not the GlenTown consumer web application; `glentown.com` remains the consumer web surface.

## 2. Primary Jobs

The site must help a visitor quickly understand:

1. what GlenTown is;
2. why it is useful in everyday local life;
3. what major capabilities are available;
4. how GlenTown differs from a single-purpose marketplace, directory, or social network;
5. whether Android/iOS distribution is coming soon, in Beta, or available;
6. how to access the official web experience, support, privacy, and legal destinations.

## 3. Product Truth

Marketing must distinguish current implementation/release truth from roadmap direction. Do not fabricate or imply:

- app-store availability;
- download counts;
- ratings;
- testimonials;
- partner endorsements;
- active-user statistics;
- merchant density;
- verified-provider density;
- government endorsement;
- artificial scarcity or waitlists.

Release/download CTAs must remain configuration-driven and must fail safely when an authoritative URL is absent.

## 4. Core Audience

Primary audiences include Filipino residents, local businesses and micro-SMEs, service providers/professionals, local buyers/sellers, travelers, and people trying to participate in or get things done within their town.

The site should communicate nationwide relevance while accurately identifying Puerto Princesa as GlenTown's deepest operational pilot and density-building market.

## 5. Information Architecture

Approved core routes:

- `/` — concise one-page product story and acquisition surface.
- `/features` — capability detail organized by user intent.
- `/download` — authoritative release-state and official distribution paths.
- `/beta` — Beta scope, access, expectations, and rollout context.

Future routes such as releases, campaign landing pages, and localized pages require explicit approval and content/evidence readiness.

## 6. Homepage Narrative

The homepage may remain a concise one-pager. Quality is measured by clarity, composition, media variety, product truth, and conversion flow—not by number of sections.

The controlled-hybrid direction should cover, as appropriate:

- Header / navigation
- Hero
- Why GlenTown / local-life value
- Community / discovery
- Marketplace / Pre-Loved / food
- Services
- Travel / events / planning
- Messaging / trust where release-ready
- Nationwide access / local depth
- A Closer Look Inside
- Beta / download status
- FAQ
- Final CTA
- Footer

Not every capability requires a separate section. Related stories may be combined to preserve one-page restraint.

## 7. Media Strategy

The site must not become a wall of phone screenshots. Use the medium appropriate to the story:

- real local-life photography;
- verified current-build screenshots;
- device frames only where device context helps;
- raw screenshot crops/UI fragments;
- iconography;
- typography;
- restrained illustrations/decorative graphics;
- horizontal gallery/lightbox for deeper product inspection.

Official GlenTown logos must be used unchanged. Current screenshots are temporary audit-era assets and may be replaced by stronger verified screenshots from later builds.

## 8. Theme and Navigation

- Default theme follows system preference.
- User can select System / Light / Dark.
- Preference persists.
- Desktop active navigation uses active text color plus underline, not a dot.
- `aria-current="page"` remains required.

## 9. Device Presentation

Where a smartphone frame is used, the approved direction is Samsung Galaxy A55-inspired geometry:

- slim contemporary chassis;
- small centered circular punch-hole;
- no notch;
- no Dynamic Island;
- screenshot corner geometry should remain authoritative rather than aggressively clipping screenshots to a generic frame.

Passive device visuals should not use decorative hover rotations/translations that add no interaction value.

## 10. Scrolling Direction

The Sofiyev template's scroll-linked visual effect is useful, but its desktop wheel friction is not.

Target interaction:

- preserve native-feeling page movement;
- selected visual scroll waypoints may smoothly settle to designed resting states;
- stops need not equal section IDs;
- desktop mouse-wheel input must not feel sluggish or require multiple viewport-heights for one sequence;
- precision trackpads should remain close to native scrolling;
- mobile should retain natural swipe/inertia behavior;
- reduced-motion preference disables forced animated progression.

## 11. Non-Goals

The MVP site is not:

- an authenticated GlenTown client;
- an administration portal;
- a pricing/subscription marketing site;
- a testimonial-led social-proof site before evidence exists;
- a replacement for Help Center, developer docs, or GlenTown Web.

## 12. Success Standard

A successful site is truthful, visually polished, fast, accessible, responsive, release-aware, and clearly recognizable as GlenTown. Engineering correctness and visual acceptance are independent gates.