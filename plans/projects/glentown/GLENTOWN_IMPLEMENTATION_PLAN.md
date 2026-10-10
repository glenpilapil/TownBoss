# GlenTown Implementation Plan / Live Development Dashboard

**Portfolio:** TownBoss
**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**2026-09-15 current recovery authority:** Historical D1.2 automated evidence is preserved, and the subsequent Samsung audit reopened Home. The coordinated post-audit Home recovery is `HOME_RECOVERY_IMPLEMENTED_AND_AUTOMATED_VERIFIED`; it is not physically approved. Orchestrator source review remains required before any physical-audit decision.
**2026-09-21 shared-baseline authority:** GlenTown-App `8e17b297b7a3b2e5b0a35eafebcefe9409f37759` is the reconciled shared baseline candidate. See `GLENTOWN_APP_WEB_WAVE2_BASELINE_RECONCILIATION_2026-09-21.md`; it does not establish final Web visual acceptance or Web feature completeness.
**Current phase:** Phase 1 — App-side recovery complete / Android resumption and Web feature-completeness work ready; physical and comprehensive responsive QA pending
**Current deliverable/task:** Android implementation resumption and bounded Web feature/completeness work — READY; final responsive/adaptive QA deferred until major Web elements exist
**Phase gate:** APP-SIDE RECOVERY COMPLETE — physical verification remains pending.
**Pre-Beta validation authority (2026-10-07):** Public Beta promotion now includes the Synthetic Population / Scenario Validation Gate defined in `GLENTOWN_SYNTHETIC_POPULATION_PRE_BETA_GATE.md`. MiroFish + OASIS is the initial candidate stack, subject to audit/benchmarking; synthetic evidence does not substitute for physical QA or real-user evidence.

## Status legend

`[ ]` not complete; `[x]` complete with evidence; `IN_PROGRESS` active; `ATTENTION` needs review; `BLOCKED` dependency; `DEFERRED` explicitly out of scope.

## Current summary

- [x] Phase 0 governance/planning foundations substantially established. Evidence: GlenTown control corpus and 2026-09-13 governance adoption.
- [x] Post-Samsung coordinated Home recovery is `HOME_RECOVERY_IMPLEMENTED_AND_AUTOMATED_VERIFIED`. App: `4010f1fcf19b58eaafe828e0b4abeac72421e7fb`; API: `738e8ac124854e7ef95f4a8472424c941da32b91`. API complete canonical suite: 1,336 tests / 4,633 assertions / 0 failures, executed in bounded equivalent PHPUnit-path batches under the same `phpunit.xml` after the host wrapper cut off monolithic output. API focused recovery: 26 / 116; Pint, changed-PHP syntax, and diff check passed. Physical verification is still pending.
- [x] Home recovery App-side complete; physical verification pending. Evidence: `170baca` → `969abec` → `9a7861e` → `a43442b` → `c28feee` → `ff6d2e2`; 369 Flutter tests passed, analyze no issues, diff check pass.
- [x] Explore recovery App-side complete; physical verification pending. Evidence: `3edfb0c`; 33 focused Explore tests, 9 cross-route tests, 369 Flutter tests, analyze no issues, diff check pass.
- [x] Create recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `aa07d2586f0b7db9a440f20b6fa927fee374b4b0`; 9 focused tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] Chat recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `f9702ed672679d6744e17a281c96c95ee312299f`; 53 focused Chat tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] You/Profile recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `820d0cf20b278827da6b4ff238bd7e0e8b4087cb`; 4 focused tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] D1.7 cross-screen/accessibility App-side closure. Evidence: GlenTown-App `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`; 20 focused tests and 370 full Flutter tests passed, analyze no issues, diff check pass.
- [ ] Physical verification, explicit API/data/domain blockers, and Beta readiness remain open. Next gate: consolidated Samsung physical re-audit.
- [x] Consolidated Samsung physical re-audit preparation is ready. Evidence worksheet: GlenTown-App `dd1ecf637c2eb7471d1c9029fc05b40a21e7837d`, `docs/audits/PHYSICAL_REAUDIT_2026-09-14.md`; 75 ordered checks, blocker/non-failure boundaries, demo credentials, evidence fields, and ADB reverse run instructions.
- [x] GlenTown-App shared baseline reconciled. Evidence: `8e17b297b7a3b2e5b0a35eafebcefe9409f37759`; Web recovery checkpoint `f5267d9ae12dd1e08a457e1c85639544ba8dc3ad`; see the 2026-09-21 baseline reconciliation record for deferred evidence and QA boundaries.
- [ ] Web feature/completeness remains pending. F-W2-005 remains open/deferred, F-W2-008 needs final SHA-bound visual verification, and real-API visual sanity needs fresh valid evidence during later comprehensive responsive/adaptive QA.

## D0.1 — Canonical repository/state reconciliation

- [x] T0.1.1 Reconcile TownBoss planning authority and dashboard ownership. Evidence: canonical files under `plans/projects/glentown/`.
- [x] T0.1.2 Fresh GlenTown-API current-HEAD full-suite verification. Evidence: API `738e8ac`; 1,336 tests / 4,633 assertions / 0 failures; same `phpunit.xml` suite paths, bounded only to retain terminal evidence.
- [ ] T0.1.3 Fresh GlenTown-App current-HEAD analyze/full-suite verification. `ATTENTION`; historical recovery checkpoints are not release verification.

## D0.2 — Audit authority, capability/blocker controls, and governance adoption

- [x] T0.2.1 Normalize physical/code/screenshot audit backlog into canonical App ledger. Evidence: GlenTown-App `9db4f889130a83c11e379f1101dae45ed5288cb8`.
- [x] T0.2.2 Establish Capability Matrix and Blocker Register. Evidence: corresponding canonical documents.
- [x] T0.2.3 Adopt documentation-compliance/governance controls. Evidence: Authority Matrix, Validation Profiles, Risk Register, Operational Acceptance Test, Documentation Compliance Protocol.

## Phase 0 gate

- [x] Governance/planning and audit authority established.
- [ ] Fresh API and App canonical verification complete.

---

# Phase 1 — Core Mobile Functional and UX Recovery

**Phase status:** CURRENT

## D1.1 — Onboarding/Auth recovery

- [x] T1.1.1 Recover onboarding/auth visual authority and supplied logo assets. Evidence: `be202c5ab539218305c8ed2d80ec823504445238`.
- [x] T1.1.2 Implement development-only email-verification bypass. Evidence: `GLENTOWN_DEV_BYPASS_EMAIL_VERIFICATION`, default off and disabled in release builds.
- [ ] T1.1.3 Real SMTP/email verification E2E. `BLOCKED_EXTERNAL` pending SMTP/delivery account.
- [ ] T1.1.4 Physical onboarding/auth recheck. `ATTENTION`.

## D1.2 — Home + Floating Navigation recovery

- [x] T1.2.1 Navigation shell recovery. Evidence: `170baca4b9fb43ac35560372224e43c0e066abf0`; App-side complete / physical recheck pending.
- [x] T1.2.2 Community UI recovery. Evidence: `969abecc4aef8f9786f1b8ff88bf2d543336fe06`.
- [x] T1.2.3 Notifications recovery. Evidence: `9a7861e13cec66b7acf8f1bba0a6ef6b36fb5075`.
- [x] T1.2.4 Map recovery. Evidence: `a43442b75916e805b44af2af62f38233112882a7`.
- [x] T1.2.5 Cart + Around You recovery. Evidence: `c28feee029834fe3be6678da0b81ab11c329c64d`.
- [x] T1.2.6 Final Home reconciliation. Evidence: `ff6d2e2e502a0fa91d19a799b46a8d7ca0523428`; 369 tests, analyze no issues, diff check pass.
  - [ ] T1.2.7 Samsung physical recheck. `ATTENTION`.
  - [x] T1.2.8 Android Home live-QA accepted baseline (FROZEN). Evidence: `73f72010d546658f08731aece5150b6ea8b77c4f`. Future explicit reopening approved for bounded visual refinement.

## D1.3 — Explore / Discovery recovery

- [x] T1.3.1 Audit backlog recovery. Evidence: `9db4f889130a83c11e379f1101dae45ed5288cb8`.
- [x] T1.3.2 Canonical Explore UI/data-truthfulness recovery. Evidence: `3edfb0c075fc984c19c6b9407868afa5a4ed6965`.
- [x] T1.3.3 Focused Explore validation. Evidence: 33 focused Explore tests passed.
- [x] T1.3.4 Cross-route validation. Evidence: 9 cross-route tests passed.
- [x] T1.3.5 Full Flutter checkpoint. Evidence: 369 tests passed.
- [x] T1.3.6 Analyzer. Evidence: no issues.
- [ ] T1.3.7 Samsung physical recheck. `ATTENTION`.
- [ ] T1.3.8 Connected universal Search; geographic scope-bound discovery/ranking; nationwide scope queries. `BLOCKED_API_CONTRACT`; see `CONNECTED_SEARCH`.
- [ ] T1.3.9 Destination hero media. `BLOCKED_API_DATA`; see `DESTINATION_HERO_MEDIA`.
- [ ] T1.3.10 Real map listing projection. `BLOCKED_API_CONTRACT`; see `MAP_LISTINGS`.
- [ ] T1.3.11 Seeded destination/discovery richness. `BLOCKED_BY_DEMO_DATA`; see `DISCOVERY_RICHNESS`.
- [ ] T1.3.12 Jobs/Directory detail fallback. Pending App recovery unless evidence proves otherwise.
- [x] T1.3.13 Explore mobile Properties / Jobs / Events **design-authority documentation drafted and user-approved** (2026-10-09), not code-implemented: GlenTown-App draft PR #33, three detailed `docs/*_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` files; TownBoss decision/pointer reconciliation in review. Explicitly separate Properties image/scrim+Map, Jobs text-first/household-hiring, Events date-first/calendar+poster-safe cards.
- [ ] T1.3.14 Implement approved category-specific **mobile UI** in three separately scoped lanes after live local worktree/API/design-token preflight, reference lifecycle review and project ownership approval. Preserve global pills, eyebrow, reduced radii, existing Welcome banner ratio, Town/Province/National selector, real-data/fixture modes and focused auth/routing gates. **PLANNED / NOT STARTED.**
- [ ] T1.3.15 Reconcile cross-domain API/capability gaps: structured Jobs salary/household-employer roles, Properties rush/price/compare state, Events date-range/calendar completeness, admission/RSVP/ticketing and organizer identity. Never fabricate unsupported data or actions. **PLANNED / OPEN; scope requires backend authority.**
- [ ] T1.3.16 Independent mobile screenshot/UI audit, responsive/edge-case tests and Samsung physical-device acceptance for implemented Properties, Jobs and Events, separately from automated analyzer/tests and from later desktop/Web adaptation. **NOT RUN / NOT APPROVED.**
- [x] T1.3.17 Services landing, Compact Service Card and Visual Service Card **user-approved documentation**: GlenTown-App `docs/SERVICES_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md` added to draft PR #33, and TownBoss governance proposal in draft PR #35. Design-only, no code or physical QA.
- [ ] T1.3.18 Independently implement Explore > Services category mobile UI (four shortcuts, legitimate Welcome-ratio ad, Explore by Need, normalized pills, Availability: Any Time, conditional Service Type, privacy-safe Map View, mixed Compact/Visual cards) after local App/API contract and design tokens preflight. **PLANNED / NOT STARTED.**
- [ ] T1.3.19 Audit and reconcile current Services model, detail and booking fallback assertions for price, verification, rating and availability; differentiate Open Now, Available Now, Next Available, By Request and live booking modes. No fabricated claims, and preserve individual livelihood eligibility. **API/DOMAIN VALIDATION REQUIRED.**
- [ ] T1.3.20 Record separate Services responsive/focused/full tests, authoritative booking/API verification, independent visual screenshots and Samsung physical-device acceptance before classifying implementation as visually accepted. **NOT RUN / NOT APPROVED.**
- [x] T1.3.21 Products **user-approved design documentation** — GlenTown-App draft PR #33, `docs/PRODUCTS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md` (approved final refined mockup, not earlier rejected image/text mockups); TownBoss draft PR #35 design-authority proposal. **DOCUMENTATION ONLY / NOT CODE-IMPLEMENTED.**
- [ ] T1.3.22 Implement approved Products mobile hierarchy and one-column square-hero item feed after local source/design-system preflight: no location subtitle; New Arrivals/Pre-Loved/Local Makers/Deals shortcuts; image-only real Welcome-ratio sponsored banner; Featured Finds; scalable searchable authoritative All Categories picker; separate All Products/Ready to Buy/Pre-Order/Made to Order purchasing pills; 1:1 BoxFit.cover image + internal gradient product title/price; truthful under-image seller/fulfillment and View Product. **PLANNED / NOT STARTED.**
- [ ] T1.3.23 Reconcile Product API and Flutter model/checkout contracts: category tree vs flat list, purchase mode/stock/variant/orderability, citizen Pre-Loved and commercial eligibility, location/delivery, real item media, valid discount provenance and remove unsafe live defaults for price=0, Brand New, stock=10, verified=true and rating=4.8. **API/DOMAIN VALIDATION REQUIRED.**
- [ ] T1.3.24 Run independent Products responsive screenshot/golden, accessibility, focused/full/analyzer/API tests and **Samsung physical-device visual audit** before claiming UI implementation accepted. **NOT RUN / NOT APPROVED.**
- [x] T1.3.25 Foods mobile landing **STRUCTURAL design approved and documented only** (user could not see food images): GlenTown-App draft PR #33, docs/FOODS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md; TownBoss draft PR #35. **IMAGERY VISUAL REVIEW PENDING / NO CODE / NO QA.**
- [ ] T1.3.26 Implement approved Foods mobile structure after actual local worktree/API preflight: Foods header/location/search, Delivery/Pickup/Dine-In/Pre-Order shortcuts, image-only genuine Welcome-ratio ad, Featured Dishes, searchable category picker, Order Timing All Foods/Order Now/Pre-Order and full-width Food Cards with **title/price below image**, provider/modes/Order Status/View Food. **NOT STARTED.**
- [ ] T1.3.27 Food API/commerce/safety gap reconciliation: source-backed food taxonomy and item photos, ingredient/allergen/privacy and provider compliance; kitchen accepting orders vs open, pre-order lead/cutoff, delivery/pickup/dine-in coverage, prep/capacity/inventory, genuine price/variant/add-on and live Cart/Checkout. Remove default 4.8, 15–25 min, Available Now, Pickup+Delivery, verified=true and ₱0 live claims. **OPEN / BACKEND CONTRACT REQUIRED.**
- [ ] T1.3.28 **Separate Foods imagery gate**: re-render sponsor, Featured Dishes and Food Card photos visibly to user, review actual image sources/crops/ratios and record independent FOODS_IMAGES_APPROVED decision. The user explicitly did not see the first mock's images. **NOT RUN / NOT APPROVED.**
- [ ] T1.3.29 Independent Foods responsive/browser/semantic screenshot tests, Flutter focused/full/analyzer and backend tests and Samsung physical-device visual QA; keep user photo approval separate from structural and physical-device PASS. **NOT RUN.**
- [x] T1.3.30 Suppliers approved mobile **design-authority documentation** completed in GlenTown-App docs/SUPPLIERS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md (draft PR #33), with TownBoss rules/plan/state/memory reconciliation on draft PR #35. Structural approval only, not implemented.
- [ ] T1.3.31 Independently implement Suppliers mobile hierarchy: topbar/one-line scope/search; Wholesalers/Manufacturers/Distributors/Post RFQ; image-only actual Welcome-ratio ad; Featured Suppliers; scalable All Categories picker; All/Bulk/Custom/Recurring capability row; full-width supplier entity card with landscape media, honest MOQ and Lead Time tiles, real price/coverage, Save, two View Supplier/Request Quote CTAs. **NOT STARTED.**
- [ ] T1.3.32 Verify Supplier Directory/API and business/supplier role/sector/capability schema, provenance, company verification, MOQs by material/unit/tier, supplier lead time, coverage, Catalog and quote contracts. Remove old mock fallback verified icons, Negotiable/Standard claims, unconnected download and false RFQ Dispatched message. **DOMAIN / SECURITY GAP OPEN.**
- [ ] T1.3.33 Implement **draft-first RFQ** form/viewer and separate real Submit only after authenticated target, buyer authorization, server idempotent acknowledgment and recipient status exist; explicitly distinguish Draft/Sent/Delivered/Quote Received and restrict broadcast. **NOT STARTED / LIVE SUBMISSION NOT VERIFIED.**
- [ ] T1.3.34 Run Suppliers responsive screenshot, accessibility/TalkBack, focused/full Flutter analyzer/API contract/security tests and independent Samsung physical-device acceptance; preserve original Android/Web recovery scheduling. **NOT RUN / NOT APPROVED.**

## D1.4 — Create recovery

**Status:** APP-SIDE COMPLETE / `READY_FOR_PHYSICAL_RECHECK`; next active deliverable is D1.5 Chat recovery.

- [x] T1.4.1 Establish Create audit authority/bounded recovery contract. Evidence: canonical App ledger CREATE-A2-01 through CREATE-A2-07 reconciled at `aa07d25`.
- [x] T1.4.2 Create layout/hierarchy and canonical Community taxonomy. Evidence: CREATE-A2-01/03 remain code-reconciled from `969abec`; shared taxonomy is preserved and validated by the D1.4 focused suite.
- [x] T1.4.3 Historical checkpoint: citizen Product → Pre-Loved and commercial category → business setup gating. The former citizen Post a Job restriction is superseded: current authority permits both household/personal and business/organization hiring through their respective eligibility/compliance flows. Evidence: CREATE-A2-02; D1.4 focused suite covers citizen, seller, and employer paths.
- [x] T1.4.4 Truthful Trust/Verification routing and customer-safe Create gates. Evidence: `aa07d25`; contextual claim entry opens the full-screen Trust & Verification gate and cannot simulate uploaded evidence or a successful claim.
- [ ] T1.4.5 Media persistence/poll special-type publishing. `BLOCKED_API_CONTRACT`; see `COMMUNITY_MEDIA` and `COMMUNITY_CATEGORY_PERSISTENCE`.
- [ ] T1.4.6 Samsung physical recheck of Create layout, IME/CTA, validation/error layers, and permission flows. `ATTENTION`.
- [x] T1.4.7 Focused and full automated validation. Evidence: 9 focused tests, 370 full Flutter tests, full analyze no issues, `git diff --check` pass at `aa07d25`.

## D1.5 — Chat recovery

**Status:** APP-SIDE COMPLETE / `READY_FOR_PHYSICAL_RECHECK`; next active deliverable is D1.6 You/Profile recovery.

- [x] T1.5.1 Canonical Chat information architecture and direct/group/chatroom/search flows. Evidence: GlenTown-App `f9702ed672679d6744e17a281c96c95ee312299f`; Chat label, API-backed repositories, typed direct/group/chatroom/recommended/search routes revalidated without mock fallback.
- [x] T1.5.2 Composer/keyboard/loading/error/unread behavior and API-contract alignment. Evidence: existing recovery `9a7861e`; focused Chat suite revalidated customer-safe retry/error handling, compact filter reachability, modal/IME behavior, and unread state.
- [x] T1.5.3 Focused validation and documentation reconciliation. Evidence: 53 focused Chat tests passed; 370 full Flutter tests passed; full analyze no issues; `git diff --check` pass at `f9702ed`.
- [ ] T1.5.4 Customer-facing Message Requests inbox. `BLOCKED_APP_DOMAIN_CONTRACT`; see `MESSAGE_REQUESTS_INBOX`.
- [ ] T1.5.5 Representative direct/group/request/recommendation/read-state acceptance. `BLOCKED_BY_DEMO_DATA`; see `POPULATED_DEMO_USER`.
- [ ] T1.5.6 Samsung two-persona/TalkBack/text-scale/connection-loss physical recheck. `ATTENTION`.

## D1.6 — You/Profile recovery

**Status:** APP-SIDE COMPLETE / `READY_FOR_PHYSICAL_RECHECK`; next active deliverable is D1.7 Cross-screen/accessibility closure.

- [x] T1.6.1 Fix Profile Setup Continue/keyboard premature progression. Evidence: GlenTown-App `820d0cf`; IME hides save/skip actions and gives explicit dismissal guidance; Save profile & continue is intentional.
- [x] T1.6.2 Truthful Trust & Verification and preserved approved You routes. Evidence: `820d0cf`; customer-safe full-screen verification state removes fake status/action behavior. Orders/Credits/Saved/Help/workspace routes remain preserved.
- [x] T1.6.3 Focused and full validation/documentation reconciliation. Evidence: 4 focused Profile Setup tests, 370 full Flutter tests, full analyze no issues, `git diff --check` pass at `820d0cf`.
- [ ] T1.6.4 Calendar, Your Places, Job Seeker Profile and separate App/Account Settings IA. `BLOCKED_APP_DOMAIN_CONTRACT`; see `YOU_PROFILE_INFORMATION_ARCHITECTURE`.
- [ ] T1.6.5 Representative Orders/Calendar/account histories and profile/media persistence acceptance. `BLOCKED_BY_DEMO_DATA`; see `POPULATED_DEMO_USER`.
- [ ] T1.6.6 Verification account status/submission capability. `BLOCKED_API_CONTRACT`; see `ACCOUNT_VERIFICATION`.
- [ ] T1.6.7 Samsung profile/IME/media/settings/Trust/Credits/Help physical recheck. `ATTENTION`.

## D1.7 — Cross-screen/accessibility closure

**Status:** APP-SIDE COMPLETE / `READY_FOR_PHYSICAL_RECHECK`.

- [x] T1.7.1 SafeArea, keyboard overlap, horizontal clipping and raw technical errors. CROSS-A2-02 is `VERIFIED_BY_SOURCE_TEST`; CROSS-A2-03 is `READY_FOR_PHYSICAL_RECHECK`; CROSS-A2-04 is `VERIFIED_BY_SOURCE_TEST`. Evidence: `f5e4085`.
- [x] T1.7.2 Bounded responsive/accessibility reconciliation; independently App-fixable rows are closed or explicitly blocked/deferred in the App ledger.
- [x] T1.7.3 Automated validation: 20 focused tests and 370 full Flutter tests passed; full analyze no issues; diff check pass.
- [ ] T1.7.4 Consolidated Samsung physical re-audit. `READY`; the 75-check session worksheet is prepared, but no physical verification is claimed.

- [x] T1.3.35 **Directory user-approved design documentation** recorded in GlenTown-App docs/DIRECTORY_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md; reconcile with TownBoss Decisions, State and Memory. **DESIGN/DOC ONLY.**
- [ ] T1.3.36 Implement Directory topbar/location/search; Government/Health/Education/Community shortcuts; image-only Welcome-ratio ad; Featured Directory; scalable All Categories picker; Access All/Open Today/24-7/Online row; single-column compact entity cards, true public hours/contact, conditional quick actions and View Entry. **NOT STARTED.**
- [ ] T1.3.37 Verify source Organization/Place/branch taxonomy, system-managed identity, public-safe coordinates, official logos, real published phones/emails/websites, time zones/holiday exceptions, online service eligibility, contact provenance and checked-at. Audit Suggest Entry moderation and Claim Entry rights separately. **DATA/API VALIDATION OPEN.**
- [ ] T1.3.38 Run Directory focused/full Flutter/analyzer + API/contact/source tests, responsive screenshot, accessibility/TalkBack and independent Samsung physical-device audit before any PASS or merge. **NOT RUN.**

## Phase 1 gate

- [x] D1.1–D1.7 independently implementable App-side work complete or explicitly blocked/deferred.
- [ ] Completed recovery surfaces physically rechecked.
- [ ] No release-critical audit finding lacks canonical status.

---

# Phase 2 — Data Completeness and Demo Reality

## D2.1 — Demo seeder integrity and populated persona
- [ ] T2.1.1 Rerunnable/idempotent demo seeder integrity.
- [ ] T2.1.2 Populated demo user/personas.

## D2.2 — Representative composition and histories
- [ ] T2.2.1 Home representative composition and destination/discovery seed richness.
- [ ] T2.2.2 Multi-category cart/order and messaging/history fixtures.
- [ ] T2.2.3 Claimable business/provenance.

## Phase 2 gate
- [ ] Representative states are rerunnable, truthful, provenance-aware and adequate for audits.

# Phase 3 — Critical Journeys

## D3.1 — Identity, community, discovery and commerce
- [ ] T3.1.1 Auth/profile and Community journeys.
- [ ] T3.1.2 Explore/search/map, commerce, and services/booking journeys.

## D3.2 — Messaging and planners
- [ ] T3.2.1 Messaging journey.
- [ ] T3.2.2 Trip Planner, Event Planner and Financial Planner journeys.

## Phase 3 gate
- [ ] Beta-critical journeys pass on concrete App/API refs with authoritative boundaries.

# Phase 4 — Nationwide Readiness

## D4.1 — Province Ready model and samples
- [ ] T4.1.1 Province Ready definition, scoring and minimum thresholds.
- [ ] T4.1.2 Seeding rollout; Puerto Princesa deep-pilot; Palawan and non-Palawan samples.

## Phase 4 gate
- [ ] Enabled geography meets thresholds or truthfully exposes limited capability.

# Phase 5 — Quality, Security and Compliance

## D5.1 — Quality/accessibility and security boundaries
- [ ] T5.1.1 Accessibility, auth/tenancy/privacy, commerce financial boundaries and private-media leakage.
- [ ] T5.1.2 External/government adapters, production ingress, independent review and risk reconciliation.

## D5.2 — Flutter design-system decoupling modernization
- [ ] T5.2.1 After the fixture-backed Android/Web UI recovery and visual-acceptance work is stable, evaluate and perform an isolated Flutter upgrade from the current 3.44.x generation to a supported 3.47+ generation. Do not combine the toolchain/design-package migration with active UI recovery.
- [ ] T5.2.2 Audit dependencies for legacy `package:flutter/material.dart` / `package:flutter/cupertino.dart` types exposed through public APIs; evaluate the standalone first-party `material_ui` and `cupertino_ui` packages and compatibility-bridge requirements before migration.
- [ ] T5.2.3 Preserve GlenTown's own design-system and canonical UX authority while migrating imports with official Flutter migration tooling only after the compatibility gate is green.
- [ ] T5.2.4 Validate the modernization checkpoint independently across Android, Web and Windows: analyzer, full tests, platform release builds, golden/visual-regression coverage, Samsung physical acceptance, and browser responsive/design QA.
- [ ] T5.2.5 If dependency compatibility remains materially risky, keep the supported SDK-bundled compatibility path and defer the package migration rather than destabilizing Beta/RC.

## D5.3 — Synthetic Population / Scenario Validation Pre-Beta Gate

- [ ] T5.3.1 Audit/benchmark the selected MiroFish/OASIS or successor stack for maintenance, licensing, privacy, reproducibility, model/API cost, observability, and practical scale.
- [ ] T5.3.2 Build the documented Puerto Princesa calibration population and weighting model from legitimate statistics, GlenTown survey evidence, seeded inventory, and explicit assumptions.
- [ ] T5.3.3 Execute the required pre-Beta scenario families at a practical calibrated scale; record exact simulator/model/config/data checkpoints and run artifacts.
- [ ] T5.3.4 Reconcile critical/high-confidence findings into implementation, blocker, risk, or explicitly accepted Beta-experiment work.
- [ ] T5.3.5 Produce the final synthetic-population findings/experiment backlog and obtain release-authority acceptance of residual simulation risk.
- [ ] T5.3.6 Preserve the boundary that synthetic results are hypothesis/risk evidence, not proof of real user behavior; define the post-Beta telemetry/research recalibration plan.

## Phase 5 gate
- [ ] No unaccepted critical/high risk remains.
- [ ] Synthetic Population / Scenario Validation Pre-Beta Gate passes on the candidate release state with material findings dispositioned.

# Phase 6 — RC Operational Acceptance

## D6.1 — Release evidence and acceptance
- [ ] T6.1.1 Release refs and full validation.
- [ ] T6.1.2 Operational acceptance, Samsung physical audit, browser/web checks, release evidence manifest and documentation closeout.
- [ ] T6.1.3 Confirm `SYNTHETIC_POPULATION_ACCEPTANCE: PASS` for the exact candidate or document why an unaffected later SHA legitimately retains the accepted evidence.

## Phase 6 gate
- [ ] Operational Acceptance Test passes on concrete release refs.

# Phase 7 — Production Verification

## D7.1 — Deployable surfaces
- [ ] T7.1.1 GlenTown mobile.
- [ ] T7.1.2 `glentown.com`, `app.glentown.com`, `biz.glentown.com`, `admin.glentown.com`.
- [ ] T7.1.3 `api.glentown.com`, `help.glentown.com`, `dev.glentown.com`, production smoke and rollback.

## Phase 7 gate
- [ ] Deployed surfaces match accepted release candidate and rollback is ready.

## Closeout discipline

Each checkpoint updates exact task/evidence, Current State, Capability Matrix, Blocker Register, Risk Register when material, and Memory; completes the Documentation Compliance Receipt; validates diff; commits `[P<phase>][D<deliverable>][T<task>]`; then performs normal non-force remote checkpoint.

- [x] T1.3.39 **Travel v3 approved design documentation** added to GlenTown-App docs/TRAVEL_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-10.md on draft PR #33 and TownBoss governance draft PR #35. Supersedes Tourism and earlier Travel mockups. **DOC ONLY.**
- [ ] T1.3.40 Implement public **Travel** landing, Back/Filters/Map/Add Travel, Town/Province/National scope, Search, Places-or-Destinations/Stays/Experiences/Plan a Trip shortcuts, Sponsored Welcome-ratio image-only banner, standardized Featured carousel, searchable All Categories, Travel Interest row and mixed truthful listings. **NOT STARTED.**
- [ ] T1.3.41 Implement authoritative geographic **Town → Places; Province/National → Destinations** semantics atomically in shortcuts, Featured headings, category picker, filter, badge, CTA and detail; use **Experiences** not Tours & Activities in visible UI without renaming domain schema. **NOT STARTED.**
- [ ] T1.3.42 Implement **image-heavy full-bleed media** cards with **zero inset padding and BoxFit.cover**, text gradient, badge/Save and independently padded below-image visitor/rate/CTA details; make every Featured card same portrait aspect and caption anchoring. **NOT STARTED.**
- [ ] T1.3.43 Reconcile source Travel Place/Destination/Organization/Geography, Accommodation units, Experience operator/price/safety/capacity, Trip Planner, map coordinates, package/rental/transfer contracts, permissions, source provenance and live booking/payment truth. **API/DOMAIN VALIDATION OPEN.**
- [ ] T1.3.44 Run Travel focused/full Flutter/analyzer, backend tests, responsive cover/crop screenshots, accessibility/TalkBack and Samsung physical visual/functional acceptance. **NOT RUN.**
