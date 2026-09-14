# GlenTown Current State

**Status:** ACTIVE DEVELOPMENT / BETA READINESS RECOVERY
**Authoritative dashboard:** `GLENTOWN_IMPLEMENTATION_PLAN.md`

Phase 0 governance/planning foundations are substantially established. Phase 1 App-side recovery is complete: Home/floating-navigation, Explore, Create, Chat, You/Profile, and D1.7 cross-screen/accessibility recovery have recorded automated evidence. The consolidated 75-check Samsung physical re-audit worksheet is ready at GlenTown-App `dd1ecf6`; physical verification remains pending and has not been claimed. The next mobile gate remains execution/reconciliation of that re-audit.

Home recovery evidence ends at `ff6d2e2` (369 Flutter tests, analyze clean, diff check pass). Explore recovery at `3edfb0c` records 33 focused Explore tests, 9 cross-route tests, 369 full tests, analyze clean and diff check pass. These are historical recovery checkpoints, not current release verification. Fresh API current-HEAD full suite/database verification and App current-HEAD release validation remain open.

Create evidence is GlenTown-App `aa07d25`; Chat evidence is `f9702ed`; You/Profile evidence is `820d0cf`. D1.7 evidence is `f5e40858b6ea1d16c2b8d5a7fcd4da5af051c654`: 20 focused tests and 370 full Flutter tests passed, full analyze reported no issues, and diff check passed. CROSS-A2-02 and CROSS-A2-04 are source-test verified; CROSS-A2-03 is ready for physical recheck. Existing API/data/demo/domain blockers remain authoritative. Full mobile physical audit is pending; Beta is not release ready.

The historical Create recovery checkpoint included a blanket citizen `Post a Job` restriction. That remains evidence of the earlier implementation, but current product authority supersedes it: GlenTown now supports both household/personal hiring and business/organization hiring with separate eligibility/compliance flows. App/API behavior must be reconciled before release.

## Web/Windows visual-audit stream — active

Web/Windows is a distinct audit/implementation stream from Samsung/mobile recovery. Approved desktop visual and interaction decisions are canonicalized in `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`.

Current approved direction includes: persistent left sidebar + topbar shell; four primary navigation authorities Home/Explore/Create/Chat with visible desktop submenus; exact Explore primary taxonomy Products/Foods/Services/Tourism/Jobs/Events/Properties/Suppliers/Directory; precise Web/Windows geographic type labels; location-contextual full Map; topbar order Location context | Map | Universal Search | Notifications | Calendar | Cart; no Web/Windows mobile onboarding or Auth Landing; landscape desktop auth imagery; clean non-hash Web paths; branded customer-safe error states; deliberate hover/focus/cursor/keyboard behavior; and latest-avatar propagation on desktop identity surfaces.

Home visual direction is strongly approved at the framing level: **Navigation | Resident/Town Operating Surface | Community**. The resident column uses a taller practical landscape Town hero, planner/orchestration actions, and contextual resident modules. Duplicate Explore-category cards on Home are removed. Quick Community Composer stays with the Community feed in a dedicated bounded column. Community tabs are For You/Following/Local/Events/Announcements/Looking For/Alerts/Polls. Ordinary posts remain vertically composed and preserve source/intended media ratios rather than being forced into landscape rectangles.

The top-level Explore destination has a strongly approved desktop visual baseline and remains a real page rather than a category redirect. Its flow is **location → discovery → authoritative categories → curated content → geographic exploration**, with location-aware hero, nine category entry cards, Featured in [location], and Explore by Location. Places, Professionals, Editor's Pick and other established suggestion concepts retain their existing roles; this work does not change the primary Explore taxonomy.

The top-level Create destination now has an approved/acceptable desktop baseline with corrections recorded in the Web/Windows visual authority. Its hero keeps the large landscape image and left-side Create hierarchy; the right contextual card becomes smaller, right-aligned and more translucent, with the generated quote removed. Product/Service/Food/Job entry cards must remain visually active when the intended behavior is to continue into setup or compliance guidance.

Current Create-domain authority is: citizen Product defaults to Pre-Loved with progressive seller/business formalization for recurring/commercial selling; individuals may offer legitimate Services and Food with progressive guidance toward applicable permits, verification, food-safety and business formalization; Jobs supports household/personal hiring as well as business/organization hiring. Missing prerequisites are guidance/setup states, not automatically disabled capabilities.

These approvals are **design/product authority only**. They do not constitute implementation, automated verification, browser verification, Windows verification or physical PASS evidence. The current Flutter Web debug surface was judged not yet useful enough for continued visual audit; future implementation must be reviewed against the canonical written authority before operator visual recheck.
