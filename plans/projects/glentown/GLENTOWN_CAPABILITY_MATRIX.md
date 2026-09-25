# GlenTown Capability Matrix

**Status:** CANONICAL / LIVING COMPLETENESS MAP

| Capability | Critical | Current status/evidence | Next evidence |
|---|---|---|---|
| Auth/onboarding | Yes | IMPLEMENTED; `be202c5a` | Physical gate; SMTP external |
| Auth/session continuity | Yes | ATTENTION; Live QA observed inconsistent Home/Login routing across restart/resume; deterministic bootstrap and working Logout not yet accepted | Focused bootstrap/router/logout tests plus Samsung API-on/API-off lifecycle matrix; `AUTH_SESSION_BOOTSTRAP_LOGOUT_READY` |
| Home/navigation | Yes | Shared App baseline `8e17b297`; Web recovery implementation `f5267d9`; historical mobile/API evidence retained | Android physical gate; later comprehensive responsive/adaptive Web QA |
| Community/notifications | Yes | POST_SAMSUNG_AUTOMATED_VERIFIED; API `738e8ac` contracts and fixtures | Orchestrator source review and physical evidence |
| Explore/discovery | Yes | Shared App baseline `8e17b297`; F-W2-005 open/deferred at 1199px; F-W2-008 final SHA-bound visual verification deferred | Web feature completeness; comprehensive responsive/adaptive QA; API/data closure |
| Universal Search | Yes | PARTIAL: descendant-aware Town/Province/National geographic eligibility is implemented for `/api/v1/places` and shared discovery consumers; universal cross-domain search/ranking remains open | Connected cross-domain search/ranking and remaining nationwide-query evidence |
| Map | Yes | PARTIAL: legacy/full-screen UI exists; privacy-safe `GET /api/v1/map-listings` API projection implemented/tested for public-coordinate Properties/Events; Home map insertion, demo fixtures, viewport bounds, canonical category markers, additional category location contracts and Samsung verification remain open | Home map App wiring + demo map fixtures + physical gate |
| Cart/Around You | Yes | IMPLEMENTED; `c28feee` | Rich fixtures/projection/physical check |
| Create | Yes | TEST_VERIFIED recovery `aa07d25` | Samsung recheck; API persistence blockers |
| Chat | Yes | TEST_VERIFIED recovery `f9702ed`; API-backed direct/group/chatroom/search, safe errors and IME behavior | Representative fixtures, Message Requests IA decision, E2E physical journey |
| You/Profile | Yes | TEST_VERIFIED recovery `820d0cf`; intentional Profile Setup IME/CTA and truthful Trust state | IA/data/verification blockers and Samsung recheck |
| Cross-screen accessibility | Yes | APP-SIDE COMPLETE / TEST_VERIFIED at `f5e4085`; 20 focused and 370 full tests passed, analyze clean | Consolidated Samsung SafeArea, keyboard, contrast, text-scale, semantics, and responsive physical re-audit |
| Demo/data | Yes | BLOCKED_BY_DEMO_DATA | Idempotent representative fixtures |
| Nationwide readiness | Yes | PLANNED | Thresholds, rollout, samples |
| Tourism Browse Mode | Yes | DECIDED / NEXT APP PASS; persistent Browse/Plan toggle, Browse banner/search, geographic-context pills, Deals filters and context-sensitive Sort defined in `GLENTOWN_TOURISM_TRIP_PLANNER.md` | Focused App implementation + Samsung visual/interaction evidence |
| Tourism Place media | Yes | PARTIAL / PHYSICALLY DEMONSTRATED at Puerto Princesa scope; nullable authoritative `featured_media` contract renders two demo Place images while null-media Places remain text-only | Automated closeout/checkpoint evidence and broader representative fixtures |
| Tourism Plan Mode / Trip Planner | No | DECIDED / PLANNED / DEFERRED; multi-destination orchestration, Experiences, Stay/room, Food Stops, transport gaps, start/end points, vehicle rental and Free Time defined in `GLENTOWN_TOURISM_TRIP_PLANNER.md` | `TOURISM_TRIP_PLANNER_ORCHESTRATION_READY` |
| Foods Meal Planner | No | DECIDED / PLANNED; approved Foods topbar entry pending implementation; canonical process/safety contract in `GLENTOWN_MEAL_ACTIVITY_PLANNING.md` | Budget/goal/calendar/recipe flow, Recipe content, evidence-backed Eating Pattern library, Calendar integration, private check-ins, professional handoff, App/API/E2E evidence |
| Recipes / Foods content | No | DECIDED / PLANNED; first-class Recipe content with provenance and disclosed sponsorship | Recipe schema/content provenance/media and `Add to Meal Plan` evidence |
| Activity Plan | No | DECIDED / PLANNED; broad intentional-movement support under Achieve, not limited to workouts | Activity plan contract, Calendar projection, check-ins and Achieve integration evidence |
| Meal/Activity + Achieve orchestration | No | DECIDED / PLANNED; Achieve owns goal, Meal/Activity plans support it | `MEAL_ACTIVITY_PLANNING_READY` |
| Contextual Welcome briefing | No | DECIDED / PENDING REFINEMENT; stable greeting plus concise event/reminder subtitle and bottom-right pill CTA | Automated state/text-layout checks and Samsung default/holiday/event/calendar-reminder QA |
| Looking For demand matching | No | DECIDED / PLANNED; canonical customer-facing evolution of `I Need...` / `Requests Lite` | Structured cross-domain intent/matching contract and E2E demand-resolution evidence |
| Glen AI contextual social participation | No | DECIDED / PLANNED; grounded Looking For first-response, AI social profile/disclosure, selective birthday/celebration participation | App/API implementation, privacy/moderation/rate/idempotency controls, AI Authority audit, E2E gate |
| Trusted reinstall restoration + biometric login | No | DEFERRED under D5.3 | `TRUSTED_ACCOUNT_SESSION_RESTORATION_BIOMETRIC_LOGIN_READY` |

`RELEASE_READY` requires applicable automated, runtime, physical, security/compliance, data and operational evidence.
