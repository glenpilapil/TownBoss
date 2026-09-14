# GlenTown App Site Visual Audit Ledger

**Status:** ACTIVE  
**Purpose:** Canonical record of human visual findings and their disposition.

## Status Vocabulary

- `PENDING`
- `FIXED`
- `VERIFIED`
- `REJECTED`
- `DEFERRED`
- `BLOCKED`
- `DECIDED`
- `REFERENCE`

Do not mark an item VERIFIED from source inspection alone. Verification requires rendered visual evidence.

## Historical Audit Findings

| ID | Finding | Status | Notes |
|---|---|---|---|
| GTAS-VA-001 | Site initially felt excessively black/heavy in dark mode. | PENDING | Accepted design must make dark mode intentionally layered rather than predominantly black. |
| GTAS-VA-002 | Theme control missing in earlier implementation. | FIXED / RELOCATE | Theme system exists; current decision moves control back to Header and removes it from Footer. |
| GTAS-VA-003 | Active desktop navigation lacked clear state. | FIXED / NEEDS RE-VERIFY | Approved state is active text color + underline. |
| GTAS-VA-004 | Active desktop navigation dot was visually undesirable. | FIXED | Do not reintroduce active dot. |
| GTAS-VA-005 | `A Closer Look Inside` did not initially behave as an actual scrollable gallery. | FIXED / NEEDS RE-VERIFY | Preserve horizontal interaction/lightbox behavior if retained. |
| GTAS-VA-006 | Generic thick phone frame looked poor and clipped screenshot corners. | FIXED / NEEDS RE-VERIFY | A55-inspired direction adopted. |
| GTAS-VA-007 | Phone front camera/notch treatment was incorrect. | FIXED / NEEDS RE-VERIFY | Small centered circular punch-hole; no notch/Dynamic Island. |
| GTAS-VA-008 | Device arrangement looked random/asymmetric rather than designed. | PENDING | Multi-device compositions need explicit geometric relationships. |
| GTAS-VA-009 | Passive phone hover animation added no value. | FIXED / NEEDS RE-VERIFY | No decorative passive rotate/lift/translate. |
| GTAS-VA-010 | Site lacked artistic elements and premium visual flow compared with Prooland/Allon/Appilo. | PENDING | Controlled hybrid remains benchmark. |
| GTAS-VA-011 | Overreliance on screenshots/device frames made media treatment repetitive. | PENDING | Media diversity remains an explicit acceptance rule. |
| GTAS-VA-012 | First custom editorial-collage hero produced narrow image strips and disconnected photographic fragments. | REJECTED | Do not reuse. |
| GTAS-VA-013 | First custom hero contained excessive orbital circles, route lines, floating cards, and weak hierarchy. | REJECTED | Freeform AI hero art direction is not authoritative. |
| GTAS-VA-014 | Community photo treatment became washed-out/muddy under blend effects. | REJECTED | Avoid destructive/muddy blend modes. |
| GTAS-VA-015 | Current screenshot set is audit-era and should eventually be refreshed. | DEFERRED | Screenshot contents are not structural authority for this audit. |
| GTAS-VA-016 | Sofiyev desktop mouse-wheel scrolling feels friction-heavy. | REJECTED AS-IS | Preserve only useful visual concepts; keep input native-feeling. |
| GTAS-VA-017 | Sofiyev mobile scrolling feels closer to desired smooth progression. | REFERENCE | Interaction reference only. |
| GTAS-VA-018 | bohd4nx typography is preferred over Sofiyev typography. | DECIDED | Tight modern hierarchy remains typography reference. |

## 2026-09-14 Multi-Page IA Audit Findings / Requirements

| ID | Requirement / Finding | Status | Acceptance note |
|---|---|---|---|
| GTAS-VA-019 | One-page-only architecture became too dense and felt like several websites stacked together. | DECIDED | Replace with connected multi-page IA while preserving one GlenTown visual system. |
| GTAS-VA-020 | Global Header must return. | PENDING | Logo, Home, Features dropdown, Beta, Download, Open Web App, Theme. |
| GTAS-VA-021 | Theme control must return to Header and be removed from Footer. | PENDING | Verify desktop/mobile and persistence. |
| GTAS-VA-022 | Hero has too many competing CTAs when Open Web App is included. | DECIDED | Hero must use Join the Beta + Learn More only; Open Web App belongs in Header. |
| GTAS-VA-023 | Home must tell the story and summarize, not contain every capability. | PENDING | Features/Beta/Download summaries link to dedicated routes. |
| GTAS-VA-024 | Features overview must represent all current Explore categories. | PENDING | Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory. |
| GTAS-VA-025 | Digital Town presentation was too heavily reduced to planner/orchestration features. | PENDING | Must include participation, economy, memories, planning, businesses, government/civic, trust, platform integrations. |
| GTAS-VA-026 | Personal Timeline / Diary / Memory Albums are missing from current marketing hierarchy. | PENDING | Add where contextually appropriate; preserve privacy distinction. |
| GTAS-VA-027 | Government/civic-service integration needs visible emphasis. | PENDING | Show as authoritative-service interoperability; no government-endorsement implication. |
| GTAS-VA-028 | Explore labels are stale. | PENDING | Use Products / Foods / Tourism, not Shopping / Food & Dining / Travel & Tours. |
| GTAS-VA-029 | Audience submenu pages required. | PENDING | Tourists / Residents / Organizations / Developers. |
| GTAS-VA-030 | Audience pages must not be feature-card catalogs only. | PENDING | Every audience page requires a realistic story section. |
| GTAS-VA-031 | Tourist story must show connected journey. | PENDING | Discover Palawan -> Build trip -> Book/coordinate -> Experience -> Keep memories. |
| GTAS-VA-032 | Resident story must show multi-role everyday journey. | PENDING | See what's happening -> Find need -> Get it done -> Stay connected -> Keep story. |
| GTAS-VA-033 | Organizations page must be business-first in public marketing. | PENDING | Establish presence -> discovery -> inquiry/order/booking -> service -> reputation -> operations. |
| GTAS-VA-034 | Developer page needs connected integration story and controlled access semantics. | PENDING | No unrestricted-public-API implication. |
| GTAS-VA-035 | Developer/partner interest flow should not consume a full page. | PENDING | Accessible modal with keyboard/focus/validation/success/error states. |
| GTAS-VA-036 | Pilot geography language must be corrected. | PENDING | Palawan Day-1 supported pilot province; Puerto Princesa deepest initial concentration. |
| GTAS-VA-037 | Beta page must expose current Survey Forms. | PENDING | `Help shape GlenTown`; only verified active form URLs. |
| GTAS-VA-038 | Download must include Windows roadmap surface. | PENDING | No Windows download action until authoritative artifact exists. |
| GTAS-VA-039 | Download must cover Android, iOS, Windows, Web coherently. | PENDING | Download remains single source of acquisition truth. |
| GTAS-VA-040 | Public architecture jargon is too technical. | DECIDED | Use `Digital Town`; no `DTOS` in public App Site UI. |
| GTAS-VA-041 | Audience pages risk looking like four unrelated microsites. | PENDING | Shared design system/navigation, distinct audience story, consistent GlenTown identity. |
| GTAS-VA-042 | Current screenshot contents should not block structural UI/UX work. | DECIDED | Disregard screenshot content during current IA audit; preserve/replace later. |

## Next Human Visual Audit — Shared Shell + Home

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

## Features / Audience Visual Audit Gate

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

## Beta / Download Visual Audit Gate

Before accepting release/participation surfaces, verify:

- Palawan Day-1 / Puerto Princesa deepest-density hierarchy is immediately understandable;
- location-dependent capability depth is not confusing;
- Survey Forms are easy to find but do not dominate Beta;
- Download visibly covers Android, iOS, Windows, Web;
- Windows clearly reads as planned/in development when no artifact exists;
- platform actions do not look disabled when actionable or actionable when unavailable;
- release metadata remains concise and legible.

No item above becomes `VERIFIED` until rendered behavior is inspected by a human.