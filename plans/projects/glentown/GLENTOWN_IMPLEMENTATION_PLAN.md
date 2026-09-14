# GlenTown Implementation Plan / Live Development Dashboard

**Portfolio:** TownBoss
**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**Current phase:** Phase 1 — App-side recovery complete / physical verification pending
**Current deliverable/task:** Consolidated Samsung physical re-audit
**Phase gate:** APP-SIDE RECOVERY COMPLETE — physical verification remains pending.

## Status legend

`[ ]` not complete; `[x]` complete with evidence; `IN_PROGRESS` active; `ATTENTION` needs review; `BLOCKED` dependency; `DEFERRED` explicitly out of scope.

## Current summary

- [x] Phase 0 governance/planning foundations substantially established. Evidence: GlenTown control corpus and 2026-09-13 governance adoption.
- [x] Home recovery App-side complete; physical verification pending. Evidence: `170baca` → `969abec` → `9a7861e` → `a43442b` → `c28feee` → `ff6d2e2`; 369 Flutter tests passed, analyze no issues, diff check pass.
- [x] Explore recovery App-side complete; physical verification pending. Evidence: `3edfb0c`; 33 focused Explore tests, 9 cross-route tests, 369 Flutter tests, analyze no issues, diff check pass.
- [x] Create recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `aa07d2586f0b7db9a440f20b6fa927fee374b4b0`; 9 focused tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] Chat recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `f9702ed672679d6744e17a281c96c95ee312299f`; 53 focused Chat tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] You/Profile recovery is App-side complete; physical verification pending. Evidence: GlenTown-App `820d0cf20b278827da6b4ff238bd7e0e8b4087cb`; 4 focused tests, 370 full Flutter tests, analyze no issues, diff check pass.
- [x] D1.7 cross-screen/accessibility App-side closure. Evidence: GlenTown-App `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`; 20 focused tests and 370 full Flutter tests passed, analyze no issues, diff check pass.
- [ ] Physical verification, explicit API/data/domain blockers, and Beta readiness remain open. Next gate: consolidated Samsung physical re-audit.

## D0.1 — Canonical repository/state reconciliation

- [x] T0.1.1 Reconcile TownBoss planning authority and dashboard ownership. Evidence: canonical files under `plans/projects/glentown/`.
- [ ] T0.1.2 Fresh GlenTown-API current-HEAD full suite/database verification. `ATTENTION`.
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

## D1.4 — Create recovery

**Status:** APP-SIDE COMPLETE / `READY_FOR_PHYSICAL_RECHECK`; next active deliverable is D1.5 Chat recovery.

- [x] T1.4.1 Establish Create audit authority/bounded recovery contract. Evidence: canonical App ledger CREATE-A2-01 through CREATE-A2-07 reconciled at `aa07d25`.
- [x] T1.4.2 Create layout/hierarchy and canonical Community taxonomy. Evidence: CREATE-A2-01/03 remain code-reconciled from `969abec`; shared taxonomy is preserved and validated by the D1.4 focused suite.
- [x] T1.4.3 Citizen Product → Pre-Loved; commercial category → business setup gating; citizen Post a Job restriction. Evidence: CREATE-A2-02; D1.4 focused suite covers citizen, seller, and employer paths.
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
- [ ] T1.7.4 Consolidated Samsung physical re-audit. `ATTENTION`; no physical verification is claimed.

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

## Phase 5 gate
- [ ] No unaccepted critical/high risk remains.

# Phase 6 — RC Operational Acceptance

## D6.1 — Release evidence and acceptance
- [ ] T6.1.1 Release refs and full validation.
- [ ] T6.1.2 Operational acceptance, Samsung physical audit, browser/web checks, release evidence manifest and documentation closeout.

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
