# TownBoss Sites Platform

**Status:** APPROVED ARCHITECTURE / PLANNED CAPABILITY
**Pilot:** TownTraveler Reference Implementation #1

TownBoss Sites is a reusable managed multi-tenant website platform. Sites Core owns site identity, domains, pages/routes, navigation, themes/design tokens, page/section/block composition, media, publishing, generic SEO hooks, and governed extension contracts.

Extensions use manifests, permissions, APIs/extension points, events/webhooks, entitlements, compatibility/security validation, lifecycle/versioning controls, and tenant isolation. Arbitrary WordPress-style uploaded server-side plugin execution is prohibited.

GlenTown Biz retains reusable horizontal business capability authority; vertical products retain vertical semantics. Page composition binds authoritative provider/contracts rather than copying business state into shadow records.

TownTraveler classification: Sites Core (site/page/domain/navigation/theme/media/SEO); Generic/Shared Plugin (forms, gallery, maps presentation, reviews/payment/CRM presentation); TownTraveler Vertical Plugin (tourism discovery, ranking, stays, experiences, tourism content, Trip Planner behavior); Site Configuration (homepage and visual identity).

Generalization is evidence-led: extract now, contract now, extract later, or keep vertical. Builder abstraction must not weaken SEO, structured data, performance, or public discoverability.
