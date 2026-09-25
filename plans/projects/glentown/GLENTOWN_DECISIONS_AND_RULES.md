# GlenTown Decisions and Rules

**Status:** CANONICAL / PROJECT-SPECIFIC

GlenTown inherits the TownBoss portfolio governance stack, including:

- `governance/DEVELOPMENT_RULES.md`
- `governance/PROJECT_GOVERNANCE_STANDARD.md`
- `governance/PROJECT_EXECUTION_STANDARD.md`
- `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`
- `governance/TASK_COMPLETION_COMPLIANCE_POLICY.md`
- `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`

GlenTown project-specific rules may be stricter but do not silently weaken portfolio governance.

## Binding project rules

1. **Palawan is the Day-1 supported pilot province. Puerto Princesa remains the deepest initial concentration and operational-density market.** Other Palawan towns/municipalities may be supported from Day 1 while capability depth and local supply vary by readiness. Nationwide access/registration and nationwide pre-Beta seeding remain valid rollout goals outside Palawan, with staged local depth.
2. Repository history proves implementation existence; higher verification states require fresh evidence tied to a concrete canonical ref/release candidate and applicable validation profile.
3. Messaging is already integrated in the canonical API lineage and must not be treated as absent without contrary repository evidence.
4. Client UI must not become authoritative for security, tenancy, pricing, completion, or protected state transitions.
5. Realistic seed content must use legitimate/publicly supportable sources and must preserve provenance and claimable-business semantics.
6. Government and other external integrations remain adapter-based; authoritative external systems remain authoritative. GlenTown must not imply government authority or endorsement merely because an integration is planned or approved.
7. New shared capabilities should use TownBoss shared infrastructure only when semantics genuinely align; avoid premature centralization.
8. Physical-device verification remains a release gate for critical mobile journeys.
9. UI/UX or infrastructure improvements discovered during bounded work do not silently expand scope.
10. Material work must update Memory and the implementation-plan dashboard before handoff.
11. Known blockers must be reconciled into `GLENTOWN_BLOCKER_REGISTER.md`; they must not remain only in agent reports or conversation history.
12. Capability status promotion must follow `GLENTOWN_CAPABILITY_MATRIX.md` and the applicable `GLENTOWN_VALIDATION_PROFILES.md` evidence requirements.
13. Every substantial write-capable task must include the mandatory TownBoss safe-abort/recovery protocol from `governance/PROJECT_EXECUTION_STANDARD.md`.
14. Material risk acceptance, product/UX authority supersession, destructive actions, external publication/deployment, and rule exceptions require the authority defined by the portfolio standard and `GLENTOWN_AUTHORITY_MATRIX.md`.
15. **Public product marketing should prefer `Digital Town` rather than `DTOS` / `Digital Town Operating System`.** Internal architecture may retain technical terminology where useful.
16. **Current public Explore taxonomy labels are Products, Foods, Services, Tourism, Jobs, Events, Properties, Suppliers, Directory.** `Shopping`, `Food & Dining`, `Travel & Tours`, `Places`, and `Professionals` must not be reintroduced as primary categories unless a later explicit decision supersedes this rule. Places and Professionals remain valid concepts outside the primary taxonomy.
17. `Achieve` is the approved public product name; do not revert public UI/marketing to `Aspirations`.
18. The Digital Town concept must not be reduced to the orchestration/planner layer. It includes connected community, discovery, commerce, trusted interactions, personal timeline/diary/memories, planning/goal execution, businesses/organizations, government/civic interoperability, and shared platform capabilities according to implementation truth.
19. **Web/Windows visual and interaction authority is canonicalized in `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`.** Desktop work must preserve the four primary navigation authorities Home/Explore/Create/Chat, the established Explore taxonomy, the location-contextual Map behavior, topbar utility order Notifications → Calendar → Cart, and the written Home/Explore/Create/Chat/Profile desktop composition rules. Generated concept images are visual references only; written authority supersedes image-generation drift.
20. **Web/Windows is not a stretched mobile surface.** It uses a persistent desktop shell, precise geographic type labels, clean Web path routing, desktop interaction states, and responsive operating surfaces. Mobile onboarding/auth visuals remain frozen; Web/Windows removes mobile onboarding and Auth Landing according to the visual authority.
21. **Create prerequisite rule:** a missing business/permit/verification prerequisite must not be represented as a permanently disabled capability when the intended product behavior is to guide the user into setup, eligibility or compliance. Product, Service, Food and Job entry points should remain discoverable and actionable when a truthful continuation path exists.
22. **Products / Pre-Loved:** citizen Product creation defaults to Pre-Loved. Repeated or commercial selling should trigger progressive seller/business setup and compliance guidance rather than retroactively making citizen Product creation business-only.
23. **Services and Food / livelihood formalization:** individuals may offer legitimate livelihood services and food where legally appropriate. GlenTown should progressively guide them toward applicable registration, permits, verification, food-safety requirements and formal business setup according to the activity and jurisdiction. Existing-business status is not a universal prerequisite merely to enter the flow.
24. **Jobs are not business-only.** GlenTown must distinguish household/personal hiring from business/organization hiring. An ordinary citizen may legitimately hire for household roles and must not be forced to create a fake business identity. Compliance obligations remain role-specific and must be surfaced truthfully.
25. The prior blanket product rule that a citizen should not see or access `Post a Job` is **superseded**. Historical mobile implementation evidence may still prove that older behavior existed, but it is no longer current product authority and must be reconciled before release.
26. **Desktop right-rail geometry is cross-screen authority.** Whenever Home, Explore, Create, Chat, owner You/Profile, public Profile or another desktop surface uses a contextual right rail, that rail uses the same standard width and gutter. Pages must not invent filler solely to occupy it.
27. **Chat contains Chats, Contacts and Chatrooms.** Contacts and Chatrooms are Chat-level destinations, not new primary shell navigation. Conversation UI may initiate booking, ordering, reservation, quote, cart and similar domain actions, but authoritative transaction state remains in the corresponding GlenTown domain service; structured transaction/status cards may return to the conversation.
28. **Organization Glen AI in Chat is an optional future capability.** Organizations may configure Glen AI to answer inquiries using approved organization knowledge and permitted native GlenTown actions. AI identity must be disclosed; human escalation/handoff and organization controls are required; Glen AI must not become an alternate authority for pricing, inventory, availability, payments, refunds, protected account state or other backend-authoritative operations.
29. **Owner and public Profile share one desktop architecture.** They use the same main-column/right-rail size structure and profile framework. Differences are driven by viewer permissions, privacy and context rather than separate page designs. Public mode removes private management and exposes only permitted public information/actions.
30. **Profile tabs are Overview, Timeline, Activity, Details, Posts, Saved, Followers, Following.** Timeline is the personal chronological history surface; Activity represents cross-GlenTown interactions/actions; Posts contains Community posts owned/published by the profile user; Details carries profile/about information. Visibility in public mode remains privacy/capability dependent.
31. **TownBoss/GlenTown must not add parallel supervisor/current-state documents when an existing canonical artifact already owns the responsibility.** Specifically reject creation of `GLENTOWN_SUPERVISOR_STATE.md` or equivalent unless a future explicit architecture decision supersedes this rule. `GLENTOWN_CURRENT_STATE.md` remains the orchestration entry point. Historical evidence remains in its canonical location; do not duplicate it into a new status document.
32. **Looking For is the canonical user-facing demand expression.** It supersedes `I Need...` and `Requests Lite` as customer-facing names. A resident may state what they are trying to find or accomplish without first choosing GlenTown's internal domain. GlenTown may structure and route the need across applicable domains such as Products, Foods, Services, Properties, Jobs, Tourism, Events, Directory, providers or later orchestrators. Existing request/demand records and lifecycle primitives may remain internal implementation mechanisms.
33. **Glen AI may provide grounded first-response assistance on Looking For posts.** Glen AI may interpret a Looking For post, extract relevant constraints such as need, location, date/time, budget, quantity or scope, search authoritative GlenTown data, and selectively comment with useful matches or refinement options. It must not invent providers, listings, availability, prices or other matches. If no supported match exists, it should say so and may offer to broaden or refine the search. Recommendation does not transfer transaction authority from the owning GlenTown domain.
34. **Glen AI has a GlenTown Community profile presence but must remain unmistakably AI.** Glen AI may use the same profile architecture and social affordances as resident profiles where appropriate, including profile viewing, posts, comments and replies, while carrying a permanent `Glen AI` identity plus an `AI Assistant`/system marker or equivalent. It must never present itself as an ordinary human resident. The first Glen AI comment in a thread must explicitly introduce or disclose that it is GlenTown's AI assistant; later comments may be shorter because the persistent profile/badge remains visible.
35. **Glen AI Community participation is selective, contextual and privacy-governed.** It may participate beyond Looking For when there is a clear useful or celebratory reason, including birthday or milestone greetings, but it must not auto-comment on every post or generate generic engagement merely to appear active. Birthday participation may use a resident's birthday only when the profile/privacy/AI-social settings permit that use, or when an explicit birthday post supplies the context. Glen AI must not infer or reveal a private birthday. Subject to those controls, it may comment on a birthday post or create a Glen AI birthday post on the celebrant's profile using the resident's permitted first name or display name.
36. **The Android Home Welcome card is a context-aware personal briefing surface.** The identity/daypart or same-day holiday greeting remains stable while the subtitle may surface the highest-value concise context: an imminent scheduled activity, an approaching personal occasion/event, an applicable upcoming holiday/event, or otherwise the normal default question. Contextual subtitle copy should fit within three lines under normal supported text scale and remain informative rather than truncate with ordinary ellipsis. Action CTAs use a compact high-contrast pill at the bottom-right, outside the left text column. Planning opportunities use the general label `Make Plans`; imminent scheduled activity uses `View Calendar`; a CTA is hidden when there is no truthful routable action.
37. **Authenticated-session continuity is separate from API reachability, and Logout must be explicit and authoritative.** A persisted signed-in session should survive ordinary app restart, process death, device reboot, app update, background/foreground transitions and temporary API/network failure. Bootstrap must distinguish initializing/unknown, authenticated, guest, unauthenticated, authoritative invalid/revoked state, and network/API unavailable state; initializing or connectivity failure must not be mapped to logout. The You-screen Logout action must work end to end: clear local authenticated state, revoke/terminate the current device/session server-side where supported, and return to Login. Authoritative suspension, revocation, security reset or invalid session may also terminate access. Silent trusted restoration after uninstall/reinstall is explicitly deferred to the separate biometric/trusted-session pass.
38. **Meal Planner is a household food-orchestration capability, not a medical nutrition authority.** It may plan around resident-selected budgets, household needs, schedules, food preferences, local availability, recipes and resident-selected eating patterns. GlenTown informs and organizes; the resident chooses; qualified professionals advise where individualized medical/nutrition guidance is needed.
39. **Eating-pattern information must be evidence/provenance-backed and non-prescriptive.** GlenTown may expose common approaches such as intermittent fasting as resident-selectable informational options, but must not decide that a pattern is medically suitable for a resident. Each information surface must expose research/source links, material limitations/context, last-reviewed information, and a visible `Consult Your Doctor/Nutritionist-Dietitian` style disclaimer. Medical conditions, pregnancy, medication use or other health-sensitive context must not be converted into AI diagnosis or individualized prescription.
40. **Recipes are a first-class Foods content type.** Recipes may be curated, local-creator, business/restaurant, Community, or brand-partner/sponsored content and may be added to Meal Planner. Sponsored/brand-partner recipes must be clearly disclosed and must not masquerade as independent Glen AI recommendations or alter health/research evidence presentation.
41. **Meal Planner is Calendar-connected and may support optional Meal Check-ins.** Accepted plans may project meals, preparation sessions and reminders into Calendar while preserving source references. Meal Check-ins may include `Take a Photo`, `Done`, `Changed Meal`, or `Skipped`; photos are private-by-default personal check-in artifacts, not authoritative proof of ingredients, portions, calories, nutrition, eating-pattern compliance or medical suitability.
42. **Achieve owns the goal; Meal Planner and Activity Plan are supporting plans.** A resident goal such as a body-weight target may invoke Meal Plan + Activity Plan + Calendar + check-ins/progress, but GlenTown must not prescribe a therapeutic diet or guarantee a health outcome. `Activity Plan` is the approved broad concept rather than `Workout Plan`, because walking, active commuting, household activity, sports, workouts and other intentional movement may all be relevant.
43. **Meal Planner safety paths should connect to real GlenTown professionals where available.** The product may route residents to eligible doctor and nutritionist-dietitian profiles, contact/message surfaces, and supported appointment/booking flows. Professional credentials, advice and appointment state remain authoritative to their owning verification/service domains; Glen AI does not become the professional.
44. **Tourism is explicitly split into persistent Browse Mode and Plan Mode.** The topbar is `Back | Tourism (Browse Mode) | Mode Toggle` or `Back | Tourism (Plan Mode) | Mode Toggle`; the former Tourism Filter icon is removed from the topbar. Browse Mode search remains ordinary Tourism search and must never implicitly start Trip Planner. Plan Mode is the explicit Trip Planner-oriented experience and is implemented in a later governed pass. The selected mode persists as a user-scoped UI preference.
45. **Tourism Browse taxonomy is geographic-context aware.** Town/City/Municipality uses `All | Places | Experiences | Stays | Deals`; Province/National/above-Town uses `All | Destinations | Experiences | Stays | Deals`. A Place must not be relabeled as a Destination to satisfy UI taxonomy. Deals exposes `All Deals | Tour Packages | Last Minute | Promos | Solo | Joiner | Private`; Solo is traveler eligibility while Joiner/Private are fulfillment/group modes and may combine with Solo.
46. **Tourism Sort is independent from discovery/deal filters.** Approved options are Recommended, Price: Highest to Lowest, Price: Lowest to Highest, and Top Rated. Price sorting appears only where authoritative comparable prices exist; Last Minute is a deal-eligibility filter, not a sort order.
47. **Trip Planning Destination is separate from the app-wide geographic browsing scope.** A resident may browse GlenTown at National scope while planning a Puerto Princesa/Palawan trip. Changing a trip destination must not silently change the global GlenTown scope.
48. **Trip Planner supports ordered multi-destination routing.** Step 0 may multi-select and order destinations; route feasibility and inter-destination transport are hard dependencies. Puerto Princesa -> El Nido may use an eligible overland connection; El Nido -> Coron is valid only when an authoritative ferry/flight/other connection fits the dates. The planner may not assume feasibility merely from geographic proximity.
49. **Trip Planner resolves inclusions before recommending add-ons.** Stay breakfast/airport-transfer inclusions, Experience pickup/drop-off/meeting-point rules, and package transport are orchestration facts. Covered meal/transport segments must not be recommended again as if uncovered.
50. **Until Riders/on-demand dispatch exists, simple trip transfers are informational Commute Options.** One-way/round-trip commute guidance may expose authoritative mode/route/terminal/duration/operating-window/indicative-fare information but must not imply GlenTown can dispatch a rider. Vehicle Rentals are a separate bookable capability when inventory exists, with minimum rental duration of 8 hours for cars and 24 hours for motorcycles.
51. **Trip Planner includes Free Time orchestration.** After hard commitments and required buffers, genuine free-time windows may receive optional cross-domain suggestions such as walking/jogging, nightlife, cafés, massage/spa, cinema/entertainment, markets/shopping, nature/sunset/stargazing, local events, or Rest/Do Nothing. Suggestions remain optional until accepted; accepted items trigger schedule/budget/transport recalculation.
52. **Home map markers use GlenTown visual language and truthful coordinates only.** The marker silhouette is the GlenTown map-pin/logo shape; the internal icon and semantic color reuse the canonical Explore category. Listing markers must come only from GlenTown content with authoritative map-safe coordinates. Geographic centroids may frame the camera but must never substitute for a listing location; default/fabricated marker fallbacks are prohibited.

## Supersession authority

`GLENTOWN_SUPERSESSION_REGISTER.md` is the canonical project-specific record of
replaced product and documentation decisions. It preserves historical evidence
without overriding the TownBoss master plan, the current implementation plan,
or later explicit GlenTown authority.

## Documentation rule

Substantial work must consult the implementation plan, app-specific plans, relevant TownBoss governance, Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Risk Register, Memory, Current State, applicable architecture/decision documents, `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md` for Web/Windows work, and repository-local instructions before action and before final reporting.

## Android Home Canonical Baseline

**Status:** ACCEPTED VISUAL BASELINE (FROZEN)

The canonical Android Home order is:
1. Welcome / Alert premium card
2. Explore
3. Around You
4. Personal Tools
5. Quick Create Community Post
6. Community feed filters
7. Community feed posts

Home Personal Tools presentation aliases:
- Achieve -> Achieve
- Financial Planner -> Finance
- Trip Planner -> Travel
- Day Planner -> Today
*(Note: These aliases are HOME-ONLY. They do not rename underlying features/routes/domain concepts.)*

Personal Tools Home action: **All Tools**

Accepted visual details include:
- Explore compact bento cards
- Products / Foods / Services / Tourism
- Tourism uses canonical beach-umbrella icon
- Around You heading is AROUND YOU
- Explore scope header and Home section actions have reconciled typography
- Compact Quick Community composer
- Intentional Community filter-to-first-post spacing
- Corrected circular You/avatar navigation treatment
- Splash tagline: Your Town, Connected.

## 2026-09-24 approved planned capability and commercial direction

Meal Planner belongs to Foods and is **APPROVED PRODUCT DIRECTION / PLANNED CAPABILITY**: household, budget and local-availability oriented; not medical nutrition authority; Glen AI may orchestrate but cannot create transaction authority. The Foods topbar entry point is currently approved pending implementation: Back | Foods | Meal Planner | Filter | Cart. Meal Planner is a Lucide-labelled action immediately before Filter, not a filter, pill, category, search mode, route, or implemented planner.

### Meal Planner / Activity Plan expanded direction

The canonical process and safety direction is now defined in `GLENTOWN_MEAL_ACTIVITY_PLANNING.md`.

Key decisions:

- Meal Planner may start from Budget, Goal, Calendar context, Recipes, or an existing plan.
- Customer planning horizons are Today, This Week, 2 Weeks, and This Month. Use `2 Weeks`, not ambiguous `Bi-weekly`, in normal UI.
- Budget planning should consider household size, meals, preparation time, ingredient reuse/leftovers, cook-vs-order balance, local availability and Calendar conflicts. Monthly planning should normally use a monthly budget envelope with rolling weekly detail.
- Eating-pattern choices are informational and resident-selected; they are not prescriptions. Research/provenance, limitations and a visible professional-consultation disclaimer are required.
- Recipes are first-class Foods content with explicit source/provenance and `Add to Meal Plan`; brand-partner/sponsored cooking content is allowed only with clear disclosure.
- Accepted meal plans integrate with Calendar. Meal Check-ins may capture optional private photos and lightweight completion state, but photos are not nutritional/medical proof.
- Achieve owns goals. Meal Planner and the approved `Activity Plan` concept may support a goal and project actions into Calendar. Activity Plan intentionally includes walking and other intentional movement beyond formal workouts.
- When individualized health guidance is appropriate, GlenTown should make real professional discovery/contact/booking paths useful instead of presenting a disclaimer-only dead end.

Commercial authority is Products 5%, Food 8%, Services 10%, Event Tickets 4%, Venue/Event-Service Reservations 8%, and individual accommodation/tours/experiences 10% or less. TownTraveler-operated packages use variable margin; delivery/courier is separate logistics with 0% marketplace commission. GlenTown Beta payment direction is context-aware Pay-At plus a licensed replaceable provider adapter (PayMongo primary; Xendit comparison/fallback). Purchased Credits and manual credit proof/top-up are deferred.

## 2026-09-25 approved Welcome, auth, Looking For, and Glen AI social direction

### Home Welcome contextual briefing

- Welcome slide CTAs use a compact filled pill at the bottom-right so contrast does not depend on the background artwork. The pill is independent of the left text-safe column and must stay clear of important character/face content.
- Slide 1 retains the normal identity/daypart greeting and same-day holiday greeting behavior. Its default subtitle remains a short "What would you like to do in your Town today?" style prompt.
- When a relevant event or holiday is approaching, Slide 1 replaces only the subtitle with a concise planning cue and uses the generic `Make Plans` pill. The occasion name belongs in the subtitle rather than in the CTA, so long names such as anniversaries do not destabilize the button.
- When the resident has an imminent scheduled activity, the subtitle becomes a concise reminder that communicates the activity and useful timing within the three-line budget, and the pill becomes `View Calendar`.
- Context priority is: imminent scheduled activity -> approaching personal occasion/event -> applicable upcoming holiday/event -> default subtitle. Privacy/visibility rules apply to every contextual source.
- Slide 2 uses the same bottom-right CTA treatment only when it has an authoritative contextual planner destination. Slide 3 uses the same treatment for its real Explore action.
- Titles and supporting copy wrap naturally; ordinary ellipsis is not the normal presentation strategy. Fixed-height accessibility limits must be handled truthfully rather than by disabling text scaling.

### Auth/session continuity and Logout

- Startup and resume routing must be deterministic. Local auth/session hydration completes before Login/Home routing makes a final decision; a transient null/uninitialized provider state is not "logged out."
- Network timeout, connection refusal, lost `adb reverse`, DNS failure, or temporary API unavailability must not erase a persisted session or silently route an otherwise signed-in resident to Login.
- Explicit Logout from You is the normal resident-controlled way to end the current session. It must clear local restoration state, revoke/terminate the current server session where supported, and prevent that same session from reappearing on restart.
- Server-authoritative invalidation such as suspension, revocation, security reset or invalid credentials may terminate the session. Connectivity failure alone may not.
- Trusted account/session restoration across uninstall/reinstall is deferred and is intentionally coupled to the future biometric/fingerprint login and trusted-device implementation under D5.3.

### Looking For and contextual Glen AI participation

- `Looking For` is the user-facing evolution of the older `I Need...` / `Requests Lite` wording. It is demand-first: the resident describes the concern or need and GlenTown interprets/routs it to relevant supply, people, listings, providers, opportunities or orchestrators.
- Glen AI may auto-comment selectively on Looking For posts when it has useful grounded help. On its first comment in a thread it explicitly introduces itself as GlenTown's AI assistant before presenting suggestions.
- Looking For assistance is grounded in real GlenTown records and permitted context. If no supported match exists, Glen AI says so rather than manufacturing one, and may offer to broaden or refine the request.
- Glen AI has a Community profile using the resident-profile framework but with permanent AI/system identity markers and disclosure. It may post, comment and reply as a system AI account; it never masquerades as a human resident.
- Glen AI may selectively participate in other Community contexts, including birthdays and celebrations. Birthday comments/posts may use a permitted first name or display name and a short wish. Birthday visibility, resident privacy and AI/social preferences govern whether the interaction is allowed.
- Glen AI must not comment on every post, reveal private dates, or generate empty engagement. Contextual social participation is intended to be useful, celebratory or otherwise clearly relevant and must remain subject to moderation, rate/duplicate controls, auditability and the TownBoss AI Authority model.
