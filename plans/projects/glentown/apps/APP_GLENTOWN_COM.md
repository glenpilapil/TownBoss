# app.glentown.com — GlenTown App Website

**Status:** APPROVED / READY TO START  
**Surface:** `https://app.glentown.com`  
**Role:** Public product, download and acquisition website for the downloadable GlenTown application.  
**Not the consumer web app:** `glentown.com` remains the GlenTown Flutter Web consumer platform.

## 1. Purpose

`app.glentown.com` is the canonical public website for GlenTown as an installable/downloadable application. It explains the app, presents its capabilities, provides trusted download/install paths, communicates Beta/release status, and routes users to support, privacy, legal and web-platform destinations.

The site must be useful before public app-store release. During Beta it can provide approved Android Beta installation/access instructions while clearly distinguishing official builds from future Google Play / Apple App Store distribution.

## 2. Architecture Decision

Use a conventional SEO-first web application/site rather than Flutter Web.

Recommended baseline:

- TypeScript-based modern web framework with server/static rendering support;
- responsive semantic HTML/CSS;
- componentized GlenTown design system/tokens;
- optimized images and device screenshots;
- static-first public pages where possible;
- metadata, Open Graph and structured-data support;
- analytics/consent added only through an explicit privacy decision;
- Cloudflare-proxied production DNS and HTTPS;
- deployment independent from `GlenTown-App` and `GlenTown-API`.

Do not couple the site to the Flutter application repository. Establish a dedicated repository. Working repository name: `GlenTown-App-Site` unless superseded by an explicit naming decision.

No application login is required for the MVP. Authentication should only be introduced when a concrete product need exists, such as authenticated Beta enrollment or device/release management.

## 3. Relationship to Other GlenTown Surfaces

| Destination | Relationship |
|---|---|
| `glentown.com` | "Use GlenTown on the web" / canonical consumer Flutter Web experience |
| Android/iOS GlenTown | Primary product being presented and distributed |
| `help.glentown.com` | Support, installation help, FAQs and troubleshooting |
| `api.glentown.com` | No direct public dependency for basic marketing pages; dynamic release/Beta data may use controlled APIs later |
| `dev.glentown.com` | Developer/integration documentation, not end-user app documentation |
| `biz.glentown.com` | Business portal destination where relevant |

## 4. MVP Information Architecture

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
- Planning/orchestration capabilities as they become release-ready.

Only advertise capabilities that are actually available in the referenced release/Beta channel.

### `/download`

- Current supported distribution channels.
- Android installation path.
- Future Google Play CTA when live.
- Future Apple App Store CTA when live.
- Current version/build identifier when appropriate.
- Minimum supported OS/device guidance.
- Integrity guidance: how to identify the official GlenTown build/source.
- Link to installation troubleshooting at `help.glentown.com`.

### `/beta`

- Beta availability and scope.
- Eligibility/access instructions if gated.
- What Beta users should expect.
- Feedback/reporting path.
- Privacy and diagnostic-data disclosure appropriate to the Beta.

This route may be hidden from primary navigation once general availability supersedes Beta.

### `/privacy` and `/terms`

Prefer canonical legal documents/URLs shared across GlenTown when available rather than maintaining conflicting copies. Redirect or render canonical content according to the legal publishing architecture.

### `/releases`

Not required for first public deployment. Add when there is a reliable release publishing workflow. Avoid hand-maintained version claims that can become stale.

## 5. Homepage Content Model

Recommended sequence:

1. Header — GlenTown brand, Features, Download, Help, Use on Web.
2. Hero — app value proposition + primary download/Beta CTA.
3. Device/product preview.
4. "Your town, connected" capability overview.
5. Local life/discovery section.
6. Commerce/services section.
7. Planning/travel/community section using only release-ready capabilities.
8. Trust/privacy/safety section.
9. Download CTA.
10. Footer — Help, Privacy, Terms, GlenTown Web, Business, Developers where appropriate.

The site should reuse official GlenTown brand assets unchanged. Product screenshots should come from verified current builds rather than mock screens whenever possible.

## 6. Release-State Model

The site must not assume app-store availability before it exists.

Supported presentation states:

- `PRE_BETA` — product introduction; no public binary CTA.
- `PRIVATE_BETA` — controlled enrollment/access.
- `PUBLIC_BETA_ANDROID` — approved Android Beta distribution with explicit installation guidance.
- `STORE_RELEASE_ANDROID` — Google Play is canonical Android install path.
- `STORE_RELEASE_IOS` — Apple App Store is canonical iOS install path.
- `GENERAL_AVAILABILITY` — normal production acquisition experience.

Release state should be centrally configurable so CTAs, labels and metadata do not drift across pages.

## 7. Content and Data Boundaries

The public site may contain static/product-managed content without depending on GlenTown authentication or operational APIs.

If dynamic data is later introduced, examples include:

- current public app version;
- supported minimum versions;
- maintenance/advisory notices;
- Beta enrollment availability;
- app-store links.

Any API-backed content must fail gracefully and must not make the marketing/download site unavailable simply because an application API is degraded.

## 8. SEO, Sharing and Accessibility

MVP requirements:

- indexable public pages;
- canonical URLs;
- page-specific titles/descriptions;
- Open Graph/social preview metadata;
- sitemap and robots policy;
- semantic headings and landmarks;
- keyboard-accessible navigation/actions;
- adequate text/background contrast;
- meaningful alt text for informative imagery;
- responsive layouts for phone, tablet and desktop;
- performance budget for hero/media assets.

Avoid doorway/location SEO pages until there is useful unique content and a deliberate search strategy.

## 9. Security and Privacy Baseline

- HTTPS only in production.
- Cloudflare-proxied DNS/origin protection consistent with TownBoss policy.
- No secrets embedded in client assets.
- Content Security Policy and appropriate security headers.
- No arbitrary executable download links.
- Official Android distribution links/builds must have documented provenance.
- Third-party analytics, pixels or session-replay tools require explicit approval and privacy disclosure before production use.
- Contact/support forms, if introduced, require abuse controls and server-side validation.

## 10. Implementation Phases

### Phase 0 — Foundation

- [ ] Establish dedicated repository (`GlenTown-App-Site` working name).
- [ ] Choose final SEO-first framework and hosting target.
- [ ] Establish formatting/lint/test/build workflow.
- [ ] Import approved GlenTown brand assets without modification.
- [ ] Establish shared design tokens and responsive layout primitives.
- [ ] Define environment/release-state configuration.
- [ ] Configure preview deployment strategy.

**Gate:** clean production build from repository HEAD with no secrets and an approved baseline shell.

### Phase 1 — Public MVP

- [ ] Home.
- [ ] Features.
- [ ] Download.
- [ ] Beta page if still applicable.
- [ ] Help/legal routing.
- [ ] Responsive header/footer/navigation.
- [ ] SEO/social metadata.
- [ ] Accessibility baseline.
- [ ] Production DNS/deployment for `app.glentown.com`.

**Gate:** desktop/mobile browser verification plus valid official download/link behavior.

### Phase 2 — Release Integration

- [ ] Centralized release metadata.
- [ ] App-store badges/links when authoritative.
- [ ] Release notes workflow.
- [ ] Deep-link / install attribution strategy if approved.
- [ ] Optional Beta enrollment workflow.

### Phase 3 — Growth

- [ ] Localized landing content where justified.
- [ ] Campaign-specific landing pages.
- [ ] Referral/deep-link campaigns.
- [ ] Experimentation/feature-flag support where appropriate.
- [ ] Conversion analytics under approved privacy controls.

## 11. Definition of Done for Initial Launch

`app.glentown.com` may be classified DEPLOYED only when:

1. its dedicated repository and ownership are established;
2. production build and automated quality checks pass;
3. official branding is used correctly;
4. all advertised product capabilities correspond to the current release state;
5. download/install CTAs point only to approved official distribution paths;
6. Privacy, Terms and Help destinations are valid;
7. mobile and desktop layouts are manually verified;
8. accessibility and metadata checks pass;
9. Cloudflare/DNS/TLS configuration is verified;
10. production URL is smoke-tested after deployment.

`OPERATIONAL` additionally requires a defined owner for content/release updates and a repeatable deployment/release process.

## 12. Immediate Start Checklist

- [ ] Create the dedicated repository.
- [ ] Select the final site framework/hosting combination.
- [ ] Decide current launch state: pre-Beta/private Beta/public Android Beta/store release.
- [ ] Assemble approved brand assets.
- [ ] Select verified current-build screenshots after the device audit.
- [ ] Draft homepage/features/download copy from the actual Beta capability set.
- [ ] Establish preview deployment before connecting `app.glentown.com` production DNS.
