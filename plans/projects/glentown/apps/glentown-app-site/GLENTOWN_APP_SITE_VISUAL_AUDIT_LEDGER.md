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

Do not mark an item VERIFIED from source inspection alone. Verification requires rendered visual evidence.

## Audit Findings

| ID | Finding | Status | Notes |
|---|---|---|---|
| GTAS-VA-001 | Site initially felt excessively black/heavy in dark mode. | PENDING | Theme control works; accepted design must make dark mode intentionally layered rather than predominantly black. |
| GTAS-VA-002 | Theme control missing in earlier implementation. | FIXED | System/Light/Dark control implemented and reported functional. |
| GTAS-VA-003 | Active desktop navigation lacked clear state. | FIXED | Active text color added; dot treatment later rejected. |
| GTAS-VA-004 | Active desktop navigation dot was visually undesirable. | FIXED | Approved state is active text color + underline. Re-verify after template-led rebuild. |
| GTAS-VA-005 | `A Closer Look Inside` did not initially behave as an actual scrollable gallery. | FIXED / NEEDS RE-VERIFY | Horizontal interaction implemented; final target now references bohd4nx gallery/lightbox mechanics. |
| GTAS-VA-006 | Generic thick phone frame looked poor and clipped screenshot corners. | FIXED / NEEDS RE-VERIFY | A55-inspired direction adopted. Final geometry must respect screenshot corners. |
| GTAS-VA-007 | Phone front camera/notch treatment was incorrect. | FIXED / NEEDS RE-VERIFY | Use small centered A55-style circular punch-hole; no notch/Dynamic Island. |
| GTAS-VA-008 | Device arrangement looked random/asymmetric rather than designed. | PENDING | Future multi-device compositions need explicit geometric relationships. |
| GTAS-VA-009 | Passive phone hover animation added no value. | FIXED / NEEDS RE-VERIFY | Remove hover rotate/lift/translate from passive product visuals. |
| GTAS-VA-010 | Site lacked artistic elements and premium visual flow compared with Prooland/Allon/Appilo. | PENDING | Template-led controlled hybrid adopted to address this. |
| GTAS-VA-011 | Overreliance on screenshots/device frames made media treatment repetitive. | PENDING | Media diversity is now an explicit acceptance rule. |
| GTAS-VA-012 | First custom editorial-collage hero produced narrow image strips and disconnected photographic fragments. | REJECTED | Do not reuse this composition. |
| GTAS-VA-013 | First custom hero contained excessive orbital circles, route lines, floating cards, and weak hierarchy. | REJECTED | Freeform AI hero art direction is no longer authoritative. |
| GTAS-VA-014 | Community photo treatment became washed-out/muddy under blend effects. | REJECTED | Do not use destructive/muddy blend modes without actual visual approval. |
| GTAS-VA-015 | Current screenshot set is based on prior audit captures and should eventually be refreshed. | DEFERRED | Acceptable temporary product truth; replace when better verified current-build captures are available. |
| GTAS-VA-016 | Sofiyev demo's desktop mouse-wheel scrolling feels friction-heavy. | REJECTED AS-IS | Preserve visual effect concept, replace behavior with bounded visual waypoints/native-feeling input. |
| GTAS-VA-017 | Sofiyev mobile scrolling feels closer to desired smooth progression. | REFERENCE | Study as interaction reference; do not blindly copy implementation. |
| GTAS-VA-018 | bohd4nx typography is preferred over Sofiyev typography. | DECIDED | Tight modern type hierarchy becomes primary typography reference. |

## Next Visual Audit Gate — V1 Hero

Before proceeding beyond the hero, verify:

- desktop light composition;
- desktop dark composition;
- mobile light composition;
- mobile dark where practical;
- headline/readability and CTA hierarchy;
- media count and balance;
- device geometry/cropping;
- scroll-waypoint behavior if implemented;
- no random passive motion;
- no horizontal overflow;
- clear brand identity;
- visible improvement over rejected Pass 3 hero.

The hero must receive explicit human approval before the next major homepage section is implemented.