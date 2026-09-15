# GeoPlotter Project Memory

**Status:** CANONICAL / LIVING DOCUMENT

## 2026-09-13 — Governance normalization integrated on TownBoss main

**Type:** CHECKPOINT / GOVERNANCE
**Status:** CURRENT

The GeoPlotter governance-normalization branch was integrated on canonical TownBoss `main` through merge commit `9cf2880`. The project corpus now explicitly inherits current portfolio execution, closeout, checkpoint, and reporting policies. This integration changes planning governance only; it does not promote GeoPlotter implementation or validation status.

This file is the durable development-memory ledger for GeoPlotter. Record material decisions, implementation milestones, verification, incidents, blockers, lessons, checkpoints and handoffs. Preserve superseded history rather than rewriting it.

## Initial reconciled memory

### 2026-09-13 — TownBoss project-governance baseline adopted
**Type:** DECISION / IMPLEMENTATION  
**Status:** CURRENT

GeoPlotter now inherits the TownBoss Development Rules and Project Governance Standard. Its implementation plan is the operator dashboard. Substantial work must follow planning-document review, execution re-checks, final documentation review and a Documentation Compliance Receipt.

### 2026-09-12 — Repository provenance reconciled
**Type:** VERIFICATION  
**Status:** CURRENT

The earlier implementation plan recorded PASS 0B on canonical `main`, PASS 0C on a remote feature branch, and later PASS 0D–0I as reported local implementation pending durable remote provenance and reconciliation.

### 2026-09-13 — GeoPlotter governance corpus normalized
**Type:** DOCUMENTATION / GOVERNANCE  
**Status:** CURRENT

GeoPlotter adopted the TownBoss/Code Project Supervisor structural pattern with project-specific Architecture, Domain Authority Matrix, Decisions & Rules, Acceptance Criteria, Capability Matrix, Validation Matrix, Documentation Compliance Protocol, Operational Acceptance Test, Risk Register and Integration Contracts. The Implementation Plan remains the primary operator dashboard and Current State remains the concise present-truth handoff.

### 2026-09-13 — Active implementation evidence reconciled into planning state
**Type:** IMPLEMENTATION / HANDOFF  
**Status:** CURRENT

Current orchestrator evidence records:
- PASS 0E project foundation — implemented on active lineage.
- PASS 0F PostGIS/SpatialRecord provenance foundation — implemented.
- PASS 0G horizontal inventory — implemented.
- PASS 0H vertical inventory — implemented.
- PASS 0I inventory lifecycle — implemented; checkpoint `33435d3` reported.
- PASS 0J listing/publication — accepted; implementation `da5604d`, closure `d991535`; full acceptance evidence included 130/130 tests plus clean typecheck/lint/build.
- PASS 0K buyer requirements + deterministic matching — implemented at `7ce0926` with reported green typecheck/tests/lint/build and coherent migration `0008`.
- PASS 0L interactive project + lot map — currently in progress.

These entries distinguish implementation/checkpoint evidence from default-branch integration. The connected `glenpilapil/GeoPlotter-Real-Estate` remote currently does not expose the local active branch `feat/pass-0e-projects-foundation`; canonical integration remains to be reconciled separately.

### 2026-09-13 — MapLibre and domain-authority decisions recorded
**Type:** ARCHITECTURE / DECISION  
**Status:** CURRENT

MapLibre GL JS is the approved interactive map foundation. PostGIS/SpatialRecord remains geometry authority. Inventory lifecycle remains availability authority. Listing and Publication remain distinct. BuyerRequirement owns buyer-search intent and Matching remains deterministic/explainable without commission bias or silent FX conversion. RealWise and GlenTown are consumers of explicit GeoPlotter contracts, not replacement authorities.

### 2026-09-13 — Recovery/resume discipline adopted
**Type:** PROCESS / LESSON  
**Status:** CURRENT

Repeated terminal/computer interruptions demonstrated that the repository/worktree must be treated as the durable checkpoint. Recovery prompts inspect surviving state first, preserve complete work, repair only partial/broken artifacts, avoid rerunning completed work, and resume the active bounded PASS from the first unfinished durable step.

### 2026-09-13 — Phase 5 CPS real product canary: PASS 0L accepted
**Type:** CHECKPOINT / VERIFICATION
**Status:** COMPLETED

GeoPlotter PASS 0L — Interactive project + lot map foundation was accepted as the CPS Phase 5 real product canary. The checkpoint is `d15a15dd1a242ae6955fda7b97094ddf98acf641` on branch `feat/pass-0e-projects-foundation`.

CPS supervised the complete acceptance flow: planning corpus resolution → task contract materialization → worker selection → implementation → validation → independent review → checkpoint. The worker (Kilo) implemented the missing backend map API route, fixed pre-existing test and schema defects discovered during validation, and produced 17/17 passing map HTTP boundary tests.

**Evidence**
- Backend route: `apps/web/src/app/api/projects/[projectId]/map/route.ts`
- Frontend: `apps/web/src/features/project-map/` + `apps/web/src/app/projects/[projectId]/map/page.tsx`
- Tests: `apps/web/src/__tests__/projects.map.http.test.ts` — 17/17 pass
- Migrations: `0009_pass_0l_spatial_subject_linkage.sql`, `0010_pass_0l_nullable_subject_linkage.sql`
- Checkpoint: `[P0L][D-INTERACTIVE-MAP][T-PASS-0L] feat: complete interactive project and lot map foundation`

**Defects fixed**
- Test bug: `membershipStatus.ACTIVE` (undefined) → `"active"`
- Test bug: `lot.id` (array access) → `lot[0].id`
- Schema: nullable `subject_type`/`subject_id` columns missing DEFAULT NULL
- Route: added UUID validation for invalid projectId format

**Next eligible work**
PASS 0M — parcel and technical-description plotting. Canonical/default-branch reconciliation remains a separate portfolio gate.

### Current handoff
PASS 0L is complete. After PASS 0L acceptance, current orchestration priority is PASS 0M parcel/technical-description plotting unless new evidence changes dependencies. Canonical/default-branch reconciliation remains a separate portfolio gate.

### 2026-09-14 — PASS 0L documentation closeout accepted
**Type:** CHECKPOINT / DOCUMENTATION
**Status:** COMPLETED

PASS 0L — Interactive Project + Lot Map Foundation is accepted at implementation-checkpoint level on GeoPlotter branch `feat/pass-0e-projects-foundation`, checkpoint `7b676f3305d50bab03e8ddf7b35c0460d743ea5f`.

**Validated checkpoint evidence**
- GeoPlotter worktree clean; `git diff --check` passed.
- Full tests: 176/176 across 13 test files; TypeScript passed; ESLint passed with 0 errors and 6 pre-existing warnings; Next.js production build passed with 14 routes.
- Migration coherence passed for `geoplotter` and `geoplotter_test`; the migration journal is coherent.
- The accepted MapLibre foundation includes `SpatialRecord` lot-subject linkage, tenant-safe canonical GeoJSON projection, project/lot rendering, inventory-status visualization, lot selection and selected-lot context, provenance/validation projection, and loading/empty/error handling.

PASS 0M-PREP structured/manual technical-description plotting reconnaissance is complete. Its bounded pipeline is structured traverse -> deterministic computation -> closure/validation -> candidate polygon -> review -> `SpatialRecord`/PostGIS -> PASS 0L rendering. OCR/document ingestion and extraction/review remain PASS 0N. PASS 0M has not begun; PASS 0M-A — Structured Technical-Description Plotting Contract is the next eligible implementation slice.

### 2026-09-15 — PASS 0M-A documentation closeout accepted
**Type:** CHECKPOINT / DOCUMENTATION
**Status:** COMPLETED

PASS 0M-A — Structured Technical-Description Plotting Contract is accepted at implementation-checkpoint level on GeoPlotter branch `feat/pass-0e-projects-foundation`, checkpoint `51f27e69985f1a10690847074b56176eb21572cc`.

**Validated checkpoint evidence**
- GeoPlotter repository: `D:\Projects\GeoPlotter`, branch `feat/pass-0e-projects-foundation`.
- GeoPlotter implementation checkpoint: `51f27e6`.
- GeoPlotter local SHA and remote SHA match after push.
- Focused tests: 19/19 passed in `plotting-contract.test.ts`.
- TypeScript: clean (`npx tsc --noEmit`).
- ESLint: clean on affected files.
- Next.js production build: succeeded.
- `git diff --check`: clean.
- Persistence introduced: NO.
- Schema/migration: NONE.
- Working tree: clean after checkpoint commit.

**Validated scope**
- Structured plotting input/result contract.
- Machine-readable normalized bearing (`normalizedDegrees`).
- Finite distance with explicit units (`meter` | `foot`).
- Structured reference point (`PointReference` with `coordinates`, `sourceCrs`, `crsKnown`).
- Truthful known/unknown CRS handling (`crsKnown === false || sourceCrs !== null`).
- Provenance preservation (`organizationId`, `projectId`, `subjectType`, `subjectId`, `sourceReference`).
- Structured ERROR / WARNING / REVIEW_REQUIRED findings (`PlottingFinding.severity`).
- Candidate result distinct from canonical SpatialRecord (`PlottingResult` separate type).
- User confirmation distinct from professional verification (`reviewState` transitions).
- No persistence, no plotting UI, no 0M-B work.

**Next eligible work**
PASS 0M-B — Deterministic Traverse Computation Engine. It is the next eligible implementation slice; it has NOT been started. Persistence remains PASS 0M-D.
