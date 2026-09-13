# app.glentown.com — GlenTown App Website

**Status:** IMPLEMENTATION IN PROGRESS / VISUAL RECOVERY  
**Surface:** `https://app.glentown.com`  
**Role:** Public product, download and acquisition website for the downloadable GlenTown application.  
**Not the consumer web app:** `glentown.com` remains the GlenTown Flutter Web consumer platform.  
**Detailed planning package:** `./glentown-app-site/README.md`

## 1. Purpose

`app.glentown.com` is the canonical public website for GlenTown as an installable/downloadable application. It explains the app, presents its capabilities, provides trusted download/install paths, communicates Beta/release status, and routes users to support, privacy, legal and web-platform destinations.

The site must be useful before public app-store release. During Beta it can provide approved Android Beta installation/access instructions while clearly distinguishing official builds from future Google Play / Apple App Store distribution.

## 2. Current Implementation State

A dedicated implementation repository now exists at `glenpilapil/GlenTown-App-Site`. The application foundation is implemented and has repeatedly passed its reported engineering checks, including lint, typecheck, tests and production build during earlier checkpoints.

Implemented foundations include:

- Next.js 16 App Router, React, TypeScript and Tailwind CSS 4;
- dedicated `/`, `/features`, `/download` and `/beta` routes;
- centralized release-aware CTA configuration;
- System / Light / Dark theme support;
- metadata, robots and sitemap foundations;
- official GlenTown brand assets and official platform marks;
- real GlenTown application screenshots and approved lifestyle-media derivatives;
- responsive header/footer/navigation and reusable marketing components.

**Visual acceptance is separate from engineering validation.** The current human visual gate is not passed. The project is in a template-led controlled-hybrid visual recovery after the earlier freeform marketing composition failed visual review.

The authoritative current-state, design-authority, audit and evidence details live in `./glentown-app-site/`.

## 3. Architecture Decision

Use a conventional SEO-first web application/site rather than Flutter Web.

Implemented baseline:

- Next.js 16 App Router with TypeScript;
- responsive semantic HTML/CSS with Tailwind CSS 4;
- componentized GlenTown design system/tokens;
- optimized images and verified device screenshots;
- static-first public pages where possible;
- metadata, Open Graph and structured-data support;
- analytics/consent only through an explicit privacy decision;
- Cloudflare-proxied production DNS and HTTPS target;
- deployment independent from `GlenTown-App` and `GlenTown-API`.

No application login is required for the MVP. Authentication should only be introduced when a concrete product need exists, such as authenticated Beta enrollment or device/release management.

## 4. Relationship to Other GlenTown Surfaces

| Destination | Relationship |
|---|---|
| `glentown.com` | "Use GlenTown on the web" / canonical consumer Flutter Web experience |
| Android/iOS GlenTown | Primary product being presented and distributed |
| `help.glentown.com` | Support, installation help, FAQs and troubleshooting |
| `api.glentown.com` | No direct public dependency for basic marketing pages; dynamic release/Beta data may use controlled APIs later |
| `dev.glentown.com` | Developer/integration documentation, not end-user app documentation |
| `biz.glentown.com` | Business portal destination where relevant |

## 5. MVP Information Architecture

### `/` — App home

- GlenTown brand and clear app value proposition.
- Primary Android install/download CTA according to current release state.
- iOS/App Store state when applicable.
- "Use GlenTown on the web" secondary CTA to `glentown.com`.
- Product screenshots/device previews.
- Core capability overview.
- Nationwide availability language while identifying Puerto Princesa as the deepest operational pilot where relevant.
- Trust/safety/privacy summary.
- Support and legal links.

### `/features`

Organize by user intent rather than exposing internal module architecture. Candidate groups:

- Community and local discovery;
- Marketplace, Pre-Loved and Food;
- Services and professionals;
- Travel, events and places;
- Messages and notifications;
- planning/orchestration capabilities as they become release-ready.

Only advertise capabilities that are actually available in the referenced release/Beta channel.

### `/download`

- Current supported distribution channels.
- Android installation path.
- Future Google Play CTA when live.
- Future Apple App Store CTA when live.
- Current version/build identifier when appropriate.
- Minimum supported OS/device guidance.
- Integrity guidance for identifying the official GlenTown build/source.
- Installation troubleshooting link when the canonical Help destination is available.

### `/beta`

- Beta availability and scope.
- Eligibility/access instructions if gated.
- What Beta users should expect.
- Feedback/reporting path.
- Privacy and diagnostic-data disclosure appropriate to the Beta.

This route may be hidden from primary navigation once general availability supersedes Beta.

### `/privacy` and `/terms`

Prefer canonical legal documents/URLs shared across GlenTown when available rather than maintaining conflicting copies.

### `/releases`

Not required for first public deployment. Add only with a reliable release publishing workflow.

## 6. Homepage Content Model

The homepage may remain a concise one-page marketing experience. Current visual implementation must follow the detailed design-authority matrix rather than freeform AI composition.

Recommended narrative remains:

1. Header / navigation.
2. Hero — app value proposition + release-aware CTA.
3. Product/device presentation where useful.
4. "Your town, connected" value story.
5. Local life / discovery.
6. Commerce / services.
7. Planning / travel / community using release-ready capabilities only.
8. Trust/privacy/safety.
9. Screenshot gallery / closer look where it improves understanding.
10. Download/Beta CTA.
11. Footer.

Media should deliberately vary among photography, device presentation, raw/cropped UI, icons, typography and decorative artwork. The site must not devolve into repeated phone mockups.

Official GlenTown brand assets must remain unchanged. Product screenshots should come from verified builds whenever possible and may be refreshed after later physical-device audits.

## 7. Current Visual Design Authority

The approved direction is a **template-led controlled hybrid**:

- `bohd4nx/app-landing` — typography, concise one-page restraint, screenshot gallery/lightbox mechanics and selected structural patterns;
- `sofiyevsr/mobile-app-landing-template` — adapted hero/media composition, photography-led split sections, decorative transitions and scroll-effect study;
- Prooland / Allon / Appilo — premium visual benchmarks;
- GlenTown — authoritative product truth, content, brand, release state and owned/approved media.

Visual sections must name their source-pattern authority. Engineering success does not promote a section to visually accepted status.

## 8. Release-State Model

The site must not assume app-store availability before it exists.

Supported product-level presentation states remain:

- `PRE_BETA`
- `PRIVATE_BETA`
- `PUBLIC_BETA_ANDROID`
- `STORE_RELEASE_ANDROID`
- `STORE_RELEASE_IOS`
- `GENERAL_AVAILABILITY`

The implementation currently uses centralized release configuration and safe URL fallbacks so labels/actions do not fabricate unavailable distribution paths.

## 9. Content and Data Boundaries

The public site may contain static/product-managed content without depending on GlenTown authentication or operational APIs.

If dynamic data is introduced later, it may include public release/version metadata, maintenance advisories, Beta availability and authoritative app-store links. API-backed content must fail gracefully and must not make the marketing site unavailable when operational APIs are degraded.

## 10. SEO, Sharing and Accessibility

MVP requirements remain:

- indexable public pages;
- canonical URLs;
- page-specific titles/descriptions;
- Open Graph/social preview metadata;
- sitemap and robots policy;
- semantic headings and landmarks;
- keyboard-accessible navigation/actions;
- adequate contrast;
- meaningful alt text;
- responsive layouts for phone, tablet and desktop;
- performance budgets for hero/media assets;
- reduced-motion behavior for motion-dependent presentation.

Avoid doorway/location SEO pages until there is useful unique content and a deliberate search strategy.

## 11. Security and Privacy Baseline

- HTTPS only in production.
- Cloudflare-proxied DNS/origin protection consistent with TownBoss policy.
- No secrets embedded in client assets.
- Content Security Policy and appropriate security headers.
- No arbitrary executable download links.
- Official Android distribution links/builds require documented provenance.
- Third-party analytics, pixels or session-replay tools require explicit approval and privacy disclosure.
- Contact/support forms, if introduced, require abuse controls and server-side validation.

## 12. Implementation Phases

### Phase 0 — Foundation

- [x] Establish dedicated repository (`GlenTown-App-Site`).
- [x] Select and implement SEO-first framework (Next.js 16 App Router).
- [x] Establish lint/typecheck/test/build workflow.
- [x] Import approved GlenTown brand assets without modification.
- [x] Establish reusable responsive layout/component foundation.
- [x] Define centralized environment/release-state configuration.
- [ ] Establish preview deployment strategy.

**Engineering gate:** previously reported PASS at multiple checkpoints.  
**Visual gate:** not implied by engineering success.

### Phase 1 — Public MVP

- [x] Home route foundation.
- [x] Features route foundation.
- [x] Download route foundation.
- [x] Beta route foundation.
- [ ] Verify final Help/legal routing.
- [x] Responsive header/footer/navigation baseline.
- [x] SEO/social metadata baseline.
- [ ] Complete final accessibility verification after visual redesign.
- [ ] Production DNS/deployment for `app.glentown.com`.

**Current visual gate:** FAIL / recovery in progress.

### Phase 2 — Release Integration

- [x] Centralized release metadata / CTA decision logic baseline.
- [ ] Configure authoritative app-store badges/links only when real destinations exist.
- [ ] Release notes workflow.
- [ ] Deep-link/install attribution strategy if approved.
- [ ] Optional Beta enrollment workflow.

### Phase 3 — Growth

- [ ] Localized landing content where justified.
- [ ] Campaign-specific landing pages.
- [ ] Referral/deep-link campaigns.
- [ ] Experimentation/feature-flag support where appropriate.
- [ ] Conversion analytics under approved privacy controls.

## 13. Definition of Done for Initial Launch

`app.glentown.com` may be classified DEPLOYED only when:

1. dedicated repository and ownership are established;
2. production build and automated quality checks pass;
3. official branding is used correctly;
4. advertised capabilities correspond to the active release state;
5. download/install CTAs point only to approved official distribution paths;
6. Privacy, Terms and Help destinations are valid;
7. mobile and desktop layouts pass explicit human visual verification;
8. accessibility and metadata checks pass;
9. Cloudflare/DNS/TLS configuration is verified;
10. production URL is smoke-tested after deployment.

`OPERATIONAL` additionally requires a defined owner for content/release updates and a repeatable deployment/release process.

## 14. Current Next Actions

1. Preserve and inspect the dirty local `feat/pass-3-visual-art-direction` working tree; do not destructively reset it.
2. Reconcile the local `README.md` and `docs/APP_SITE_ARCHITECTURE.md` with the TownBoss package and current visual-audit decisions.
3. Capture exact local HEAD/status/diff evidence and rerun engineering validation.
4. Implement only the bounded **V1 Typography + Hero** scope using named reference authorities.
5. Run automated engineering validation.
6. Perform explicit human desktop/mobile visual audit.
7. Do not proceed to subsequent homepage sections until the V1 visual gate passes.
