# GlenTown App Site Acceptance Criteria

**Status:** ACTIVE

## 1. Product Truth

A release candidate must:

- advertise only supported/release-ready capabilities;
- never contain fabricated ratings, reviews, testimonials, usage counts, partners, scarcity, or store URLs;
- use releaseConfig-authoritative platform status and destinations;
- provide truthful fallbacks when official URLs are absent;
- accurately present Puerto Princesa as deepest operational pilot without implying nationwide commercial density.

## 2. Branding

- Official GlenTown logo assets are used unchanged.
- Platform marks are official/appropriate Android and Apple identity assets.
- No unapproved logo redraws, recolors, or improvised marks.

## 3. Typography / Visual System

- Typography follows the accepted modern/tight hierarchy.
- Light and dark themes both feel intentionally designed.
- Dark theme is not dominated by unnecessary black surfaces.
- Visual hierarchy is clear at desktop, tablet, and mobile sizes.
- Major composition follows an approved reference pattern or has explicit human design approval.

## 4. Hero Gate

The hero must:

- communicate GlenTown's value within the first viewport;
- present a clear primary CTA and web alternative where applicable;
- avoid the rejected image-strip/orbital-collage treatment;
- use only a small number of strong media elements;
- maintain intentional balance and negative space;
- avoid random phone/device rotation;
- avoid decorative passive hover motion;
- pass light/dark and desktop/mobile human visual review.

## 5. Photography / Media

- Photography remains understandable at a glance.
- Important people, faces, hands, and contextual objects are not arbitrarily severed by masks/crops.
- Media types vary appropriately; not every story is presented as a phone screenshot.
- Current screenshots are verified app captures rather than invented UI.
- Screenshot/device framing does not distort or over-clip the underlying capture.

## 6. Navigation / Theme

- System theme is default unless user selected another mode.
- Light/Dark/System selection persists.
- Desktop active navigation uses active text color + underline.
- `aria-current="page"` is set appropriately.
- Mobile navigation remains usable and accessible.

## 7. A Closer Look Inside

- horizontal scrolling actually works;
- touch swipe works on mobile;
- desktop navigation controls are usable if present;
- neighboring content provides scroll affordance;
- keyboard/focus interaction is acceptable;
- optional lightbox does not trap users or violate reduced-motion/accessibility expectations.

## 8. Scroll Choreography

If visual scroll waypoints are implemented:

- mouse wheel does not feel sluggish/resistant;
- trackpad remains close to native behavior;
- mobile swipe/inertia remains natural;
- one deliberate gesture can settle toward the next designed visual stop where intended;
- stops are not forced globally on every semantic section;
- reduced-motion preference disables forced animated progression;
- keyboard and scrollbar navigation remain usable.

## 9. Functional / Engineering Gate

Required before acceptance:

- `npm run lint` PASS
- `npm run typecheck` PASS
- `npm run test` PASS
- `npm run build` PASS
- `git diff --check` PASS
- core routes smoke-test successfully

Engineering PASS alone is not visual PASS.

## 10. Accessibility / Responsive

- semantic headings/landmarks;
- keyboard-accessible controls;
- visible focus states;
- useful alt text;
- acceptable color contrast;
- no unintended horizontal page overflow;
- reasonable layout at ~390px, ~768px, and desktop widths;
- reduced-motion support where animation is material.

## 11. Performance

- web media is optimized;
- source originals are not shipped directly when optimized derivatives exist;
- hero assets are appropriately prioritized;
- avoid unnecessary animation libraries or carousel dependencies;
- no basic marketing route should depend on live API availability.

## 12. Deployment Gate

`DEPLOYED` additionally requires:

- authoritative Privacy/Terms/Help destinations;
- official distribution URLs where applicable;
- production DNS/TLS/Cloudflare verification;
- deployment smoke test;
- production browser/visual verification.

`OPERATIONAL` additionally requires a repeatable release/content update process and named ownership.