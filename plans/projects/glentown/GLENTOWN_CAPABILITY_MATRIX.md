# GlenTown Capability Matrix

**Status:** CANONICAL / LIVING COMPLETENESS MAP

| Capability | Critical | Current status/evidence | Next evidence |
|---|---|---|---|
| Auth/onboarding | Yes | IMPLEMENTED; `be202c5a` | Physical gate; SMTP external |
| Home/navigation | Yes | Shared App baseline `8e17b297`; Web recovery implementation `f5267d9`; historical mobile/API evidence retained | Android physical gate; later comprehensive responsive/adaptive Web QA |
| Community/notifications | Yes | POST_SAMSUNG_AUTOMATED_VERIFIED; API `738e8ac` contracts and fixtures | Orchestrator source review and physical evidence |
| Explore/discovery | Yes | Shared App baseline `8e17b297`; F-W2-005 open/deferred at 1199px; F-W2-008 final SHA-bound visual verification deferred | Web feature completeness; comprehensive responsive/adaptive QA; API/data closure |
| Universal Search | Yes | BLOCKED_API_CONTRACT | Geographic cross-domain contract |
| Map | Yes | IMPLEMENTED UI; `a43442b` | Listing/media projection, physical check |
| Cart/Around You | Yes | IMPLEMENTED; `c28feee` | Rich fixtures/projection/physical check |
| Create | Yes | TEST_VERIFIED recovery `aa07d25` | Samsung recheck; API persistence blockers |
| Chat | Yes | TEST_VERIFIED recovery `f9702ed`; API-backed direct/group/chatroom/search, safe errors and IME behavior | Representative fixtures, Message Requests IA decision, E2E physical journey |
| You/Profile | Yes | TEST_VERIFIED recovery `820d0cf`; intentional Profile Setup IME/CTA and truthful Trust state | IA/data/verification blockers and Samsung recheck |
| Cross-screen accessibility | Yes | APP-SIDE COMPLETE / TEST_VERIFIED at `f5e4085`; 20 focused and 370 full tests passed, analyze clean | Consolidated Samsung SafeArea, keyboard, contrast, text-scale, semantics, and responsive physical re-audit |
| Demo/data | Yes | BLOCKED_BY_DEMO_DATA | Idempotent representative fixtures |
| Nationwide readiness | Yes | PLANNED | Thresholds, rollout, samples |

`RELEASE_READY` requires applicable automated, runtime, physical, security/compliance, data and operational evidence.
