# GlenTown Project Memory

**Status:** CANONICAL / LIVING DOCUMENT

This is GlenTown's durable development-memory ledger. It records material decisions, implementation milestones, verification, incidents, blockers, lessons, checkpoints and handoffs. It supplements the normative implementation plans and decisions; it does not replace them.

## Memory rules
- Append material history; do not erase failed or superseded approaches.
- Distinguish `DECISION`, `IMPLEMENTATION`, `VERIFICATION`, `INCIDENT`, `LESSON`, `CHECKPOINT`, `BLOCKER` and `SUPERSEDED`.
- Prefer repository refs, test results, PRs and file paths as evidence.
- Planned work is not implemented; implemented work is not verified without evidence.
- Update before substantial milestone handoff.

## 2026-09-13 â€” TownBoss-level GlenTown implementation strategy strengthened

**Type:** DECISION / IMPLEMENTATION
**Status:** CURRENT

GlenTown adopted the strongest applicable Code Project Supervisor governance patterns as a product-specific execution system rather than copying CPS infrastructure concerns. New canonical documents establish: Authority Matrix, Capability Matrix, Blocker/Dependency Register, Validation Profiles, Operational Acceptance Test, Risk Register and Release Evidence Manifest template.

`GLENTOWN_IMPLEMENTATION_PLAN.md` is now phase-gated from canonical-state reconciliation through core UX recovery, demo/data reality, critical journeys, nationwide readiness, quality/security/compliance, release-candidate operational acceptance and production verification. Status promotion is explicit: PLANNED, IMPLEMENTED, INTEGRATED, TEST_VERIFIED, RUNTIME_VERIFIED, PHYSICAL_VERIFIED, RELEASE_READY.

The documentation-compliance protocol now requires structured receipts and mandatory safe-abort/recovery behavior in substantial agent task contracts. Known blockers must be reconciled into the canonical Blocker Register instead of remaining scattered through agent reports or conversations.

## 2026-09-13 â€” TownBoss project-governance baseline adopted

**Type:** DECISION / IMPLEMENTATION
**Status:** CURRENT

GlenTown inherits `governance/DEVELOPMENT_RULES.md` and `governance/PROJECT_GOVERNANCE_STANDARD.md`. The implementation plan is the operator dashboard. Substantial work must perform planning-document review, execution re-checks when assumptions change, final documentation review, and a Documentation Compliance Receipt.

## 2026-09-12 â€” Canonical implementation evidence reconciled

**Type:** VERIFICATION
**Status:** CURRENT

The implementation plan records canonical API and Flutter branch evidence, including integrated messaging ancestry, Trip/Event/Financial Planner integrations, historical Laravel/Flutter verification, and the requirement for fresh current-HEAD verification before promotion to VERIFIED.

## Current handoff
The active frontend recovery sequence remains bounded: completed Home/navigation/notifications/community/map/cart/Around You work requires physical recheck; Explore canonical audit backlog is the next major screen recovery, followed by remaining Create/Chat/You findings. Cross-repo/data/architecture blockers must be resolved or tracked through the canonical blocker register while realistic demo/Beta data and release-readiness gates progress in parallel where dependencies permit.

## 2026-09-21 â€” GlenTown-App shared baseline and TownBoss reconciliation

**Type:** GOVERNANCE / CURRENT-STATE RECONCILIATION
**Status:** CURRENT

GlenTown-App `8e17b297b7a3b2e5b0a35eafebcefe9409f37759` is the reconciled shared
baseline candidate, preserving Web recovery implementation
`f5267d9ae12dd1e08a457e1c85639544ba8dc3ad`. It is not final Web visual
acceptance or feature-completeness evidence. F-W2-003 and F-W2-013 remain
visually closed; F-W2-005 remains open/deferred for the 1199px Explore
navigation/banner overlap; F-W2-008 is implemented but needs fresh SHA-bound
visual verification. `REAL_API_VISUAL_SANITY` is unverified because correction-03
purported real-API captures were byte-identical to fixture captures.

Current sequence: converge App and TownBoss, resume Android as a first-class
lane, continue bounded Web feature/completeness work, use live real-API QA with
explicit fixture mode, then complete responsive/adaptive QA after major Web
elements exist. The baseline record retains the canonical navigation, taxonomy,
jobs/hiring and `>=1200` desktop-breakpoint authority and records the live-QA
and project-folder operating rules.

## 2026-09-13 â€” Live dashboard backfill and recovery chain reconciliation

**Type:** IMPLEMENTATION / VERIFICATION / CHECKPOINT
**Status:** CURRENT

TownBoss rebuilt the implementation plan as a live phase/deliverable/task dashboard with gates, blockers, evidence and next work. It records the Home chain `170baca` â†’ `969abec` â†’ `9a7861e` â†’ `a43442b` â†’ `c28feee` â†’ `ff6d2e2` (369 Flutter tests, analyze clean, diff check pass), audit backlog normalization `9db4f88`, and Explore recovery `3edfb0c` (33 focused Explore tests, 9 cross-route tests, 369 full tests, analyze clean, diff check pass). No physical verification is claimed. Next eligible implementation work is D1.4 Create recovery; it was deliberately not started in this documentation checkpoint.

**Documentation Compliance Receipt:** planning review covered TownBoss governance, the CPS dashboard reference, all required GlenTown controls, and read-only App/API history; execution re-check covered Git baseline/branch evidence and blocker/capability alignment; final review covers this dashboard, Current State, Capability Matrix, Blocker Register, Memory, acceptance criteria, and checkpoint policy. Conflicts: none; exceptions: none; Risk Register: no material risk truth changed; validation: documentation diff review and `git diff --check`; safe-abort event: patch engine removed four task-owned docs during a rejected replacement, immediately restored as the intended replacements and verified before checkpoint.

## 2026-09-13 â€” Dashboard integrated on canonical TownBoss main

**Type:** CHECKPOINT
**Status:** CURRENT

The evidence-backed live dashboard was integrated on TownBoss `main` through merge commit `66efa2e`. Its current phase remains Phase 1 and next eligible implementation work remains D1.4 Create recovery; no Create work was begun by the integration.

## 2026-09-13 â€” Create recovery checkpoint

**Type:** IMPLEMENTATION / VERIFICATION / CHECKPOINT
**Status:** CURRENT

GlenTown-App `aa07d2586f0b7db9a440f20b6fa927fee374b4b0` closes independently App-fixable D1.4 work. The existing role-aware Create hierarchy, shared Community taxonomy/preselection, citizen Pre-Loved composer, commercial setup gate, and employer-gated jobs were revalidated. The contextual business-claim entry now opens the dedicated Trust & Verification screen rather than simulating document upload or claim success. Evidence: 9 focused tests, 370 full Flutter tests, full analyze with no issues, and diff check pass.

D1.4 is App-side complete and `READY_FOR_PHYSICAL_RECHECK`, not physically verified. Community category/media/poll persistence and business-claim persistence remain `BLOCKED_API_CONTRACT`; Create IME/CTA and permission flows require Samsung verification. Next bounded deliverable: D1.5 Chat recovery.

## 2026-09-13 â€” Chat recovery checkpoint

**Type:** IMPLEMENTATION / VERIFICATION / CHECKPOINT
**Status:** CURRENT

GlenTown-App `f9702ed672679d6744e17a281c96c95ee312299f` closes independently App-fixable D1.5 work. The checkpoint revalidated the approved customer label **Chat**, the real API-backed messaging repositories, typed direct/group/chatroom/recommended/search flows, customer-safe error/retry UI, unread handling, and compact filter/create-group IME behavior. Evidence: 53 focused Chat tests, 370 full Flutter tests, full analyze with no issues, and diff check pass.

D1.5 is App-side complete and `READY_FOR_PHYSICAL_RECHECK`, not physically verified. Representative direct/group/request/recommendation/read-state acceptance remains `BLOCKED_BY_DEMO_DATA` through `POPULATED_DEMO_USER`; a customer-facing Message Requests inbox remains `BLOCKED_APP_DOMAIN_CONTRACT` through `MESSAGE_REQUESTS_INBOX`; two-persona Samsung/TalkBack/text-scale/connection-loss evidence remains open. Next bounded deliverable: D1.6 You/Profile recovery.

## 2026-09-13 â€” You/Profile recovery checkpoint

**Type:** IMPLEMENTATION / VERIFICATION / CHECKPOINT
**Status:** CURRENT

GlenTown-App `820d0cf20b278827da6b4ff238bd7e0e8b4087cb` closes independently App-fixable D1.6 work. Profile Setup now hides save/skip actions while the IME is open and explains keyboard dismissal before an intentional save or skip; its CTA is `Save profile & continue`. Trust & Verification is customer-facing and truthful: internal terminology, static success-like statuses, and snackbar-only actions were removed. Evidence: 4 focused Profile Setup tests, 370 full Flutter tests, full analyze with no issues, and diff check pass.

D1.6 is App-side complete and `READY_FOR_PHYSICAL_RECHECK`, not physically verified. Calendar/Places/Job Seeker/separate settings IA is `BLOCKED_APP_DOMAIN_CONTRACT`; representative histories/media acceptance is `BLOCKED_BY_DEMO_DATA`; verification status/submission is `BLOCKED_API_CONTRACT`; Samsung You/Profile recheck remains open. Next bounded deliverable: D1.7 Cross-screen/accessibility closure.

## 2026-09-14 â€” Cross-screen/accessibility closure

**Type:** IMPLEMENTATION / VERIFICATION / CHECKPOINT
**Status:** CURRENT

Inherited Kilo D1.7 work was preserved and completed at GlenTown-App `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`. Goal Personalization and Financial Planner map customer-visible failures through `CustomerError.action`; Destination tabs scroll; the Explore scoped title is ellipsis-bounded. CROSS-A2-02 and CROSS-A2-04 are `VERIFIED_BY_SOURCE_TEST`; CROSS-A2-03 is `READY_FOR_PHYSICAL_RECHECK`. Evidence: 20 focused tests passed, 370 full Flutter tests passed with zero failures and exit 0, full analyze reported no issues with exit 0, and `git diff --check` passed.

D1.7 independently achievable App work and Phase 1 App-side recovery are complete, not physically verified. Existing API/data/demo/domain blockers remain recorded in the Blocker Register. Next gate: `CONSOLIDATED_SAMSUNG_PHYSICAL_REAUDIT`.

**Documentation Compliance Receipt:** Implementation Plan, Current State, Capability Matrix, Blocker Register, Memory, and the canonical App ledger were reconciled. No CPS files were touched; no physical verification was inferred from automated or source evidence.

## 2026-09-14 â€” Consolidated Samsung physical re-audit ready

**Type:** VERIFICATION PREPARATION / CHECKPOINT
**Status:** CURRENT

GlenTown-App `dd1ecf637c2eb7471d1c9029fc05b40a21e7837d` adds `docs/audits/PHYSICAL_REAUDIT_2026-09-14.md`, the canonical session worksheet for physical review of UI checkpoint `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`. It sequences 75 checks from fresh-install/auth through Profile Setup, shell, Home, Notifications, Cart, Community, Around You, Map, Explore, Create, Chat, You/Profile, and cross-screen stress. Every ledger issue row carrying physical-recheck semantics is referenced. API/data/demo/domain/architecture/external blockers are explicitly `KNOWN_BLOCKER â€” NOT A PHYSICAL FAILURE`.

No device was connected during preparation, so no physical result is claimed. The worksheet records the Maria demo credential, screenshot/result fields, localhost API configuration through `adb reverse tcp:8000 tcp:8000`, and the development-only verification-bypass boundary. Phase 1 App-side recovery remains complete; consolidated Samsung physical re-audit execution is the next gate.

  ## 2026-09-22 — GlenTown-App Android Home Freeze Reconciliation

  **Type:** GOVERNANCE RECONCILIATION
  **Status:** CURRENT

  Android Home live-QA has reached an accepted visual baseline (FROZEN) at checkpoint 73f72010d546658f08731aece5150b6ea8b77c4f. The canonical Home order is recorded as: Welcome/Alert, Explore, Around You, Personal Tools, Quick Create Community Post, Community filters, Community feed. Personal Tools uses Home-only aliases (Achieve, Finance, Travel, Today) with an 'All Tools' action.

  The user approved a future explicit reopening of the Home visual baseline for one bounded color/image refinement pass (Welcome card background, alert style, Explore card backgrounds, Around You card gutters, and collapsed floating navigation). This pass must not be implemented in TownBoss.

  Functional followups remain open/deferred: GPS fallback, missing Personal Tools destinations, All Tools hub destination, Around You/API media completeness, onboarding background regression, and first-install Welcome-card verification.

## 2026-10-07 — Synthetic Population / Scenario Validation Pre-Beta Gate

- Adopted a mandatory GlenTown **Synthetic Population / Scenario Validation** gate before public Beta.
- Canonical contract: `GLENTOWN_SYNTHETIC_POPULATION_PRE_BETA_GATE.md`.
- Initial candidate stack: MiroFish + OASIS, subject to repository/security/license/compute/reproducibility benchmarking; the gate itself remains tool-agnostic.
- Puerto Princesa is the first calibration environment, not the scope ceiling. Planned progression may expand through Palawan and broader weighted Philippine simulations.
- Planning scale ladder: 50–200 micro-simulation; 2,000–5,000 Puerto Princesa calibration; 5,000–20,000 Palawan; 20,000–50,000 regional/multi-province; 50,000–250,000 weighted Philippines; larger stress experiments only after practical benchmarking.
- Synthetic agents may carry statistical/analytical weights; one agent need not equal one real person.
- Raw population size does not outrank calibration quality.
- Synthetic output is hypothesis/risk/experiment evidence only. It does not prove real usability, demand, conversion, retention, trust, or product-market fit.
- Gate PASS requires material findings to be fixed, mitigated, explicitly accepted, or converted into governed Beta experiments.
- Real Beta telemetry, surveys, qualitative research, support/safety outcomes, and marketplace data must later recalibrate or invalidate simulation assumptions.


## 2026-10-09 — Explore Properties, Jobs, Events mobile UX acceptance

**Type:** DECISION / DOCUMENTATION  
**Status:** USER-APPROVED CONCEPT / DOCS UNDER REVIEW / NOT IMPLEMENTED

The user reviewed conceptual mobile discovery mockups for three selected Explore categories. GlenTown should reuse category-specific topbar, full-width location selector, search, four icon shortcuts, Home Welcome-aspect-ratio sponsored banner, normalized scrolling pills, global eyebrow type and reduced-radius tokens while avoiding mechanical one-size-fits-all cards and secondary sections.

- **Properties:** Buy/Rent/Rush/Projects; Popular Locations; horizontal All/Residential/Commercial/Industrial/Agricultural pills; conditional Property Type; Map View. Image-led property card places For Sale/Rent/Rush badge **inside image upper-left**, separate listing-owner badge, transparent-to-black in-image lower scrim, unlimited count of **fully fitting** contextual features on one row, left price with global eyebrow and right **icon-only stateful Compare**; description two lines, View Property.
- **Jobs:** Full-Time/Part-Time/Remote/Internships; Hiring Highlights (New Openings/Nearby Work/Household Jobs); normalized job-sector pills and conditional Job Role; information-driven cards with real employer/public-safe household identity, work conditions, structured salary eyebrow, two-line preview, Save and View Job. Must respect current TownBoss citizen/household posting rule, not fabricate company registration. Jobs app-local specification was **audited for detail parity** and already has 532 lines, 24 sections, 36 acceptance checklist items; no padding/approved-design rewrite was needed.
- **Events:** Today/Weekend/Free/Online; Upcoming Highlights; category pills; **always-visible When: Upcoming** date filter even on All; Calendar View prioritized over Map; image-led event cards with date badge **inside upper-left image**, poster-sensitive image treatment and schedule/location/admission **below image**, global eyebrow, two-line excerpt and View Event. Accurate timezones, calendar multi-day projection and cancellation/status; missing pricing does **not** mean Free. Current client has no authoritative RSVP/ticket capability; Create Event and Event Planner must remain distinct.

**Documentation evidence (GlenTown-App):** draft PR #33, branch `docs/properties-mobile-ui-authority-20261009`; detailed files `docs/PROPERTIES_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` (508 lines), `docs/JOBS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` (532 lines), and `docs/EVENTS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` (781 lines). All files were fetched back and verified on that branch. Detailed acceptance, unresolved API/data needs, accessibility, error states, responsive tests and implementation handoffs are preserved in those records.

**Governance reconciliation:** TownBoss Decisions and Rules, Implementation Plan and Current State are being proposed on a separate **documentation review branch**, not silently amended on main. No app or backend source implementation was changed; no analyzer, runtime/browser, visual screenshot or Android physical acceptance is asserted. Phase 1 recovery and ongoing Web/Android execution sequence are unchanged until separately authorized.

**Next gate:** review and merge the documentation PRs through governance; reconcile exact component tokens/Welcome ratio, Jobs salary/household posting, Properties price/rush/compare and Events date/organizer/admission/Calendar contract; then issue independent bounded implementation tasks with mandated real-data, visual and physical QA.


## 2026-10-09 — Explore Services consolidated landing and two card variants

**Type:** DECISION / DOCUMENTATION  
**Status:** USER-APPROVED DESIGN CONCEPT / REVIEW BRANCH / NOT IMPLEMENTED

The user first accepted the **refined Compact Service Card** for information-first services such as repairs, maintenance, cleaning, tutoring and professional consultation, then accepted the **refined Visual Service Card** for portfolio/work-sample-driven services such as beauty, photography, styling, design and renovation. Subsequently, the user explicitly approved the **consolidated Explore > Services mobile landing** containing both cards in one mixed feed.

Approved hierarchy: Back/Services/Filters/Create Service topbar → full-width Town/Province/National selector → contextual service/provider/skills search → **Available Today, Home Visits, At Provider, Online** shortcuts → sponsored local service banner at actual Home Welcome-card aspect ratio → **Explore by Need** three contextual tiles (Home Repairs, Beauty & Care, Professional Help) → Browse Services/grounded Map View → normalized one-row horizontal category pills → **Availability: Any Time** always displayed even under All → optional conditional **Service Type: All** → Service Listings with real data and Sort → mixed Compact/Visual cards.

Approved card distinction: Compact has a substantial responsive square thumbnail beside mode/locality/brief copy, avoiding giant repetitive photos. Visual has a large genuine provider work/portfolio image above mode/locality/two-line excerpt, without a real-estate image scrim. Both share title/provider, separate Save/Heart, genuine category/delivery/location, the global **STARTING AT** eyebrow with an actual price/unit/basis, clearly separate availability, and full-width **View Service**. Presentation variant selection depends on imagery's actual usefulness/rights, not rigid service-sector assignment or an invented consumer toggle.

Existing Services Booking, Availability & Appointment Management UX Architecture still governs **Open Now versus Available Now versus Next Available**, request-based mode, real appointment slots, staff/branch choice, queue/waitlist and provider scheduling. No universal Book Now or false live capacity. Source inspection revealed unsafe default/fallback prices, 4.8 ratings, verification=true and Available Today claims in the current accessible Flutter model/detail; these need separate contract checks. Individual lawful livelihood provider access remains supported with progressive verification and compliance, not a fabricated company identity.

**App-local detailed source:** GlenTown-App `docs/SERVICES_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` on review branch `docs/properties-mobile-ui-authority-20261009` (draft PR #33). **TownBoss governance:** Decisions and Rules, Implementation Plan, Current State and this Memory are reconciled on `docs/glentown-explore-three-category-ux-20261009` (draft PR #35); approval/review is not merge or physical PASS. No Flutter/API implementation, tests, device screenshots or browser QA was performed here.

**Next conceptual category:** Products. The following design requires its own separate visual approval; do not invent Product specifics or silently treat Services approval as Products approval.


## 2026-10-10 — Approved Explore Products interactive design

**Type:** USER-APPROVED UX DECISION / DOCUMENTATION  
**Status:** DESIGN CONCEPT APPROVED / REVIEW BRANCH / NOT IMPLEMENTED / NOT PHYSICALLY VERIFIED

User rejected the first generated graphic as not the same kind of in-chat UI mockup used for earlier categories, and rejected the subsequent disconnected line/text/image outline. The first spatial, interactive Products mockup was then explicitly refined before approval. **The final refined interactive screen is the only approved Products visual direction**; the preceding image and textual outlines are historical rejected iterations.

**Approved landing:**
1. Topbar Back / Products / Filters / Cart / Sell Product.
2. Full-width Town/Province/National location selector containing **only the resolved location and icon/chevron**, omitting the "Explore Products In" helper label.
3. Contextual Search products, brands, or sellers.
4. Quick shortcuts **New Arrivals / Pre-Loved / Local Makers / Deals**, independent freshness, item condition, producer provenance and promotion facets.
5. **Sponsored banner creative is image-only** (its designer-provided words, if any, are contained within the image asset), with external small Sponsored/Ad attribution; must use actual Home Welcome-card aspect ratio in production, never duplicate native advertising title and CTA overlay.
6. **Featured Finds** compact horizontally scrolling small-photo/title/price product carousel and supported See All.
7. **Browse Products** paired with **All Categories** searchable, scalable category picker/sheet, supporting real API category IDs and true hierarchy if contract exists. A flat short Fashion/Electronics/Home category-pill list is explicitly rejected as non-scalable.
8. A separate single-row horizontally scrollable **shopping availability** selector: **All Products / Ready to Buy / Pre-Order / Made to Order**. Distinct from product category and condition.
9. **Product Listings** true count or honest loading, with Sort.
10. **ONE full-width product card per compact-mobile row**. Card hero is **1:1 square** and **BoxFit.cover**, upper-left truthful condition badge, independent upper-right Heart, and **a dark bottom gradient carrying actual Product Title and price eyebrow + amount overlaid inside the photo**. Below media: actual seller display name, public-safe locality/category, concise two-line description, valid fulfillment/availability and full-width **View Product**. Contrasts with Services Visual Card (no portfolio price scrim) and earlier rejected idea of moving all product text below photo.

**Critical contract rules:** "New Arrivals" ≠ Brand New; "Local Makers" requires production provenance, not mere seller geography; "Deals" requires validated discount basis; Ready to Buy / Pre-Order / Made to Order are purchase-orderability modes and **not** condition or product categories. Seller/public locality/fulfillment and genuine image must have provenance, real item condition cannot default Brand New and real missing price cannot become ₱0. Current accessible MarketplaceProduct model contains risky mock defaults for 4.8 rating, stock 10, verified seller true, Brand New condition and null/parse-price-to-zero, while existing MarketplaceScreen still uses Marketplace title, tag pills and two-column grid. Require separate API/screen reconciliation before real rendering. Citizens may publish appropriate Pre-Loved products, with progressive business formalization for repeat commercial trade per existing TownBoss rules.

**App-local detailed specification:** GlenTown-App docs/PRODUCTS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md — 821 lines, 34 detailed sections, 55 acceptance checks and a 44-scenario matrix — on docs/properties-mobile-ui-authority-20261009, draft PR #33. **TownBoss governance reconciliation:** Decisions and Rules, Implementation Plan (separate design/implementation/API validation/device QA gates), Current State and this Memory on docs/glentown-explore-three-category-ux-20261009, draft PR #35. Both draft PRs are review-only, unmerged unless independently verified otherwise.

**Implementation:** No new Flutter/API code, tests, screenshot audit, Samsung physical-device visual acceptance, checkout/payment confirmation or publication was executed by the documentation effort. Do not mark implementation complete merely because the user approves the visual mockup.

**Next unapproved Explore concepts:** Foods, Suppliers, Tourism and Directory; preserve the selective shared hierarchy but determine domain-specific cards and fulfillment behaviors separately.


## 2026-10-10 — Foods structural approval; imagery unseen

**Type:** UX STRUCTURE DECISION / DOCUMENTATION  
**Status:** STRUCTURE_APPROVED / IMAGERY_VISUAL_REVIEW_PENDING / NOT CODE IMPLEMENTED

The user requested an **actual in-chat interactive mobile Foods landing mockup**, matching prior Explore category visual-review workflows, **not** an AI-generated screenshot or a text-and-image outline. The assistant presented a dish-led Foods screen. The user replied explicitly: **“I don't see the images but the structure is approved. Document it. Make it as detailed as possible in the documentations.”** This authorizes detailed recording of the hierarchy, component anatomy and controls, but **does not authorize approval of ad or dish imagery**, which was invisible to the user. Never elevate structural approval to full photograph/pixel-level visual approval; re-render actual visible imagery and request separate user review of sponsored creative, featured food thumbnails and Food Card photo crop/ratio.

**Approved composition:** Topbar Back/Foods/Filters/Cart/Offer Food; full-width actual Town/Province/National selector **without Explore Foods In eyebrow**; search dishes, cuisines or food sellers; four quick shortcuts **Delivery / Pickup / Dine-In / Pre-Order**; authorized **image-only sponsored banner** at actual Home Welcome-card ratio, with Sponsored/Ad disclosure outside; **Featured Dishes** horizontal mini photo/title/price carousel; **Browse Foods** and a searchable **All Categories** picker; distinct **Order Timing: All Foods / Order Now / Pre-Order** one-row horizontal selector; Food Listings real count/Sort; full-width **one-column mobile Food Card**.

**Food Card structural contract:** Large photo region with independent Heart and optional true Pre-Order badge. Unlike the approved Products card, **dish title/provider and global PRICE/amount are BELOW the image**, not on a square-photo bottom price gradient. Beneath follow public-safe locality/category, actual Delivery/Pickup/Dine-In chips, short description, genuine Order Status/preparation, and full-width **View Food**. Sample images/photos did **not** display; even the mock's approx. 4:3 card ratio/cover crop remains provisional until user can view it.

**Product-domain guardrails:** Pre-Order is timing, not fulfillment; it should synchronize with the order-timing selector, while Delivery/Pickup/Dine-In are fulfillment modes. Kitchen Open Now != Accepting Orders Now != Food Item Available != Preparation Duration != Pickup Ready != Delivery ETA != Confirmed Order. Current inspected main FoodItem mock mapping has unsafe production-use fallbacks for **4.8 rating, 15–25 min prep, Available Now, Pickup and Delivery, verified=true and null price as ₱0**; these must be gated/reconciled. No fake verified kitchen, food safety, dietary/allergen or local delivery claims. Home-based/individual lawful food livelihoods remain eligible with progressive applicable food permits, sanitary compliance and formalization, not an invented business prerequisite.

**App source:** GlenTown-App docs/FOODS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md under existing review branch docs/properties-mobile-ui-authority-20261009 and draft PR #33. App-local doc details the accepted structure, 44 separate future acceptance checks, 40 scenario tests, image review gate, actual API contract investigation and implementation plan.

**TownBoss pointers:** Decisions and Rules adds Foods structure-only authority; Implementation Plan adds separate design, implementation, API safety, image-review and physical QA work; Current State keeps correct caveat; this Memory preserves exact approval. All on existing governance review branch docs/glentown-explore-three-category-ux-20261009 and draft PR #35. Draft documentation is not merged app code or QA.

**Next gate:** re-present food and ad images so user can actually see them, then record a distinct FOODS_IMAGES_APPROVED or correction decision. Separately perform real API, Flutter tests, accessibility/screenshots and Samsung physical Android QA before ever declaring production-ready. Do not issue an implementation agent prompt while another related one is pending.

**Remaining unapproved Explore screen proposals:** Suppliers, Tourism and Directory.
