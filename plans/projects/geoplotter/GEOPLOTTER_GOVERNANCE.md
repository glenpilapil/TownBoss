# GeoPlotter Governance Baseline

**Status:** CANONICAL / PROJECT-SPECIFIC

GeoPlotter inherits:
- `governance/DEVELOPMENT_RULES.md`
- `governance/PROJECT_GOVERNANCE_STANDARD.md`
- `governance/PROJECT_EXECUTION_STANDARD.md`
- `governance/TASK_CLOSEOUT_SEQUENCE.md`
- `governance/TASK_CHECKPOINT_COMMIT_POLICY.md`
- `governance/TASK_REPORTING_AND_MEMORY_POLICY.md`

## Project-specific rules
1. **Evidence/provenance first.** Geospatial, document, inventory, commercial and verification claims must preserve source/provenance appropriate to their risk.
2. **No duplicate domain truth.** Follow `GEOPLOTTER_DOMAIN_AUTHORITY_MATRIX.md`; projections/caches do not become new authorities.
3. **Bounded PASS execution.** Every substantial implementation pass has explicit scope, exclusions, dependencies, validation and completion contract.
4. **Evidence-backed promotion.** Worker prose cannot promote IMPLEMENTED work to VERIFIED/CHECKPOINTED when required validation is missing or failing.
5. **Human verification where uncertainty matters.** OCR/title/site-plan extraction and inferred geometry must not silently become authoritative when confidence or professional boundaries require review.
6. **Inventory transitions are deterministic.** Availability, tenancy and history invariants are server-authoritative.
7. **Public exposure is explicit.** Listing and publication are separate; only approved whitelist projections may leave internal boundaries.
8. **Integration preserves authority.** RealWise/GlenTown consume explicit contracts and do not replace GeoPlotter real-estate authority.
9. **Recovery does not duplicate execution.** Interrupted work resumes from durable repository/worktree state and completed work is not rerun by default.
10. **Commit/push/merge/deploy are distinct authorities.** A worker authorized to edit/commit is not implicitly authorized to publish or deploy.
11. **Independent review is risk-based.** Use separate review or deterministic secondary evidence for migrations, tenancy/auth, public exposure, money/pricing, geospatial accuracy/CRS and major architecture changes.
12. **Documentation is part of completion.** Material development updates the dashboard, Current State, applicable canonical docs and Memory before accepted handoff/checkpoint.

## Required project corpus
- `GEOPLOTTER_IMPLEMENTATION_PLAN.md`
- `GEOPLOTTER_CURRENT_STATE.md`
- `GEOPLOTTER_GOVERNANCE.md`
- `GEOPLOTTER_ARCHITECTURE.md`
- `GEOPLOTTER_DOMAIN_AUTHORITY_MATRIX.md`
- `GEOPLOTTER_DECISIONS_AND_RULES.md`
- `GEOPLOTTER_ACCEPTANCE_CRITERIA.md`
- `GEOPLOTTER_CAPABILITY_MATRIX.md`
- `GEOPLOTTER_VALIDATION_MATRIX.md`
- `GEOPLOTTER_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`
- `GEOPLOTTER_OPERATIONAL_ACCEPTANCE_TEST.md`
- `GEOPLOTTER_RISK_REGISTER.md`
- `GEOPLOTTER_INTEGRATION_CONTRACTS.md`
- `GEOPLOTTER_MEMORY.md`

## Documentation compliance
Use the three-stage protocol in `GEOPLOTTER_DOCUMENTATION_COMPLIANCE_PROTOCOL.md`: Planning Gate, Execution Re-check Gate, Final Review Gate. Substantial final reports include a Documentation Compliance Receipt.

## Acceptance baseline
- [ ] Canonical repository provenance/integration reconciled for intended completed work.
- [ ] Fresh candidate-ref validation passes.
- [ ] Geospatial accuracy/provenance gate passes.
- [ ] Inventory/publication/matching invariants pass.
- [ ] Brokerage operational scenarios pass.
- [ ] RealWise/public integration scenarios pass where activated.
- [ ] Privacy/security/deployment readiness pass.
- [ ] Physical + visual final gate passes.
