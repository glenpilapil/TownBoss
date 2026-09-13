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

### Current handoff
Cline is implementing PASS 0L. Required completion is a real backend spatial projection + authenticated project map API + MapLibre frontend + interactive lot selection; a frontend-only mocked implementation is insufficient. After PASS 0L acceptance, current orchestration priority is PASS 0M parcel/technical-description plotting unless new evidence changes dependencies. Canonical/default-branch reconciliation remains a separate portfolio gate.
