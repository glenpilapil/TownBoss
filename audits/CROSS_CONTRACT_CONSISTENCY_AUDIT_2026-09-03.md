# Cross-contract Consistency Audit — 2026-09-03

**Repository:** `glenpilapil/TownBoss`  
**Base:** `68db1ca974ae7b9dc8dfb480ffd7561d114b8cb1`  
**Result after remediation:** **PASS**  
**Scope:** canonical capability contracts, Capability Registry, Capability Dependency / Integration Matrix, and human-readable architecture where ownership or authority wording could conflict.

## Audit objective

Verify that TownBoss capability contracts agree on ownership, authority, source-of-truth boundaries, status/version labels, cross-cutting security/reliability/provenance semantics, and dependency direction. The audit corrects semantic drift; it does not promote implementation status or create new product/Beta scope.

## Canonical invariants used as conflict tests

- `dependency != ownership`
- `integration != authority transfer`
- `data access != permission`
- `confidence != authority`
- `orchestration != authority`
- `simulation != approval`
- `constraint pass != execution authority`
- `review != verification != authority != evidence truth`
- `audit record != evidence source truth != domain state`
- `derived projection != authoritative record`
- product adapters may specialize but must not fork canonical capability semantics

## Findings and remediation

### CXC-001 — Contract status/version drift

**Finding:** Evidence & Provenance, Scenario Engine, and Constraint Engine contracts still declared `status: canonical-design`, while the root Capability Registry declared each as `canonical-design-v1`.

**Risk:** machine consumers could interpret the same canonical capability as having different lifecycle/version status depending on source.

**Remediation:** changed all three contract statuses to `canonical-design-v1`. No implementation state changed.

**Files:**
- `capabilities/evidence-provenance/CONTRACT.yaml`
- `capabilities/scenario-engine/CONTRACT.yaml`
- `capabilities/constraint-engine/CONTRACT.yaml`

**Disposition:** resolved.

### CXC-002 — Authorization incorrectly appeared to own identity and tenancy

**Finding:** AI Authority's separation-of-concerns text said Authorization owned identities and tenancy/resource scope. This conflicted with the Capability Registry and dependency matrix, where Identity & Trust owns identity context and Organizations & Tenancy owns organization/tenant context, with Authorization consuming both to decide permission.

**Risk:** future adapters could collapse three separate capabilities and treat authorization as the identity or tenancy source of truth.

**Remediation:** Authorization now explicitly consumes identity/actor context from Identity & Trust and organization/tenancy context from Organizations & Tenancy. It owns resource-authorization policy, roles/permissions as authorization semantics, tenant-aware resource-scope enforcement, and domain access decisions. It explicitly does not own identity or tenancy source-of-truth state.

**Files:**
- `capabilities/ai-authority/CONTRACT.yaml`
- `architecture/AI_AUTHORITY_MODEL.md`

**Disposition:** resolved.

### CXC-003 — Human Verification reviewer identity ownership ambiguity

**Finding:** Human Verification said it owned `attributable reviewer identity` while also stating it did not own generic identity. The intended semantics were attribution of an Identity & Trust reference to a review outcome, not ownership of reviewer identity itself.

**Risk:** duplicate identity semantics or reviewer-specific identity records becoming an alternate identity source of truth.

**Remediation:** Human Verification now owns reviewer identity **reference and attribution** within verification records. Identity & Trust is explicitly the reviewer identity source of truth; resource authorization remains outside Human Verification.

**Files:**
- `capabilities/human-verification/CONTRACT.yaml`
- `architecture/HUMAN_VERIFICATION_WORKFLOW.md`

**Disposition:** resolved.

### CXC-004 — Orchestration wording could imply authority

**Finding:** Glen AI Foundation contained the invariant `orchestration-remains-execution-lifecycle-authority`. This was inconsistent with the portfolio rule `orchestration != authority` even though the surrounding contract intended lifecycle ownership only.

**Risk:** terminology could be read as granting Orchestration execution permission or approval authority.

**Remediation:** changed the invariant to `orchestration-remains-owner-of-execution-lifecycle`.

**File:** `capabilities/glen-ai-foundation/CONTRACT.yaml`

**Disposition:** resolved.

### CXC-005 — Cross-cutting specialization precedence was implicit

**Finding:** Several contracts correctly contain capability-specific security, idempotency, reliability, audit, or evidence requirements, but the precedence rule between generic cross-cutting capabilities and stricter domain-specific rules was implicit rather than canonical.

Examples reviewed:
- Media security requirements vs Security Baseline.
- Platform API idempotency-key placement vs Reliability & Mutation Semantics effect safety.
- Payments & Credits financial idempotency/reconciliation vs generic Reliability.
- Human Verification review outcomes vs Evidence & Provenance assessments and Identity & Trust.
- Audit & Observability records vs Evidence & Provenance and source-domain state.

**Risk:** later product adapters could treat a local specialized rule as replacing the portfolio baseline or claim overlapping ownership.

**Remediation:** added explicit composition precedence to both dependency-matrix representations:
- Security Baseline is the portfolio minimum; capability-specific rules may strengthen but not weaken it.
- Reliability owns generic retry-safe effect semantics; API Boundary owns interface placement/contract; domain capabilities may impose stricter profiles.
- Evidence & Provenance owns source/claim/lineage semantics; Audit observes without becoming source truth; Human Verification owns review workflow without owning identity source or evidence truth.
- Authorization, AI Authority, professional authority, government/external authority, and Orchestration remain distinct; Orchestration owns lifecycle coordination, not authority.

**Files:**
- `capabilities/CAPABILITY_DEPENDENCY_INTEGRATION_MATRIX.yaml`
- `architecture/CAPABILITY_DEPENDENCY_INTEGRATION_MATRIX.md`

**Disposition:** resolved.

## Boundary checks that passed without contract changes

### Reviews & Reputation vs Human Verification
Reviews remain opinion/reputation records and derived signals. Reputation cannot satisfy professional verification or human-verification requirements and cannot create legal, government, or financial authority.

### Scheduling vs booking/resource domains
Scheduling owns generic temporal, hold/reservation, conflict, capacity, recurrence, and calendar semantics. Owning product domains retain booking/business completion and authoritative resource state.

### Public Data Gateway vs external authority
The gateway owns adapter, ingestion, freshness, normalization, provenance mapping, and reconciliation semantics. Government, institutional, commercial, or other external sources remain authoritative for their own records and rights.

### Audit & Observability vs Evidence & Provenance
Audit provides attributable accountability and telemetry. Evidence & Provenance owns source/claim/artifact/assessment lineage. Neither automatically becomes the other.

### Feature Flags & Experimentation vs Authorization / AI Authority
Feature exposure does not grant permission, entitlement, consent, approval, or AI authority. Experiment variants cannot weaken mandatory safety or authority gates.

### Scenario Engine / Constraint Engine / AI Authority / Orchestration
Scenario output remains hypothetical. Constraint evaluation does not approve execution. AI Authority determines maximum autonomous behavior. Authorization separately decides permission. Orchestration coordinates lifecycle and cannot manufacture authority.

### Platform API Boundary vs Reliability & Mutation Semantics
API Boundary governs supported interface, versioning, request/response/error contracts, idempotency-key placement, and webhook interface behavior. Reliability governs duplicate-safe effects, retry classification, concurrency, unknown outcomes, recovery, and replay safety.

### Payments & Credits vs product order/booking state
Financial state and product fulfillment state remain distinct. Provider acceptance/settlement and local order/booking completion are reconciled rather than conflated.

## Status and implementation-truth check

No capability was promoted from architecture to implementation by this audit. Existing `implemented`, `implemented-partial`, `canonical-design-v1/v2`, `emerging`, `approved-direction`, and deferred/extraction statuses remain evidence-driven.

No shared runtime, microservice, external provider, event bus, identity service, security vendor, or new product feature is mandated by these corrections.

## Residual risks

The audit establishes semantic consistency of the canonical architecture, not physical implementation conformity. Product repositories may still contain implementation drift, incomplete adapters, missing enforcement, or product-local concepts that do not yet map cleanly to TownBoss contracts.

Those are intentionally deferred to the next **Implementation-truth audit across products** after this consistency pass.

## Final result

**PASS** — identified cross-contract inconsistencies were corrected, no unresolved canonical ownership or authority conflict remains in the audited architecture set, and implementation truth was not overstated.
