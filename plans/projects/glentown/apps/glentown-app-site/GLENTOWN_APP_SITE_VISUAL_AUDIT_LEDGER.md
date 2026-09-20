# GlenTown Persistent Issue Ledger

**Status:** CANONICAL / LIVING
**Purpose:** Canonical record of all actionable visual/UI findings and their disposition across GlenTown surfaces. Dated physical/visual audits remain evidence sources; they feed findings into this ledger but do not replace it.

## Model

This ledger is the persistent source of truth for all actionable visual/UI findings. Once an issue enters this ledger, it remains until explicitly resolved. Omission from a later audit report does NOT close an issue.

Every actionable visual finding receives a stable ID. IDs are not arbitrarily renumbered between audits.

## Status Vocabulary

| Status | Meaning |
|---|---|
| `OPEN` | Issue is acknowledged and unresolved. |
| `CODE_FIXED_NOT_PHYSICALLY_VERIFIED` | Code change addresses the issue; physical/browser/device validation is still required before promotion. |
| `VERIFIED_FIXED` | Issue is resolved and verified by the required runtime/device/browser evidence at an exact checkpoint. |
| `ACCEPTED` | Issue is acknowledged as acceptable/within approved design; no further action required. |
| `SUPERSEDED` | Issue is overridden by a later explicit decision or supersession entry. |
| `DEFERRED` | Issue is intentionally out of scope for the current execution window. |
| `NOT_REPRODUCED` | Issue could not be reproduced under the documented conditions. |
| `REJECTED` | Design direction or concept was rejected; do not reuse. This is a design-direction disposition, not a closure state for an actionable finding. |

## Critical Rule

An issue remains in this ledger until explicitly resolved. A later audit report omitting the issue does NOT close it. A source-code change alone does NOT convert a device-observed issue to `VERIFIED_FIXED`.

## Issue Record Fields

Each actionable finding record supports:

- **ID** — stable unique identifier
- **Platform** — Web / Android / iOS / Cross-platform
- **Surface** — specific screen/component/context
- **Finding** — description of the visual/UX issue
- **Authority/Source** — governing document or audit that established the finding
- **First Observed** — date or checkpoint of first observation
- **Last Observed** — date or checkpoint of last confirmed observation
- **Implementation Status** — current code/implementation state
- **Automated Validation** — test/build/lint evidence status
- **Browser/Device Validation** — physical/browser acceptance status
- **Issue Status** — one of the required closure states above
- **Fixed-at SHA/Checkpoint** — exact ref where code fix was applied, if applicable
- **Verified-at SHA/Checkpoint** — exact ref where physical/browser verification was recorded
- **Evidence/Reference** — links to audit reports, worksheets, checkpoints
- **Notes/Supersession** — supersession notes, deferral rationale, or other context

---

## App Site Findings

| ID | Finding | Status | Platform | Surface | Authority/Source | First Observed | Last Observed | Implementation Status | Automated Validation | Browser/Device Validation | Issue Status | Fixed-at SHA | Verified-at SHA | Evidence/Reference | Notes/Supersession |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| GTAS-VA-001 | Site initially felt excessively black/heavy in dark mode. | OPEN | Web | Site | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Accepted design must make dark mode intentionally layered rather than predominantly black. |
| GTAS-VA-002 | Theme control missing in earlier implementation. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Header/Footer | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Theme system exists; control moved to Header | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Approved state is active text color + underline. Verify desktop/mobile and persistence. |
| GTAS-VA-003 | Active desktop navigation lacked clear state. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Desktop navigation | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Active state implemented | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Approved state is active text color + underline. |
| GTAS-VA-004 | Active desktop navigation dot was visually undesirable. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Desktop navigation | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Active dot removed | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Do not reintroduce active dot. |
| GTAS-VA-005 | A Closer Look Inside did not initially behave as an actual scrollable gallery. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Home gallery | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Horizontal interaction/lightbox behavior implemented | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Preserve horizontal interaction/lightbox behavior if retained. |
| GTAS-VA-006 | Generic thick phone frame looked poor and clipped screenshot corners. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Device frames | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | A55-inspired direction adopted | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | — |
| GTAS-VA-007 | Phone front camera/notch treatment was incorrect. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Device frames | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Small centered circular punch-hole implemented | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | No notch/Dynamic Island. |
| GTAS-VA-008 | Device arrangement looked random/asymmetric rather than designed. | OPEN | Web | Device composition | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Multi-device compositions need explicit geometric relationships. |
| GTAS-VA-009 | Passive phone hover animation added no value. | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | Web | Device frames | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Decorative passive rotate/lift/translate removed | — | — | CODE_FIXED_NOT_PHYSICALLY_VERIFIED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | — |
| GTAS-VA-010 | Site lacked artistic elements and premium visual flow compared with Prooland/Allon/Appilo. | OPEN | Web | Site | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Controlled hybrid remains benchmark. |
| GTAS-VA-011 | Overreliance on screenshots/device frames made media treatment repetitive. | OPEN | Web | Site | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Media diversity remains an explicit acceptance rule. |
| GTAS-VA-012 | First custom editorial-collage hero produced narrow image strips and disconnected photographic fragments. | REJECTED | Web | Hero | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | REJECTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Do not reuse. Design-direction rejection; not an actionable finding. |
| GTAS-VA-013 | First custom hero contained excessive orbital circles, route lines, floating cards, and weak hierarchy. | REJECTED | Web | Hero | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | REJECTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Freeform AI hero art direction is not authoritative. Design-direction rejection. |
| GTAS-VA-014 | Community photo treatment became washed-out/muddy under blend effects. | REJECTED | Web | Community media | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | REJECTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Avoid destructive/muddy blend modes. Design-direction rejection. |
| GTAS-VA-015 | Current screenshot set is audit-era and should eventually be refreshed. | DEFERRED | Web | Site | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | DEFERRED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Screenshot contents are not structural authority for this audit. |
| GTAS-VA-016 | Sofiyev desktop mouse-wheel scrolling feels friction-heavy. | REJECTED | Web | Scrolling | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | REJECTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Preserve only useful visual concepts; keep input native-feeling. Design-direction rejection. |
| GTAS-VA-017 | Sofiyev mobile scrolling feels closer to desired smooth progression. | REFERENCE | Web | Scrolling | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | REFERENCE | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Interaction reference only. |
| GTAS-VA-018 | bohd4nx typography is preferred over Sofiyev typography. | ACCEPTED | Web | Typography | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | ACCEPTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Tight modern hierarchy remains typography reference. |
| GTAS-VA-019 | One-page-only architecture became too dense and felt like several websites stacked together. | ACCEPTED | Web | Information architecture | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Multi-page IA implemented | — | — | ACCEPTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Replace with connected multi-page IA while preserving one GlenTown visual system. |
| GTAS-VA-020 | Global Header must return. | OPEN | Web | Header | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Logo, Home, Features dropdown, Beta, Download, Open Web App, Theme. |
| GTAS-VA-021 | Theme control must return to Header and be removed from Footer. | OPEN | Web | Header/Footer | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Verify desktop/mobile and persistence. |
| GTAS-VA-022 | Hero has too many competing CTAs when Open Web App is included. | ACCEPTED | Web | Hero | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Hero CTAs simplified | — | — | ACCEPTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Hero must use Join the Beta + Learn More only; Open Web App belongs in Header. |
| GTAS-VA-023 | Home must tell the story and summarize, not contain every capability. | OPEN | Web | Home | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Features/Beta/Download summaries link to dedicated routes. |
| GTAS-VA-024 | Features overview must represent all current Explore categories. | OPEN | Web | Features | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Products, Foods, Services, Tourism, Jobs, Events, Properties, Suppliers, Directory. |
| GTAS-VA-025 | Digital Town presentation was too heavily reduced to planner/orchestration features. | OPEN | Web | Marketing/Features | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Must include participation, economy, memories, planning, businesses, government/civic, trust, platform integrations. |
| GTAS-VA-026 | Personal Timeline / Diary / Memory Albums are missing from current marketing hierarchy. | OPEN | Web | Marketing/Features | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Add where contextually appropriate; preserve privacy distinction. |
| GTAS-VA-027 | Government/civic-service integration needs visible emphasis. | OPEN | Web | Marketing/Features | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Show as authoritative-service interoperability; no government-endorsement implication. |
| GTAS-VA-028 | Explore labels are stale. | OPEN | Web | Explore | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Use Products / Foods / Tourism, not Shopping / Food & Dining / Travel & Tours. |
| GTAS-VA-029 | Audience submenu pages required. | OPEN | Web | Navigation | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Tourists / Residents / Organizations / Developers. |
| GTAS-VA-030 | Audience pages must not be feature-card catalogs only. | OPEN | Web | Audience pages | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Every audience page requires a realistic story section. |
| GTAS-VA-031 | Tourist story must show connected journey. | OPEN | Web | Tourists page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Discover Palawan -> Build trip -> Book/coordinate -> Experience -> Keep memories. |
| GTAS-VA-032 | Resident story must show multi-role everyday journey. | OPEN | Web | Residents page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | See what's happening -> Find need -> Get it done -> Stay connected -> Keep story. |
| GTAS-VA-033 | Organizations page must be business-first in public marketing. | OPEN | Web | Organizations page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Establish presence -> discovery -> inquiry/order/booking -> service -> reputation -> operations. |
| GTAS-VA-034 | Developer page needs connected integration story and controlled access semantics. | OPEN | Web | Developers page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | No unrestricted-public-API implication. |
| GTAS-VA-035 | Developer/partner interest flow should not consume a full page. | OPEN | Web | Developers page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Accessible modal with keyboard/focus/validation/success/error states. |
| GTAS-VA-036 | Pilot geography language must be corrected. | OPEN | Web | Beta/Download | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Palawan Day-1 supported pilot province; Puerto Princesa deepest initial concentration. |
| GTAS-VA-037 | Beta page must expose current Survey Forms. | OPEN | Web | Beta page | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Help shape GlenTown; only verified active form URLs. |
| GTAS-VA-038 | Download must include Windows roadmap surface. | OPEN | Web | Download | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | No Windows download action until authoritative artifact exists. |
| GTAS-VA-039 | Download must cover Android, iOS, Windows, Web coherently. | OPEN | Web | Download | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Download remains single source of acquisition truth. |
| GTAS-VA-040 | Public architecture jargon is too technical. | ACCEPTED | Web | Marketing | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | Digital Town copy implemented | — | — | ACCEPTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Use Digital Town; no DTOS in public App Site UI. |
| GTAS-VA-041 | Audience pages risk looking like four unrelated microsites. | OPEN | Web | Audience pages | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | OPEN | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Shared design system/navigation, distinct audience story, consistent GlenTown identity. |
| GTAS-VA-042 | Current screenshot contents should not block structural UI/UX work. | ACCEPTED | Web | Site | 2026-09-14 Multi-Page IA Audit | 2026-09-14 | 2026-09-14 | — | — | — | ACCEPTED | — | — | GLENTOWN_APP_SITE_VISUAL_AUDIT_LEDGER.md (historical) | Disregard screenshot content during current IA audit; preserve/replace later. |

---

## Visual Audit Gates

These gates define required human visual verification before acceptance of major surfaces. They are not findings themselves; they are acceptance criteria for future verification.

### Next Human Visual Audit — Shared Shell + Home

Before accepting shared site architecture, verify:

- Header visually belongs to GlenTown and does not overpower Hero;
- logo/home link is clear;
- Home / Features / Beta / Download hierarchy is clear;
- Features dropdown is discoverable, readable, and keyboard usable;
- Open Web App reads as persistent utility action, not competing acquisition CTA;
- theme control is usable in Header across light/dark/system modes;
- Footer no longer duplicates theme control;
- mobile menu preserves all destinations without crowding;
- Home Hero uses Join the Beta + Learn More only;
- Home tells one story and does not reproduce the full Features/Beta/Download pages;
- desktop (~1440), tablet (~768), mobile (~390) have no unintended overflow;
- light and dark modes are intentional;
- current screenshots are disregarded as content-quality blockers.

### Features / Audience Visual Audit Gate

Before accepting Features architecture, verify:

- `/features` is comprehensive but scannable;
- all 9 current Explore labels are present;
- Digital Town is visibly broader than planners;
- Timeline / Diary / Memories are understandable and privacy-safe;
- Government/Civic integration is visible but does not imply government authority;
- business organizations receive appropriate emphasis;
- Tourists, Residents, Organizations, Developers pages share GlenTown design language without becoming clones;
- every audience page has a story section showing connected outcomes;
- Explore taxonomy and audience-story UI do not feel like duplicate card grids;
- developer interest modal is visually/accessibly integrated.

### Beta / Download Visual Audit Gate

Before accepting release/participation surfaces, verify:

- Palawan Day-1 / Puerto Princesa deepest-density hierarchy is immediately understandable;
- location-dependent capability depth is not confusing;
- Survey Forms are easy to find but do not dominate Beta;
- Download visibly covers Android, iOS, Windows, Web;
- Windows clearly reads as planned/in development when no artifact exists;
- platform actions do not look disabled when actionable or actionable when unavailable;
- release metadata remains concise and legible.

No item above becomes `VERIFIED_FIXED` until rendered behavior is inspected by a human.
