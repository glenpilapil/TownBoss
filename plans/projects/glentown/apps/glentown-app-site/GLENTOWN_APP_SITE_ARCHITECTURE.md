# GlenTown App Site Architecture

**Status:** ACTIVE BASELINE

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
- official Apple/Android marks for platform identity
- `node:test` with `tsx` for lightweight logic tests
- Webpack-backed local dev/build scripts on the current Windows workstation because native SWC is blocked by Application Control

## 2. Architectural Principles

- SEO-first, server/static-renderable public site.
- Static-first content where possible.
- Marketing pages must not require GlenTown API availability to render.
- Release-state behavior is centrally configured.
- Content and presentation are separated where practical.
- Brand/media assets are local production assets; runtime paths must not depend on neighboring repositories.
- No secrets in client-exposed environment variables or static assets.

## 3. Deployment Boundary

Production target remains `app.glentown.com`.

Documented direction:

- DigitalOcean App Platform for hosting/application deployment.
- Cloudflare for DNS/CDN/WAF/origin-protection policy consistent with TownBoss standards.

Infrastructure implementation is a separate deployment-readiness concern and must not be inferred as complete from architecture documentation.

## 4. Relationship to Other Surfaces

- `glentown.com` — consumer GlenTown web experience.
- `help.glentown.com` — support and troubleshooting.
- `api.glentown.com` — no hard dependency for core public rendering.
- `biz.glentown.com` — business destination when relevant.
- `dev.glentown.com` — developer/integration documentation.

## 5. Release Configuration

The repository currently models platform release state through typed configuration sourced from environment variables. Current implementation states include `coming_soon`, `beta`, and `available`, with separate optional download/Beta URLs.

CTA behavior must remain fail-safe:

- coming soon -> non-actionable status;
- beta + authoritative URL -> Beta CTA;
- beta without URL -> informational/fallback behavior appropriate to route context;
- available + authoritative URL -> download CTA;
- available without URL -> non-actionable missing-link state.

Do not hard-code invented store URLs.

## 6. Marketing Presentation Layer

The presentation layer is currently under active redesign. The target is a controlled hybrid of approved reference patterns rather than freeform AI-generated composition.

Functional architecture should survive visual replacement wherever possible, including:

- release configuration;
- DownloadCTA logic;
- theme architecture;
- SEO/metadata;
- screenshot/content configuration;
- official platform assets;
- verified brand assets;
- tests.

Presentation components may be replaced when a reference-led implementation is stronger.

## 7. Design Reference Integration

Do not import another template framework wholesale.

Reference patterns may be ported into Next.js/Tailwind while preserving GlenTown's existing stack. Upstream dependencies are adopted only when they materially improve an approved composition.

Current guidance:

- retain Next.js rather than adopting Astro;
- retain Tailwind without DaisyUI;
- retain Lucide rather than React Icons for generic UI icons;
- prefer native horizontal scrolling over Swiper for the screenshot rail;
- add Framer Motion only if required for approved scroll-linked/reveal behavior.

## 8. Media Architecture

Production media categories:

- `/public/brand/` — approved GlenTown PNG assets.
- `/public/screenshots/` — verified app screenshots; currently audit-era assets may be temporary.
- `/public/platforms/` — platform marks.
- `/public/images/hero/` — optimized website derivatives of approved lifestyle photography.

Source originals under local `source-assets/` are working material and should remain ignored by the implementation repository unless a later provenance/asset-storage decision explicitly changes that policy.

## 9. DeviceFrame

An A55-inspired DeviceFrame is permitted as a presentation primitive, not as the default medium for every screenshot.

Constraints:

- no notch/Dynamic Island;
- small centered punch-hole;
- screenshot geometry should not be distorted to fit decorative framing;
- multi-device arrangements must use intentional geometry;
- passive devices should not animate on hover without functional value.

## 10. Scroll Interaction Architecture

Scroll-linked presentation may use a small set of visual waypoints. The implementation must preserve accessibility and native-feeling control.

Do not use a large artificial spacer that makes desktop wheel input feel resistant. Do not globally hijack scrolling or force strict section snapping.

Any scroll choreography must:

- degrade safely without JavaScript;
- respect `prefers-reduced-motion`;
- avoid trapping keyboard/touch users;
- remain responsive across mouse wheel, precision trackpad, and touch input.

## 11. Validation Architecture

Engineering validation and visual validation are separate gates.

Engineering baseline:

- lint
- typecheck
- tests
- production build
- `git diff --check`
- route/dev-server smoke verification where applicable

Visual baseline:

- desktop light
- desktop dark
- mobile light
- mobile dark where practical
- responsive/tablet review
- browser interaction review
- human visual acceptance

Passing engineering checks does not promote visual work to VERIFIED.