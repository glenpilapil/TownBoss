# TownBoss Scenario + Constraint Engine Audit — 2026-09-02

**Status:** Evidence-based architectural audit
**Scope:** TownBoss platform foundation plus current default-branch code searches of GlenTown-API and GeoPlotter for first-class scenario, constraint, and orchestration implementations.

## Executive finding

TownBoss has approved architectural direction for Scenario Engine and Constraint Engine, but current product code does not yet expose a first-class reusable implementation under those concepts. The correct next step is therefore to define canonical logical contracts and interaction rules, not to extract or migrate production code.

The existing TownBoss registry already classified both capabilities as Platform Core and explicitly sequenced their design after Evidence & Provenance. Evidence & Provenance is now canonical design v1, so this design gate is unblocked.

## Repository evidence checked

### TownBoss

The Capability Registry currently records:

- Scenario Engine — Platform Core, current home `none`, status `approved-direction`;
- Constraint Engine — Platform Core, current home `none`, status `approved-direction`;
- both were marked for design after Evidence & Provenance.

The AI Authority Model already requires consequential actions to use simulation/preflight where appropriate and says evidence/provenance should accompany important AI-derived claims and decisions. It also distinguishes recommendation/drafting from execution authority.

### GlenTown-API

Default-branch code searches for `scenario`, `constraint`, `eligibility`, and `orchestration` did not identify a first-class reusable engine or domain model under those names. This does not prove that no individual business rules, validation checks, budgets, availability checks, or eligibility conditions exist elsewhere; it establishes that there is no currently evident shared engine to extract simply by renaming existing code.

### GeoPlotter

Default-branch code search for `scenario` likewise did not identify an existing reusable Scenario Engine implementation. GeoPlotter remains a strong design consumer because its planned development alternatives, site-condition choices, preservation/removal decisions, spatial constraints, terrain/hazard constraints, and future development comparison workflows require a reusable scenario/constraint abstraction.

## Why two capabilities, not one

Combining scenarios and constraints into a single engine would blur responsibilities.

Scenario Engine answers:

- What alternative are we evaluating?
- What assumptions does it use?
- What run produced the outcome?
- How does this outcome compare with alternatives?

Constraint Engine answers:

- Which rules or limits apply?
- Are they hard, soft, or advisory?
- What context was evaluated?
- Did each rule pass, fail, warn, remain unknown, or error?
- Was any permitted override authorized and recorded?

They collaborate closely but should remain independently reusable.

## Required Scenario Engine primitives

The canonical model needs:

- scenario identity, type, subject, lifecycle and lineage;
- explicit assumptions with optional evidence references;
- scenario-to-constraint bindings;
- scenario runs with method/version/input snapshot metadata;
- outcomes with units, uncertainty and supporting evidence;
- comparison records for trade-offs, ranking and explanations.

The engine must not own domain-specific scenario meaning or execution.

## Required Constraint Engine primitives

The canonical model needs:

- versioned constraint definitions;
- parameters and reusable constraint sets;
- severity classification: hard, soft, advisory;
- evaluation contexts with subject, scenario, time, location and jurisdiction references;
- deterministic evaluation result vocabulary: pass, fail, warning, unknown, not applicable, error;
- explicit explanation/reason for non-pass outcomes;
- authorized override records where the owning domain permits override.

The engine must not become the authority that authors government, professional, legal, financial, or product-domain rules.

## Critical semantic rules

### Unknown is not pass

Missing, stale, ambiguous, inaccessible, or unevaluable information must not silently satisfy a constraint.

### Constraint source is not constraint authority

A TownBoss record may encode a requirement sourced from an agency, professional, policy owner, operator or business domain. The owning source remains authoritative; Constraint Engine only represents and evaluates the rule within the bounds of available evidence and permissions.

### Passing constraints does not approve the domain action

A feasible GeoPlotter scenario is not an approved development plan. A Day Planner scenario that passes current checks does not create government eligibility. A RealWise affordability result does not approve financing. A trading scenario does not grant execution authority.

### Scenario output is not authoritative state

Scenario outcomes are hypothetical or simulated results. Even when deterministic, they remain scenario outputs until a domain process adopts a result into authoritative state.

## Evidence & Provenance dependency

Material assumptions, rule sources, effective dates, evaluation inputs, and important outputs should link to Evidence & Provenance where practical. This makes comparisons explainable and allows newer evidence to supersede stale assumptions or constraint sources without rewriting history.

## Initial design consumers

### GeoPlotter

Use the pair for development alternatives such as current site, preserve significant trees, selective removal and cleared-site options, combined with development type, architectural theme and user requirements. Constraint Engine can evaluate setbacks, easements, terrain, hazards, access, density, preservation or other available rules while Scenario Engine compares outcomes.

### GlenTown

Day Planner is the clearest consumer: alternative errand plans can be evaluated against time windows, office hours, eligibility/cooldowns, required documents, dependencies, travel cost and budget before Orchestration executes an approved plan.

Other planners can later reuse the same contracts without forcing their domain semantics into Platform Core.

## Forex boundary

Scenario Engine is broadly reusable for experiment, backtest or forward-test comparison. Constraint Engine may support explicit deterministic limits. Trading risk policy, broker execution, funded-account rules and autonomous execution authority remain outside these generic engines.

## Migration and extraction recommendation

1. Establish canonical logical contracts now.
2. Keep existing product-specific validation and planning logic where it is until a concrete integration needs adapters or shared records.
3. Do not create new standalone services, databases, packages or repositories merely because the capabilities are classified as Platform Core.
4. When first implementation work begins, select one bounded consumer and prove the contract before generalizing further.
5. Preserve evidence references, temporal semantics, explanation, deterministic result vocabulary and authority boundaries from the start.
6. Revisit physical extraction after real multi-product consumption or another approved extraction trigger.

## Outcome

**Canonical design is justified. Production extraction is not.**
