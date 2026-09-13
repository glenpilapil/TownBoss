# GeoPlotter Documentation Compliance Protocol

**Status:** CANONICAL

## Core rule
Substantial GeoPlotter development must verify documentation compliance at three stages: Planning Gate, Execution Re-check Gate and Final Review Gate.

## 1. Planning Gate
Before substantial work, identify and read the relevant set:
- `governance/DEVELOPMENT_RULES.md`
- `governance/PROJECT_GOVERNANCE_STANDARD.md`
- `GEOPLOTTER_IMPLEMENTATION_PLAN.md`
- `GEOPLOTTER_CURRENT_STATE.md`
- `GEOPLOTTER_GOVERNANCE.md`
- `GEOPLOTTER_ARCHITECTURE.md`
- `GEOPLOTTER_DECISIONS_AND_RULES.md`
- `GEOPLOTTER_ACCEPTANCE_CRITERIA.md`
- `GEOPLOTTER_MEMORY.md`
- relevant capability/domain/validation/risk/integration docs
- repository-local instructions, ADRs, README and task-specific specifications

Record the documents consulted. When relying on a local TownBoss clone, verify repository identity, branch/HEAD and freshness.

## 2. Execution Re-check Gate
Re-check governing docs when any material trigger occurs:
- task scope changes;
- architecture assumptions change;
- a dependency/upstream component is introduced;
- spatial authority, CRS/SRID or geospatial-accuracy assumptions change;
- a new external/government data source is introduced;
- authorization, tenancy, privacy, money/pricing or public-exposure boundaries change;
- legal/professional-practice uncertainty appears;
- acceptance criteria become ambiguous;
- implementation conflicts with documentation;
- recovery after interruption changes execution strategy;
- a task becomes blocked/attention-required;
- a worker proposes out-of-contract work.

Do not wait until final reporting to discover a governing conflict.

## 3. Final Review Gate
Before `DONE`, `VERIFIED`, checkpoint approval or final report, re-read the documents governing scope, architecture, decisions, acceptance, validation, authority/risk, documentation and Memory. Compare actual output against current documents, not only the original worker plan.

Verify:
1. scope stayed bounded;
2. domain authority was not duplicated;
3. architecture/decisions were followed or approved deviations recorded;
4. acceptance evidence matches the completion claim;
5. temporary limitations/deferrals are explicit;
6. canonical docs and Memory reflect material new truth.

## 4. Documentation Compliance Receipt
Every substantial final report must include:
- Planning documents consulted
- Execution-stage documents re-checked and trigger
- Final-review documents consulted
- Conflicts/ambiguities found
- Resolution
- Approved exceptions
- Canonical documents updated
- Memory update performed
- Compliance result: `PASS | PASS_WITH_APPROVED_EXCEPTION | FAIL`

A `FAIL` cannot be promoted to VERIFIED.

## 5. Conflict handling
When documents disagree: identify exact conflict, apply TownBoss authority hierarchy, consider recency/explicit supersession, do not silently choose convenience, request a decision if authority remains unresolved, update affected canonical docs, and record material resolution in Memory.

## 6. Retrieval principle
Read only what is relevant, but the read-set must cover scope, architecture, authority, validation and historical constraints. Compliance is not measured by number of files opened.
