# Code Project Supervisor — Upstream Sync Policy

**Status:** CANONICAL / INITIAL  
**Purpose:** Govern long-term maintenance of CPS when based on Agent Orchestrator or another upstream project.

## Principle

Forking an upstream project creates a maintenance obligation. CPS must minimize unnecessary divergence and isolate TownBoss-specific extensions so upstream improvements can be adopted without repeatedly rewriting the fork.

## Repository Model

When the fork is established, maintain:

- `origin` — TownBoss/CPS fork;
- `upstream` — canonical upstream project;
- a protected default branch for CPS;
- scoped feature branches for CPS changes.

Exact branch names are implementation details, but upstream provenance must remain explicit.

## Change Placement Rules

Prefer, in order:

1. upstream configuration;
2. extension/plugin/adapter points;
3. isolated CPS modules;
4. narrow upstream patches;
5. invasive core modifications only when no sustainable alternative exists.

Every invasive upstream-core modification must document why extension/configuration was insufficient.

## Sync Cadence

Do not merge upstream continuously merely because commits exist. Review upstream at meaningful cadence and before major CPS milestones/security updates.

For each candidate update:

- review release notes/commits;
- identify security fixes;
- compare affected CPS customization zones;
- run upstream and CPS tests;
- verify worker adapters and operational acceptance paths;
- record accepted/deferred update in Memory when material.

## Version/Provenance Record

CPS must be able to state which upstream commit/tag/release it derives from and which CPS patches are applied beyond it.

## Conflict Policy

When upstream conflicts with CPS customization:

- prefer re-expressing CPS behavior through an extension point;
- do not preserve local code merely because it existed first;
- retain CPS-specific behavior only when required by canonical product/governance rules;
- record material architectural conflicts and decisions.

## Contribution-Back Policy

Generic fixes/improvements that do not expose TownBoss-specific intellectual property should be considered for upstream contribution when doing so reduces fork burden. Contribution is optional and must respect project policy/licensing.

## Exit Strategy

CPS must retain enough abstraction that it can migrate away from the upstream foundation if maintenance, licensing, security, or architecture becomes unacceptable. Critical CPS governance semantics must not exist only as undocumented patches inside upstream code.

## Adoption Audit Requirement

Before the first fork/customization pass, the Agent Orchestrator adoption audit must identify:

- upstream extension seams;
- expected CPS customization zones;
- likely merge-conflict hotspots;
- upstream test/build process;
- licensing/notice obligations;
- proposed provenance/version tracking mechanism.