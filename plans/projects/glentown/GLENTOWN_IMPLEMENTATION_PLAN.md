# GlenTown Implementation Plan / Development Dashboard

**Portfolio:** TownBoss
**Current state:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**Pilot:** Puerto Princesa City, Palawan
**Rollout:** Nationwide access with capability/readiness-based availability and nationwide pre-Beta seeding.
**Dashboard rule:** checkboxes are authoritative completion markers; do not mark complete without evidence.

## Governing execution documents
- `GLENTOWN_AUTHORITY_MATRIX.md`
- `GLENTOWN_CAPABILITY_MATRIX.md`
- `GLENTOWN_BLOCKER_REGISTER.md`
- `GLENTOWN_VALIDATION_PROFILES.md`
- `GLENTOWN_OPERATIONAL_ACCEPTANCE_TEST.md`
- `GLENTOWN_RISK_REGISTER.md`
- `GLENTOWN_RELEASE_EVIDENCE_MANIFEST_TEMPLATE.md`
- `GLENTOWN_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`
- `GLENTOWN_DECISIONS_AND_RULES.md`
- `GLENTOWN_ACCEPTANCE_CRITERIA.md`
- `GLENTOWN_MEMORY.md`

## Status promotion
PLANNED, IMPLEMENTED, INTEGRATED, TEST_VERIFIED, RUNTIME_VERIFIED, PHYSICAL_VERIFIED, RELEASE_READY.
Historical code/tests prove only the level actually evidenced. Worker prose alone cannot promote status.

# Phase 0 — Canonical State Reconciliation
**Gate:** active work is traceable to current canonical repository and planning authority.
- [ ] Fresh API full-suite/database verification complete on canonical HEAD.
- [ ] Fresh Flutter analyze/test verification complete on canonical HEAD.
- [ ] Post-September onboarding/auth and active recovery work reconciled to canonical App lineage.
- [ ] Canonical UI/UX regression/audit authority reconciled and versioned.
- [ ] Capability Matrix reflects present implementation truth.
- [ ] Blocker Register reflects known dependencies.

# Phase 1 — Core Functional and UX Recovery
**Gate:** release-critical mobile surfaces are coherent before broader promotion.
- [ ] Onboarding/auth current authority physically rechecked.
- [ ] Home/floating-navigation recovery physically rechecked.
- [ ] Notifications gestures/routing physically rechecked.
- [ ] Community post interactions/detail architecture resolved to applicable contract level.
- [ ] Cart and Around You recovery physically rechecked.
- [ ] Map recovery physically rechecked against real-data capability.
- [ ] Explore canonical audit backlog recovered and physically rechecked.
- [ ] Create, Chat/Messages and You remaining audit backlog reconciled.

# Phase 2 — Data Completeness and Demo Reality
**Gate:** representative audits can exercise intended states without misleading real-mode behavior.
- [ ] Comprehensive rerunnable realistic demo-data seeding passes twice.
- [ ] Stable populated demo user/personas available.
- [ ] Community advisory data available where intended.
- [ ] Rich mixed community posts include representative media and categories.
- [ ] Recommendations/discovery fixtures available where product design requires them.
- [ ] Life-event/reminder/home orchestration cards represented where intended.
- [ ] Multi-category/multi-vendor cart/order history represented.
- [ ] Messaging/notification/reservation histories represented.
- [ ] Claimable-business semantics and provenance verified.

# Phase 3 — Critical Journey Validation
**Gate:** core journeys work end-to-end against real contracts.
- [ ] Authentication/profile journey passes.
- [ ] Community create/interact/detail journey passes at supported capability level.
- [ ] Explore/search/map/detail journey passes.
- [ ] Marketplace/Food/Service representative transaction journeys pass.
- [ ] Cart/checkout/order boundaries pass.
- [ ] Messaging end-to-end physical-device journey passes.
- [ ] Trip Planner regression/runtime gate passes.
- [ ] Event Planner regression/runtime gate passes.
- [ ] Financial Planner regression/runtime gate passes.
- [ ] Commerce/order boundary review passes.

# Phase 4 — Nationwide Beta Readiness
**Gate:** enabled locations satisfy explicit readiness thresholds or are capability-gated truthfully.
- [ ] Province Ready scoring/thresholds finalized.
- [ ] Nationwide pre-Beta seeding executed to required threshold.
- [ ] Puerto Princesa deepest-pilot density/readiness evidenced.
- [ ] Additional Palawan municipality sample passes.
- [ ] Outside-Palawan sample passes.
- [ ] Capability availability is geographic/readiness-aware.

# Phase 5 — Quality, Security, Privacy and Compliance
**Gate:** release candidate has no unaccepted critical/high risk.
- [ ] Accessibility/responsive/edge-case review complete.
- [ ] Authentication/authorization/tenancy/privacy review complete.
- [ ] Commerce/booking financial-state authority review complete.
- [ ] Private media/data leakage review complete.
- [ ] External/government adapter review complete where enabled.
- [ ] Production ingress/security controls reviewed.
- [ ] Required independent reviews complete.
- [ ] Risk Register reconciled; accepted risks explicitly authorized.

# Phase 6 — Release Candidate Operational Acceptance
**Gate:** `GLENTOWN_OPERATIONAL_ACCEPTANCE_TEST.md` passes on concrete release refs.
- [ ] API/App/TownBoss release refs frozen and recorded.
- [ ] Fresh full automated gates pass under Validation Profiles.
- [ ] Operational Acceptance Test passes.
- [ ] Final physical-device visual audit passes.
- [ ] Required web/browser surface checks pass.
- [ ] Release Evidence Manifest completed.
- [ ] Memory, Current State, Capability Matrix and dashboard updated.

# Phase 7 — Production Verification
**Gate:** deployed surfaces match the accepted release candidate and rollback is ready.
- [ ] Android/iOS GlenTown release verified — `apps/GLENTOWN_MOBILE.md`.
- [ ] `glentown.com` verified — `apps/GLENTOWN_WEB.md`.
- [ ] `app.glentown.com` verified — `apps/APP_GLENTOWN_COM.md`.
- [ ] `biz.glentown.com` verified — `apps/BIZ_GLENTOWN_COM.md`.
- [ ] `admin.glentown.com` verified — `apps/ADMIN_GLENTOWN_COM.md`.
- [ ] `api.glentown.com` verified — `apps/API_GLENTOWN_COM.md`.
- [ ] `help.glentown.com` verified — `apps/HELP_GLENTOWN_COM.md`.
- [ ] `dev.glentown.com` verified — `apps/DEV_GLENTOWN_COM.md`.
- [ ] Production smoke/health verification passes.
- [ ] Rollback refs/procedure verified.

`glentown.com` remains canonical; `www.glentown.com` should redirect to it.

## Capability work outside immediate Beta gates
- [x] Trip Planner implementation present on canonical Flutter lineage.
- [x] Event Planner / Events implementation present on canonical Flutter lineage.
- [x] Financial Planner implementation present on canonical Flutter lineage.
- [x] Messaging backend implementation present on canonical API lineage.
- [x] Community advisory acknowledgements implemented on API lineage.
- [x] Organization actor/setup discovery implemented on API lineage.
- [ ] Day Planner implementation evidence reconciled.
- [ ] Achieve implementation evidence reconciled.
- [ ] Glen AI / Ask Glen production implementation evidenced.
- [ ] Government-service adapters production implementation evidenced.
- [ ] PMS multi-unit evolution implementation evidenced where activated.
- [ ] Transport/transfers and event-venue/rentals implementation evidenced where activated.

## Phase discipline
- Do not pull later-phase capability work forward merely because it is convenient.
- A phase may overlap another only when dependencies permit and doing so does not bypass its gate.
- Known blockers must be reconciled through `GLENTOWN_BLOCKER_REGISTER.md`.
- Validation must use `GLENTOWN_VALIDATION_PROFILES.md`.
- Material work must obey `GLENTOWN_AUTHORITY_MATRIX.md` and produce the Documentation Compliance Receipt.
- Every substantial agent task contract must include safe-abort and recovery behavior as a mandatory section.

## Evidence rule
Repository history proves implementation existence. Default-branch ancestry proves canonical integration. Higher verification states require fresh evidence tied to concrete refs and applicable validation/acceptance gates.
