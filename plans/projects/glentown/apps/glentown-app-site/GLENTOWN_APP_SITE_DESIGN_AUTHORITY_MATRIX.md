# GlenTown App Site Design Authority Matrix

**Status:** ACTIVE / CONTROLLED HYBRID

This matrix prevents future implementation agents from inventing major visual systems without a named authority.

| Concern | Primary Authority | Secondary Reference | GlenTown Adaptation Rule |
|---|---|---|---|
| Typography hierarchy | `bohd4nx/app-landing` | Premium references | Keep tight tracking, strong heavy display headings, restrained body copy; do not import Sofiyev's playful display typography. |
| Homepage structural restraint | `bohd4nx/app-landing` | GlenTown product needs | One-page is acceptable; do not add pricing/testimonial/stat sections without real need/evidence. |
| Hero composition | Sofiyev mobile-app template | Prooland / Allon / Appilo | Device-led composition may be adapted; use GlenTown media/branding; avoid the rejected four-photo custom collage. |
| Hero scroll effect | Sofiyev visual concept | GlenTown interaction rules | Preserve cinematic progression but replace 300vh friction with accessible visual waypoints / bounded scroll choreography. |
| Lifestyle photography integration | Sofiyev 50/50 story splits | Prooland / Allon / Appilo | Use approved GlenTown lifestyle photography with recognizable context and varied composition. |
| Screenshot gallery / lightbox | `bohd4nx/app-landing` | Existing GlenTown rail | Prefer native horizontal scrolling, touch support, adjacent peek, optional desktop controls/lightbox. |
| Generic icons | GlenTown / Lucide | Template structure only | Keep `lucide-react`; do not import React Icons solely to match a template. |
| Platform marks | GlenTown official assets | Platform brand guidance | Use official Android/Apple marks; no generic substitutes. |
| Device frame | GlenTown A55 direction | Sofiyev device emphasis | Use A55-inspired geometry only where device context helps. |
| Theme behavior | Existing GlenTown `next-themes` implementation | bohd4nx behavior | System default + persisted Light/Dark override; preserve current architecture unless a defect is proven. |
| Decorative backgrounds | Sofiyev | Premium references | Adapt waves, blobs, grids, routes only when they support hierarchy; avoid generic decoration overload. |
| Section transitions | Sofiyev + premium references | GlenTown | Use restrained composition changes between sections; no scroll hijacking. |
| FAQ structure | bohd4nx | Existing GlenTown content | Structure may be adapted; content remains truthful and GlenTown-authored. |
| Final CTA / store presentation | GlenTown release logic | bohd4nx/Sofiyev visual patterns | CTA availability and URLs remain releaseConfig-authoritative. |
| Product copy / claims | GlenTown canonical docs | Product marketing context | Template copy/social proof never becomes GlenTown truth. |
| Brand assets | GlenTown official assets | None | Use unchanged. |

## Rejected Authorities / Patterns

- Cruip Open as primary reference — rejected based on visual direction before deep audit.
- bohd4nx hero as primary GlenTown hero — too minimal/generic for target art direction.
- Sofiyev typography — rejected.
- Sofiyev 300vh desktop hero scroll binding — rejected due mouse-wheel friction.
- AI-generated freeform orbital/editorial hero collage — rejected by human visual audit.
- Generic SaaS blob/card composition as default — rejected.
- Pricing and fabricated testimonials/social proof — rejected until product truth supports them.

## Implementation Rule

Every major visual change must name the reference pattern it is adapting and identify any intentional deviation. If no reference authority applies, the work remains a design proposal and must be visually approved before broad implementation.