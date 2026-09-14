# GlenTown App Site Acceptance Criteria

**Status:** ACTIVE

## 1. Product Truth

A release candidate must:

- advertise only supported/release-ready capabilities as current;
- distinguish current, Beta, rolling-out, and directional capabilities where needed;
- never contain fabricated ratings, reviews, testimonials, usage counts, partners, scarcity, government endorsement, unrestricted API access, or store/download URLs;
- use authoritative release configuration for platform status and destinations;
- provide truthful fallbacks when official URLs/artifacts are absent;
- present Palawan as the Day-1 supported pilot province;
- identify Puerto Princesa as the deepest initial concentration/operational-density market;
- avoid implying equal local depth across Palawan or nationwide.

## 2. Public Terminology

- Public marketing uses `Digital Town`.
- `DTOS` and `Digital Town Operating System` are absent from public App Site marketing copy unless later explicitly approved.
- Explore labels are exactly: Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory.
- Superseded Shopping / Food & Dining / Travel & Tours labels do not return.
- `Achieve` is used instead of `Aspirations` in public UI.

## 3. Global Header / Navigation / Theme

The accepted site must provide:

- GlenTown logo linked to Home;
- Home;
- clickable Features overview;
- Features submenu with For Tourists, For Residents, For Organizations, For Developers;
- Beta;
- Download;
- persistent `Open Web App` utility action on desktop and accessible mobile equivalent;
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
- exclude `Open Web App` from Hero;
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

- present Palawan as Day-1 supported pilot province;
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
- Web points to the authoritative GlenTown Web destination;
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

Engineering PASS alone is not visual PASS.

## 15. Performance / SEO / Deployment

- web media is optimized;
- public marketing routes do not depend on live operational API availability;
- all public routes have appropriate metadata/canonical handling;
- sitemap/robots reflect intended public routes;
- authoritative Privacy/Terms/Help destinations exist before deployment classification;
- production DNS/TLS/Cloudflare and browser smoke checks pass;
- developer-interest form has anti-abuse/privacy handling before production if enabled;
- survey URLs are reverified before production.

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
- Beta geography reflects Palawan Day-1 / Puerto Princesa deepest density;
- Download includes Windows without falsely offering a download;
- no public terminology regression remains.