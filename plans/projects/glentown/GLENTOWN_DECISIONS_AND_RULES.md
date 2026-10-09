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
32. **Synthetic Population / Scenario Validation is a mandatory pre-Beta gate.** Follow `GLENTOWN_SYNTHETIC_POPULATION_PRE_BETA_GATE.md`. Puerto Princesa is the first calibration environment, not the geographic ceiling. MiroFish + OASIS is the initial candidate stack but is not permanent architecture; it must be audited and benchmarked before use. Synthetic agents may be weighted to represent larger populations, and nationally representative runs may use tens or hundreds of thousands of calibrated agents when practical. Raw scale does not outrank calibration quality. Synthetic output may create hypotheses, risks, experiments and mitigation work, but must never be represented as proof of real user behavior, usability, demand, conversion, retention, trust, or product-market fit. Material findings must be dispositioned before gate PASS, and post-Beta observed evidence must recalibrate or invalidate simulation assumptions.

33. **Explore mobile category hierarchy reuse is selective, not universal.** For the user-approved Properties, Jobs, and Events mobile category directions, reuse the GlenTown topbar/location/search/shortcut/Welcome-ratio sponsored banner/normalized scrolling-pill conventions, global reduced-radius tokens, eyebrow typography, and current navigation/guest/data-truthfulness authority; do not copy identical discovery sections or listing-card anatomy across domains. Properties is inventory/image+bottom-scrim driven; Jobs is compact/text-first; Events is date-first/image-led with an in-image date badge and calendar-first alternative view. See the separate app-local detailed specifications and the acceptance boundaries below.

34. **Services mobile discovery design is now user-approved**, including one unified Explore > Services landing screen and two approved service card compositions. The same global UI hierarchy remains selective, with service-specific availability, delivery method, lawful individual-provider access and accurate booking-mode gates. See the detailed app-local Services UX specification; no service availability, provider trust, pricing, or booking flow may be presented as verified solely from mock/default data.

## Explore Mobile Category Design Authority (2026-10-09)

**Product decision:** The user accepted the conceptual **Explore > Properties**, **Explore > Jobs**, and **Explore > Events** mobile screen directions. This is **DESIGN CONCEPT APPROVED**, **NOT IMPLEMENTED**, and **NOT PHYSICAL_DEVICE_APPROVED**. The category designs must be implemented through separate bounded, source-of-truth-gated tasks. This decision does not mandate adopting these layouts for all other Explore categories or override independent Web/Windows visual authority.

**Shared visual contract:** Category-specific Back/title/Filters/create-or-submit topbar (no invented ellipsis); full-width resolved Town/Province/National selector; category search; four meaningful quick shortcuts; sponsored banner using actual existing Home Welcome-card aspect-ratio authority (never assumed 16:9); relevant Highlights section; normalized single-row horizontally scrollable primary category pills; existing global reduced corner-radius, spacing, Lucide and eyebrow tokens; honest count/sort/facets, auth and data state; no duplicate shell navigation.

**Properties:** Buy / Rent / Rush / Projects; Popular Locations; All, Residential, Commercial, Industrial, Agricultural; conditional Property Type; Map View. Listing cards use title/Heart, location, genuine featured media with transaction badge **inside upper-left**, distinct owner trust badge, transparent-to-black bottom image scrim, single width-measured complete-feature row (**no fixed three-feature cap**), left-aligned price plus global eyebrow and right-aligned **icon-only, stable-state Compare**; two-line excerpt and View Property. Rush and pricing require authoritative eligibility/expiry.

**Jobs:** Full-Time / Part-Time / Remote / Internships; Hiring Highlights (New Openings / Nearby Work / Household Jobs); normalized job sector pills; conditional Job Role; compact text-first card, real employer/household attribution, employment/work-mode chips, accurately structured pay using global eyebrow, two-line summary, Save/Heart and **View Job** before application. Job posts by citizens/households remain legitimately accessible according to project rules 24–25; do not force false business identity. Model opportunity/arrangement/work-mode facets independently.

**Events:** Today / Weekend / Free / Online; Upcoming Highlights; event-category scrolling pills; **When: Upcoming** date selector visible even with All; **Calendar View** as primary list alternative. Cards use title/Heart, genuine public organizer, date badge **inside featured image upper-left**, poster-safe image treatment, schedule/venue/admission below image with global eyebrow, two-line summary and **View Event**. Multi-day/timezone overlap, public visibility, cancellation, organizer attribution and Calendar/List parity are required. **Free admission, RSVP and ticket purchase must not be inferred from missing API data**; gate unsupported features truthfully. **Create Event and Event Planner are distinct**; planner cannot silently publish/cancel or book.

**Services (approved 2026-10-09):** Mobile Services uses Back/Services/Filters/Create Service, full-width resolved Town/Province/National selector, Search services/providers/skills, four shortcuts **Available Today / Home Visits / At Provider / Online**, sponsored local service banner at the real Home Welcome-card aspect ratio, **Explore by Need** with illustrative Home Repairs / Beauty & Care / Professional Help tiles, normalized horizontal service-category pills, **Map View** only with verified and privacy-safe geographic data, **Availability: Any Time** always accessible and **Service Type: All** conditionally when meaningful backed child types exist. One **mixed Service Listings feed** contains two approved variants: (1) **Compact Service Card** with substantial square thumbnail beside delivery/locality/description, (2) **Visual Service Card** with large genuine portfolio media followed by delivery/locality/description; neither copies Property price/scrim overlay. Both show real title/provider, independent Save, truthful **STARTING AT** amount and unit eyebrow, separately backed availability or **By Request**, and full-width **View Service**. Layout selection follows actual informational value of permitted media, not rigidly enforced categories. Exact provider reputation/verification, professional licensure, published rates, availability and booking are backend-authoritative; Open Now ≠ Available Now ≠ Next Available. Individual livelihood Services remain eligible for progressive lawful setup, not a false business identity. Detailed bookings/inquiries follow the existing Service Booking/Availability/Appointment UX architecture and actual configured mode, never universal Book Now.


**Detailed app-local design specifications** (GlenTown-App documentation review branch `docs/properties-mobile-ui-authority-20261009`, draft PR #33):
- `docs/PROPERTIES_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md`
- `docs/JOBS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md`
- `docs/EVENTS_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md`
- `docs/SERVICES_MOBILE_DISCOVERY_UX_SPECIFICATION_2026-10-09.md`

The four design docs include responsive/component rules, screen hierarchies, UX decisions, domain/capability truthfulness, edge cases, acceptance criteria, tests, proposed implementation sequencing and explicitly unresolved items. Those app documents are the detailed handoff but not proof of code, functional validation or physical QA. Before implementation, verify the current accepted Welcome-card ratio, pills/tokens, actual App/API branch contracts, privacy/eligibility and TownBoss UX evidence lifecycle. Their GitHub review/merge status must be verified independently.

## Supersession authority

`GLENTOWN_SUPERSESSION_REGISTER.md` is the canonical project-specific record of
replaced product and documentation decisions. It preserves historical evidence
without overriding the TownBoss master plan, the current implementation plan,
or later explicit GlenTown authority.

## Documentation rule

Substantial work must consult the implementation plan, app-specific plans, relevant TownBoss governance, Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Risk Register, Memory, Current State, applicable architecture/decision documents, `GLENTOWN_SYNTHETIC_POPULATION_PRE_BETA_GATE.md` for pre-Beta simulation work, `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md` for Web/Windows work, and repository-local instructions before action and before final reporting.

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
