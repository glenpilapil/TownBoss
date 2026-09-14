# GlenTown App Site Acceptance Criteria

**Status:** ACTIVE

The GlenTown App Site also inherits the portfolio-wide `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md`. These criteria add GlenTown-specific product, UX and release requirements and do not replace the portfolio web gates.

## 1. Product Truth

A release candidate must:

- advertise only supported/release-ready capabilities as current;
- distinguish current, Beta, rolling-out, and directional capabilities where needed;
- never contain fabricated ratings, reviews, testimonials, usage counts, partners, scarcity, government endorsement, unrestricted API access, or store/download URLs;
- use authoritative release configuration for platform status and destinations;
- provide truthful fallbacks when official URLs/artifacts are absent;
- present Palawan as the supported pilot province;
- identify Puerto Princesa as the deepest initial concentration/operational-density market;
- avoid implying equal local depth across Palawan or nationwide.

## 2. Public Terminology

- Public marketing uses `Digital Town`.
- `DTOS` and `Digital Town Operating System` are absent from public App Site marketing copy unless later explicitly approved.
- Explore labels are exactly: Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory.
- Superseded Shopping / Food & Dining / Travel & Tours labels do not return.
- `Achieve` is used instead of `Aspirations` in public UI.
- Public copy uses `Open GlenTown Web` rather than `Open Web App`.
- Internal rollout shorthand such as `Day-1` is not used in public-facing marketing copy.

## 3. Global Header / Navigation / Theme

The accepted site must provide:

- GlenTown logo linked to Home;
- Home;
- clickable Features overview;
- Features submenu with For Tourists, For Residents, For Organizations, For Developers;
- Beta;
- Download;
- persistent `Open GlenTown Web` utility action on desktop and accessible mobile equivalent;
- System / Light / Dark theme control in Header;
- no duplicate theme control in Footer;
- desktop active text + underline treatment;
- `aria-current="page"` where appropriate;
- keyboard-accessible Features dropdown/mobile navigation.

## 4. Home / Hero Gate

Home must:

- tell a coherent GlenTown story rather than duplicate complete supporting pages;
- communicate GlenTown value within the first viewport;
- use Hero CTA hierarchy `Join the Beta` + `Learn More`;
- exclude `Open GlenTown Web` from Hero;
- make `Learn More` smoothly scroll to the intended next explanatory section while respecting reduced-motion preferences and sticky-header offset;
- summarize Features, Beta, and Download with clear links to their dedicated routes;
- avoid becoming an exhaustive feature wall;
- preserve truthful capability availability.

Hero must additionally pass light/dark and desktop/mobile human visual review and respect reduced motion.

## 5. Features Overview Gate

`/features` must:

- represent all 9 current Explore categories;
- represent the broader Digital Town, not only planners;
- cover community/discovery, local economy/transactions, trust, Life & Memories, Plan & Accomplish, businesses/organizations, government/civic services, and platform/developer capabilities;
- include Personal Timeline, private Diary, Memory Albums, Day Planner, Trip Planner, Event Planner, Financial Planner, and Achieve where product truth permits;
- preserve privacy distinctions between Timeline/Diary/Memories;
- distinguish current vs directional capabilities without misleading status treatment;
- remain scannable and avoid repeated dashboard-card monotony.

## 6. Audience Page Gate

All four audience pages are required:

- `/features/tourists`
- `/features/residents`
- `/features/organizations`
- `/features/developers`

Every audience page must include:

1. a clear audience-specific value proposition;
2. relevant feature/capability groups;
3. a realistic story section showing features working together into an outcome;
4. appropriate trust/availability context;
5. a clear CTA.

Tourists must demonstrate a journey equivalent to:
`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`.

Residents must demonstrate a journey equivalent to:
`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`, and must communicate multi-role identity.

Organizations are business-first in public marketing and must demonstrate a journey equivalent to:
`Establish presence -> Get discovered -> Receive inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`.

Developers must demonstrate a journey equivalent to:
`Register interest -> Approved access when available -> Use shared capabilities -> Build specialized experience -> Respect domain authority`, without implying unrestricted public API access.

## 7. Developer / Partner Interest Modal

Accepted only if:

- implemented as a modal/dialog or approved compact overlay rather than an unnecessary standalone route;
- keyboard focus, Escape, close controls, labels, validation, success/error states, and responsive behavior work;
- production submission includes server validation/privacy handling/anti-abuse controls before launch;
- copy does not promise immediate credentials or approval.

## 8. Government / Civic Integration Gate

Government-service integration must be visible without implying government authority.

Acceptance requires:

- official government systems remain authoritative;
- no government endorsement claim without evidence;
- no claim that every DICT/eGov integration is already live;
- relevant stories may show service discovery, requirements, appointment/errand planning, identity/verification, messaging/payment/reporting only where supported or clearly directional.

## 9. Beta Gate

`/beta` must:

- present Palawan as the supported pilot geography without public `Day-1` shorthand;
- identify Puerto Princesa as deepest initial concentration;
- explain location-dependent feature depth/readiness;
- explain what Beta participants should expect;
- include a visible Survey Forms / `Help shape GlenTown` section;
- use only verified current survey URLs labeled by intended audience;
- provide a clear Join Beta action where authoritative.

## 10. Download Gate

`/download` must present Android, iOS, Windows, and Web.

Acceptance requires:

- Windows is shown as roadmap/in-development until a real artifact exists;
- no false Windows download button;
- official platform actions are configuration-driven;
- Web points to the authoritative GlenTown Web destination and uses `Open GlenTown Web` public copy;
- Version / Requires / Updated values are evidence-aware;
- no invented store URLs.

## 11. Photography / Media / Product Proof

- Photography remains understandable at a glance.
- Important people/context are not arbitrarily severed by masks/crops.
- Media types vary appropriately; not every story is a phone screenshot.
- Current screenshot contents are replaceable and do not dictate structural acceptance.
- Horizontal product showcase, where retained, remains usable by touch, mouse, keyboard, and lightbox controls.

## 12. Information Architecture / Psychology

Acceptance requires:

- Home = narrative and summaries;
- Features = comprehensive capability hub;
- audience pages = contextualized capability + story;
- Beta = participation/rollout/surveys;
- Download = acquisition truth;
- no page feels like an unrelated microsite;
- no feature taxonomy is repeated with conflicting labels;
- audience participation cards do not resemble pricing tiers;
- no fake social proof, urgency, scarcity, or metrics.

## 13. Accessibility / Responsive

- semantic headings/landmarks;
- keyboard-accessible controls;
- visible focus states;
- useful alt text;
- acceptable color contrast;
- no unintended horizontal page overflow;
- reasonable layout at ~390px, ~768px, and desktop widths;
- reduced-motion support where material;
- accessible Header dropdown/mobile navigation;
- accessible developer-interest modal.

## 14. Functional / Engineering Gate

Required before acceptance:

- `npm run lint` PASS
- `npm run typecheck` PASS
- `npm run test` PASS
- `npm run build` PASS
- `git diff --check` PASS
- all primary routes and Features subroutes smoke-test successfully

Engineering PASS alone is not visual PASS and does not satisfy the portfolio web-quality gate by itself.

## 15. Performance / SEO / Deployment

This section is governed by `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md` and is release-blocking where applicable.

The GlenTown App Site must additionally verify:

### SEO / discoverability
- no accidental `noindex` on intended public pages;
- unique meta titles and useful meta descriptions;
- one primary `h1` per page unless an explicit exception is documented;
- clean route slugs;
- useful internal links between Home, Features, audience pages, Beta and Download;
- canonical handling for all public routes;
- valid `sitemap.xml` containing intended public routes only;
- valid `robots.txt` aligned with route-indexing intent;
- appropriate `og:image` and Open Graph metadata for shareable pages;
- truthful schema markup where an applicable schema type is supported;
- Search Console verification before production SEO acceptance where operationally available;
- zero known broken internal links or primary external actions.

### Media / frontend performance
- meaningful images have appropriate alt text;
- web media is compressed/optimized;
- responsive image sizing/lazy loading behavior is appropriate;
- Core Web Vitals are measured on representative public critical pages and material regressions resolved or explicitly accepted;
- unnecessary re-renders on critical experiences are removed;
- input-driven expensive work is debounced where appropriate;
- production JS/CSS is minified;
- sensible code splitting and lazy loading are used;
- non-critical scripts are deferred where safe;
- materially unused production dependencies are removed.

### API / backend efficiency where used
- no known N+1 query behavior on critical paths;
- database indexes exist for known/measured high-cost queries where appropriate;
- large lists are paginated/bounded;
- API payloads are bounded/compressed where supported;
- API/server/expensive-query caching is used only where safe and beneficial;
- database connection pooling, CDN, server-side caching and load balancing are explicitly evaluated for applicability rather than blindly required.

### Deployment / security
- public marketing routes do not depend on live operational API availability;
- production HTTPS is enforced;
- mixed content is absent;
- authoritative Privacy/Terms/Help destinations exist before deployment classification;
- production DNS/TLS/Cloudflare and browser smoke checks pass;
- developer-interest form has anti-abuse/privacy handling before production if enabled;
- survey URLs are reverified before production.

The release evidence must record `PASS`, `FAIL`, or justified `NOT_APPLICABLE` for the inherited web gate families.

## 16. Human Cross-Check Gate

Before UI/UX acceptance, a reviewer must be able to confirm:

- the site feels like one connected GlenTown website across Home/Features/Beta/Download;
- Header correctly connects the experience;
- Home is not overloaded;
- Features is comprehensive;
- each audience page has a meaningful story;
- Digital Town is broader than planners;
- Timeline/Diary/Memories are not omitted;
- business organizations receive clear emphasis;
- government services/integration are visible but truthful;
- Beta geography reflects Palawan pilot support / Puerto Princesa deepest density without internal rollout shorthand in public copy;
- Download includes Windows without falsely offering a download;
- no public terminology regression remains.

## 17. Portfolio Web Gate Completion

Before the App Site can be classified `RELEASE_READY`, attach a completed portfolio web gate receipt covering the applicable families from `governance/WEB_APPLICATION_QUALITY_GATE_STANDARD.md`.

At minimum the receipt must show:

- indexing/metadata: PASS/FAIL;
- sitemap/robots/search discovery: PASS/FAIL;
- broken-link/navigation integrity: PASS/FAIL;
- media/alt/optimization: PASS/FAIL;
- Core Web Vitals/frontend performance: PASS/FAIL;
- API/database efficiency: PASS/FAIL/NOT_APPLICABLE;
- caching/CDN/load-balancing/pooling applicability: PASS/FAIL/NOT_APPLICABLE;
- HTTPS/security: PASS/FAIL;
- responsive/accessibility: PASS/FAIL;
- production cleanliness/dependency review: PASS/FAIL.

Any `FAIL` in an applicable release-blocking gate prevents `RELEASE_READY` unless the operator records an explicit bounded exception.