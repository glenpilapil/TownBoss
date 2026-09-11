# TownBoss Platform Implementation Plan

**Status:** DECIDED / PLANNED with governance foundations

## Mission

Provide the portfolio-level operating architecture that allows TownBoss projects to share capabilities deliberately without collapsing into one tightly coupled application.

## Existing foundations to preserve and reconcile

- Management Guidelines v2.1.
- Managing Director Guidelines — Master Summary v2.1.
- IP & Legal Validation Gate Map.
- canonical decision and operating blueprint practices.
- GeoPlotter and GlenTown integration guidelines.
- shared orchestration-engine decision.
- Glen AI direction.
- production protection and origin-control practices.

## Shared capability candidates

These are candidates for shared platform ownership; each requires a build-vs-project-owned decision before implementation:

- identity and account linking;
- organizations and roles where cross-product semantics truly align;
- orchestration engine;
- Glen AI service gateway and controlled tool access;
- notifications and messaging interoperability;
- shared geographic and reference data;
- audit and event conventions;
- feature flags and experimentation;
- observability and platform controls;
- government integration adapters;
- developer and integration standards.

## Architecture rule

A capability becomes a TownBoss shared service only when at least two products have sufficiently aligned semantics and centralization creates more value than coupling cost. Otherwise it remains project-owned behind an API or contract.

## Implementation phases

### Phase 0 — Portfolio architecture inventory
- repository and application inventory;
- domain ownership map;
- deployment and environment inventory;
- data classification;
- dependency map.

### Phase 1 — Standards
- API and event conventions;
- account and permission interoperability rules;
- logging and audit conventions;
- platform protection baseline;
- release and checkpoint evidence schema.

### Phase 2 — Shared orchestration foundation
Implement only after consumer requirements from GlenTown planners and CodeBisor are reconciled.

### Phase 3 — AI and tool gateway
Controlled Glen AI access to native product capabilities with validation, receipts, and approval gates.

### Phase 4 — Cross-product identity and integration
Account linking and shared adapters only after privacy, platform-protection, and legal architecture review.
