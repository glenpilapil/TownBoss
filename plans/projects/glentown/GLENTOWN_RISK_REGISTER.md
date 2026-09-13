# GlenTown Risk Register

**Status:** CANONICAL / LIVING

| Risk | Severity | Current control | Required follow-up |
|---|---|---|---|
| UI regression / canonical UX drift | High | Regression ledger, physical/screenshot/code audits, documentation compliance | Keep authority reconciled before every UI pass; physical recheck before promotion |
| API/App contract drift | High | Typed repositories/contracts and focused tests | Contract-level validation and cross-repo reconciliation |
| Incomplete or misleading demo data | High for Beta audit | Rerunnable seeders and populated demo-user work | Rich category/state coverage, provenance and idempotency evidence |
| Authorization/tenancy/privacy leakage | Critical | Server-authoritative policies and tests | Security gate and independent review for consequential changes |
| Pricing/order/booking state authority drift to client | Critical | Server-authoritative domain rules | Commerce/booking validation profile and end-to-end checks |
| Nationwide empty-experience risk | High | Province Ready strategy and pre-Beta seeding | Define/verify thresholds and capability gating by geography |
| External/government integration instability | Medium/High | Adapter pattern; external systems remain authoritative | Per-adapter failure/caching/provenance policy |
| Agent scope drift or undocumented supersession | High | Authority matrix, task contracts, compliance protocol | Fail closed; require explicit exceptions and final receipt |
| Destructive Git/data recovery mistakes | High | Safety refs and bounded recovery practices | Standard safe-abort/recovery section in every substantial agent task |
| Historical evidence mistaken for current verification | High | Evidence rule | Tie VERIFIED status to concrete current refs and fresh receipts |
| Physical-device behavior diverges from automated tests | High | Physical-device release gate | Maintain representative Samsung/device acceptance pass |
| Dependency/blocker rediscovery causes repeated partial fixes | Medium/High | Canonical blocker register | Consult/update blocker register in every material task |
| Production ingress/security exposure | Critical | Cloudflare/Tunnel/WAF/Zero Trust strategy | Production security audit and deployment verification |

## Rules
- Material new risks discovered during work must be added or reconciled here before handoff.
- Critical/high risks cannot be silently accepted by a worker or supervisor.
- Risk acceptance requires explicit operator authority and a recorded scope/review condition.
