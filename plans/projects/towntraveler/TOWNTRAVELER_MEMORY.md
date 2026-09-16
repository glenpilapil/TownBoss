# TownTraveler Project Memory

**Status:** CANONICAL / LIVING DOCUMENT

This file records material TownTraveler development history, decisions, verification, blockers, lessons, checkpoints and handoffs.

## Initial memory

### 2026-09-13 — TownBoss project-governance baseline adopted
**Type:** DECISION / IMPLEMENTATION  
**Status:** CURRENT

TownTraveler now inherits the TownBoss Development Rules and Project Governance Standard. Its implementation plan is the operator dashboard. Substantial work must perform planning-document review, execution re-checks, final documentation review and a Documentation Compliance Receipt.

### 2026-09-16 — TownTraveler designated TownBoss Sites Pilot #1
**Type:** PRODUCT / ARCHITECTURE DECISION  
**Status:** CURRENT

TownTraveler is the first reference implementation/proving consumer of `TOWNBOSS_SITES_PLATFORM`. Generic site/page/theme/block/publishing concerns should be supplied through TownBoss Sites where proven, while destinations, tourism discovery, experiences, accommodation, tourism-context food/events, travel search semantics and Trip Planner presentation remain TownTraveler vertical concerns unless later evidence changes a boundary.

The pilot must not weaken TownTraveler's web-first, guest-first, SEO/shareability/performance requirements. Website blocks that expose domain data should bind to authoritative providers rather than duplicate business data. Existing/working vertical behavior must not be rewritten solely for abstraction purity; use extract-now, contract-now, extract-later and keep-vertical decisions.

### Current handoff
TownTraveler remains greenfield. Immediate focus is still Phase 0 authoritative ownership, GlenTown reuse boundaries, account linking and SEO taxonomy, now including validation of the minimum TownBoss Sites Core/plugin/vertical-extension boundary before public discovery implementation.
