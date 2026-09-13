# GlenTown Blocker and Dependency Register

**Status:** CANONICAL / LIVING

This register prevents known dependencies from being repeatedly rediscovered. A blocker is closed only with evidence or an explicit superseding decision.

| ID | Capability | Type | Blocks | Primary owner | Required resolution/evidence |
|---|---|---|---|---|---|
| COMMUNITY_POST_DETAIL | Community | BLOCKED_APP_DOMAIN_CONTRACT | Canonical typed post detail | App/domain | Typed detail model and route |
| COMMUNITY_MEDIA | Community | BLOCKED_API_CONTRACT | Gallery/media persistence and immersive detail | API + App | Media write/read projection with tests |
| COMMUNITY_CATEGORY_PERSISTENCE | Community | BLOCKED_API_CONTRACT | Canonical category persistence | API + App | Category write contract + projection |
| CONNECTED_SEARCH | Search | BLOCKED_API_CONTRACT | Real universal search | API | Typed geographic-scope-aware cross-domain search contract |
| MAP_LISTINGS | Map | BLOCKED_API_CONTRACT | Real production pins/listings | API | Real map listing provider/projection |
| MAP_LISTING_MEDIA | Map | BLOCKED_API_DATA | Rich selected-pin preview/detail | API/data | Canonical media/detail projection |
| DESTINATION_HERO_MEDIA | Destinations | BLOCKED_API_DATA | Destination immersive hero | API/data | Canonical destination featured-media projection |
| NOTIFICATION_PREFERENCES | Notifications | BLOCKED_API_CONTRACT | Persisted notification settings | API | Preference persistence contract |
| CART_FEATURED_MEDIA | Cart | BLOCKED_API_DATA | Rich cart item presentation | API/data | Featured media projection for typed sources |
| CART_RICH_FIXTURES | Cart | BLOCKED_BY_DEMO_DATA | Multi-category/multi-vendor audit | Demo data | Realistic populated cart/order fixtures |
| AROUND_YOU_IDENTITY | Around You | BLOCKED_API_CONTRACT | Safe navigation for incomplete items | API | Canonical typed identity/route projection |
| AROUND_YOU_MEDIA | Around You | BLOCKED_API_DATA | Rich nearby cards/details | API/data | Canonical media projection |
| AROUND_YOU_IMMERSIVE | Around You | BLOCKED_ARCHITECTURE_CONTRACT | Shared immersive detail | App architecture | Approved reusable detail-shell contract |
| HOME_RICH_DATA | Home | BLOCKED_BY_DEMO_DATA | Representative physical visual audit | Demo data | Advisory, mixed posts/media, recommendations, reminders/life events and commerce fixtures |
| POPULATED_DEMO_USER | Cross-cutting | BLOCKED_BY_DEMO_DATA | Notifications/orders/reservations/messages audit | Demo data | Stable populated demo account and rerunnable fixtures |
| PROVINCE_READY | Nationwide rollout | DATA_READINESS | Nationwide Beta density/readiness | Data/readiness | Province thresholds, provenance and readiness evidence |

## Rules
- Tasks must consult this register before declaring a newly discovered blocker.
- If implementation closes or changes a blocker, update this register, the Capability Matrix, Implementation Plan and Memory where material.
- Do not bypass blockers with mock behavior in real mode unless an explicit development-only fixture policy authorizes it.
