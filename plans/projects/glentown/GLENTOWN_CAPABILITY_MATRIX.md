# GlenTown Capability Matrix

**Status:** CANONICAL / LIVING COMPLETENESS MAP

## Status vocabulary
PLANNED, IMPLEMENTED, INTEGRATED, TEST_VERIFIED, RUNTIME_VERIFIED, PHYSICAL_VERIFIED, RELEASE_READY.

Blockers are recorded separately with explicit labels such as BLOCKED_API_CONTRACT, BLOCKED_API_DATA, BLOCKED_APP_DOMAIN_CONTRACT, BLOCKED_ARCHITECTURE_CONTRACT, BLOCKED_BY_DEMO_DATA, BLOCKED_EXTERNAL, or DEFERRED_WITH_REASON.

A capability must never be promoted based only on worker prose or historical evidence.

| Capability | Beta critical? | Primary owner | Current evidence/status | Principal next evidence |
|---|---|---|---|---|
| Authentication / onboarding | Yes | App + API | IMPLEMENTED / reconciliation active | Physical-device auth gate |
| Profile / identity | Yes | App + API | IMPLEMENTED | Physical/runtime verification |
| Home | Yes | App + API | IMPLEMENTED / regression recovery evidenced | Samsung physical re-audit + rich data |
| Community / social | Yes | App + API | IMPLEMENTED | Typed detail/media/category persistence + physical verification |
| Notifications | Yes | App + API | IMPLEMENTED | Physical gestures/routing; preference persistence contract |
| Explore / discovery | Yes | App + API | IMPLEMENTED | Canonical audit backlog recovery + physical verification |
| Universal search | Yes | App + API | Partial | Real cross-domain connected-search contract |
| Map | Yes | App + API | IMPLEMENTED UI | Real listings/media API contract + physical verification |
| Around You | Yes | App + API | Partial | Identity/media projection + immersive detail architecture |
| Marketplace / products / pre-loved | Yes | App + API | IMPLEMENTED | Critical journey/runtime verification |
| Food | Yes | App + API | IMPLEMENTED | Critical journey/runtime verification |
| Services | Yes | App + API | IMPLEMENTED | Booking/deposit/runtime verification |
| Cart / checkout / orders | Yes | App + API | IMPLEMENTED | Featured media/rich fixtures + commerce boundary review |
| Reviews / ratings | Yes | App + API | IMPLEMENTED | Critical journey verification |
| Messaging | Yes | App + API | API foundation integrated | End-to-end physical-device gate |
| Places / destinations / tourism | Yes | App + API | IMPLEMENTED | Media/data completeness + physical verification |
| Events / Event Planner | Yes | App + API | INTEGRATED | Regression/runtime gate |
| Trip Planner | Yes | App + API | INTEGRATED | Regression/runtime gate |
| Financial Planner | Yes | App + API | INTEGRATED | Regression/runtime gate |
| Day Planner | Day-1 target | Shared orchestration + App/API | Evidence reconciliation pending | Implementation evidence |
| Achieve | Day-1 target | Shared orchestration + App/API | Evidence reconciliation pending | Implementation evidence |
| Jobs | Yes | App + API | Partial/implemented surfaces | Journey verification |
| Professionals | Yes | App + API | Partial/implemented surfaces | Journey verification |
| Accommodations / PMS | Where activated | App + API | Booking foundation implemented | Multi-unit/readiness verification |
| Transport / transfers | Where activated | App + API | Planned/partial evidence | Capability evidence |
| Event venues / rentals | Where activated | App + API | Planned/partial evidence | Capability evidence |
| Credits | Beta policy dependent | App + API | Partial | Financial/security/operational gates |
| Trust & Verification | Yes where transactions require | App + API | Partial | Runtime/security verification |
| Glen AI / Ask Glen | Not required unless explicitly promoted | Shared AI + GlenTown | Planned | Production implementation evidence |
| Government-service adapters | Capability gated | Shared adapters + GlenTown | Planned | Adapter-specific production evidence |
| Nationwide Province Ready seeding | Yes | Data/readiness | In progress | Province readiness thresholds/evidence |

## Promotion rule
A capability reaches RELEASE_READY only when all applicable automated, runtime, physical-device, security/compliance, data-readiness and operational gates are satisfied or explicitly approved as non-blocking.
