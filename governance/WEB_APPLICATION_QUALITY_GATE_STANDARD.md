# TownBoss Web Application Quality Gate Standard

**Status:** CANONICAL / PORTFOLIO-WIDE / MANDATORY FOR WEB APPLICATIONS AND PUBLIC WEBSITES

This standard defines the minimum quality gates that every TownBoss-produced web application, web portal, public website, landing site, and browser-delivered product must satisfy before a release-ready claim. Project-specific plans may strengthen these gates but may not silently weaken them.

This standard is inherited by Code Project Supervisor validation profiles and by every applicable project acceptance plan.

## 1. Scope and applicability

Apply this standard to:

- public marketing/product websites;
- SEO-facing web applications;
- authenticated web applications and portals;
- administrative/business portals;
- progressive web applications;
- browser-delivered product surfaces.

Some controls are conditional on deployment architecture or route intent. A control may be marked `NOT_APPLICABLE` only with a recorded technical reason and evidence. `NOT_APPLICABLE` is not equivalent to skipped.

SEO indexing requirements differ by route class:

- public discoverable routes must be indexable unless deliberately excluded;
- private/authenticated/account/admin routes should normally be excluded from search indexing;
- staging, preview and non-production environments must not accidentally become indexed.

## 2. Gate A — crawlability, indexing and metadata

For every public indexable route:

- no accidental `noindex` directive or equivalent blocking header;
- unique, descriptive page title;
- useful meta description;
- canonical URL where applicable;
- correct heading hierarchy with exactly one primary page `h1` unless an explicit accessibility/content architecture exception is documented;
- clean, stable, human-readable URL slug;
- useful internal links to relevant related content;
- Open Graph metadata, including an appropriate `og:image` for shareable public pages;
- structured data/schema markup where the page has a supported, truthful schema type and the markup can be validated;
- no contradictory canonical/indexing directives.

For private/non-indexable routes, indexing exclusion must be intentional and verified.

## 3. Gate B — sitemap, robots and search discovery

For public websites and SEO-facing applications:

- valid `sitemap.xml` or equivalent sitemap index generated from intended public routes;
- valid `robots.txt` matching the indexing policy;
- sitemap excludes private, staging, duplicate and intentionally non-indexed routes;
- robots rules do not accidentally block required assets or public routes;
- canonical URLs and sitemap URLs agree;
- Search Console or equivalent webmaster verification is configured before production SEO acceptance where operationally available;
- deployment includes a process to re-submit or refresh discovery after material route changes where appropriate.

## 4. Gate C — link integrity and navigation

Before release:

- zero known broken internal links;
- external links used for critical actions are verified;
- navigation destinations resolve correctly;
- redirects are intentional and do not create loops/chains unnecessarily;
- internal linking supports discoverability and user navigation;
- link labels are meaningful and accessible.

A release candidate with a broken primary CTA, acquisition route, legal route, authentication route, or navigation destination is blocked.

## 5. Gate D — image and media quality

- meaningful images have accurate alt text; decorative images use appropriate empty/decorative semantics;
- images are compressed/optimized for web delivery;
- responsive image sizing is used where materially beneficial;
- lazy loading is used for non-critical below-the-fold media where appropriate;
- above-the-fold/LCP media is not lazily loaded in a way that harms rendering;
- media dimensions/aspect behavior avoid layout shift;
- unsupported or unnecessarily large source formats are not shipped when optimized equivalents are available.

## 6. Gate E — Core Web Vitals and frontend performance

A production/release candidate must be measured using representative production-like conditions.

Required objectives:

- Core Web Vitals are reviewed and material regressions are resolved or explicitly accepted;
- unnecessary re-renders are identified and removed on performance-sensitive flows;
- expensive input-driven work is debounced/throttled where appropriate;
- code is split into sensible chunks and non-critical code is deferred;
- JavaScript and CSS production assets are minified;
- non-critical scripts are deferred/async-loaded where safe;
- unused dependencies and materially unused shipped code are removed;
- route/page loading avoids unnecessary client work;
- loading skeletons/placeholders are used for meaningful asynchronous waits when they improve UX without causing layout instability.

Performance acceptance must be evidence-based rather than based only on local developer perception.

## 7. Gate F — caching, CDN and delivery architecture

Where applicable to the deployment architecture:

- static assets use appropriate cache headers;
- CDN/edge delivery is used for public static/media assets when operationally justified;
- server-side caching is applied to safe expensive reads where beneficial;
- API responses use caching only when correctness, authorization and invalidation semantics permit it;
- expensive computed queries/results are cached where safe and measurable;
- compressed transfer encoding is enabled for suitable responses/payloads;
- cache keys preserve tenant/user/locale/security boundaries;
- cache invalidation behavior is explicit and tested for mutable data.

A cache must never leak user-, tenant-, authorization-, or privacy-scoped data across boundaries.

## 8. Gate G — API and backend efficiency

For web applications backed by APIs/databases:

- no known N+1 query patterns on release-critical paths;
- database indexes exist for measured/known high-cost query patterns where appropriate;
- large collections are paginated or otherwise bounded;
- API payloads are appropriately bounded and do not ship unnecessary fields/data;
- API payload compression is enabled where the platform/deployment supports it;
- database connection pooling is configured where supported and operationally appropriate;
- repeated expensive queries are eliminated or cached safely;
- load testing or representative concurrency evidence exists for high-traffic/high-risk release paths where required.

## 9. Gate H — scalability and availability architecture

The following are mandatory only where the system's scale/availability requirements justify them, but the applicability decision must be explicit:

- load balancer or equivalent managed distribution layer;
- horizontal scaling strategy;
- CDN/edge distribution;
- connection pooling;
- server-side caching;
- health checks and failover behavior;
- rate limiting and abuse protection.

Small or single-instance systems may mark specific infrastructure controls `NOT_APPLICABLE` with justification rather than adding unnecessary architecture.

## 10. Gate I — HTTPS, security and transport

- production traffic is HTTPS-only;
- HTTP redirects to HTTPS where an HTTP listener exists;
- secure-cookie/session behavior is correct;
- sensitive endpoints are not cached publicly;
- security headers are reviewed for the application's deployment model;
- mixed-content requests are absent;
- secrets are not exposed in browser bundles or repository output;
- dependency/security checks required by project policy pass;
- public forms and APIs have appropriate abuse controls before production exposure.

## 11. Gate J — responsive design and accessibility

Accessibility is a release gate, not a polish item. TownBoss web products should target WCAG 2.2 AA for applicable public and application surfaces unless a stricter project or regulatory standard applies.

### Keyboard-only operability

A user must be able to operate the complete release-critical web experience using a keyboard alone, without requiring a mouse, touch input, pointer, hover-only interaction, or cursor-based gesture.

Acceptance requires:

- all interactive elements are reachable by keyboard;
- logical tab order follows the visual/task order;
- `Tab` and `Shift+Tab` move predictably through focusable controls;
- `Enter` and/or `Space` activate controls according to native platform semantics;
- arrow-key behavior is implemented where expected for menus, tabs, radio groups, listboxes, comboboxes and similar composite widgets;
- no keyboard trap exists except an intentional temporary focus trap inside an active modal/dialog, and that trap releases correctly on close;
- visible focus indicators are always available and are not removed without an accessible replacement;
- focus is not lost or reset unexpectedly after navigation, validation, async updates, modal open/close, item creation/deletion, pagination, or route transitions;
- dialogs move focus into the dialog, keep focus inside while active where appropriate, support `Escape` when dismissal is allowed, and restore focus to the invoking control after close;
- dropdowns, popovers, menus, accordions, tabs, carousels, lightboxes and custom widgets have complete keyboard interaction, not only click handlers;
- skip navigation / skip-to-main-content is available where repeated navigation would otherwise create a substantial keyboard burden;
- hover-only content has a keyboard/focus equivalent;
- drag-and-drop or pointer gestures have a keyboard-accessible alternative where they are required to complete a task;
- all release-critical flows can be completed from start to finish with keyboard-only input.

A release candidate fails this gate if a user becomes blocked from a release-critical feature because a mouse, cursor, touch gesture, or pointer hover is required.

### Semantic and assistive-technology accessibility

- semantic HTML/native controls are preferred over custom role emulation;
- page regions use meaningful landmarks such as header, nav, main, aside and footer where appropriate;
- heading hierarchy communicates document structure correctly;
- controls have accessible names, labels and descriptions;
- form fields have persistent labels or an equivalent accessible association;
- validation errors identify the affected field, explain the problem and are programmatically associated with the control;
- status changes, async completion, loading, errors and important dynamic updates are exposed to assistive technology when needed;
- ARIA is used only when native semantics are insufficient and must not conflict with native semantics;
- meaningful images/media have accessible alternatives; decorative media is hidden from assistive technology appropriately;
- tables, lists and data structures use correct semantics;
- icon-only buttons have accessible names;
- link/button purpose is understandable from accessible name and context;
- screen-reader reading order matches the intended content/task order;
- authentication, checkout, booking, submission and other critical flows do not depend on sensory cues alone.

### Visual and interaction accessibility

- color contrast meets applicable WCAG AA expectations for text and meaningful UI boundaries/states;
- information is not conveyed by color alone;
- focus state is visually distinguishable from hover/active states;
- text can scale/zoom without hiding content or controls or forcing two-dimensional scrolling except where intrinsically necessary;
- layouts remain usable at representative mobile, tablet, laptop and desktop widths;
- no unintended horizontal overflow;
- touch targets are reasonably sized and spaced for mobile use;
- reduced-motion preferences are respected where animation/motion is material;
- flashing/strobing content that can create seizure risk is not used;
- animations, carousels, auto-advancing content or time-based interactions provide appropriate pause/stop/control behavior where required;
- orientation is not unnecessarily locked;
- content remains understandable when custom styling fails or assistive modes modify presentation.

### Accessibility evidence

Before release, evidence must include both automated and human/manual checks where applicable:

- automated accessibility scan using the project's approved tooling;
- keyboard-only walkthrough of every release-critical user journey;
- focus-order/focus-visibility inspection;
- dialog/menu/dropdown/custom-widget keyboard verification;
- representative screen-reader or accessibility-tree inspection for critical flows when applicable;
- zoom/reflow and responsive review;
- contrast review;
- reduced-motion verification for motion-heavy surfaces.

Automated accessibility tooling is supporting evidence only. A green automated scan does not prove keyboard completeness, screen-reader usability or accessible task completion.

## 12. Gate K — production cleanliness

Before release/checkpoint promotion:

- no broken links;
- no unintended `noindex` on public routes;
- no unused production dependencies that materially increase attack surface/bundle size;
- no known unnecessary re-render hot spots on critical experiences;
- no debug-only output, placeholder credentials, stale test routes or accidental dev tooling exposed publicly;
- production build uses minification/optimization settings;
- generated assets/routes reflect the intended release state.

## 13. Mandatory evidence bundle

A web release candidate must attach evidence appropriate to its route and architecture, including at minimum:

- route inventory and indexability classification;
- metadata/title/description/canonical verification;
- broken-link scan or equivalent route/link check;
- sitemap and robots validation for SEO-facing products;
- image/alt-text review;
- responsive/browser visual evidence;
- keyboard-only end-to-end accessibility evidence for release-critical flows;
- focus-order/focus-visibility and interactive-widget accessibility evidence;
- automated accessibility scan plus required manual accessibility review;
- production build evidence;
- bundle/dependency review where relevant;
- Core Web Vitals/Lighthouse/Web Vitals evidence for public critical pages where available;
- API/database performance evidence for backend-driven critical paths;
- HTTPS/security verification;
- project test/lint/typecheck/build gates.

Evidence must correspond to the exact repository/deployment state being promoted.

## 14. Release-blocking failures

Unless explicitly approved as a bounded exception, the following block `RELEASE_READY`:

- broken primary navigation/CTA/auth/legal links;
- accidental `noindex` or crawl blocking on intended public pages;
- missing/invalid canonical handling that creates known duplicate-indexing risk;
- missing sitemap/robots on a public SEO site where required;
- any release-critical journey that cannot be completed keyboard-only;
- keyboard traps, invisible focus, unreachable controls or pointer-only release-critical interactions;
- severe screen-reader/semantic, contrast, reflow, reduced-motion or responsive accessibility failure;
- known N+1 query behavior on a release-critical path;
- unbounded large-list/API behavior on a release-critical path;
- material Core Web Vitals regression without accepted justification;
- HTTPS/transport/security failure;
- known privacy/authorization cache leakage;
- production build failure;
- unresolved critical unused/dependency/security issue;
- evidence collected before the final source state rather than after it.

## 15. Supervisor enforcement

Code Project Supervisor must treat this standard as an inherited validation profile for web projects.

Before checkpoint/release promotion it must:

1. determine which gates apply;
2. run or request the required deterministic checks;
3. record `PASS`, `FAIL`, or justified `NOT_APPLICABLE` for each gate family;
4. require a keyboard-only walkthrough of all release-critical web journeys and record evidence;
5. prevent worker prose or automated accessibility scans from overriding failed manual accessibility evidence;
6. require human visual/browser/accessibility review where user experience is material;
7. refuse `RELEASE_READY` while release-blocking failures remain unresolved.

## 16. Relationship to project-specific standards

Project-specific acceptance criteria may add stricter requirements such as SEO route taxonomies, business-specific structured data, government-compliance checks, commerce performance thresholds or browser/device/accessibility matrices.

They may not silently remove portfolio-wide requirements. Any weakening requires a documented, operator-approved exception with scope and review/expiry condition.
