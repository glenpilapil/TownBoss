# GlenTown Supersession Register

**Status:** CANONICAL / PROJECT-SPECIFIC

This register records replaced GlenTown decisions without rewriting their
historical evidence. It is read with `GLENTOWN_DECISIONS_AND_RULES.md`, the
GlenTown Implementation Plan, and applicable TownBoss portfolio governance.
Later explicit authority prevails.

| Historical decision | Superseding decision | Current authority | Implementation impact |
| --- | --- | --- | --- |
| Visible navigation label `Messages` | Visible label is `Chat`; `/messages`, `MessagesScreen`, and messaging internals remain technical names. | `GLENTOWN_DECISIONS_AND_RULES.md` rules 19 and 27; `GLENTOWN_WEB_WINDOWS_CHAT_PROFILE_AUTHORITY.md`. | Do not rename technical identifiers only to change customer-facing copy. |
| Oversized/special Create FAB, notch, or cradle | Create is a regular peer primary destination. | `GLENTOWN_DECISIONS_AND_RULES.md` rules 19 and 21; `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`. | Do not restore a center FAB, logo button, notch, or cradle. |
| Original primary intent grid: Shopping / Food & Dining / Services / Travel & Tours / Events & Fairs / Jobs & Careers / Properties / Suppliers / Community | The intermediate Places/Professionals recovery taxonomy replaced the original grid, and was itself superseded by Products / Foods / Services / Tourism / Jobs / Events / Properties / Suppliers / Directory. | `GLENTOWN_DECISIONS_AND_RULES.md` rule 16; `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`; `GLENTOWN_CURRENT_STATE.md`. | Preserve historical grids only when marked `HISTORICAL` or `SUPERSEDED`; Places and Professionals remain valid non-primary concepts. |
| Puerto-Princesa-only product framing | Puerto Princesa is the deepest operational concentration/pilot; nationwide signup, pre-Beta seeding, staged activation, and location-specific capability depth may coexist. | `GLENTOWN_DECISIONS_AND_RULES.md` rule 1; `GLENTOWN_IMPLEMENTATION_PLAN.md`; `plans/TOWNBOSS_MASTER_DEVELOPMENT_PLAN.md`. | Keep pilot density, account access, seeded readiness, capability availability, and commercial activation distinct. |
| Consumer-facing City/Municipality wording | Use `Town` in shared consumer UI; retain City/Municipality in precise official, API, model, analytics, legal, and admin contexts. | App-specific accepted authority: GlenTown-App `59a1fd5`, `docs/ARCHITECTURE_BASELINE_1_0.md`; Web/Windows retains precise geographic type labels. | Do not weaken geographic domain semantics or replace precise terms where required. |

## App-specific accepted authority / canonical promotion pending

These entries are accepted App authority, not a silent promotion to portfolio
or project-wide UI authority. They require an explicit later TownBoss decision
to change that level.

| Topic | App-specific accepted authority | Current handling |
| --- | --- | --- |
| Create long-press AI entry | GlenTown-App `59a1fd5`, `docs/UI_AUTHORITY_RECOVERY.md` and `docs/UI_REGRESSION_RECOVERY_LEDGER.md` reserve long-press on the You avatar for Ask Glen once a real surface exists. TownBoss Master Development Plan section 4.2 decides Glen AI / Ask Glen generally, but does not establish this gesture. | Do not treat the Create gesture replacement as portfolio canonical; preserve it as App-specific accepted authority pending promotion. |
| Offline GlenTown and Beta persistent-content cache | GlenTown-App `59a1fd5`, `docs/ARCHITECTURE_BASELINE_1_0.md`, `docs/FRONTEND_ARCHITECTURE.md`, and `docs/UI_REGRESSION_RECOVERY_LEDGER.md` classify Offline GlenTown as `DECIDED` roadmap direction, Beta persistent-content caching as `PLANNED`, and full offline-first synchronization as `DEFERRED` / not implemented. | No storage-engine decision is established. Do not select or imply encrypted SQLite, Drift, Hive, or Isar without a separate approved architecture decision. |
