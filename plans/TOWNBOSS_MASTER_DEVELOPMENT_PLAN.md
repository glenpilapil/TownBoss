# TownBoss Master Development Plan

**Status:** CANONICAL / ACTIVE  
**Baseline date:** 2026-09-11  
**Latest repository reconciliation:** 2026-09-13  
**Purpose:** Portfolio-level development authority for TownBoss and its projects.

## 1. Authority and Scope

This plan defines what TownBoss is building, the boundaries between projects, shared platform capabilities, implementation sequencing, validation gates, deployment surfaces, and the location of project-specific implementation plans.

It does **not** replace detailed domain specifications, ADRs, repository issues, test evidence, security reviews, or legal/compliance documents. Those remain authoritative within their scope and are linked or referenced by project plans.

### Status vocabulary

- **DECIDED** — product/architecture decision approved; implementation not implied.
- **PLANNED** — implementation work defined but not completed.
- **IMPLEMENTED** — code/configuration exists; verification may still be pending.
- **VERIFIED** — implementation has passed defined automated/manual evidence gates.
- **DEPLOYED** — released to the specified environment.
- **OPERATIONAL** — deployed and actively operated with required controls.
- **BLOCKED** — cannot proceed until a named dependency is resolved.
- **DEFERRED** — intentionally outside the current execution window.

A feature must never be promoted from DECIDED/PLANNED to IMPLEMENTED or VERIFIED solely because it appears in planning documentation or conversation history.

## 2. Portfolio Development Model

TownBoss development follows this authority chain:

`TownBoss Master Development Plan -> Project Implementation Plan -> Deployable Application Plan -> Milestone/Gate -> Task -> Evidence -> Checkpoint`

Each project plan maintains:

1. AS-IS verified baseline.
2. Approved decisions not yet implemented.
3. Gap register.
4. Target architecture.
5. Phased implementation plan.
6. Validation and release gates.
7. Deployment and operations requirements.
8. Cross-project dependencies.

## 3. Portfolio Register

| Project | Current classification | Primary purpose | Plan |
|---|---|---|---|
| TownBoss Platform | DECIDED / PLANNED / partial foundations | Portfolio governance, shared capabilities and operating architecture | `projects/townboss/TOWNBOSS_PLATFORM_IMPLEMENTATION_PLAN.md` |
| GlenTown | IMPLEMENTED in substantial areas; active Beta verification | Digital Town Operating System | `projects/glentown/GLENTOWN_IMPLEMENTATION_PLAN.md` |
| Code Project Supervisor | DECIDED / FOUNDATION ADOPTION | Portfolio development supervisor and coding-agent orchestration/control plane | `projects/code-project-supervisor/README.md` |
| GeoPlotter | ACTIVE IMPLEMENTATION / remote-local reconciliation required | Geospatial real-estate/project inventory platform | `projects/geoplotter/GEOPLOTTER_IMPLEMENTATION_PLAN.md` |
| RealWise | DECIDED / PLANNED; no canonical repo currently identified | Real-estate business platform and operating model | `projects/realwise/REALWISE_IMPLEMENTATION_PLAN.md` |
| TownTraveler | DECIDED / PLANNED; no canonical repo currently identified | Web-first travel discovery/planning vertical | `projects/towntraveler/TOWNTRAVELER_IMPLEMENTATION_PLAN.md` |
| Forex Quant Lab | RESEARCH / PLANNED; no canonical repo currently identified | Controlled systematic-trading research and execution lab | `projects/forex-quant-lab/FOREX_QUANT_LAB_IMPLEMENTATION_PLAN.md` |

The prior `CodeBisor` project plan remains under `projects/codebisor/` as a legacy/reference artifact. It is not the preferred implementation foundation for Code Project Supervisor unless an explicit later decision reverses that direction.

The first active-repository reconciliation report is `reconciliation/ACTIVE_REPOSITORY_RECONCILIATION_2026-09-12.md`.

## 4. Shared TownBoss Architecture

### 4.1 Shared Orchestration Engine — DECIDED

Canonical model:

`Goal -> Tasks -> Requirements -> Dependencies -> Validation Gates -> Resources -> Schedule -> Execution -> Exceptions -> Completion`

Intended consumers include GlenTown Day Planner, Trip Planner, Event Planner, Financial Planner, Achieve, future project management, and other workflow-oriented TownBoss products.

Implementation must favor reusable orchestration primitives without forcing every product into identical UX or domain semantics.

### 4.2 Glen AI / Ask Glen — DECIDED

Glen AI has two broad responsibilities:

- open-domain conversational assistance;
- orchestration into native product experiences and controlled actions.

Agentic actions must preserve application authorization, validation, auditability, and explicit approval where required. AI is not an authorization boundary.

### 4.3 Identity and Organizations — SHARED DIRECTION

Projects should reuse identity and organization concepts where doing so is legally, operationally and technically appropriate. Cross-product SSO and account linking require an explicit architecture pass before production adoption; individual applications must not silently couple databases.

### 4.4 Government Service Interoperability — DECIDED

Government systems remain authoritative. Integrations use adapters, provenance, caching rules, failure isolation, and appropriate consent/security controls. Approved high-priority sources include DICT eGov services and SEC business-verification/data services, subject to production access, legal and security validation.

### 4.5 Security Baseline — DECIDED

Portfolio production systems require, as applicable:

- Cloudflare-proxied DNS and origin protection/private ingress;
- WAF and rate limiting;
- Zero Trust for sensitive administrative surfaces;
- application authentication and authorization;
- tenant/ownership boundaries;
- server-side validation;
- secret management;
- audit trails;
- dependency and application-security verification;
- monthly production security audit control.

Frontend code is never treated as a security boundary.

## 5. Development Governance

### 5.1 Evidence hierarchy

Preferred implementation evidence:

1. repository code/configuration;
2. automated test/analyzer/build output;
3. migrations/schema/runtime evidence;
4. deployment/runtime checks;
5. physical-device or browser visual verification where applicable;
6. checkpoint/commit/PR evidence.

### 5.2 Validation gates

Projects define their own gates, but production-facing applications should normally cover:

- requirements/design decision gate;
- architecture/security gate;
- implementation gate;
- automated verification gate;
- integration gate;
- UX/accessibility/responsive gate;
- physical-device/browser gate where relevant;
- deployment readiness gate;
- post-deployment operational verification.

### 5.3 Development-supervisor integration

Code Project Supervisor should eventually consume this hierarchy so that supervisor state can resolve project -> application -> milestone -> gate -> task -> evidence rather than relying on conversation state. Planning documents define intended work; machine/repository evidence defines implementation status.

## 6. Portfolio Sequencing

### Current priority band

### Canonical platform and public-data pointers

- **TownBoss Sites Platform:** approved reusable managed multi-tenant website/platform capability; canonical authority is `architecture/TOWNBOSS_SITES_PLATFORM.md`. TownTraveler is Pilot / Reference Implementation #1. Sites owns generic composition/platform concerns; GlenTown Biz and vertical products retain domain authority.
- **Public Data Gateway candidates:** `architecture/PUBLIC_DATA_GATEWAY.md` remains the portfolio boundary and `architecture/PUBLIC_DATA_GATEWAY_CANDIDATES.md` records approved candidates. PHIVOLCS ArcGIS REST is high-priority and DENR-BMB PAIS is approved; both are **NOT IMPLEMENTED** pending source, provenance, licensing, freshness, query, and adapter review.

1. GlenTown Beta readiness and nationwide pre-Beta seeding, with Puerto Princesa as deepest operational pilot.
2. Code Project Supervisor foundation adoption and operational development supervision.
3. GeoPlotter foundational implementation and RealWise integration requirements.
4. TownBoss canonical/shared architecture where required by active projects.

### Subsequent priority band

5. TownTraveler implementation after GlenTown has sufficient platform/revenue/operational maturity.
6. RealWise broader digital operating platform around GeoPlotter, CRM and sales operations.
7. Forex Quant Lab progression only through controlled research/simulation/validation gates.

Priority is revisable by explicit portfolio decision; it is not inferred from document order.

## 7. Cross-Project Rules

- Reuse patterns and shared services deliberately; avoid accidental distributed-monolith coupling.
- Domain ownership remains explicit.
- APIs/contracts are preferred over direct cross-project database access.
- Shared packages require ownership, versioning and compatibility rules.
- Upstream open-source projects classified as references do not become dependencies automatically.
- Licensing must be checked before code/data/model incorporation.
- Production integrations require provenance, security, legal/compliance and failure-mode review appropriate to risk.

## 8. Identity and Authority Supersession

### 8.1 Canonical project identities

| Current term | Status | Scope |
| --- | --- | --- |
| Code Project Supervisor / CPS | CURRENT_INTERNAL | Architecture, implementation, governance, internal technical references |
| Project Supervisor | CURRENT_PUBLIC_PRODUCT_NAME | Installed application, user-facing product identity |
| Agent Orchestrator / AO | INHERITED_UPSTREAM_CHASSIS | Execution runtime, inherited implementation, upstream provenance |
| CodeBisor | SUPERSEDED | Former project name/direction |

### 8.2 Authority boundary

TownBoss/CPS canonical planning and governance documents outrank upstream AO
product decisions for product direction. Source/code wins for describing actual
current executable behavior. When two layers disagree, reconcile explicitly
rather than silently choosing stale upstream prose.

Machine-readable agent guidance in CPS repositories (`AGENTS.md`, `CLAUDE.md`,
`SUPERSESSION_REGISTER.md`) is the CPS authority layer for agents. It supersedes
upstream AO agent instructions for repository-local behavior.

### 8.3 Upstream compatibility

AO runtime names, CLI surfaces, state directories (`~/.ao`), and implementation
patterns remain valid for compatibility. Do not rename these merely to change
branding. The separate product-convergence pass will handle full installer/binary
convergence.

## 9. Immediate Masterplan Workstream

- [x] First repository-by-repository AS-IS reconciliation for GlenTown, CodeBisor and GeoPlotter.
- [x] Reclassify several inferred statuses using repository evidence where available.
- [x] Establish Code Project Supervisor as the current portfolio development-supervision project and retain CodeBisor as legacy/reference material.
- [ ] Run Code Project Supervisor Agent Orchestrator adoption audit and record GO/NO-GO.
- [ ] Fresh current-HEAD automated verification for GlenTown API/App as required by Beta readiness.
- [ ] Reconcile GeoPlotter local implementation with canonical remote Git history as required by active work.
- [ ] Link canonical specifications/ADRs for each project.
- [ ] Establish cross-project dependency register.
- [ ] Establish shared-service ownership map.
- [ ] Establish environment/deployment inventory.
- [ ] Establish portfolio security and observability baseline.
- [ ] Feed application plans into the eventual Code Project Supervisor roadmap model where useful.
