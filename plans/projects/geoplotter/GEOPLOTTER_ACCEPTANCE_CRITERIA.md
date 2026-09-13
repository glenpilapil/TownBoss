# GeoPlotter Acceptance Criteria

**Status:** CANONICAL

## Purpose
Define when GeoPlotter is operational enough for RealWise operations and safe downstream integration.

## Primary acceptance scenario
A real property/project can move through the system with evidence-backed state:

1. canonical project/property/inventory identity exists;
2. geometry is established with provenance and validation state;
3. map visualization reflects canonical spatial data;
4. uncertain document-derived facts are reviewed before authoritative use;
5. inventory lifecycle is auditable and tenant-safe;
6. listing/publication exposes only eligible public-safe data;
7. buyer requirements produce deterministic explainable matches;
8. inquiry/lead is routed through brokerage workflows;
9. viewing/tripping and transaction readiness are traceable;
10. RealWise can consume the capability without replacing GeoPlotter authority;
11. downstream integrations cannot leak private/internal fields;
12. audit/evidence/history survives the workflow.

## Mandatory gates
### A. Repository provenance
- [ ] Intended completed work has durable repository refs.
- [ ] Release candidate ancestry/integration is known.
- [ ] Fresh validation is tied to the candidate ref.

### B. Geospatial correctness
- [ ] CRS/SRID behavior is explicit and tested.
- [ ] Geometry validity/closure expectations are evidenced.
- [ ] Provenance/validation state survives projections.
- [ ] UI does not imply survey/legal certainty beyond evidence.

### C. Documents/evidence
- [ ] OCR/extraction uncertainty is represented.
- [ ] Human review exists where required.
- [ ] Verification assertions retain attribute/source/date/state.

### D. Inventory/commercial lifecycle
- [ ] Lot/unit status transitions are deterministic and audited.
- [ ] Sold/withheld inventory cannot be represented as available.
- [ ] Listing and publication state remain separate.
- [ ] Public projection is explicitly whitelisted.

### E. Matching
- [ ] Buyer criteria remain explicit.
- [ ] Ranking is deterministic and explainable.
- [ ] No commission/incentive bias exists.
- [ ] Currency mismatches do not trigger silent conversion.

### F. Brokerage workflows
- [ ] Lead/opportunity semantics are tenant-safe.
- [ ] Assignment/routing lifecycle is evidenced.
- [ ] Viewing/tripping acceptance passes.
- [ ] Transaction-readiness handoff is traceable.

### G. Security/privacy
- [ ] Cross-tenant access tests pass.
- [ ] Private documents/fields do not leak through public APIs.
- [ ] Secrets/configuration are not embedded in client bundles.
- [ ] Public API abuse/rate-limit policy is addressed before production exposure.

### H. Integrations
- [ ] RealWise consumption preserves GeoPlotter authority.
- [ ] GlenTown/public consumers use versioned public-safe contracts where activated.
- [ ] External data provenance/freshness is explicit.

### I. Operations
- [ ] Observability/error reporting exists.
- [ ] Deployment/recovery procedures are documented and tested.
- [ ] Production configuration is reproducible.

### J. Final visual/physical gate
- [ ] Core user flows pass browser/device visual audit.
- [ ] Maps/selectors/loading/error states are usable and intentional.

## Completion rule
GeoPlotter reaches operational release when the applicable mandatory gates and scenarios in `GEOPLOTTER_OPERATIONAL_ACCEPTANCE_TEST.md` pass on an accepted release-candidate lineage. Remaining enhancements then move to later milestones rather than keeping the initial release perpetually open.
