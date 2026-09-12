# Active Repository Reconciliation — 2026-09-12

**Scope:** Evidence-backed reconciliation for active TownBoss development repositories.

## Canonical repositories and current default refs

| Project | Repository | Default branch | Current default HEAD | Current evidence result |
|---|---|---|---|---|
| GlenTown Flutter | `glenpilapil/GlenTown-App` | `main` | `9ff2443` | Real-API Trip/Event/Financial work canonical; fresh analyzer/test receipt pending |
| GlenTown API | `glenpilapil/GlenTown-API` | `master` | `5d9f812` | Messaging and organization/community work canonical; fresh full-suite receipt pending |
| CodeBisor | `glenpilapil/CodeBisor` | `master` | `a1a1d29` | Provider-routing/canary foundations canonical; required `test` branch check configured, fresh visible receipt pending |
| GeoPlotter | `glenpilapil/GeoPlotter-Real-Estate` | `main` | `bde5a05` | `main` through PASS 0B; remote PASS 0C branch exists; reported PASS 0I still absent remotely |
| TownBoss | `glenpilapil/TownBoss` | `main` | active | Canonical architecture/planning authority |

RealWise, TownTraveler and Forex Quant Lab have no separate installed repositories currently visible through the connected GitHub account; they remain planning/research surfaces until a repository is established or identified.

## GlenTown API reconciliation

Current canonical `master` is `5d9f812` (organization setup/actor-discovery merge).

Explicit Git ancestry checks establish that the Messaging implementation is already part of canonical `master`:

- direct messaging v1 `3335da4` -> current `master`: 190 commits ahead, 0 behind;
- messaging contract alignment `fab3286` -> current `master`: 173 commits ahead, 0 behind;
- messaging backend foundation `5d38926` -> current `master`: 158 commits ahead, 0 behind;
- messaging integration `c90a643` -> current `master`: 94 commits ahead, 0 behind, with `c90a643` as the merge base.

Therefore Messaging is **IMPLEMENTED ON CANONICAL DEFAULT-BRANCH HISTORY / FRESH VERIFICATION PENDING**. The earlier statement that Messaging required default-branch integration was incorrect and is superseded by this ancestry check.

Canonical API history includes messaging routes/controllers/models/policies, group/chatroom/request expansion, participant and acting-identity support, idempotency/mute-state work, and dedicated Messaging feature/contract tests.

No current default-HEAD status check or PR-triggered workflow receipt was exposed by the connected GitHub lookup. Historical Laravel pass counts remain historical evidence only. Fresh full-suite execution against `5d9f812` or a newer canonical release candidate is required before `VERIFIED` is claimed.

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

1. Run fresh GlenTown API full suite and database verification on canonical `master` (`5d9f812` or its successor).
2. Run fresh GlenTown Flutter analyzer/test suite on canonical `main` (`9ff2443` or its successor).
3. Reconcile post-September-4 Flutter onboarding/auth work with `main`.
4. Obtain fresh CodeBisor required-test/full-suite/runtime evidence.
5. Push or otherwise establish canonical remote provenance for GeoPlotter PASS 0D–0I and bind tests/migrations to those refs.
6. Reconcile PASS 0C branch completeness and intended merge path.

## Status rule

Conversation notes and agent reports may establish `DECIDED`, `PLANNED`, or reported implementation context. Repository history establishes implementation existence. Default-branch ancestry establishes canonical integration. `VERIFIED` requires fresh test/build/runtime evidence tied to a concrete canonical ref or release candidate.
