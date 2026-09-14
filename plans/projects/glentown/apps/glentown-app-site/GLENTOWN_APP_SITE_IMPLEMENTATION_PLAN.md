# GlenTown App Site Implementation Plan

**Status:** ACTIVE / IA RECONCILIATION / VISUAL AUDIT OPEN  
**Application:** `app.glentown.com`  
**Implementation repository:** `glenpilapil/GlenTown-App-Site`  
**Latest verified site checkpoint at time of this update:** `723264018a7b15721b9de95ab5e281bb9da1f910` on `feat/v1-typography-hero`

## 1. Objective

Deliver a production-grade, SEO-first, truthful, visually polished public website for GlenTown that:

1. explains GlenTown through a coherent product story;
2. presents the breadth of the connected **Digital Town** without collapsing it into a single marketplace, directory, social network, or planning product;
3. gives major audiences focused feature pages and realistic story sections showing how capabilities work together;
4. provides authoritative Beta, survey, release-status, download, Windows-roadmap, and Web-access information;
5. preserves a clean Next.js architecture, evidence-based marketing, accessibility, and explicit human visual acceptance gates.

Public-facing copy must use **Digital Town** as the preferred term. Do not use `DTOS` or `Digital Town Operating System` in marketing UI unless a later explicit decision reverses this rule.

## 2. Current Strategic Direction

The prior one-page-only experiment is superseded. The approved direction is now a **connected multi-page product website** with a narrative Home page and focused supporting routes.

The website should make GlenTown's breadth understandable by connecting capabilities instead of presenting unrelated mini-products.

The central public narrative is:

`local life is fragmented -> GlenTown connects it -> people discover and participate -> people transact and communicate -> GlenTown helps them plan and accomplish -> trust, memories, businesses, government access, and platform integrations reinforce one Digital Town`

The planners are one layer of the Digital Town, not the definition of the Digital Town.

## 3. Information Architecture

### 3.1 Global Header

Restore the persistent site header.

Desktop target:

`[GlenTown logo]  Home  Features ▾  Beta  Download  |  Open Web App  |  Theme`

Requirements:

- GlenTown logo links to `/`.
- `Home` links to `/`.
- `Features` is clickable and links to `/features`.
- Features dropdown contains:
  - `For Tourists` -> `/features/tourists`
  - `For Residents` -> `/features/residents`
  - `For Organizations` -> `/features/organizations`
  - `For Developers` -> `/features/developers`
- `Beta` links to `/beta`.
- `Download` links to `/download`.
- `Open Web App` links to the authoritative GlenTown Web destination (`glentown.com`) and is a persistent utility action, not a Hero CTA.
- System / Light / Dark theme control returns to the header and is removed from the footer.
- Header should remain low-profile, responsive, accessible, and sticky where visual review approves it.
- On scroll, header may use a subtle opaque/translucent surface for readability.
- On mobile, use a compact menu; Features must remain expandable and `Open Web App` may live inside the mobile menu.
- Active route treatment remains active text color + underline on desktop; preserve `aria-current`.

### 3.2 Primary Routes

Approved route family:

- `/` — narrative Home and concise summaries of Features, Beta, and Download.
- `/features` — complete capability hub.
- `/features/tourists` — tourist-focused capability and story page.
- `/features/residents` — resident/citizen-focused capability and story page.
- `/features/organizations` — business-organization-focused capability and story page.
- `/features/developers` — platform/developer capability and integration story page.
- `/beta` — Beta scope, rollout, participation, surveys, and expectations.
- `/download` — authoritative platform release/download/access page.

Do not create a separate route solely for developer/partner registration interest. Use an accessible modal launched from the developer page and other relevant CTAs.

## 4. Home Page — Narrative, Not Exhaustive Catalog

Home should tell the story and summarize deeper routes rather than repeat every capability.

### 4.1 Hero

Preserve the approved GlenTown visual concept and official logo motif.

Hero CTA hierarchy:

1. `Join the Beta` -> `/beta`
2. `Learn More` -> smooth-scroll to the first explanatory Home section

Remove `Open Web App` from Hero; it belongs in the header and Download summary/page.

Hero requirements:

- communicate GlenTown value within the first viewport;
- maintain a full-viewport-feeling composition without excessive overflow;
- keep a clear indication that more content follows, such as the approved downward scroll cue;
- preserve reduced-motion behavior;
- do not overload Hero copy with planner names or architecture terminology.

### 4.2 Home Story

Home should include, in a restrained flow:

1. why GlenTown exists / local-life fragmentation;
2. real-life story sections;
3. `Discover`, `Connect`, `Get Things Done` as parallel behaviors, not numbered sequential steps;
4. concise Feature summary linking to `/features`;
5. concise Digital Town summary that communicates connected local life, memories, planning, businesses, trust, government access, and platform services without becoming a feature wall;
6. Trust & Verification summary where useful;
7. product proof / screenshot showcase;
8. concise Beta summary linking to `/beta`;
9. concise Download summary linking to `/download`;
10. FAQ if it remains useful on Home;
11. compact final CTA;
12. footer.

The Home page may preview audience paths, but complete audience capability lists belong on Features routes.

## 5. Features Overview — Complete Capability Hub

`/features` is the authoritative public capability overview. It may be comprehensive, but must use progressive disclosure and truthful maturity/status language.

### 5.1 Explore Taxonomy

Use the current approved Explore labels:

1. Products
2. Foods
3. Services
4. Tourism
5. Events
6. Jobs
7. Properties
8. Suppliers
9. Directory

Do not revert to the superseded labels `Shopping`, `Food & Dining`, or `Travel & Tours`.

### 5.2 Digital Town Capability Families

The Features hub must communicate that the Digital Town is broader than the orchestration/planner layer.

Organize capabilities across connected families such as:

#### Discover & Participate

- Community and local social participation
- Products and Pre-Loved
- Foods
- Services and professionals
- Tourism
- Events
- Jobs/opportunities
- Properties
- Suppliers
- Directory / Places / local discovery
- Messaging / requests / group participation where release-ready
- Reviews / reputation / Trust & Verification
- Orders, bookings, reservations, scheduling, and checkout where supported

#### Life & Memories

- Personal Timeline
- private Diary
- Memory Albums
- milestones / memory dates / throwbacks where supported
- controlled sharing/conversion boundaries where release-ready

The site must preserve privacy distinctions: Diary is private; Timeline/public-memory behavior must not imply private diary content is automatically public.

#### Plan & Accomplish

- Day Planner
- Trip Planner
- Event Planner
- Financial Planner
- Achieve
- shared orchestration value: tasks, requirements, dependencies, resources, schedules, blockers, validation, and completion

Do not market these as generic to-do/calendar clones. Do not imply all planner capabilities have equal release maturity.

#### Businesses & Organizations

The underlying product taxonomy supports general organizations, but the App Site's audience page and marketing emphasis must focus on **business organizations** and economically active organizations:

- MSMEs and local businesses
- merchants/sellers
- service businesses and professionals
- employers
- tourism businesses
- suppliers/cooperatives where relevant
- business profiles/presence
- products/services
- customer inquiries/messages
- orders/bookings
- jobs/events
- reviews/reputation/verification
- organization/workforce/tasks/approvals/attendance/expense/performance capabilities only with explicit current-vs-roadmap labeling

Do not imply the full future Business Platform is already Beta-ready if it is not.

#### Government & Civic Services

Government-service integration must be visible as a major Digital Town direction.

Public messaging should emphasize:

- authoritative government information and services;
- government-service discovery;
- requirements/checklist assistance where supported;
- appointment/errand planning and orchestration;
- identity/verification integrations where authorized;
- official messaging, payment, citizen-report, and other integrations only where authoritative government adapters/contracts permit them;
- GlenTown routes users to or integrates with authoritative government systems rather than replacing government databases or implying government authority.

Approved/high-priority government interoperability references include the DICT eGov API ecosystem and authorized services such as eGov SSO, eVerify/PhilSys, eMessage, eGovPay, liveness, citizen reports, and DBM Compass where production access, policy, and implementation readiness are established.

Never imply government endorsement solely because integration is planned or technically possible.

#### Platform & Developers

Where public/partner appropriate:

- identity/authentication
- location/geographic entities
- search/discovery and Places
- messaging
- notifications
- reviews/reputation/trust
- payments/credits where authorized
- scheduling
- public-data gateway
- orchestration
- APIs / permissions / scopes
- authorized vertical integrations

Specialized vertical systems should retain domain authority; GlenTown exposes/consumes shared capabilities through controlled contracts rather than absorbing every specialist domain.

## 6. Audience Feature Pages

Every Features submenu page must contain BOTH:

1. audience-specific feature/capability groups; and
2. a **story section** demonstrating how those capabilities connect into a realistic end-to-end outcome.

These pages are not filtered card catalogs. The story section is mandatory for acceptance.

### 6.1 `/features/tourists` — For Tourists

Primary question: **How does GlenTown help me experience a place?**

Feature emphasis may include:

- Tourism discovery
- destinations / local places / stays where supported
- Foods
- Events
- local Products
- experiences/tours
- reviews/trust
- messaging/providers
- bookings/reservations
- Trip Planner
- local transfers/vehicle/boat rentals where supported
- Timeline/memories after the experience where supported

Story section target:

`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`

The story should show how discovery, planning, trusted local supply, transactions, timing, and memories connect. It must not become a tourism-only directory.

### 6.2 `/features/residents` — For Residents

Primary question: **What can GlenTown do for my everyday local life?**

Feature emphasis may include:

- Community
- Products / Pre-Loved
- Foods
- Services / professionals
- Jobs/opportunities
- Properties
- Suppliers / Directory
- Events / Tourism
- Messaging
- reviews/trust/verification
- orders/bookings
- Day Planner
- Financial Planner
- Achieve
- Trip/Event Planner where relevant
- Timeline
- Diary
- Memory Albums
- government/civic-service discovery and integrations where supported
- the current onboarding paths and multi-role identity model

Story section target:

`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`

Demonstrate that one resident may be a buyer, seller, worker, learner, traveler, service customer, provider, organization member, and community participant at different times.

### 6.3 `/features/organizations` — For Organizations

Marketing focus: **business organizations first**, while acknowledging GlenTown's broader organization model.

Primary question: **How can a business participate and operate inside the Digital Town?**

Feature emphasis may include:

- create or claim a business presence where supported
- become discoverable in relevant categories
- Products / Services / Foods / Tourism offerings as applicable
- messages/inquiries
- orders/bookings
- events
- jobs/opportunities
- reviews/reputation/trust/verification
- customers and local demand participation
- supplier/business relationships
- later business-operating capabilities such as workforce, tasks, approvals, attendance, expenses, performance, CRM/analytics only with roadmap/rolling-out truth labels

Story section target:

`Establish your presence -> Get discovered -> Receive an inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`

Do not frame the page as a generic institutional software catalog.

### 6.4 `/features/developers` — For Developers

Primary question: **What can I build with GlenTown?**

Feature emphasis may include:

- shared platform services
- identity/authentication
- location/geography
- Places/discovery
- commerce and transaction primitives where exposed
- trust/verification/reputation signals where exposed
- messaging/notifications where exposed
- scheduling/orchestration where exposed
- public data and government adapters where authorized
- permissions/scopes
- approved vertical integration patterns

TownTraveler and RealWise/GeoPlotter may be used as architecture-pattern examples where truthful, but do not imply public unrestricted API access.

Story section target:

`Register interest -> Approved access when available -> Use shared GlenTown capabilities -> Build a specialized experience -> Respect domain authority and integration boundaries`

#### Developer / Partner Interest Modal

Use an accessible modal, not a dedicated registration page.

Requirements:

- CTA such as `Register Interest`;
- form fields limited to what is actually needed;
- explicit purpose and privacy notice/consent where required;
- client + server validation when submission is enabled;
- focus trap;
- Escape close;
- close button;
- keyboard-accessible controls;
- success/error states;
- mobile full-height/sheet fallback where appropriate;
- anti-abuse controls before production;
- no promise of immediate API credentials or unrestricted access.

## 7. Beta Page

`/beta` becomes the definitive Beta participation and rollout page.

### 7.1 Geography

Supersede the prior public framing of a Puerto-Princesa-only pilot.

Approved public rollout language:

- **Palawan is the Day-1 supported pilot province.**
- **Puerto Princesa is the deepest initial concentration and operational density market.**
- Other Palawan towns/municipalities may be supported from Day 1, while feature depth, local supply, and operational readiness can differ by location.
- Nationwide registration/selected capabilities may coexist with staged local depth outside Palawan according to product readiness.

Do not claim equal commercial density across Palawan or nationwide.

### 7.2 Beta Content

Include:

- Beta hero / participation CTA
- `Nationwide access. Local depth.` or superseding approved wording
- Palawan Day-1 pilot context
- Puerto Princesa deepest-density explanation
- capability-based rollout explanation
- what Beta users should expect
- evolving features / feedback expectations
- audience participation paths
- release/install guidance linked to `/download`

### 7.3 Survey Forms

Beta must include a clear `Help shape GlenTown` / Survey Forms section.

Requirements:

- link only to current authoritative forms;
- verify current active URLs before implementation;
- label each form by intended audience;
- do not preserve obsolete survey URLs merely because they existed in earlier campaigns;
- appropriate current forms may include Resident/Consumer, Business/MSME, Beta/Pilot, and other active validated segments.

## 8. Download Page

`/download` is the authoritative acquisition/release page.

Supported presentation surfaces:

1. Android
2. iOS
3. Windows
4. Web

Rules:

- Android/iOS remain primary mobile targets.
- Windows must be represented because adaptive Windows work is part of the approved product direction, but must show truthful status such as `In development`, `Coming later`, or configuration-driven equivalent until a real Windows distribution artifact exists.
- Web routes to the authoritative GlenTown Web experience.
- Do not present a Windows download button until an authoritative artifact/source exists.
- Store/download/Beta URLs must remain configuration-driven.
- Release metadata must distinguish current verified values from placeholders requiring later release verification.

Download should contain:

- platform status/action cards
- Version
- Requires
- Updated
- Web access
- official source/integrity guidance where useful
- installation/help link when authoritative

## 9. Public Terminology

Mandatory public copy rules:

- Prefer **Digital Town**.
- Do not use `DTOS` in public site copy.
- Do not use `Digital Town Operating System` in public marketing copy unless later explicitly approved.
- Use `Town` as the friendly shared user-facing label for City/Municipality where appropriate.
- Current Explore labels: Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory.
- `Achieve` is the approved product term; do not revert to `Aspirations` in public UI.

Internal architecture/documentation may retain technical terms where needed, but the App Site presentation should remain consumer-readable.

## 10. Footer

Theme controls are removed from Footer because they belong in Header.

Footer should provide conventional infrastructure links, subject to authoritative destinations:

- GlenTown logo / short description
- Product: Home, Features, Beta, Download
- Features: Tourists, Residents, Organizations, Developers
- GlenTown Web
- Help/Support
- Privacy
- Terms

Do not invent unavailable legal/support/social links.

## 11. Media / Storytelling

The site must not become a wall of screenshots or feature cards.

Use the medium appropriate to the story:

- real local-life photography
- verified screenshots
- device frames only where useful
- raw screenshot crops/UI fragments
- icons
- typography
- restrained brand/decorative treatments
- story sequences on audience pages

Current screenshots remain replaceable audit-era content. UI/UX acceptance must not depend on keeping the current screenshot set.

## 12. Visual / Psychology Rules

- One section should have one primary communication job.
- Use progressive disclosure; Home summarizes, Features expands, audience pages contextualize.
- Avoid taxonomy fatigue by visually distinguishing Explore categories from intent/path stories.
- Prefer outcome-first copy over internal module terminology.
- Trust/proof should precede high-commitment conversion where practical.
- Hero, Beta, Download, and final CTA may repeat calls-to-action for distinct reasons; do not put a CTA in every section.
- No fake urgency, scarcity, testimonials, ratings, users, partner logos, or government endorsement.
- Do not make audience participation cards look like pricing tiers.
- Connected capability stories should show why GlenTown breadth belongs in one product.

## 13. Responsive / Accessibility Requirements

Validate at minimum:

- desktop around 1440×900
- tablet around 768px wide
- mobile around 390px wide

Required:

- accessible global header and dropdown/menu
- keyboard-operable Features submenu
- visible focus states
- persistent theme preference
- developer-interest modal accessibility
- story sections reflow without losing narrative order
- no unintended horizontal page overflow
- reduced-motion support for Hero/scroll effects
- semantic headings and landmarks
- meaningful alt text
- acceptable contrast

## 14. Implementation Phases

### Phase R0 — Documentation Reconciliation

- [x] Reconcile TownBoss App Site documentation with the multi-page decision.
- [x] Record public `Digital Town` terminology rule.
- [x] Record new Explore taxonomy labels.
- [x] Record Palawan Day-1 / Puerto Princesa deepest-density rollout rule.
- [x] Record Windows download roadmap surface.
- [x] Record audience-page story requirements.
- [x] Record developer-interest modal requirement.
- [ ] Reconcile repository-local README/architecture/docs before or with implementation.

### Phase R1 — Shared Site Shell

- [ ] Restore accessible header with GlenTown logo.
- [ ] Add Home / Features / Beta / Download navigation.
- [ ] Add Features dropdown/submenu.
- [ ] Restore theme controls to Header; remove from Footer.
- [ ] Add persistent `Open Web App` header utility action.
- [ ] Preserve responsive/mobile navigation and active-route state.
- [ ] Update Footer navigation.

**Gate R1:** header/footer/theme/navigation pass desktop/tablet/mobile visual + accessibility review.

### Phase R2 — Home Recomposition

- [ ] Hero: `Join the Beta` + `Learn More` only.
- [ ] Remove Hero `Open Web App` CTA.
- [ ] Preserve Hero visual brand treatment, viewport behavior, scroll cue, reduced motion.
- [ ] Keep Home focused on story and concise Features/Beta/Download summaries.
- [ ] Remove duplicate/exhaustive content better owned by supporting pages.
- [ ] Preserve real-life storytelling and product proof.

**Gate R2:** Home tells one coherent GlenTown story and does not read as several sites stacked together.

### Phase R3 — Features Overview

- [ ] Build complete `/features` hub using current taxonomy.
- [ ] Represent Digital Town breadth beyond planners.
- [ ] Include Life & Memories, planning, businesses, government/civic, trust, and platform capabilities with truthful status semantics.
- [ ] Provide clear audience links.

**Gate R3:** complete but scannable capability hub passes product-truth and information-architecture review.

### Phase R4 — Audience Pages

- [ ] `/features/tourists`
- [ ] `/features/residents`
- [ ] `/features/organizations`
- [ ] `/features/developers`
- [ ] Include mandatory story section on every page.
- [ ] Implement developer/partner interest modal.

**Gate R4:** each page explains both capabilities and a realistic connected outcome for its intended audience.

### Phase R5 — Beta

- [ ] Reframe pilot as Palawan Day-1 support.
- [ ] Identify Puerto Princesa as deepest initial density.
- [ ] Explain location-dependent depth.
- [ ] Add authoritative Survey Forms section.
- [ ] Preserve truthful Beta expectations and CTAs.

**Gate R5:** rollout geography and participation are unambiguous and evidence-safe.

### Phase R6 — Download

- [ ] Android state/action.
- [ ] iOS state/action.
- [ ] Windows roadmap state/action with no false artifact.
- [ ] Web access.
- [ ] Version / Requires / Updated.
- [ ] authoritative release configuration and URLs only.

**Gate R6:** download/release page is the single source of acquisition truth.

### Phase R7 — Release Readiness

- [ ] lint
- [ ] typecheck
- [ ] tests
- [ ] production build
- [ ] `git diff --check`
- [ ] route smoke checks for all new routes
- [ ] responsive visual audit
- [ ] keyboard/accessibility audit
- [ ] dark/light/system theme audit
- [ ] metadata/sitemap/canonical route audit
- [ ] performance/media audit
- [ ] Help/Privacy/Terms destination verification
- [ ] production DNS/TLS/Cloudflare verification when deploying

## 15. Engineering and Visual Gates

Engineering validation and human visual acceptance remain separate.

For every implementation tranche:

1. inspect current source and preserve accepted work;
2. implement bounded scope;
3. run engineering checks;
4. perform actual browser visual inspection;
5. perform responsive and keyboard checks;
6. reconcile findings against this plan and acceptance criteria;
7. update Current State / Visual Audit Ledger / Memory;
8. checkpoint only after the relevant gate is accepted.

Do not infer visual success from agent self-report, screenshots alone, or passing tests.

## 16. Cross-Check Standard for Human UI/UX Review

The future human review must be able to answer YES to all of these:

- Does Home tell the story without trying to contain every feature?
- Does Header connect the site clearly across routes?
- Is `Open Web App` available without competing with Hero conversion?
- Are Features comprehensive and based on current GlenTown taxonomy?
- Do Tourists, Residents, Organizations, and Developers each receive an audience-specific page?
- Does every audience page demonstrate a realistic connected story, not just list features?
- Is `Digital Town` communicated as a broad connected ecosystem rather than merely the planner layer?
- Are Timeline, Diary, Memory Albums, planners, business capabilities, trust, government-service integration, and platform integration represented where appropriate?
- Is the Organizations page business-first while respecting the general organization model?
- Is Government/Civic integration prominent but truthful and non-authoritative in tone?
- Does Beta communicate Palawan Day-1 support and Puerto Princesa deepest concentration accurately?
- Are current survey links easy to find on Beta?
- Does Download cover Android, iOS, Windows, and Web truthfully?
- Is the developer/partner interest flow a modal rather than an unnecessary page?
- Are public labels Products / Foods / Tourism used instead of superseded taxonomy names?
- Are theme controls in Header and absent from Footer?
- Is the site visually coherent across routes rather than four unrelated microsites?
- Are future/rolling-out capabilities distinguished from verified current behavior?

If any answer is NO, the corresponding UI/UX requirement remains open.