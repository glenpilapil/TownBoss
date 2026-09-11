# Active Repository Reconciliation — 2026-09-12

**Scope:** First evidence-backed reconciliation pass for active TownBoss development repositories.

## Repositories identified

| Project | Canonical repository located | Default branch | Reconciliation result |
|---|---|---|---|
| GlenTown Flutter | `glenpilapil/GlenTown-App` | `main` | Reconciled |
| GlenTown API | `glenpilapil/GlenTown-API` | `master` | Reconciled |
| CodeBisor | `glenpilapil/CodeBisor` | `master` | Reconciled |
| GeoPlotter | `glenpilapil/GeoPlotter-Real-Estate` | `main` | Reconciled with remote/local evidence discrepancy |
| TownBoss planning/architecture | `glenpilapil/TownBoss` | `main` | Canonical planning authority |
| RealWise | No installed repository found under the current connected GitHub account | — | Planning-only until repository is established/identified |
| TownTraveler | No installed repository found under the current connected GitHub account | — | Planning-only until repository is established/identified |
| Forex Quant Lab | No installed repository found under the current connected GitHub account | — | Research/planning-only until repository is established/identified |

## GlenTown findings

### API
Repository evidence confirms implementation beyond the earlier masterplan baseline, including:

- merged messaging backend foundation (`c90a643`, building on `5d38926`);
- messaging participant/mute/idempotency contract work;
- organization setup and actor-discovery contracts;
- bounded self-employment enrollment;
- community taxonomy and viewer-scoped feed filters;
- versioned Community Advisory acknowledgement APIs.

Historical Laravel test counts remain useful evidence but are not current-HEAD verification. A fresh full suite remains required.

### Flutter
Repository evidence confirms:

- Trip Planner real-API integration merged by PR #15 (`e83c961`);
- Event planning/discovery real-API integration merged by PR #16 (`fa15502`);
- Financial Planner real-API integration merged by PR #17 (`9ff2443`).

Therefore these capabilities were reclassified from generic approved/planned direction to implemented-with-current-verification-pending.

## CodeBisor findings

Recent repository history confirms implemented foundations for:

- capability-aware provider routing;
- provider identity binding before worker launch;
- provider-specific autonomous resource budgets;
- deterministic provider failure normalization/deferral;
- routed adapter identity for Codex, Gemini, Cline and Kilo;
- bounded GeoPlotter onboarding canary behavior.

The masterplan parser/ingestion layer remains a planned next step and is now explicitly linked to the TownBoss planning corpus.

## GeoPlotter findings

The canonical connected GitHub repository currently exposes `main` through PASS 0B (`bde5a05`) with executable development foundations, local infrastructure, Python geospatial-service scaffold, health test and baseline CI.

A later PASS 0I checkpoint was reported from local development as branch `feat/pass-0e-projects-foundation`, commit `33435d3`, but the connected GitHub repository does not resolve that commit and branch discovery does not expose the reported later branch.

The masterplan therefore distinguishes:

- remote-GitHub-evidenced implementation through PASS 0B; and
- reported local implementation through PASS 0I pending synchronization/reconciliation.

This discrepancy is a development-governance issue, not a reason to discard the PASS 0I work. The next GeoPlotter gate is to establish the canonical remote ref for the later passes and bind test/migration evidence to it.

## Immediate next reconciliation sequence

1. Fresh GlenTown API full-suite evidence at current HEAD.
2. Fresh GlenTown Flutter analyzer/test evidence at current HEAD.
3. GeoPlotter remote synchronization and PASS 0C–0I reconciliation.
4. Current CodeBisor full-suite and persistence/runtime evidence.
5. Repository establishment/identification decisions for RealWise, TownTraveler and Forex Quant Lab when implementation begins.

## Status rule

Conversation notes and agent reports may establish `DECIDED`, `PLANNED`, or reported implementation context. Canonical repository evidence establishes implementation existence. Fresh tests/build/runtime evidence tied to a concrete ref are required for `VERIFIED` release claims.
