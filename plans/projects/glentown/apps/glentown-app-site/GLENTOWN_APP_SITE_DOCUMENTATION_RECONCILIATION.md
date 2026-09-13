# GlenTown App Site Documentation Reconciliation

**Status:** COMPLETE FOR TOWNBOSS / REPOSITORY-LOCAL FOLLOW-UP PENDING  
**Date:** 2026-09-13  
**Application:** `app.glentown.com` / `GlenTown-App-Site`

## Purpose

This document reconciles the TownBoss planning authority with the implemented GlenTown-App-Site history before the next visual implementation pass. TownBoss is updated now; the implementation repository remains untouched because its current Pass 3 working tree is intentionally dirty and contains newer uncommitted visual-audit work.

## Sources Reviewed

- `plans/projects/glentown/apps/APP_GLENTOWN_COM.md`
- the dedicated `plans/projects/glentown/apps/glentown-app-site/` package
- pushed `GlenTown-App-Site/README.md`
- pushed `GlenTown-App-Site/docs/APP_SITE_ARCHITECTURE.md`
- Pass 0–3 history and evidence captured in `GLENTOWN_APP_SITE_MEMORY.md`
- current visual-audit and controlled-hybrid decisions

## Authority Chain

`TownBoss Master Development Plan -> GlenTown project plan -> APP_GLENTOWN_COM.md -> glentown-app-site package -> repository-local implementation docs -> source code / evidence`

TownBoss documents define approved product, architecture, status, gates and durable decisions. Repository-local docs describe implementation-specific structure. Source code and evidence determine implementation/verification status. Human visual acceptance is separate from automated engineering validation.

## Confirmed Alignment

Repository-local documentation remains aligned on the dedicated SEO-first site, Next.js/TypeScript/Tailwind foundation, static-first delivery, centralized release configuration, `/`, `/features`, `/download`, `/beta`, SEO foundations, official brand assets, System/Light/Dark theme behavior, DigitalOcean + Cloudflare deployment direction, and runtime independence from GlenTown-App and GlenTown-API.

## Stale Parent State

`APP_GLENTOWN_COM.md` still said `APPROVED / READY TO START` and retained an untouched startup checklist. Evidence now supports an implemented foundation with an active visual redesign, but not DEPLOYED or OPERATIONAL status.

The truthful parent status is therefore `IMPLEMENTATION IN PROGRESS / VISUAL RECOVERY`.

## Repository-Local Gaps To Reconcile

The pushed repository docs predate the current Pass 3 visual audit and should be reconciled locally before V1 with:

- engineering PASS does not imply visual PASS;
- current visual gate is FAIL / redesign in progress;
- rejected freeform editorial-collage hero;
- template-led controlled-hybrid design authority;
- bohd4nx for typography/one-page restraint/gallery mechanics;
- Sofiyev for adapted hero/media composition and scroll-effect study;
- Prooland / Allon / Appilo as premium visual benchmarks;
- GlenTown as product-truth/brand/release authority;
- Samsung Galaxy A55-inspired device rules;
- active desktop navigation underline + color;
- genuine horizontally scrollable `A Closer Look Inside`;
- media diversity rather than phone-after-phone presentation;
- selected visual scroll waypoints rather than global scroll hijacking;
- current screenshots are truthful but temporary and may be refreshed later.

## Why The Implementation Repository Is Not Updated Remotely Here

The local `feat/pass-3-visual-art-direction` working tree is intentionally dirty and newer than the pushed state. Updating remote docs independently would create a misleading split and could complicate preservation/reconciliation.

TownBoss planning authority is reconciled now. Repository-local docs must be updated from the local dirty Pass 3 state before V1 coding.

## Required Local Reconciliation Before V1

`README.md` should record the current visual-recovery status, controlled-hybrid reference authority, engineering-vs-visual gate distinction, A55/platform/media rules, scroll-waypoint direction, screenshot refresh expectation, and visual-audit checkpoint workflow.

`docs/APP_SITE_ARCHITECTURE.md` should record the design-authority boundary, reference-template dependency policy, conditional Framer Motion decision, device/screenshot geometry rules, native horizontal gallery behavior, visual scroll-waypoint constraints, and human visual-evidence requirement.

## Safety Rule

Before V1 Typography + Hero:

1. inspect and preserve the exact dirty Pass 3 working tree;
2. do not reset, clean, or checkout-overwrite it;
3. reconcile repository-local docs in that authoritative state;
4. capture exact HEAD/status/diff evidence;
5. rerun engineering validation;
6. then begin the bounded V1 implementation.

## Result

- **TownBoss parent planning status:** RECONCILED
- **Dedicated application package:** RECONCILED
- **Repository-local documentation:** PENDING LOCAL PASS 3 RECONCILIATION
- **Implementation repository mutation:** NONE
- **Next approved implementation scope:** Typography + Hero only, followed by engineering validation and explicit human visual audit.
