# Active Repository Reconciliation — 2026-09-12

**Scope:** Evidence-backed reconciliation for active TownBoss development repositories.

## Canonical repositories and current default refs

| Project | Repository | Default branch | Current default HEAD | Current evidence result |
|---|---|---|---|---|
| GlenTown Flutter | `glenpilapil/GlenTown-App` | `main` | `9ff2443` | Real-API Trip/Event/Financial work on canonical branch; fresh test receipt pending |
| GlenTown API | `glenpilapil/GlenTown-API` | `master` | `5d9f812` | Organization/community work canonical; Messaging exists later but is not on current default branch |
| CodeBisor | `glenpilapil/CodeBisor` | `master` | `a1a1d29` | Provider-routing/canary foundations canonical; required `test` branch check configured, fresh visible receipt pending |
| GeoPlotter | `glenpilapil/GeoPlotter-Real-Estate` | `main` | `bde5a05` | `main` through PASS 0B; remote PASS 0C branch exists; reported PASS 0I still absent remotely |
| TownBoss | `glenpilapil/TownBoss` | `main` | active | Canonical architecture/planning authority |

RealWise, TownTraveler and Forex Quant Lab have no separate installed repositories currently visible through the connected GitHub account; they remain planning/research surfaces until a repository is established or identified.

## GlenTown API reconciliation

Current canonical `master` is `5d9f812` (organization setup/actor-discovery merge). Repository history also contains Messaging implementation (`5d38926`) and a later Messaging integration commit (`c90a643`), but those commits are not ancestors of the currently exposed default-branch HEAD.

Therefore:

- organization setup/actor discovery, self-employment enrollment, community taxonomy/feed filters and advisory acknowledgements are canonical-default-branch implementation evidence;
- Messaging is **IMPLEMENTED IN REPOSITORY HISTORY / DEFAULT-BRANCH INTEGRATION PENDING**;
- the previous statement that Messaging was merged into current API `master` was incorrect and has been corrected in the GlenTown implementation plan.

No current default-HEAD status checks or PR-triggered workflow receipts were exposed by the connected GitHub lookup. Historical Laravel pass counts remain historical evidence only. Fresh full-suite execution against the canonical release candidate is required.

## GlenTown Flutter reconciliation

Current canonical `main` is `9ff2443`, the Financial Planner real-API merge. Canonical history confirms:

- Trip Planner real-API integration — PR #15 (`e83c961`);
- Event planning/discovery real-API integration — PR #16 (`fa15502`);
- Financial Planner real-API integration — PR #17 (`9ff2443`).

The earlier 369/369 test + zero-analyzer-issues checkpoint predates these later integrations. Fresh current-HEAD analyzer/tests remain required. Physical-device onboarding/auth corrections discussed after September 4 are not evidenced on current `main` and must be reconciled before promotion to IMPLEMENTED.

## CodeBisor reconciliation

Current canonical `master` is `a1a1d29`. Repository history confirms:

- capability-aware provider routing;
- provider identity binding before live worker launch;
- provider-specific autonomous resource budgets;
- deterministic provider failure normalization/deferral;
- Codex/Gemini/Cline/Kilo adapter identity binding;
- bounded GeoPlotter onboarding canary work.

`master` is configured with a required `test` status check. However, the connected status/workflow lookup exposes no fresh receipt for current HEAD, so CodeBisor remains IMPLEMENTED with fresh full-suite/runtime verification pending.

## GeoPlotter reconciliation

Canonical `main` remains `bde5a05`, the PASS 0B merge.

Remote branch inventory also exposes:

- `feat/pass-0b-development-foundation`;
- `feat/pass-0c-persistence-tenancy-foundation` at `47d5c1b`;
- `docs/realwise-business-foundation`.

The PASS 0C branch is therefore remotely present, but it has not been merged into `main`. Its current head includes accepted CRM/TownBoss platform-boundary documentation, so branch-name presence alone is not sufficient to claim the whole PASS 0C implementation verified.

The reported later PASS 0I checkpoint (`feat/pass-0e-projects-foundation`, `33435d3`) still does not resolve in the connected repository, and no PASS 0D–0I branches are exposed remotely.

GeoPlotter status is therefore:

- **PASS 0B — canonical/default-branch evidenced**;
- **PASS 0C — remote feature branch evidenced, merge/test completeness pending reconciliation**;
- **PASS 0D–0I — reported local implementation, remote provenance pending**.

## Immediate execution gates

1. Integrate/reconcile GlenTown Messaging lineage with canonical API branch before Beta release claims.
2. Run fresh GlenTown API full suite on canonical release candidate.
3. Run fresh GlenTown Flutter analyzer/test suite on canonical release candidate.
4. Reconcile post-September-4 Flutter onboarding/auth work with `main`.
5. Obtain fresh CodeBisor required-test/full-suite/runtime evidence.
6. Push or otherwise establish canonical remote provenance for GeoPlotter PASS 0D–0I and bind tests/migrations to those refs.
7. Reconcile PASS 0C branch completeness and intended merge path.

## Status rule

Conversation notes and agent reports may establish `DECIDED`, `PLANNED`, or reported implementation context. Repository history establishes implementation existence. Default-branch ancestry establishes canonical integration. `VERIFIED` requires fresh test/build/runtime evidence tied to a concrete canonical ref or release candidate.
