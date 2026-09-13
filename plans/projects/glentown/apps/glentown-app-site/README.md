# GlenTown App Site Planning Package

**Application:** `app.glentown.com` / `GlenTown-App-Site`  
**Parent plan:** `../APP_GLENTOWN_COM.md`  
**Status:** ACTIVE PLANNING / IMPLEMENTATION IN PROGRESS  
**Purpose:** Canonical planning and evidence package for the public GlenTown application website.

## Authority Chain

`TownBoss Master Development Plan -> GlenTown project plan -> APP_GLENTOWN_COM.md -> this application package -> milestone/gate -> task -> evidence -> checkpoint`

This directory follows the documentation discipline used by `plans/projects/code-project-supervisor/`: durable decisions, current state, implementation sequencing, acceptance criteria, evidence rules, and memory are kept in version-controlled project documentation instead of depending on conversation history.

## Canonical Files

- `GLENTOWN_APP_SITE_PRODUCT_SPEC.md` — application purpose, audiences, scope, content model, non-goals.
- `GLENTOWN_APP_SITE_ARCHITECTURE.md` — technical architecture and integration boundaries.
- `GLENTOWN_APP_SITE_CURRENT_STATE.md` — current evidence-backed baseline and active blockers.
- `GLENTOWN_APP_SITE_DECISIONS_AND_RULES.md` — durable product, UX, content, asset, and implementation rules.
- `GLENTOWN_APP_SITE_DESIGN_AUTHORITY_MATRIX.md` — approved template/reference authority by design concern.
- `GLENTOWN_APP_SITE_IMPLEMENTATION_PLAN.md` — phased implementation and validation gates.
- `GLENTOWN_APP_SITE_ACCEPTANCE_CRITERIA.md` — acceptance conditions for visual, functional, technical, and release readiness.
- `GLENTOWN_APP_SITE_VALIDATION_AND_EVIDENCE_STANDARD.md` — evidence required before status promotion.
- `GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md` — visual findings, corrections, and verification status.
- `GLENTOWN_APP_SITE_MEMORY.md` — durable project history, including attempts, failures, reversals, checkpoints, and lessons.

## Status Vocabulary

Use the TownBoss portfolio status vocabulary where applicable:

- `DECIDED`
- `PLANNED`
- `IMPLEMENTED`
- `VERIFIED`
- `DEPLOYED`
- `OPERATIONAL`
- `BLOCKED`
- `DEFERRED`

For visual work, engineering and visual status must be recorded separately. A passing build does not imply visual acceptance.

## Working Repository

Primary implementation repository: `glenpilapil/GlenTown-App-Site` / local `D:\Projects\GlenTown\GlenTown-App-Site`.

This TownBoss package is the planning authority. Repository-local docs may contain implementation detail, but must not knowingly contradict this package.

## Current Design Workflow

The project has moved from freeform AI-designed marketing composition to a **template-led controlled hybrid**. Major visual sections must name their source-pattern authority and require human visual acceptance before checkpointing.

Current reference set:

- `bohd4nx/app-landing` — typography, one-page restraint, screenshot gallery/lightbox mechanics.
- `sofiyevsr/mobile-app-landing-template` — media diversity, device-led hero composition, photography-led split sections, decorative section transitions, scroll-effect study.
- Prooland, Allon, Appilo — premium visual benchmarks.
- GlenTown — authoritative brand, product truth, release state, copy, assets, and content.

## Change Discipline

When a durable decision changes:

1. update the smallest authoritative document set;
2. mark superseded decisions rather than silently erasing history;
3. update `CURRENT_STATE` and `MEMORY` when material;
4. record visual audit results separately from automated engineering validation;
5. do not promote status without evidence.