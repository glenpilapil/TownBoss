# glentown.com — Consumer Flutter Web Implementation Plan

**Status:** PARTIALLY IMPLEMENTED / web-adaptive foundations exist; production readiness requires reconciliation.

## Mission

Deliver the actual GlenTown consumer platform on the web, not a marketing shell. `glentown.com` is canonical and `www.glentown.com` redirects to it.

## Implementation

### Phase 0 — Reconcile current Flutter Web capability
- Verify the current web build succeeds from GlenTown-App HEAD.
- Inventory unsupported or mobile-only plugins and flows.
- Audit adaptive breakpoints, navigation, dialogs, overlays, forms, and media.
- Confirm deep-link and router behavior.

### Phase 1 — Web application foundation
- Configure the production service environment.
- Define browser sign-in and session behavior.
- Review web security headers and browser data handling.
- Define URL and deep-link models for posts, listings, places, events, profiles, and planners.
- Implement error, 404, offline, and loading states.

### Phase 2 — Responsive UX
- Desktop, tablet, and mobile-web navigation.
- Keyboard and focus accessibility.
- Pointer and hover states.
- Large-screen information density without stretching mobile layouts.
- Image and media performance.

### Phase 3 — Web discoverability
Flutter Web SEO limitations must be explicitly evaluated. Public discovery pages may require server-rendered or pre-rendered companion pages or another indexing strategy while signed-in interactive experiences remain Flutter.

### Phase 4 — Production gate
- browser matrix;
- Lighthouse and performance baseline;
- accessibility audit;
- sign-in and application-security verification;
- analytics and error reporting;
- CDN and deployment validation.
