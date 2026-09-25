# GlenTown Blocker and Dependency Register

**Status:** CANONICAL / LIVING

| ID | Type | Blocks | Required evidence |
|---|---|---|---|
| CONNECTED_SEARCH | PARTIAL_API_IMPLEMENTED | Universal Search; remaining discovery ranking/nationwide cross-domain queries | Descendant-aware Town/Province/National eligibility is implemented for Places/shared consumers; still require connected cross-domain Search/ranking contract and evidence |
| MAP_LISTINGS | PARTIAL_API_IMPLEMENTED / BLOCKED_APP+DEMO | Home real map listing projection | `/api/v1/map-listings` privacy-safe Property/Event projection is implemented/tested; require synthetic map-visible demo fixtures, Home map App wiring before Around You, GlenTown category markers, viewport bounds/scale work, additional category public-location contracts, and Samsung evidence |
| DESTINATION_HERO_MEDIA | BLOCKED_API_DATA | Destination hero media | Featured-media projection |
| DISCOVERY_RICHNESS | BLOCKED_BY_DEMO_DATA | Seeded destination/discovery audit | Representative provenanced fixtures |
| JOBS_DIRECTORY_FALLBACK | BLOCKED_APP_DOMAIN_CONTRACT | Jobs/Directory fallback | Canonical detail/route recovery evidence |
| SMTP_EMAIL_VERIFICATION | BLOCKED_EXTERNAL | Real email verification E2E | SMTP/delivery account and E2E proof |
| COMMUNITY_MEDIA | BLOCKED_API_CONTRACT | Media persistence/detail | Write/read projection with tests |
| BUSINESS_CLAIM_PERSISTENCE | BLOCKED_API_CONTRACT | Real business claim/evidence submission | Server claim/evidence write contract and authoritative status projection |
| NOTIFICATION_PREFERENCES | BLOCKED_API_CONTRACT | Persisted settings | Preference contract |
| CART_RICH_FIXTURES | BLOCKED_BY_DEMO_DATA | Cart audit | Representative fixtures |
| HOME_RICH_DATA | BLOCKED_BY_DEMO_DATA | Home physical audit | Mixed rich fixtures |
| POPULATED_DEMO_USER | BLOCKED_BY_DEMO_DATA | Cross-cutting audit including Chat direct/group/request/recommendation/read-state acceptance | Stable persona/fixtures |
| MESSAGE_REQUESTS_INBOX | BLOCKED_APP_DOMAIN_CONTRACT | Customer-facing Chat Message Requests discoverability and handling | Approved inbox information architecture, then API-field/capability verification |
| YOU_PROFILE_INFORMATION_ARCHITECTURE | BLOCKED_APP_DOMAIN_CONTRACT | Calendar, Your Places, Job Seeker Profile and separated App/Account Settings destinations | Approved routes/models and eligible information architecture |
| ACCOUNT_VERIFICATION | BLOCKED_API_CONTRACT | Account verification status/submission flow | Authoritative status and submission contract |
| PROVINCE_READY | BLOCKED_BY_DEMO_DATA | Nationwide readiness | Thresholds, provenance, rollout/sample evidence |
| HOME_RECOVERY_CURRENT_HEAD_VALIDATION | RESOLVED_AUTOMATED | Coordinated post-Samsung Home checkpoint | API `738e8ac`: 1,336 tests / 4,633 assertions / 0 failures under the canonical `phpunit.xml` paths; physical verification is separate and pending |
| FLUTTER_TOOLCHAIN_PINNING | DEFERRED | Canonical Flutter SDK pinning | Pinned Flutter SDK version recorded in canonical project configuration |
| DART_REPOSITORY_FORMAT_NORMALIZATION | DEFERRED | Repository-wide Dart formatter debt | Separate governed migration after toolchain pinning; do not conflate with current-formatting gate |
| WEB_WAVE2_RESPONSIVE_QA | DEFERRED | Final Web responsive/adaptive acceptance | Complete major Web elements first; then resolve F-W2-005 at 1199px, obtain SHA-bound F-W2-008 evidence, and capture valid real-API visual evidence |

2026-09-25 note: map-safe exact coordinates currently exist only where the owning model explicitly permits public exact location. Properties and Events meet that contract when `is_exact_location_public=true` and a coordinate-bearing Address exists. Products/Foods/Services/Experiences/Jobs/Suppliers/Places remain excluded from real listing markers until authoritative coordinate + public-location semantics exist; GeographicEntity centroids are camera/scope aids only and must not be used as listing-marker coordinates.

Close/change a row only with evidence and synchronized dashboard, capability, Current State and Memory updates.

D1.7 App-side reconciliation introduced no new contract blocker and closed no existing API/data/demo dependency. CROSS-A2-02 and CROSS-A2-04 are source-test verified; CROSS-A2-03 and device-dependent accessibility checks proceed to the consolidated Samsung physical re-audit.
