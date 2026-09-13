# GlenTown App Site Memory

**Status:** ACTIVE  
**Purpose:** Durable project-development memory for `GlenTown-App-Site`.

This file records meaningful development history, decisions, reversals, incidents, validation, and lessons so future developers/agents do not depend on chat memory alone.

## Current Project State

**Date:** 2026-09-13  
**Implementation repository:** `GlenTown-App-Site`  
**Current reported visual branch:** `feat/pass-3-visual-art-direction`  
**Working tree:** intentionally dirty/uncommitted during active visual audit  
**Current phase:** template-led visual recovery  
**Engineering baseline:** lint/typecheck/tests/build previously passing; 13/13 tests reported  
**Visual baseline:** NOT ACCEPTED  
**Current design authority:** controlled hybrid documented in `GLENTOWN_APP_SITE_DESIGN_AUTHORITY_MATRIX.md`  
**TownBoss documentation reconciliation:** COMPLETE  
**Repository-local documentation reconciliation:** PENDING on authoritative dirty Pass 3 worktree  
**Next approved action:** preserve/inspect Pass 3, reconcile local README/architecture docs, rerun baseline validation, then implement typography + hero only and perform human visual audit before continuing.

---

## 2026-09-12 — Dedicated App Site Repository Established

**Type:** Architecture / Implementation  
**Status:** COMPLETE

### Context

`app.glentown.com` required a dedicated SEO-first public website separate from the Flutter app and API repositories.

### Action

A Next.js 16 App Router repository was created as `GlenTown-App-Site` with TypeScript, Tailwind CSS 4, ESLint, npm, and a Windows Webpack workaround after native SWC was blocked by Application Control.

### Result

Dedicated repository established and pushed to GitHub. Local dev/build works through Webpack.

### Lesson

The website must remain independently deployable and must not depend at runtime on neighboring local repository paths.

---

## 2026-09-12 — Pass 0 Site Foundation

**Type:** Implementation  
**Status:** COMPLETE / ENGINEERING VERIFIED

### Action

Implemented the initial foundation:

- release configuration;
- centralized metadata;
- UI/layout primitives;
- responsive header/footer;
- `/`, `/features`, `/download`, `/beta`;
- robots/sitemap;
- README/architecture documentation;
- CI and test foundation.

### Validation

Reported lint, typecheck, tests, build, and diff checks passing.

### Lesson

Release state and distribution URLs must remain configuration-driven. Do not invent store/social/legal/deployment facts.

---

## 2026-09-12 — Official GlenTown Brand Assets Integrated

**Type:** Asset / Implementation  
**Status:** COMPLETE

### Action

Approved PNG assets were copied from the GlenTown app brand source into the site repository. A reusable `GlenTownLogo` component was created and integrated into header/footer.

### Decision

Use approved PNG brand assets only for this site unless a later explicit asset decision changes that rule. Do not redraw/recolor official branding.

---

## 2026-09-12 — Pass 1 Visual Experience

**Type:** Implementation / Audit  
**Status:** ENGINEERING VERIFIED / VISUAL QUALITY LATER SUPERSEDED

### Action

Real GlenTown audit screenshots were integrated, Lucide icons added, and homepage/features/download/beta received a first marketing redesign.

### Result

Engineering checks passed, but later human review found the visual experience insufficiently rich and too dependent on screenshots/device presentations.

### Lesson

Real product screenshots improve truthfulness but do not by themselves create strong marketing art direction.

---

## 2026-09-12 — Release CTA Accuracy Corrections

**Type:** Product Truth / Implementation  
**Status:** COMPLETE

### Action

Release configuration was expanded to support authoritative platform download/Beta URLs. Centralized CTA logic was introduced with safe missing-URL behavior and tests.

### Result

`coming_soon`, `beta`, and `available` states became safer and route-aware. Beta self-link behavior was corrected.

### Validation

13 total tests were later reported passing across release configuration and DownloadCTA behavior.

---

## 2026-09-12 — Pass 2 Theme and Marketing Composition

**Type:** Implementation / Visual Audit  
**Status:** PARTIALLY ACCEPTED / VISUAL DIRECTION SUPERSEDED

### Action

Added System/Light/Dark theme support through `next-themes`, marketing component decomposition, and a larger one-page composition.

### Human Audit

Theme control worked. However, the overall design changed much less than intended and remained visually weak compared with supplied premium references.

### Lesson

Implementing a theme system and adding more sections is not equivalent to improving art direction.

---

## 2026-09-13 — Device, Navigation, and Gallery Corrections

**Type:** Visual Audit / Implementation  
**Status:** IMPLEMENTED / NEEDS FINAL RE-VERIFY

### Decisions

- Desktop active navigation should use text color + underline, not a dot.
- Generic thick device frames were rejected.
- Samsung Galaxy A55-inspired frame selected.
- Small centered circular punch-hole only; no notch/Dynamic Island.
- Screenshot corner geometry should guide the frame rather than aggressive clipping.
- Passive phone hover movement was rejected.
- Multi-phone arrangements require intentional geometry.
- `A Closer Look Inside` must be truly horizontally scrollable.
- Use actual Android/Apple platform marks.

### Lesson

Small interaction/geometry details materially affect perceived design quality and must be visually inspected, not inferred from JSX/Tailwind classes.

---

## 2026-09-13 — Lifestyle Photography Prepared

**Type:** Asset  
**Status:** COMPLETE

### Source Stories

Four approved lifestyle photographs were selected:

- Discover your town
- Local economy
- Services / get things done
- Community / participate locally

### Action

Large JPEG originals were preserved locally under ignored `source-assets/hero/`. WebP derivatives were generated at 2400px long edge, quality 85, for public web use.

### Result

Optimized production assets were created without destructive automatic segmentation.

### Lesson

Complex transparent elements and hair/hand edges exceeded available automated masking quality. Preserve environmental context rather than manufacturing poor cutouts.

---

## 2026-09-13 — Custom Editorial Collage Hero Rejected

**Type:** Visual Audit / Incident  
**Status:** REJECTED

### Symptom

Rendered hero contained narrow vertical image strips, severed photographic subjects, excessive orbital circles/route lines, floating cards, weak hierarchy, and a small stranded device.

### Cause

Freeform prose art direction such as “editorial collage,” “environmental blend,” and “location geometry” left too much visual interpretation to the implementation agent.

### Resolution

Stop freeform AI-designed major compositions. Move to template-led implementation with named source patterns and section-by-section visual gates.

### Lesson

Engineering agents are reliable at implementation mechanics but should not be treated as unconstrained art directors for this project.

---

## 2026-09-13 — Template-Led Recovery: bohd4nx/app-landing

**Type:** Reference Audit  
**Status:** PARTIAL REFERENCE

### Findings

Useful for:

- typography hierarchy;
- one-page restraint;
- horizontal screenshot gallery/lightbox mechanics;
- FAQ structure;
- clean app-site implementation patterns.

Rejected as sole visual authority because its hero/art direction is too minimal and generic for GlenTown.

### Decision

Retain as typography/structural/gallery reference.

---

## 2026-09-13 — Template-Led Recovery: Sofiyev Mobile App Landing

**Type:** Reference Audit  
**Status:** PARTIAL VISUAL AUTHORITY

### Findings

Useful for:

- media diversity;
- device-led hero structure;
- photography-led 50/50 sections;
- decorative waves/blobs/background transitions;
- scroll-linked visual effect concept.

Rejected/adapted:

- stylized typography;
- Astro/DaisyUI stack;
- Swiper dependency by default;
- 300vh hero scroll binding that causes desktop mouse-wheel friction.

### Decision

Adopt a controlled hybrid rather than a single-template design system.

---

## 2026-09-13 — Controlled Hybrid Design Strategy Approved

**Type:** Decision  
**Status:** ACTIVE

### Authority

- Typography / one-page restraint: bohd4nx
- Hero composition: Sofiyev, adapted
- Lifestyle photography integration: Sofiyev, adapted
- Screenshot gallery/lightbox: bohd4nx
- Premium benchmark: Prooland / Allon / Appilo
- Product truth / content / branding / release logic: GlenTown

### Scroll Decision

The user likes the Sofiyev scroll effect but not the desktop friction. Target future behavior is selected visual waypoints: a deliberate wheel/swipe gesture may settle toward the next visual resting state, without strict section-ID snapping or global scroll hijacking.

---

## 2026-09-13 — Documentation Authority Reconciled

**Type:** Documentation / Governance  
**Status:** TOWNBOSS COMPLETE / REPOSITORY-LOCAL FOLLOW-UP PENDING

### Context

The parent `APP_GLENTOWN_COM.md` still described the application as `APPROVED / READY TO START` even though the dedicated repository, major routes, release configuration, theme system, SEO foundation and several visual passes already existed.

### Action

- Updated the parent plan to evidence-backed `IMPLEMENTATION IN PROGRESS / VISUAL RECOVERY` status.
- Marked implemented Phase 0/Phase 1 foundations without overstating deployment, accessibility, Help/legal, or store-release readiness.
- Added `GLENTOWN_APP_SITE_DOCUMENTATION_RECONCILIATION.md`.
- Updated this package's README, Current State and V0 implementation gate.
- Explicitly preserved the boundary between engineering validation and human visual acceptance.

### Repository-Local Boundary

The remote GlenTown-App-Site repository was deliberately not mutated because the authoritative local Pass 3 worktree is intentionally dirty and newer than the pushed state.

### Result

TownBoss planning now reflects actual project status. The next required action is to reconcile the local Pass 3 `README.md` and `docs/APP_SITE_ARCHITECTURE.md` in place, preserve the worktree, capture exact evidence, and rerun baseline validation before V1.

### Lesson

Portfolio planning, repository-local documentation, source code and validation evidence must advance together, but a dirty authoritative worktree must not be bypassed by remote documentation edits.

---

## Memory Maintenance Rule

After each substantial implementation/audit pass:

1. update Current State;
2. update Visual Audit Ledger;
3. append material history here;
4. record commit/branch when checkpointed;
5. distinguish engineering PASS from visual PASS;
6. never rewrite failed history to make the project appear linear.