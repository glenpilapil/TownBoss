# GeoPlotter Risk Register

**Status:** CANONICAL / LIVING

| Risk | Impact | Likelihood | Mitigation / gate | Owner | Status |
|---|---|---|---|---|---|
| CRS/SRID misuse | High | Medium | explicit CRS rules, projection tests, geospatial review | Spatial/geospatial | OPEN |
| Inferred geometry presented as legal boundary | Critical | Medium | provenance/validation UI, disclaimers, professional review | Spatial/Evidence | OPEN |
| OCR extraction error | High | High | confidence, source traceability, human review | Document/OCR | OPEN |
| Stale title/document evidence | High | Medium | source/date/refresh state | Evidence | OPEN |
| Privacy/PII leakage | Critical | Medium | document ACLs, public whitelist, leakage tests | Security/Publication | OPEN |
| Cross-tenant leakage | Critical | Low-Medium | service-scoped tenancy, 404/non-disclosure tests | Security | ACTIVE CONTROL |
| Stale inventory | High | Medium | authoritative lifecycle, import reconciliation, freshness controls | Inventory | ACTIVE CONTROL |
| Sold/reserved race condition | High | Medium | transactional transitions, locking/concurrency tests where needed | Inventory | OPEN |
| Publication leakage | Critical | Medium | central eligibility + explicit public projection | Publication | ACTIVE CONTROL |
| Pricing/currency mistake | High | Medium | authoritative listing price, ISO currency, no silent FX | Listing/Matching | ACTIVE CONTROL |
| Valuation overclaim | High | Medium | ranges/confidence, comparable provenance, appraisal boundary | Valuation | OPEN |
| Hazard/elevation source misuse | High | Medium | source/date/method/limitations visible | Property Intelligence | OPEN |
| Government/public data provenance loss | High | Medium | adapter/source metadata and freshness | Integration | OPEN |
| Professional-practice boundary violation | Critical | Low-Medium | professional handoff, no unsupported legal/survey/appraisal claims | Governance | OPEN |
| Migration drift | High | Medium | generated migrations, journal/snapshot coherence, dev/test verification | Data | ACTIVE CONTROL |
| Map payload scalability | Medium-High | Medium | bounded GeoJSON now; vector-tile threshold later | Mapping | MONITOR |
| Basemap/provider failure | Medium | Medium | provider-neutral MapLibre overlay architecture, graceful failure | Mapping | OPEN |
| Integration coupling | High | Medium | versioned contracts/adapters, no direct DB authority | Integration | OPEN |
| AI overreach | High | Medium | deterministic rules for governed decisions; AI recommendations remain non-authoritative | AI/Domain | OPEN |
| Interrupted development loses state/repeats work | Medium | Medium | durable Git working state, bounded recovery/resume rules | Development | ACTIVE CONTROL |
| Public API abuse | Medium-High | Medium | rate-limit/abuse-control gate before production public exposure | Security | DEFERRED TO 1B |

## Risk rule
Critical/high risks that affect the active PASS must be explicitly mitigated or accepted before verification. New material risks discovered during implementation are added here or to a more specific security/legal register rather than hidden in terminal notes.
