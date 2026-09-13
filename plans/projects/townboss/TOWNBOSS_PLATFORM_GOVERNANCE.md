# TownBoss Platform Governance Baseline

**Status:** CANONICAL / PROJECT-SPECIFIC

TownBoss Platform inherits `governance/DEVELOPMENT_RULES.md` and `governance/PROJECT_GOVERNANCE_STANDARD.md`.

## Project decisions and rules

- Shared capabilities are extracted only when multiple products have sufficiently aligned semantics and centralization creates more value than coupling cost.
- Product-specific domain authority must not be erased by portfolio-level convenience.
- Shared services require explicit ownership, contracts, consumers, and evidence before implementation.
- Architecture standards should enable interoperability without forcing all projects into one runtime or data model.
- Security, identity, AI/tool authority, government adapters, and cross-product data sharing require explicit boundary and privacy review.
- Reusable capabilities should remain replaceable through adapters/contracts where practical.
- Portfolio governance must help projects ship; governance work must not become an open-ended product of its own.
- Material work must update the implementation dashboard, Current State, and Memory before handoff.

## Acceptance criteria

TownBoss Platform reaches its first operational governance milestone when:

- [ ] portfolio repository/application inventory is current;
- [ ] domain ownership boundaries are documented;
- [ ] dependency/integration mapping is current;
- [ ] API/event/audit/release evidence standards are consumable by active projects;
- [ ] at least one shared capability decision is proven from real multi-product demand rather than speculation;
- [ ] product-specific authority remains intact after shared integration;
- [ ] privacy/security review is complete for any cross-product identity or sensitive-data capability introduced;
- [ ] active projects comply with the TownBoss development/governance baseline;
- [ ] Current State and Memory reflect the verified milestone.

Later shared services retain their own phase/gate criteria in the implementation dashboard.

## Documentation compliance

Before substantial TownBoss Platform work, consult at minimum:

- `governance/DEVELOPMENT_RULES.md`;
- `governance/PROJECT_GOVERNANCE_STANDARD.md`;
- `plans/projects/townboss/TOWNBOSS_PLATFORM_IMPLEMENTATION_PLAN.md`;
- `plans/projects/townboss/TOWNBOSS_PLATFORM_CURRENT_STATE.md`;
- this governance baseline;
- `plans/projects/townboss/TOWNBOSS_PLATFORM_MEMORY.md`;
- relevant architecture/capability registries and project documents for affected consumers;
- repository-local instructions for any implementation repository involved.

Re-check governing documentation whenever scope, ownership, integration boundaries, risk, or acceptance interpretation materially changes.

Before final reporting/checkpointing, compare actual work against the governing documents, update the dashboard/Current State/Memory where required, and include a Documentation Compliance Receipt covering planning documents, execution re-checks, final-review documents, conflicts, approved exceptions, and documents updated.
