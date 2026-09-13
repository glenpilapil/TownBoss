# GlenTown App Site Current State

**Status date:** 2026-09-13  
**Overall:** IMPLEMENTED foundation / active visual redesign / NOT visually accepted

## Repository

- Implementation repo: `glenpilapil/GlenTown-App-Site`
- Local path: `D:\Projects\GlenTown\GlenTown-App-Site`
- Current visual-work branch reported in development: `feat/pass-3-visual-art-direction`
- Current Pass 3 working tree: intentionally dirty/uncommitted during visual audit.
- TownBoss documentation reconciliation: COMPLETE.
- Repository-local Pass 3 documentation reconciliation: PENDING.

## Engineering Baseline

Implemented and repeatedly validated during earlier passes:

- Next.js 16 App Router project
- Tailwind CSS 4
- TypeScript
- ESLint
- typecheck script
- node:test/tsx test suite
- Webpack local dev/build workaround for Windows Application Control blocking native SWC
- `/`, `/features`, `/download`, `/beta`
- sitemap/robots/metadata foundation
- release-aware CTA configuration
- System/Light/Dark theme control
- official GlenTown PNG branding copied locally
- official platform marks
- screenshot/content configuration

Recent reported validation before template-led recovery:

- lint: PASS
- typecheck: PASS
- tests: 13/13 PASS
- production build: PASS
- core routes: HTTP 200 in development

These results establish engineering viability only. They do not establish visual acceptance.

## Visual Status

**Visual gate: FAIL / redesign in progress.**

Material findings from human visual review:

- early marketing composition remained too black/heavy in dark mode;
- theme control worked, but initial Pass 2 produced insufficient visual improvement;
- active navigation required an underline rather than a dot;
- `A Closer Look Inside` needed genuine horizontal scrolling;
- initial generic device frames were visually poor;
- Samsung Galaxy A55-inspired frame selected;
- screenshot corner geometry must drive frame treatment rather than aggressive screenshot clipping;
- random multi-phone angles looked uncomposed;
- passive phone hover movement added no value;
- custom AI-created hero collage produced an unacceptable result with image strips, disconnected fragments, excessive orbit/route decoration, and poor visual hierarchy;
- site still lacked the artistic richness, flow, and media variety of selected premium references.

## Recovery Direction

The project has moved to **template-led controlled hybrid** design.

Evaluated references:

1. `bohd4nx/app-landing`
   - useful for typography, one-page restraint, screenshot gallery/lightbox mechanics, FAQ structure;
   - rejected as sole visual authority because hero/art direction is too minimal.

2. `sofiyevsr/mobile-app-landing-template`
   - useful for media diversity, device-led hero composition, photography splits, SVG/background transitions, scroll-effect concept;
   - typography rejected for GlenTown;
   - desktop 300vh scroll binding rejected because of wheel friction.

Premium benchmarks retained: Prooland, Allon, Appilo demos.

## Current Approved Design Strategy

Controlled hybrid:

- typography / one-page restraint: bohd4nx
- hero composition pattern: Sofiyev, adapted
- lifestyle photography integration: Sofiyev-style 50/50 splits, adapted with GlenTown photography
- screenshot gallery/lightbox: bohd4nx pattern
- premium visual benchmark: Prooland / Allon / Appilo
- product truth, content, branding, release behavior: GlenTown
- scroll effect: preserve the desirable cinematic settling concept but replace the friction-heavy 300vh behavior with accessible visual waypoints

## Documentation Reconciliation Status

Completed in TownBoss:

- parent `APP_GLENTOWN_COM.md` updated from `READY TO START` to evidence-backed implementation-in-progress / visual-recovery status;
- dedicated reconciliation record added;
- implementation-plan V0 updated to distinguish TownBoss reconciliation from repository-local reconciliation.

Still required locally before coding:

- preserve/inspect the exact dirty Pass 3 worktree;
- update local `README.md` and `docs/APP_SITE_ARCHITECTURE.md` from that authoritative state;
- capture exact HEAD/status/diff evidence;
- rerun engineering validation.

## Immediate Next Gate

Before broad homepage implementation:

1. preserve and inspect the dirty local Pass 3 working tree without destructive Git operations;
2. reconcile repository-local docs;
3. capture exact local baseline and rerun engineering checks;
4. implement typography/foundation + hero only using named reference authorities;
5. perform human visual audit;
6. do not continue to subsequent sections until hero visual gate passes.

## Blockers / Attention

- No approved production app-store URLs should be invented.
- Current screenshots are usable as temporary verified app imagery but are expected to be refreshed later.
- Framer Motion adoption remains a bounded implementation decision, not yet automatically approved as a dependency.
- Pass 3 uncommitted work must be preserved/reconciled before a new implementation branch/checkpoint is created.