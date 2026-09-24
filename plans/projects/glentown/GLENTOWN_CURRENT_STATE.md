# GlenTown Current State

## ORCHESTRATION ENTRY POINT AND CURRENT-STATE RESOLUTION PROTOCOL

**GLENTOWN_CURRENT_STATE.md is the single operational entry point for determining current GlenTown state.** It does not replace domain authority documents; it directs the reader to them and records the current accepted refs, active workstreams, blockers, and validation freshness.

### Resolution Order

When resolving questions about current, latest, remaining, pending, already fixed, accepted, implemented, verified, or next action state:

1. **GLENTOWN_CURRENT_STATE** — this document; accepted refs and pointers only
2. **GLENTOWN_DECISIONS_AND_RULES** — binding product and implementation rules
3. **GLENTOWN_SUPERSESSION_REGISTER** — explicit overrides of older decisions
4. **Relevant authority/domain/app documents** — e.g., `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`, app-specific authority
5. **Current implementation evidence** — concrete code refs at accepted checkpoints
6. **Validation/audit evidence tied to exact checkpoints** — physical/device/browser evidence bound to exact SHAs

Conversational or model memory is discovery context only, not project authority.

### Authority Pointers

- Product/decision authority: `GLENTOWN_DECISIONS_AND_RULES.md`, `GLENTOWN_SUPERSESSION_REGISTER.md`
- Implementation plan/dashboard: `GLENTOWN_IMPLEMENTATION_PLAN.md`
- Capability/status: `GLENTOWN_CAPABILITY_MATRIX.md`
- Blockers: `GLENTOWN_BLOCKER_REGISTER.md`
- Validation requirements: `GLENTOWN_VALIDATION_PROFILES.md`
- Web/Windows visual authority: `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`
- Web/Windows Chat/Profile authority: `GLENTOWN_WEB_WINDOWS_CHAT_PROFILE_AUTHORITY.md`
- Meal Planner / Activity Plan product authority: `GLENTOWN_MEAL_ACTIVITY_PLANNING.md`
- App visual audit ledger (persistent issue ledger): `plans/projects/glentown/apps/glentown-app/GLENTOWN_FLUTTER_APP_VISUAL_AUDIT_LEDGER.md`
- Current App/Web shared-baseline reconciliation: `GLENTOWN_APP_WEB_WAVE2_BASELINE_RECONCILIATION_2026-09-21.md`
- Mobile physical audit: GlenTown-App `dd1ecf6` (`docs/audits/PHYSICAL_REAUDIT_2026-09-14.md`)
- Memory: `GLENTOWN_MEMORY.md`
- TownBoss portfolio governance: `governance/*.md`, `plans/TOWNBOSS_MASTER_DEVELOPMENT_PLAN.md`
- CPS governance: `plans/projects/code-project-supervisor/*.md`

### Current Accepted Checkpoints

- **GlenTown-App reconciled shared baseline candidate:** `8e17b297b7a3b2e5b0a35eafebcefe9409f37759` (`reconcile/web-wave2-governance-20260921`)
- **Web recovery implementation checkpoint:** `f5267d9ae12dd1e08a457e1c85639544ba8dc3ad`; Web feature completeness and final responsive/browser acceptance remain pending.
- **TownBoss canonical checkpoint:** `ede731578ce63fbdd9db6945014ac00259870627` (origin/main)
- **GlenTown-App accepted post-Samsung recovery:** `4010f1fcf19b58eaafe828e0b4abeac72421e7fb`
- **GlenTown-Flutter accepted shared baseline:** `ad54364452958870ae3aa25286605b5ea5f98a70`
- **GlenTown-API accepted recovery:** `738e8ac124854e7ef95f4a8472424c941da32b91`
- **API full-suite checkpoint:** `738e8ac` (1,336 tests / 4,633 assertions / 0 failures, canonical `phpunit.xml` paths)
- **Home recovery:** `ff6d2e2` → `4010f1f` (369 tests, analyze clean, diff check pass)
- **Explore recovery:** `3edfb0c` (33 focused Explore tests, 9 cross-route tests, 369 full tests)
- **Create recovery:** `aa07d25` (9 focused tests, 370 full tests)
- **Chat recovery:** `f9702ed` (53 focused tests, 370 full tests)
- **You/Profile recovery:** `820d0cf` (4 focused tests, 370 full tests)
- **D1.7 cross-screen/accessibility:** `f5e4085` (20 focused tests, 370 full tests)
- **Samsung physical re-audit worksheet:** GlenTown-App `dd1ecf6` (75-check session; no physical result claimed)
- **GlenTown-Flutter accepted shared baseline:** `ad54364452958870ae3aa25286605b5ea5f98a70`
  - Changed-Dart-files gate passed.
  - 5 changed Dart files checked.
  - 0 required formatting.
  - ANALYZE: 0 errors, 0 warnings, 0 infos.
  - TESTS: 483 total / 483 passed / 0 failed.
  - WEB RELEASE BUILD: PASS.
  - ANDROID APK RELEASE BUILD: PASS.
  - WEB BROWSER ACCEPTANCE: PARTIAL — headless Chrome 153 release-build pass at `ad543644`; branded GlenTown loaded, SPA /explore deep-link and refresh retained, Back/Forward between /explore and /create, Explore taxonomy exact, real-mode unavailable truthful, no fabricated cards, no horizontal overflow at 599/600/899/900/1199/1200/1440, floating nav through 1199, full desktop shell at >=1200. Environment-dependent items DEFERRED: production API connectivity, production CORS, production server auth/session, server-backed uploads, real cart/notification behavior. Web Maps OPEN: Android key approved for temporary Web reuse; current build used GLENTOWN_MAPS_KEY_PLACEHOLDER; actual key must not be committed; production domain/referrer restrictions pending; Maps JavaScript API runtime verification pending.
  - ANDROID PHYSICAL ACCEPTANCE: NOT RUN.
  - Responsive desktop threshold corrected to >=1200.
  - Manifest cleanup verified.
  - Scoped changed-Dart CI format gate.
  - `.gitattributes` Dart LF policy.
  - Android R8 correction for uCrop optional OkHttp references.

### Active Workstreams

- D1.2–D1.7 App-side recovery: COMPLETE / AWAITING CONSOLIDATED SAMSUNG PHYSICAL RE-AUDIT
- Android implementation: READY TO RESUME after App + TownBoss baseline convergence.
- Web/Windows feature/completeness work: ACTIVE; the responsive micro-correction loop is intentionally parked until major Web elements are implemented.
- Final responsive/adaptive Web QA: DEFERRED; F-W2-005 remains open at 1199px, F-W2-008 requires fresh SHA-bound visual verification, and real-API visual sanity requires fresh valid evidence.
- API/data/demo/domain blockers: OPEN (see Blocker Register)
- Fresh API current-HEAD full-suite verification: OPEN
- Fresh App current-HEAD release validation: OPEN
- Auth bootstrap/logout correctness: ATTENTION / PENDING IMPLEMENTATION; Live QA observed inconsistent Home/Login routing across restart/resume. API/network unavailability must remain distinct from logout.
- Home Welcome contextual briefing refinement: APPROVED / PENDING; stable greeting, three-line contextual subtitle, and bottom-right pill CTA rules are canonical.
- Looking For + Glen AI contextual social participation: DECIDED / PLANNED / NON-BLOCKING unless promoted; includes grounded Looking For auto-help, explicit first-comment AI disclosure, Glen AI Community profile, and selective privacy-safe birthday/celebration participation.
- Meal Planner + Activity Plan: DECIDED / PLANNED / NON-BLOCKING unless promoted; includes Budget/Goal/Calendar/Recipe entry modes, evidence-backed non-prescriptive Eating Pattern information, Recipe content, Calendar projection, private Meal Check-ins/photos, Achieve linkage, Activity Plan, and professional referral.
- Trusted uninstall/reinstall restoration + biometric/fingerprint login: DEFERRED to D5.3; no current guarantee of silent reinstall restoration.

### 2026-09-25 product/UX decisions pending implementation

- **Welcome card:** Slide 1 is a context-aware personal briefing surface. Imminent scheduled activity outranks approaching personal occasion/event, which outranks upcoming holiday/event, which outranks the default subtitle. Contextual copy stays concise within the three-line budget. CTA is a high-contrast bottom-right pill: `Make Plans` for routable planning contexts, `View Calendar` for imminent scheduled activity, otherwise hidden when no truthful action exists.
- **Auth:** persisted sign-in must remain stable across ordinary lifecycle events and temporary API/network outage. Startup/resume requires an initializing state rather than routing transient null auth to Login. You -> Logout must clear local state, terminate/revoke the current session where supported, and return to Login. Uninstall/reinstall trusted restoration remains deferred to biometric/trusted-device work.
- **Looking For:** canonical user-facing demand expression; older `I Need...` / `Requests Lite` wording is superseded for normal UI. GlenTown may structure and route the need across domains behind the user-facing post.
- **Glen AI Community:** future Glen AI may selectively auto-comment on Looking For with grounded real-data suggestions, explicitly introduce itself on its first thread comment, and maintain a resident-style social profile with permanent AI/system identity. Selective birthday/celebration posts/comments are approved subject to birthday visibility, privacy and AI/social preferences; generic auto-engagement on every post is not approved.
- **Meal Planner:** Foods-owned household food orchestration with Today/Week/2 Weeks/Month planning, budget/goal/calendar/recipe entry modes, and first-class Recipe content. Eating patterns are resident-selected informational options supported by research/provenance and visible `Consult Your Doctor/Nutritionist-Dietitian` guidance; GlenTown does not prescribe or diagnose.
- **Calendar / check-ins:** accepted meal/activity plans may project source-linked entries/reminders into Calendar. Meal Check-ins may include an optional private photo, but an image is not authoritative nutrition/medical proof.
- **Achieve / Activity Plan:** Achieve owns the goal; Meal Planner and Activity Plan may support it. `Activity Plan` is broader than a workout plan and includes walking and other resident-selected intentional movement. Professional doctor/nutritionist-dietitian discovery/contact/booking should be exposed where supported by real GlenTown data/capabilities.

### Current Validation Freshness

- API recovery validation: BOUND TO `738e8ac`; not inherited by later SHAs
- App recovery validations: BOUND TO respective checkpoints; not inherited by later SHAs
- Physical/browser acceptance: NOT_RUN for current HEAD; separate requirement
- Automated tests/builds: DO NOT ESTABLISH BROWSER/DEVICE VISUAL ACCEPTANCE
- API-off device audit: PENDING_VALIDATION; Samsung API-off scenarios and hardcoded/demo/cache/empty/connection-state coverage defined but not executed (formerly GT-MOBILE-OFF-001, reclassified from visual ledger to validation tracking)

### Unresolved Blockers

See `GLENTOWN_BLOCKER_REGISTER.md` for current authoritative blocker list.
Active blockers include: CONNECTED_SEARCH, MAP_LISTINGS, DESTINATION_HERO_MEDIA, DISCOVERY_RICHNESS, COMMUNITY_MEDIA, POPULATED_DEMO_USER, MESSAGE_REQUESTS_INBOX, YOU_PROFILE_INFORMATION_ARCHITECTURE, ACCOUNT_VERIFICATION, PROVINCE_READY.

### Latest Visual-Audit Ledger

- Flutter App (persistent issue ledger): `plans/projects/glentown/apps/glentown-app/GLENTOWN_FLUTTER_APP_VISUAL_AUDIT_LEDGER.md`
- Mobile/App: Samsung physical re-audit worksheet at GlenTown-App `dd1ecf6` (`docs/audits/PHYSICAL_REAUDIT_2026-09-14.md`); 75-check session READY; no physical result claimed

### Supersession Pointer

`GLENTOWN_SUPERSESSION_REGISTER.md` records explicit overrides. Later explicit supersession overrides older decisions. Historical evidence remains as evidence but does not become current authority after supersession.

---

**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**Authoritative dashboard:** `GLENTOWN_IMPLEMENTATION_PLAN.md`

**Current Home authority:** Android Home live-QA has reached an ACCEPTED VISUAL BASELINE (FROZEN) at GlenTown-App checkpoint `73f72010d546658f08731aece5150b6ea8b77c4f`. A future explicit reopening is approved for one bounded color/image refinement pass (Welcome card background, alert style, Explore card backgrounds, Around You card gutters, and collapsed floating navigation). Deferred functional followups (GPS fallback, missing Personal Tools destinations, All Tools hub, API media, onboarding) remain explicitly unresolved.

Phase 0 governance/planning foundations are substantially established. Phase 1 App-side recovery is complete: Home/floating-navigation, Explore, Create, Chat, You/Profile, and D1.7 cross-screen/accessibility recovery have recorded automated evidence. The consolidated 75-check Samsung physical re-audit worksheet is ready at GlenTown-App `dd1ecf6`; physical verification remains pending and has not been claimed. The next mobile gate remains execution/reconciliation of that re-audit.

Home recovery evidence ends at `ff6d2e2` (369 Flutter tests, analyze clean, diff check pass). Explore recovery at `3edfb0c` records 33 focused Explore tests, 9 cross-route tests, 369 full tests, analyze clean and diff check pass. These are historical recovery checkpoints, not current release verification. Fresh API current-HEAD full suite/database verification and App current-HEAD release validation remain open.

The current API recovery checkpoint completed the canonical `phpunit.xml` suite at `738e8ac`: 1,336 tests / 4,633 assertions / 0 failures. The host wrapper cut off monolithic silent PHPUnit output, so the same configured test paths were run in bounded complete batches with terminal Laravel JSON summaries; no tests were excluded. Focused post-recovery contracts passed 26 tests / 116 assertions; Pint, changed-PHP syntax, and `git diff --check` passed. Physical verification remains pending, and an orchestrator independent source review is required before any physical-audit decision.

Create evidence is GlenTown-App `aa07d25`; Chat evidence is `f9702ed`; You/Profile evidence is `820d0cf`. D1.7 evidence is `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`: 20 focused tests and 370 full Flutter tests passed, full analyze reported no issues, and diff check passed. CROSS-A2-02 and CROSS-A2-04 are source-test verified; CROSS-A2-03 is ready for physical recheck. Existing API/data/demo/domain blockers remain authoritative. Full mobile physical audit is pending; Beta is not release ready.

The historical Create recovery checkpoint included a blanket citizen `Post a Job` restriction. That remains evidence of the earlier implementation, but current product authority supersedes it: GlenTown now supports both household/personal hiring and business/organization hiring with separate eligibility/compliance flows. App/API behavior must be reconciled before release.

## Web/Windows visual-audit stream — active

Web/Windows is a distinct audit/implementation stream from Samsung/mobile recovery. Approved desktop visual and interaction decisions are canonicalized in `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md` and `GLENTOWN_DECISIONS_AND_RULES.md`.

Current approved direction includes: persistent left sidebar + topbar shell; four primary navigation authorities Home/Explore/Create/Chat with visible desktop submenus; exact Explore primary taxonomy Products/Foods/Services/Tourism/Jobs/Events/Properties/Suppliers/Directory; precise Web/Windows geographic type labels; location-contextual full Map; topbar order Location context | Map | Universal Search | Notifications | Calendar | Cart; no Web/Windows mobile onboarding or Auth Landing; landscape desktop auth imagery; clean non-hash Web paths; branded customer-safe error states; deliberate hover/focus/cursor/keyboard behavior; and latest-avatar propagation on desktop identity surfaces.

A cross-screen desktop grid rule is approved: whenever a contextual right rail is present, it uses the same standard width and gutter across Home, Explore, Create, Chat, owner You/Profile, public Profile and future desktop surfaces that adopt this pattern. The main workspace uses the remaining bounded width. Pages do not add filler merely to occupy the rail.

Home visual direction is strongly approved at the framing level: **Navigation | Resident/Town Operating Surface | Community**. The resident column uses a taller practical landscape Town hero, planner/orchestration actions, and contextual resident modules. Duplicate Explore-category cards on Home are removed. Quick Community Composer stays with the Community feed in a dedicated bounded column. Community tabs are For You/Following/Local/Events/Announcements/Looking For/Alerts/Polls. Ordinary posts remain vertically composed and preserve source/intended media ratios rather than being forced into landscape rectangles.

The top-level Explore destination has a strongly approved desktop visual baseline and remains a real page rather than a category redirect. Its flow is **location → discovery → authoritative categories → curated content → geographic exploration**, with location-aware hero, nine category entry cards, Featured in [location], and Explore by Location. Places, Professionals, Editor's Pick and other established suggestion concepts retain their existing roles; this work does not change the primary Explore taxonomy.

The top-level Create destination has an approved/acceptable desktop baseline. Its hero keeps the large landscape image and left-side Create hierarchy; the right contextual card is smaller, right-aligned and more translucent, with the generated quote removed. Product/Service/Food/Job entry cards remain visually active when the intended behavior is to continue into setup or compliance guidance. Product defaults to Pre-Loved for citizens with progressive commercial formalization; Services and Food allow legitimate individual livelihood entry with progressive compliance guidance; Jobs supports household/personal and business/organization hiring.

Chat is structurally approved, with only minor spacing, gap and corner-radius polish open at the concept level. Its internal navigation includes **Chats, Contacts and Chatrooms**. Conversations may expose contextual Book, Order, Reserve, Request Quote, Add to Cart and similar actions, while the relevant GlenTown domain remains authoritative for transaction state. Structured transaction/status cards may return to the conversation. A future optional organization feature may enable Glen AI to answer inquiries using organization-approved knowledge and permitted native actions, with clear AI disclosure, organization controls and human handoff.

The owner You/Profile desktop concept is strongly approved subject to the shared grid. Tabs are **Overview, Timeline, Activity, Details, Posts, Saved, Followers, Following**. Timeline is chronological personal history; Activity represents cross-GlenTown actions/interactions; Posts contains owned/published Community posts; Details contains profile/about information. Owner mode may expose Your Orders, Your Calendar, Your Places, Job Seeker Profile, App & Account Settings, Trust & Verification, Achieve/goals and other capability-truthful personal tools.

Public Profile uses the **same profile architecture and size structure** as owner You/Profile. Its cover/header is bounded to the standard main-column width rather than spanning across the right rail, and the standard contextual rail begins at the top alongside it. Visitor mode substitutes appropriate public actions such as Follow, Message and reporting/overflow actions for owner-management actions, subject to visibility and capability rules. The two modes are one profile architecture with viewer-context differences, not separate visual systems.

These approvals are **design/product authority only**. They do not constitute implementation, automated verification, browser verification, Windows verification or physical PASS evidence. Future implementation must be reviewed against the canonical written authority before operator visual recheck.
