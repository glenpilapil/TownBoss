# GlenTown Implementation Plan / Development Dashboard

**Portfolio:** TownBoss  
**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY  
**Pilot:** Puerto Princesa City, Palawan  
**Rollout:** Nationwide access with capability/readiness-based availability and nationwide pre-Beta seeding.

## Dashboard purpose

This file is the canonical GlenTown implementation plan **and live operator dashboard**. It must be updated whenever a substantial task changes implementation truth, blocker state, evidence, next work, or release readiness.

It must show at a glance:
- current phase and active deliverable;
- completed deliverables/tasks with evidence;
- blocked/deferred work;
- next eligible task;
- gates required before advancement.

A checked box means the item is complete at the stated evidence level, not merely attempted.

## Status legend

- `[ ]` — not complete
- `[x]` — complete with evidence
- `⏳` — active/in progress
- `⚠` — attention/review required
- `⛔` — blocked
- `↪` — deferred by explicit decision

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

`PLANNED → IMPLEMENTED → INTEGRATED → TEST_VERIFIED → RUNTIME_VERIFIED → PHYSICAL_VERIFIED → RELEASE_READY`

Historical code/tests prove only the level actually evidenced. Worker prose alone cannot promote status.

---

# Current dashboard summary

- [x] TownBoss GlenTown governance/control corpus established.
  Evidence: Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Operational Acceptance Test, Risk Register, Release Evidence Manifest template, Documentation Compliance Protocol.
- [x] Canonical frontend audit backlog recovered and versioned.
  Evidence: GlenTown-App `9db4f889130a83c11e379f1101dae45ed5288cb8`, `docs(ui): consolidate remaining audit backlog`.
- [x] Home/navigation recovery chain implemented and full-suite validated.
  Evidence: `170baca` → `969abec` → `9a7861e` → `a43442b` → `c28feee` → `ff6d2e2`; full Flutter suite 369/369 at reconciliation checkpoint.
- [x] Explore/discovery App recovery implemented and full-suite validated.
  Evidence: GlenTown-App `3edfb0c075fc984c19c6b9407868afa5a4ed6965`; 33 focused Explore tests, 9 cross-route tests, full Flutter 369/369, analyze clean, diff check pass.
- [ ] Completed App recovery surfaces physically rechecked on Samsung.
- [ ] ⏳ Current next implementation deliverable: **Create recovery**.
- [ ] Chat recovery.
- [ ] You/Profile recovery.
- [ ] Cross-screen/accessibility closure.
- [ ] API/demo-data dependency closure.
- [ ] Final consolidated App reconciliation.
- [ ] Samsung consolidated physical re-audit.
- [ ] Beta operational acceptance.

---

# Phase 0 — Canonical State and Governance Reconciliation

**Phase status:** SUBSTANTIALLY COMPLETE / FRESH API CANONICAL VERIFICATION STILL OPEN

## Deliverable D0.1 — Portfolio/project governance baseline

- [x] T0.1.1 Establish GlenTown project-control corpus.
  Evidence: canonical TownBoss documents under `plans/projects/glentown/`.
- [x] T0.1.2 Establish authority, capability, blocker, validation, risk and operational-acceptance controls.
  Evidence: `GLENTOWN_AUTHORITY_MATRIX.md`, `GLENTOWN_CAPABILITY_MATRIX.md`, `GLENTOWN_BLOCKER_REGISTER.md`, `GLENTOWN_VALIDATION_PROFILES.md`, `GLENTOWN_RISK_REGISTER.md`, `GLENTOWN_OPERATIONAL_ACCEPTANCE_TEST.md`.
- [x] T0.1.3 Establish mandatory documentation closeout and safe-abort/recovery rules.
  Evidence: TownBoss governance policies + `GLENTOWN_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`.

## Deliverable D0.2 — Frontend audit authority recovery

- [x] T0.2.1 Reconcile physical, screenshot and code audit evidence into one canonical ledger.
  Evidence: GlenTown-App `9db4f88`; 12 Explore, 7 Create, 7 Chat, 8 You and 8 cross-screen findings normalized.
- [x] T0.2.2 Version principal textual audit evidence.
  Evidence: `docs/audits/mobile-ux-auditor-evaluation.md`, `docs/audits/screenshot-ux-auditor-evaluation.md` committed at `ff6d2e2` lineage.
- [x] T0.2.3 Preserve screenshot/annotation evidence without polluting canonical source history.
  Evidence: screenshot/annotation corpus intentionally retained outside tracked source at reconciliation checkpoints.

## Deliverable D0.3 — Fresh canonical validation baseline

- [x] T0.3.1 Full Flutter regression suite verified on active recovery lineage.
  Evidence: 369 tests passed, 0 failed at `ff6d2e2`; analyze clean; diff check pass.
- [x] T0.3.2 Full Flutter suite re-verified after Explore recovery.
  Evidence: 369 tests passed at `3edfb0c`; analyze clean; diff check pass.
- [ ] T0.3.3 Fresh GlenTown-API full-suite/database verification on canonical release-intended lineage.
- [ ] T0.3.4 Reconcile active API feature branches/checkpoints to canonical/default branch before release promotion.

## Phase 0 gate

- [x] Canonical frontend audit authority established.
- [x] TownBoss execution/governance baseline established.
- [x] Fresh Flutter full-suite evidence exists on current recovery lineage.
- [ ] Fresh canonical API verification/integration state established.

---

# Phase 1 — Core Mobile Functional and UX Recovery

**Phase status:** CURRENT

## Deliverable D1.1 — Onboarding/Auth recovery

- [x] T1.1.1 Restore onboarding/auth visual authority and official supplied logo assets.
  Evidence: GlenTown-App `be202c5ab539218305c8ed2d80ec823504445238` (`fix/device-audit-onboarding-auth` lineage); focused validation reported green.
- [x] T1.1.2 Add explicit non-release email-verification development bypass.
  Evidence: `GLENTOWN_DEV_BYPASS_EMAIL_VERIFICATION`, default off and disabled in release builds; documented as temporary.
- [ ] T1.1.3 Real SMTP/email verification end-to-end validation.
  Status: `BLOCKED_EXTERNAL` pending real SMTP/delivery account.
- [ ] T1.1.4 Physical recheck of onboarding/auth final logo fidelity and frozen layout.

## Deliverable D1.2 — Home/Floating Navigation recovery

- [x] T1.2.1 Restore shared navigation shell clearance and avatar fallback.
  Evidence: `170baca4b9fb43ac35560372224e43c0e066abf0`; focused test pass, analysis clean, diff check pass.
- [x] T1.2.2 Restore Community taxonomy, Home filters and post interaction boundaries.
  Evidence: `969abecc4aef8f9786f1b8ff88bf2d543336fe06`; focused Community tests 3/3.
- [x] T1.2.3 Restore actionable Notifications interactions.
  Evidence: `9a7861e13cec66b7acf8f1bba0a6ef6b36fb5075`; focused notification tests 5/5.
- [x] T1.2.4 Recover branded Map marker/search/preview architecture without production mock pins.
  Evidence: `a43442b75916e805b44af2af62f38233112882a7`; focused Map tests 2/2.
- [x] T1.2.5 Reconcile Cart and Around You typed routing/presentation boundaries.
  Evidence: `c28feee029834fe3be6678da0b81ab11c329c64d`; focused tests 2/2.
- [x] T1.2.6 Final App-side Home recovery reconciliation.
  Evidence: `ff6d2e2e502a0fa91d19a799b46a8d7ca0523428`; focused 17/17, full Flutter 369/369, analyze clean, diff check pass.
- [ ] T1.2.7 Samsung physical recheck of Home/navigation/notifications/community/cart/Around You/map recovery.

## Deliverable D1.3 — Explore/Discovery recovery

- [x] T1.3.1 Recover and normalize Explore audit backlog.
  Evidence: `9db4f88`; 12 canonical Explore findings recorded.
- [x] T1.3.2 Remove fabricated fixed/remote-image featured inventory from real-mode Explore.
  Evidence: `3edfb0c`.
- [x] T1.3.3 Restore canonical Explore category order and search ownership.
  Evidence: `3edfb0c`; canonical order rendered directly; normal Explore retains universal Search; Map retains map-local Search only.
- [x] T1.3.4 Improve truthful real-mode Search unavailable state.
  Evidence: `3edfb0c`; Browse Categories exit added; fake connected results prohibited.
- [x] T1.3.5 Reconcile stale Explore tests and all 12 ledger rows.
  Evidence: 33 focused Explore tests + 9 cross-route tests passed at `3edfb0c`.
- [x] T1.3.6 Full regression validation after Explore recovery.
  Evidence: Flutter 369/369; full/focused analysis no issues; `git diff --check` pass.
- [ ] T1.3.7 Samsung physical recheck of Explore/discovery recovered surfaces.
- [ ] T1.3.8 Connected universal Search contract.
  Status: `BLOCKED_API_CONTRACT`.
- [ ] T1.3.9 Scope-bound discovery/ranking contract and nationwide scope queries.
  Status: `BLOCKED_API_CONTRACT`.
- [ ] T1.3.10 Destination hero-media projection.
  Status: `BLOCKED_API_DATA`.
- [ ] T1.3.11 Real Map listing projection in connected mode.
  Status: `BLOCKED_API_CONTRACT`.
- [ ] T1.3.12 Seeded destination/discovery richness for realistic audit.
  Status: `BLOCKED_BY_DEMO_DATA`.
- [ ] T1.3.13 Jobs/Directory detail fallback recovery.
  Status: bounded later App task; not part of `3edfb0c`.

## Deliverable D1.4 — Create recovery

**Status:** NEXT ACTIVE DELIVERABLE

- [ ] ⏳ T1.4.1 Read canonical Create audit rows and governing UX/product rules.
- [ ] T1.4.2 Reconcile main Create hierarchy and top/safe-area presentation.
- [ ] T1.4.3 Verify citizen product flow defaults to Pre-Loved and commercial categories trigger business setup.
- [ ] T1.4.4 Ensure citizens do not receive unauthorized `Post a Job` action.
- [ ] T1.4.5 Reconcile Community create entry points with canonical seven-category taxonomy.
- [ ] T1.4.6 Reconcile supported media/form/keyboard/error behavior without fake persistence.
- [ ] T1.4.7 Reconcile Trust/Verification routing to approved full-screen flows where applicable.
- [ ] T1.4.8 Add/update focused tests.
- [ ] T1.4.9 Update App ledger and TownBoss project-control docs.
- [ ] T1.4.10 Checkpoint with canonical commit/report format.

## Deliverable D1.5 — Chat recovery

- [ ] T1.5.1 Reconcile customer label `Chat` versus superseded `Messages` terminology.
- [ ] T1.5.2 Verify direct/group/chatroom/message-request information architecture.
- [ ] T1.5.3 Reconcile pending/recommended/search conversation flows.
- [ ] T1.5.4 Reconcile composer/keyboard/loading/error/unread behavior.
- [ ] T1.5.5 Verify frontend against implemented messaging backend contracts.
- [ ] T1.5.6 Add/update focused tests and documentation.
- [ ] T1.5.7 Checkpoint and TownBoss closeout.

## Deliverable D1.6 — You/Profile recovery

- [ ] T1.6.1 Correct Profile Setup Continue/keyboard behavior that allowed premature progression.
- [ ] T1.6.2 Reconcile Your Orders, Your Calendar, Your Places and Job Seeker Profile destinations.
- [ ] T1.6.3 Reconcile App/Account/Notification Settings hierarchy.
- [ ] T1.6.4 Reconcile Trust & Verification, Credits, Help/Support and business/organization entries.
- [ ] T1.6.5 Verify persistent You-avatar entry model and destination routing.
- [ ] T1.6.6 Add/update focused tests and documentation.
- [ ] T1.6.7 Checkpoint and TownBoss closeout.

## Deliverable D1.7 — Cross-screen/accessibility closure

- [ ] T1.7.1 SafeArea/status-bar audit closure.
- [ ] T1.7.2 Persistent navigation/button overlap closure.
- [ ] T1.7.3 Keyboard/modal/error stacking closure.
- [ ] T1.7.4 Text scale/horizontal-control clipping closure.
- [ ] T1.7.5 Contrast/iconography/Lucide consistency closure.
- [ ] T1.7.6 Customer-safe error/empty/loading state closure.
- [ ] T1.7.7 Responsive web/desktop sanity verification where release-relevant.
- [ ] T1.7.8 Final cross-screen focused tests and documentation reconciliation.

## Phase 1 gate

- [ ] All D1.1–D1.7 independently implementable items complete or explicitly blocked/deferred.
- [ ] Completed mobile recovery surfaces physically rechecked.
- [ ] No unresolved release-critical UI regression lacks a canonical status.
- [ ] App/TownBoss documentation synchronized at checkpoint.

---

# Phase 2 — Data Completeness and Demo Reality

**Phase status:** ACTIVE DEPENDENCY WORK / NOT GATE-COMPLETE

## Deliverable D2.1 — Stable populated demo personas

- [x] T2.1.1 Populated Maria demo identity established on reconciled API feature lineage.
  Evidence: `maria.santos@example.com`; email-verified; password validation reported; seeded orders/notifications/posts/conversations/messages/requests.
- [ ] T2.1.2 Reconcile populated demo-data commits to canonical API release-intended lineage.
- [ ] T2.1.3 Establish additional citizen/business/professional personas as required by acceptance flows.

## Deliverable D2.2 — Rich Home/community/discovery fixtures

- [ ] T2.2.1 Community advisory fixture.
- [ ] T2.2.2 Mixed post categories with representative media/gallery.
- [ ] T2.2.3 Recommendations / People You May Know where product design requires them.
- [ ] T2.2.4 Life-event/reminder/home-orchestration cards.
- [ ] T2.2.5 Around You media-rich fixtures.
- [ ] T2.2.6 Destination/discovery media-rich fixtures.

## Deliverable D2.3 — Commerce/history fixtures

- [ ] T2.3.1 Multi-category/multi-vendor Cart state.
- [ ] T2.3.2 Orders/reservations/bookings/invitations history.
- [ ] T2.3.3 Messaging and notification history across representative personas.
- [ ] T2.3.4 Claimable-business semantics/provenance verification.

## Phase 2 gate

- [ ] Dedicated seed run passes.
- [ ] Second seed run proves idempotency.
- [ ] Intended categories/states are represented.
- [ ] Real mode never substitutes fabricated client-side demo data.

---

# Phase 3 — Critical Journey Validation

**Phase status:** NOT COMPLETE

## Deliverable D3.1 — Identity and social journeys
- [ ] Auth/profile journey passes end-to-end.
- [ ] Community create/interact/detail journey passes at supported capability level.
- [ ] Notifications semantic-routing journey passes.

## Deliverable D3.2 — Discovery and transaction journeys
- [ ] Explore/search/map/detail journey passes.
- [ ] Marketplace/Product journey passes.
- [ ] Food journey passes.
- [ ] Service booking/deposit journey passes.
- [ ] Cart/checkout/order boundaries pass.
- [ ] Reviews/ratings completion journey passes.

## Deliverable D3.3 — Messaging/planner journeys
- [ ] Messaging end-to-end physical-device journey passes.
- [ ] Trip Planner runtime/regression gate passes.
- [ ] Event Planner runtime/regression gate passes.
- [ ] Financial Planner runtime/regression gate passes.
- [ ] Day Planner implementation/runtime evidence reconciled.
- [ ] Achieve implementation/runtime evidence reconciled.

## Phase 3 gate
- [ ] All Beta-critical journeys pass on concrete App/API refs.
- [ ] Server-authoritative commerce/booking state boundaries verified.

---

# Phase 4 — Nationwide Beta Readiness

**Phase status:** NOT COMPLETE

## Deliverable D4.1 — Province Ready model
- [ ] Define Province Ready scoring and minimum threshold.
- [ ] Record provenance/freshness requirements.
- [ ] Define capability gating for not-yet-ready locations.

## Deliverable D4.2 — Nationwide pre-Beta seeding
- [ ] Puerto Princesa deepest-pilot readiness evidenced.
- [ ] Remaining Palawan province readiness progressed to threshold.
- [ ] Province-by-province nationwide seed execution tracked.
- [ ] At least one outside-Palawan sample passes readiness and product checks.

## Phase 4 gate
- [ ] Enabled locations satisfy threshold or truthfully expose limited capability.
- [ ] Nationwide users do not encounter misleading empty experiences for advertised capability.

---

# Phase 5 — Quality, Security, Privacy and Compliance

**Phase status:** NOT COMPLETE

## Deliverable D5.1 — Quality/accessibility
- [ ] Accessibility audit complete.
- [ ] Responsive/edge-case audit complete.
- [ ] Localization/currency formatting review complete.

## Deliverable D5.2 — Security/privacy
- [ ] Auth/authorization/tenancy review complete.
- [ ] Commerce/booking financial-state authority review complete.
- [ ] Private-media/data leakage review complete.
- [ ] Messaging privacy/abuse controls reviewed.
- [ ] Production ingress/WAF/Zero Trust controls reviewed.

## Deliverable D5.3 — Compliance/integration
- [ ] External/government adapter review complete where enabled.
- [ ] Required independent reviews complete.
- [ ] Risk Register reconciled with no unaccepted critical/high risk.

---

# Phase 6 — Release Candidate Operational Acceptance

**Phase status:** NOT STARTED

## Deliverable D6.1 — Freeze release refs
- [ ] Record GlenTown-App SHA.
- [ ] Record GlenTown-API SHA.
- [ ] Record TownBoss planning SHA.
- [ ] Record migration/seed checkpoint.

## Deliverable D6.2 — Automated and operational acceptance
- [ ] Fresh full API suite/database verification.
- [ ] Fresh Flutter full suite/analyze.
- [ ] `GLENTOWN_OPERATIONAL_ACCEPTANCE_TEST.md` passes.
- [ ] Final Samsung physical-device audit passes.
- [ ] Required web/browser surfaces pass.
- [ ] Release Evidence Manifest completed.

## Phase 6 gate
- [ ] Release candidate has evidence-backed operational acceptance.
- [ ] Current State, Capability Matrix, Blocker Register, Memory and this dashboard are synchronized.

---

# Phase 7 — Production Verification

**Phase status:** NOT STARTED

## Deliverable D7.1 — Deployable surfaces
- [ ] Android/iOS GlenTown release verified — `apps/GLENTOWN_MOBILE.md`.
- [ ] `glentown.com` verified — `apps/GLENTOWN_WEB.md`.
- [ ] `app.glentown.com` verified — `apps/APP_GLENTOWN_COM.md`.
- [ ] `biz.glentown.com` verified — `apps/BIZ_GLENTOWN_COM.md`.
- [ ] `admin.glentown.com` verified — `apps/ADMIN_GLENTOWN_COM.md`.
- [ ] `api.glentown.com` verified — `apps/API_GLENTOWN_COM.md`.
- [ ] `help.glentown.com` verified — `apps/HELP_GLENTOWN_COM.md`.
- [ ] `dev.glentown.com` verified — `apps/DEV_GLENTOWN_COM.md`.

## Deliverable D7.2 — Production smoke and recovery
- [ ] Production smoke/health verification passes.
- [ ] Monitoring/operational owner confirmed.
- [ ] Rollback refs/procedure verified.

`glentown.com` remains canonical; `www.glentown.com` should redirect to it.

---

# Capability work outside immediate Beta gate

- [x] Trip Planner implementation present on canonical Flutter lineage.
- [x] Event Planner / Events implementation present on canonical Flutter lineage.
- [x] Financial Planner implementation present on canonical Flutter lineage.
- [x] Messaging backend foundation implementation evidenced on API lineage.
- [x] Community advisory acknowledgements implemented on API lineage.
- [x] Organization actor/setup discovery implemented on API lineage.
- [ ] Day Planner implementation evidence reconciled.
- [ ] Achieve implementation evidence reconciled.
- [ ] Glen AI / Ask Glen production implementation evidenced.
- [ ] Government-service adapters production implementation evidenced.
- [ ] PMS multi-unit evolution implementation evidenced where activated.
- [ ] Transport/transfers and event-venue/rentals implementation evidenced where activated.

---

# Closeout discipline

Every substantial task must, before checkpoint completion:

1. run the applicable validation profile;
2. update the exact task/deliverable row in this dashboard;
3. attach concise evidence (commit/ref + relevant test/runtime/physical result);
4. reconcile Capability Matrix / Blocker Register / Current State / Risk Register where truth changed;
5. append Memory when the milestone is material;
6. complete the Documentation Compliance Receipt;
7. commit using `[P<phase>][D<deliverable>][T<task>] <summary>`;
8. follow TownBoss remote-checkpoint policy;
9. return a short operator report.

A task is not closed merely because code was committed in GlenTown-App or GlenTown-API.

## Evidence rule

Repository history proves implementation existence. Default-branch ancestry establishes canonical integration. `TEST_VERIFIED`, `RUNTIME_VERIFIED`, `PHYSICAL_VERIFIED`, and `RELEASE_READY` require fresh evidence tied to concrete refs and applicable validation/acceptance gates.
