# GlenTown App Site Decisions and Rules

**Status:** ACTIVE

## Product / Release Truth

- `app.glentown.com` is the public product/download site for the downloadable GlenTown app.
- `glentown.com` remains the consumer web application.
- Release/download CTAs are configuration-driven.
- Never fabricate app-store links, Beta links, ratings, reviews, testimonials, download counts, partners, adoption, scarcity, or merchant/provider density.
- If a required authoritative URL is missing, render a truthful non-actionable or informational fallback rather than a dead link.

## Brand Assets

- Use official GlenTown brand assets unchanged.
- Current site brand authority is the approved PNG asset set copied into the site repository.
- Do not redraw, recolor, stylize, or invent alternate logos.
- Platform identity must use proper Android/Apple marks rather than generic phone icons.

## Theme

- Default to device/system appearance.
- User can explicitly choose System / Light / Dark.
- Persist user preference.
- Both themes must receive visual review; dark mode must not collapse into excessive black surfaces.

## Navigation

- Desktop active route = active text color + underline.
- Active dot is rejected.
- Preserve `aria-current="page"`.
- Mobile treatment may use a clearer highlighted row/pill where appropriate.

## Device Frames

- Approved direction: Samsung Galaxy A55-inspired frame.
- Small centered circular punch-hole only.
- No notch or Dynamic Island.
- Do not force screenshots into excessively rounded clipping masks.
- Screenshot's real corner geometry is authoritative.
- Device frames are optional presentation tools, not the default treatment for all product media.

## Composition

- Do not use arbitrary/random device angles.
- Multi-device arrangements must follow a deliberate geometric relationship.
- Passive device visuals must not rotate/lift/translate on hover merely for decoration.
- Avoid a repeated wall-of-phones visual language.
- Use photography, UI fragments, raw screenshot crops, icons, typography, and restrained artwork where better suited.

## Photography

Approved lifestyle stories currently include:

- Discover your town
- Local economy
- Services / get things done
- Community / participate locally

Web derivatives exist for site use. Photography should preserve recognizable story/context; do not use narrow image strips or destructive pseudo-cutouts that sever faces, bodies, hands, or key objects.

## Visual Design Authority

Freeform AI art direction is no longer authoritative for major compositions.

Major sections must identify the reference pattern being adapted. Current controlled hybrid:

- bohd4nx/app-landing — typography, one-page restraint, screenshot gallery/lightbox mechanics.
- Sofiyev mobile-app landing template — media diversity, device-led hero pattern, lifestyle split-section composition, decorative transitions, scroll-effect concept.
- Prooland / Allon / Appilo — premium visual benchmark.
- GlenTown — authoritative product/content/brand/release truth.

Do not copy proprietary template assets or code without license authority. Layout/composition references are acceptable; third-party media must be replaced by GlenTown-owned/approved media unless licensing is verified.

## Scrolling

- Preserve the desirable visual/cinematic effect observed in the Sofiyev template.
- Reject its desktop wheel friction caused by long scroll-bound staging.
- Target selected visual scroll waypoints, not strict global section snapping.
- Waypoints may exist within or between semantic sections.
- Precision trackpad and touch should remain native-feeling.
- Reduced-motion users must not be forced through animated progression.

## Screenshot Gallery

`A Closer Look Inside` must be truly horizontally scrollable:

- native/touch horizontal scrolling;
- clear adjacent-item affordance;
- desktop navigation controls where useful;
- snap behavior where it improves control;
- lightbox/detail interaction may follow the bohd4nx pattern;
- avoid dependencies such as Swiper unless an accepted requirement cannot be met natively.

## One-Page Direction

A concise one-page homepage is explicitly acceptable and preferred over unnecessary page length. Richness should come from composition, media variety, and storytelling, not from adding irrelevant pricing/testimonial/stat sections.

## Content Boundaries

- Organize by user intent, not internal module names.
- Advertise only release-ready capabilities.
- Puerto Princesa may be described as the deepest operational pilot/density-building market while maintaining nationwide relevance.
- Do not imply commercial availability everywhere before readiness exists.

## Engineering vs Visual Gates

- lint/typecheck/tests/build passing = engineering evidence.
- human browser/device visual acceptance = visual evidence.
- Neither substitutes for the other.
- Agents must not claim visual success from headless code inspection.

## Documentation Discipline

- Later explicit user decisions supersede earlier assumptions.
- Superseded rules should be marked/reconciled, not silently duplicated.
- Update Current State, Implementation Plan, Visual Audit Ledger, and Memory when material changes occur.