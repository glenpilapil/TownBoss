# TownBoss

Canonical platform architecture, shared capabilities, governance, AI authority, and reusable foundations for TownBoss products.

## Architecture Baseline v1

TownBoss Architecture Baseline v1 is the current portfolio architecture baseline.

- Human-readable baseline: `architecture/TOWNBOSS_ARCHITECTURE_BASELINE_V1.md`
- Machine-readable baseline: `capabilities/ARCHITECTURE_BASELINE_V1.yaml`
- Capability Registry: `capabilities/CAPABILITY_REGISTRY.yaml`
- Dependency / Integration Matrix: `capabilities/CAPABILITY_DEPENDENCY_INTEGRATION_MATRIX.yaml`
- Implementation Truth Matrix: `capabilities/IMPLEMENTATION_TRUTH_MATRIX.yaml`
- Adapter Roadmap: `capabilities/ADAPTER_ROADMAP.yaml`
- Shared Capability Extraction Policy: `governance/EXTRACTION_POLICY.md`
- Approved Upstream Implementation Ledger: `governance/APPROVED_UPSTREAM_IMPLEMENTATION_LEDGER.md`
- Portfolio Development Rules: `governance/DEVELOPMENT_RULES.md`
- Project Governance Standard: `governance/PROJECT_GOVERNANCE_STANDARD.md`

The baseline separates canonical architecture from implementation truth. Physical capability extraction and adapters remain evidence-driven and implementation-led. Approved upstream recommendations are tracked separately with explicit implementation triggers, validation receipts, dependency status, and stage gates so approval does not imply premature adoption and triggered recommendations are not lost.

## Development governance

`governance/DEVELOPMENT_RULES.md` is the canonical portfolio-wide development policy. `governance/PROJECT_GOVERNANCE_STANDARD.md` defines the minimum governance corpus for each active project, including an implementation-plan dashboard, project Memory, Current State, project-specific rules/acceptance, and the three-stage documentation compliance cycle.

Projects may add stricter project-specific rules and explicit approved exceptions, but substantial development should be planned, bounded, evidence-driven, verified, checkpointed, and recorded in project Memory. Machine-enforceable rules should be encoded into development supervision, repository checks, CI, and checkpoint gates rather than relying only on agent recollection.
