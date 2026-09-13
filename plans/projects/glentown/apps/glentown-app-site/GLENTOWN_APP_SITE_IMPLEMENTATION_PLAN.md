# GlenTown App Site Implementation Plan

**Status:** ACTIVE / VISUAL RECOVERY  
**Application:** `app.glentown.com`

## 1. Objective

Deliver a production-grade, SEO-first, truthful, visually polished public website for the GlenTown downloadable application while preserving a clean Next.js architecture and evidence-based release behavior.

## 2. Existing Baseline

Foundation already implemented in `GlenTown-App-Site` includes:

- Next.js 16 App Router
- TypeScript
- Tailwind CSS 4
- responsive site shell
- `/`, `/features`, `/download`, `/beta`
- typed release configuration
- release-aware CTA logic
- System/Light/Dark theme support
- SEO metadata, sitemap, robots
- official PNG brand assets
- official platform marks
- real app screenshots
- automated lint/typecheck/test/build workflow

The current challenge is visual quality, not foundational architecture.

## 3. Current Recovery Principle

Do not rebuild the entire marketing site in one pass.

Each major visual surface is implemented and accepted through a bounded visual gate:

`reference pattern -> implementation -> engineering validation -> human visual audit -> correction -> acceptance -> checkpoint`

An agent must not continue to the next major visual surface when the active surface has failed human visual review.

## 4. Phase V0 — Documentation and Baseline Reconciliation

- [x] Establish dedicated TownBoss planning package.
- [x] Reconcile TownBoss parent `APP_GLENTOWN_COM.md` with the actual implementation state.
- [x] Record repository-local documentation gaps and reconciliation requirements in `GLENTOWN_APP_SITE_DOCUMENTATION_RECONCILIATION.md`.
- [ ] Reconcile the local dirty Pass 3 `README.md` and `docs/APP_SITE_ARCHITECTURE.md` with this package.
- [ ] Preserve/reconcile the dirty Pass 3 branch before any destructive Git operation.
- [ ] Capture exact implementation HEAD/working-tree status before the next coding pass.
- [ ] Confirm current tests and production build still pass after local reconciliation.

**Gate V0:** TownBoss planning is now reconciled. V0 remains open until the authoritative local Pass 3 worktree and its repository-local documentation are reconciled and validated without losing uncommitted work.

## 5. Phase V1 — Typography + Hero

**Reference authority:**

- Typography: bohd4nx
- Hero composition: Sofiyev, adapted
- Premium visual benchmark: Prooland / Allon / Appilo
- Product truth/brand: GlenTown

Scope:

- [ ] Apply approved modern/tight typography hierarchy.
- [ ] Rebuild hero using a named Sofiyev composition pattern rather than freeform collage.
- [ ] Use the smallest effective media set; do not force all four lifestyle photos into hero.
- [ ] Retain one strong product/device anchor where appropriate.
- [ ] Integrate official platform marks and truthful release-aware CTAs.
- [ ] Implement bounded scroll-linked visual effect only if it can meet the waypoint interaction rules.
- [ ] Preserve system theme behavior.
- [ ] Remove rejected Pass 3 hero composition artifacts.

Engineering validation:

- lint
- typecheck
- tests
- build
- diff check
- route smoke check

Human visual audit:

- desktop light
- desktop dark
- mobile light
- mobile dark where practical
- mouse wheel / trackpad / touch interaction as applicable

**Gate V1:** hero explicitly approved by human visual audit.

## 6. Phase V2 — Photography-Led Story Sections

**Reference authority:** Sofiyev 50/50 lifestyle split compositions + premium references.

- [ ] Map approved lifestyle photos to the strongest GlenTown stories.
- [ ] Keep people/activity recognizable; do not use narrow strips or fake cutouts.
- [ ] Vary media treatment so device frames are not repeated everywhere.
- [ ] Combine capability stories where needed to maintain one-page restraint.
- [ ] Preserve truthful capability availability.

Candidate story grouping:

- Discover / Community
- Local Economy: Marketplace / Pre-Loved / Food
- Services / Professionals
- Travel / Events / Planning

**Gate V2:** photography-led sections pass responsive visual audit without feeling templated or repetitive.

## 7. Phase V3 — Product Inspection / A Closer Look Inside

**Reference authority:** bohd4nx screenshot gallery/lightbox.

- [ ] Implement native horizontal scroll rail.
- [ ] Touch swipe on mobile.
- [ ] Adjacent screenshot peek.
- [ ] Desktop navigation controls where useful.
- [ ] Snap behavior where beneficial.
- [ ] Optional lightbox/detail viewing.
- [ ] Use current verified screenshots; document that they may be refreshed after later physical-device audits.

**Gate V3:** interaction works with mouse, keyboard, touch, and responsive layouts.

## 8. Phase V4 — Supporting Sections

- [ ] Nationwide access / local depth.
- [ ] Trust/privacy/safety summary where appropriate.
- [ ] Beta/download presentation.
- [ ] FAQ.
- [ ] Final CTA.
- [ ] Footer.

Rules:

- no fake pricing;
- no fake testimonials;
- no unsupported statistics;
- no invented social links;
- no invented release destinations.

**Gate V4:** complete homepage flow passes human visual review and product-truth review.

## 9. Phase V5 — Subpage Alignment

Align `/features`, `/download`, and `/beta` with the accepted homepage visual system without blindly duplicating homepage composition.

- [ ] consistent typography/tokens;
- [ ] active navigation behavior;
- [ ] truthful release states;
- [ ] responsive behavior;
- [ ] theme parity;
- [ ] accessibility.

**Gate V5:** all routes visually coherent and functionally verified.

## 10. Phase V6 — Release Readiness

- [ ] performance/media audit;
- [ ] accessibility audit;
- [ ] metadata/social preview audit;
- [ ] security-header/config review;
- [ ] deployment/DNS readiness;
- [ ] official legal/help destinations;
- [ ] production smoke test;
- [ ] visual/browser verification after deployment.

## 11. Dependency Policy

Do not add dependencies solely because a reference template uses them.

Current disposition:

- Next.js / React / TypeScript / Tailwind — KEEP
- `next-themes` — KEEP
- `lucide-react` — KEEP
- React Icons — SUBSTITUTE / NOT NEEDED
- Swiper — NOT NEEDED unless native rail cannot meet accepted behavior
- DaisyUI — NOT NEEDED
- Astro — NOT ADOPTED
- Framer Motion — CONDITIONAL; adopt only if V1 approved scroll/reveal behavior materially benefits and cannot be implemented cleanly with existing capabilities

## 12. Checkpoint Discipline

For each accepted phase:

1. preserve baseline evidence;
2. implement bounded scope;
3. run engineering gates;
4. perform human visual audit;
5. correct findings;
6. update Current State, Visual Audit Ledger, and Memory;
7. checkpoint/commit only after acceptance.

Do not infer completion from agent self-report alone.