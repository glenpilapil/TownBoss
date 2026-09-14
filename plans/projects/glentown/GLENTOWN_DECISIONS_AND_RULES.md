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
16. **Current public Explore taxonomy labels are Products, Foods, Services, Tourism, Events, Jobs, Properties, Suppliers, Directory.** Superseded public labels `Shopping`, `Food & Dining`, and `Travel & Tours` must not be reintroduced unless a later explicit decision supersedes this rule.
17. `Achieve` is the approved public product name; do not revert public UI/marketing to `Aspirations`.
18. The Digital Town concept must not be reduced to the orchestration/planner layer. It includes connected community, discovery, commerce, trusted interactions, personal timeline/diary/memories, planning/goal execution, businesses/organizations, government/civic interoperability, and shared platform capabilities according to implementation truth.
19. **Web/Windows visual and interaction authority is canonicalized in `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`.** Desktop work must preserve the four primary navigation authorities Home/Explore/Create/Chat, the established Explore taxonomy, the location-contextual Map behavior, topbar utility order Notifications → Calendar → Cart, and the written Home/Explore/Create desktop composition rules. Generated concept images are visual references only; written authority supersedes image-generation drift.
20. **Web/Windows is not a stretched mobile surface.** It uses a persistent desktop shell, precise geographic type labels, clean Web path routing, desktop interaction states, and responsive operating surfaces. Mobile onboarding/auth visuals remain frozen; Web/Windows removes mobile onboarding and Auth Landing according to the visual authority.
21. **Create prerequisite rule:** a missing business/permit/verification prerequisite must not be represented as a permanently disabled capability when the intended product behavior is to guide the user into setup, eligibility or compliance. Product, Service, Food and Job entry points should remain discoverable and actionable when a truthful continuation path exists.
22. **Products / Pre-Loved:** citizen Product creation defaults to Pre-Loved. Repeated or commercial selling should trigger progressive seller/business setup and compliance guidance rather than retroactively making citizen Product creation business-only.
23. **Services and Food / livelihood formalization:** individuals may offer legitimate livelihood services and food where legally appropriate. GlenTown should progressively guide them toward applicable registration, permits, verification, food-safety requirements and formal business setup according to the activity and jurisdiction. Existing-business status is not a universal prerequisite merely to enter the flow.
24. **Jobs are not business-only.** GlenTown must distinguish household/personal hiring from business/organization hiring. An ordinary citizen may legitimately hire for household roles and must not be forced to create a fake business identity. Philippine domestic-work law expressly recognizes an employer as a person engaging a domestic worker and covers roles such as general househelp, yaya/nursemaid, cook and gardener. Compliance obligations remain role-specific and must be surfaced truthfully.
25. The prior blanket product rule that a citizen should not see or access `Post a Job` is **superseded**. Historical mobile implementation evidence may still prove that older behavior existed, but it is no longer current product authority and must be reconciled before release.

## Documentation rule

Substantial work must consult the implementation plan, app-specific plans, relevant TownBoss governance, Authority Matrix, Capability Matrix, Blocker Register, Validation Profiles, Risk Register, Memory, Current State, applicable architecture/decision documents, `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md` for Web/Windows work, and repository-local instructions before action and before final reporting.
