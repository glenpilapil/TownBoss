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

## Supersession authority

`GLENTOWN_SUPERSESSION_REGISTER.md` is the canonical project-specific record of
replaced product and documentation decisions. It preserves historical evidence
without overriding the TownBoss master plan, the current implementation plan,
or later explicit GlenTown authority.

## Documentation rule

Substantial work must consult the implementation plan, app-specific plans, relevant TownBoss governance, Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Risk Register, Memory, Current State, applicable architecture/decision documents, `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md` for Web/Windows work, and repository-local instructions before action and before final reporting.
