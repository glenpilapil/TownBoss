# GlenTown App Site Architecture

**Status:** ACTIVE BASELINE / MULTI-PAGE IA APPROVED

## 1. Technical Baseline

Implementation repository: `GlenTown-App-Site`

Current baseline:

- Next.js 16 App Router
- React
- TypeScript
- Tailwind CSS 4
- npm
- `next-themes` for System / Light / Dark behavior
- `lucide-react` for generic UI icons
- node:test with `tsx` for lightweight logic tests
- Webpack-backed local dev/build scripts on the current Windows workstation because native SWC is blocked by Application Control

## 2. Architectural Principles

- SEO-first, server/static-renderable public site.
- Static-first content where possible.
- Marketing pages must not require GlenTown operational API availability to render.
- Release-state behavior is centrally configured.
- Content and presentation are separated where practical.
- Brand/media assets are local production assets; runtime paths must not depend on neighboring repositories.
- No secrets in client-exposed variables or static assets.
- Home is narrative; deeper capability content belongs on focused routes.
- The site must feel like one connected GlenTown product website rather than unrelated microsites.

## 3. Route Architecture

Approved primary routes:

- `/`
- `/features`
- `/features/tourists`
- `/features/residents`
- `/features/organizations`
- `/features/developers`
- `/beta`
- `/download`

Do not create a standalone developer-interest registration route unless a later explicit requirement supersedes the modal decision.

Legacy redirects must be intentional and must not redirect active dedicated routes back into Home after the multi-page architecture is implemented.

## 4. Shared Site Shell

### Header

Approved desktop structure:

`Logo | Home | Features ▾ | Beta | Download | Open Web App | Theme`

Architecture requirements:

- shared Header component mounted consistently across public routes;
- Features parent item links to `/features` and exposes accessible submenu routes;
- desktop active-route semantics include `aria-current` and underline treatment;
- `Open Web App` uses the authoritative Web destination;
- theme selector is hosted in Header and persisted through `next-themes`;
- mobile navigation uses accessible expandable/collapsible behavior;
- sticky/header-scroll visual treatment must not change route/content semantics.

### Footer

Footer does not own theme selection.

It may expose Product, Features audience links, GlenTown Web, Help, Privacy, and Terms only when destinations are authoritative.

## 5. Relationship to Other Surfaces

- `glentown.com` — consumer GlenTown Web experience.
- `help.glentown.com` — support and troubleshooting.
- `api.glentown.com` — no hard dependency for core public rendering.
- `biz.glentown.com` — business destination where relevant.
- `dev.glentown.com` — deeper developer/integration documentation where available.

The App Site may explain platform/developer concepts without becoming the full developer documentation portal.

## 6. Content Architecture

### Home

Home should compose narrative sections and summaries, not duplicate all detailed capability data.

### Features Overview

Features overview should be data-driven or content-configured where practical so category names, maturity/status copy, and audience links do not drift across pages.

Current Explore labels:

- Products
- Foods
- Services
- Tourism
- Events
- Jobs
- Properties
- Suppliers
- Directory

### Audience Pages

Tourists, Residents, Organizations, and Developers should share reusable page/story primitives while preserving audience-specific copy and sequencing.

Every audience page requires a story section demonstrating connected use of capabilities. Avoid four copies of the same card-grid template with only text substitutions.

## 7. Digital Town Presentation Architecture

Public UI uses `Digital Town` terminology.

The presentation model should support capability families broader than planners:

- discover/participate;
- local economy/transactions;
- life/memories;
- plan/accomplish;
- businesses/organizations;
- government/civic services;
- platform/developer integrations.

Timeline, Diary, and Memory Album content must preserve privacy distinctions in all marketing copy/configuration.

Government integration content must preserve the rule that official government systems remain authoritative and that adapters/integrations do not imply endorsement or replacement of public systems.

## 8. Developer Interest Modal Architecture

Developer/partner registration interest uses an accessible modal/dialog component.

Implementation requirements:

- can be opened from `/features/developers` and other explicitly approved CTAs;
- no separate route required;
- semantic dialog behavior;
- focus management/trap;
- Escape close;
- close button;
- keyboard-operable fields/actions;
- client validation for UX plus server-side validation if submissions are enabled;
- success/error state;
- privacy/consent treatment as required;
- abuse controls before production;
- progressive enhancement/fallback if JavaScript fails where practical.

Submission infrastructure must not expose secrets client-side.

## 9. Release Configuration

Release configuration must support truthful platform-specific states and authoritative destinations.

Target presentation surfaces:

- Android
- iOS
- Windows
- Web

Windows requires a non-downloadable roadmap/in-development state until an authoritative artifact/source exists.

Web uses the authoritative GlenTown Web destination rather than release artifact logic.

Do not hard-code invented store/download URLs.

## 10. Beta / Survey Content Architecture

Beta route may render static/product-managed rollout content without operational API dependency.

Survey links should be centrally configured/content-managed where practical so obsolete URLs can be removed without rewriting multiple sections.

Only verified current survey destinations may be shown.

Geography copy must represent:

- Palawan Day-1 support;
- Puerto Princesa deepest initial concentration;
- location-dependent feature depth/readiness;
- broader nationwide registration/selected capability direction.

## 11. Government / Public Data Integration Presentation

The App Site may explain government/civic integration direction without calling live government APIs for basic page rendering.

Where dynamic public-service metadata is introduced later:

- use adapter/service boundaries;
- preserve provenance/authority labels;
- fail safely;
- avoid making core marketing pages unavailable during external-government outages;
- do not cache or restate sensitive authoritative state beyond approved policies.

## 12. Media Architecture

Production media categories remain local to the site repository.

Use media according to story purpose:

- brand assets;
- verified screenshots;
- optimized lifestyle photography;
- platform marks;
- audience-story media;
- restrained decorative assets.

Current screenshot content is replaceable. Component architecture should not assume exact current screenshot count/content.

## 13. DeviceFrame

A55-inspired DeviceFrame remains a permitted presentation primitive, not the default medium for every screenshot.

Constraints:

- small centered punch-hole;
- no notch/Dynamic Island;
- screenshot geometry not distorted;
- passive devices do not animate on hover without functional value.

## 14. Scroll / Motion Architecture

Scroll-linked presentation must preserve native-feeling control and accessibility.

Do not globally hijack scrolling or require excessive artificial spacer height.

Any choreography must:

- degrade safely;
- respect `prefers-reduced-motion`;
- avoid trapping keyboard/touch users;
- preserve normal route navigation.

## 15. SEO Architecture

Every public route requires:

- meaningful title/description;
- canonical URL;
- appropriate Open Graph/social metadata where supported;
- semantic heading hierarchy;
- sitemap inclusion when intended for indexing.

Features audience pages should contain unique audience-specific content/story and must not be thin duplicate SEO pages.

## 16. Validation Architecture

Engineering validation and visual validation are separate gates.

Engineering baseline:

- lint
- typecheck
- tests
- production build
- `git diff --check`
- route/dev-server smoke verification for all public routes

Visual baseline:

- desktop light/dark
- tablet
- mobile light/dark where practical
- Header/dropdown/mobile-menu interaction
- theme persistence
- audience-page story readability
- developer modal interaction
- Beta/Download truth review
- browser interaction review
- human visual acceptance

Passing engineering checks does not promote visual work to VERIFIED.