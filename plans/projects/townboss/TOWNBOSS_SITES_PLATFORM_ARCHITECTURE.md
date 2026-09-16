# TownBoss Sites Platform Architecture

**Status:** APPROVED DIRECTION / ARCHITECTURE BASELINE  
**Capability:** `TOWNBOSS_SITES_PLATFORM`  
**Pilot:** TownTraveler

## Mission
Provide a managed, multi-tenant website composition and extension platform for TownBoss products and organizations. Replace bespoke organization-site development as the default with reusable sites, themes, blocks, governed plugins, and shared-service integrations.

WordPress is a product-pattern reference for themes, blocks, plugins, hooks, permissions, extensibility, and ecosystem economics; it is not an architectural authority. TownBoss Sites does not permit arbitrary uploaded server-side code execution.

## Ownership boundary
TownBoss Sites owns website/platform concerns: site identity/configuration, domains, routing, pages, navigation, themes/design tokens, templates, sections/blocks, responsive composition, site media, SEO metadata, draft/publish/version lifecycle, plugin contracts, plugin activation, permissions, UI extension points, compatibility, entitlements, and site analytics integration points.

Reusable horizontal business capabilities remain owned by GlenTown Biz/TownBoss shared services when justified: generic CRM, organization/workforce, tasks/approvals, operations primitives, management intelligence, identity/messaging primitives, commerce/payment primitives and other generic services.

Vertical products retain specialized authority. TownTraveler owns tourism semantics; GeoPlotter owns real-estate/property semantics. Sites consumes authoritative services through explicit contracts and must not create shadow domain databases.

## Platform layers
1. **Sites Core** — Site, domain, route, page, revision, publishing, navigation, media, SEO, localization.
2. **Composition Engine** — Theme, design tokens, template, pattern, section, typed block, responsive rules, dynamic data binding.
3. **Extension Runtime** — Plugin manifest, permissions/capabilities, UI extension points, events, API contracts, webhooks, entitlements, compatibility and lifecycle.
4. **Shared TownBoss Services** — Identity, organizations, GlenTown Biz, CRM, commerce/payments, reviews, analytics, Glen AI and other proven shared capabilities.
5. **Vertical Services** — TownTraveler, GeoPlotter and future domain products.

## Core resource contracts
### Site
Tenant/organization owner, identity, hostname/domain, locale, status, theme, environment/configuration and plan entitlements.

### Page
Route/slug, page type, SEO metadata, draft/published state, composition tree and revisions.

### Theme
Design tokens, typography, spacing, global layout, responsive behavior and component/block variants.

### Block
Blocks are typed declarative composition units, not arbitrary executable content. A block contract includes type, schema/version, validated props/configuration, optional authoritative data binding, permissions, rendering contract and responsive configuration.

Dynamic bindings must identify an authoritative provider/resource rather than copying business data into page content.

### Plugin / Extension
A governed plugin manifest should support: identifier, publisher, version, compatibility, capabilities, permissions, required services, UI extension points, blocks provided, events consumed/emitted, API requirements, webhooks, configuration schema/version, billing/entitlement and security/provenance metadata.

## Extension classes
- **Content extensions** — blocks/patterns such as galleries, FAQ and testimonials.
- **Business extensions** — forms, CRM, reservations, commerce, memberships and similar reusable capabilities.
- **Vertical extensions** — adapters and presentation capabilities for specialized domains such as TownTraveler accommodation or GeoPlotter listings.

A plugin may expose blocks but is not limited to being a block.

## Future multi-surface contract
Extension manifests should remain capable of declaring future surfaces such as `website`, `glentown`, `towntraveler`, `organization_dashboard`, `mobile`, and `glen_ai`. Initial implementation must not expand scope to implement every surface.

## Commercial/entitlement model
Keep site plans, plugin entitlements and usage metering distinct.

- Site plans may govern custom domains, storage, staff seats, analytics and platform limits.
- Plugins may be FREE, FREEMIUM or PREMIUM.
- Publisher classes begin FIRST_PARTY; VERIFIED_THIRD_PARTY is future scope.
- Usage may meter storage, bandwidth, AI, transactions or other costly resources.

Do not hard-code speculative pricing. Entitlements are capability-based.

## Security boundary
Plugin extensibility is a major trust boundary. Required controls include least-privilege scopes, explicit grants, tenant isolation, authorization, signed webhooks, secrets isolation, provenance/publisher verification, compatibility policy, update/version policy, rollback, disable/quarantine kill switch, audit trails, rate/resource limits, uninstall/data-retention policy and security review.

Third-party arbitrary server execution is prohibited unless a later explicit security/architecture decision changes this rule.

## Organization UX baseline
`Organization → Your Website → Create Site → Choose Template → Configure Brand → Add/Edit Pages → Add Sections/Blocks → Enable Plugins → Preview → Publish → Connect Domain`.

The first experience should be guided and constrained rather than attempting to reproduce the full WordPress administration surface.

## TownTraveler pilot
TownTraveler is Reference Implementation / Pilot #1. It should use the same Sites platform intended for later organization websites while retaining tourism authority. Existing working vertical functionality must not be rewritten merely for abstraction purity.

Use four extraction decisions: **extract now**, **contract now**, **extract later**, **keep vertical**. Prefer incremental migration/strangler patterns.

## Provisional TownTraveler classification matrix
This matrix establishes planning boundaries and must be validated against actual implementation as it appears.

| Capability | Classification | Rationale |
|---|---|---|
| Site/page routing | SITES_CORE | Generic website concern |
| Navigation | SITES_CORE | Generic website concern |
| SEO metadata/structured presentation hooks | SITES_CORE | Core public-site requirement |
| Domains | SITES_CORE | Site infrastructure |
| Media | SITES_CORE | Generic site assets |
| Themes/design tokens | SITES_CORE | Composition concern |
| Page/section/block composition | SITES_CORE | Builder foundation |
| Editorial/blog primitives | GENERIC_PLUGIN or CORE candidate | Reusable, validate core threshold |
| Contact/forms | GENERIC_PLUGIN | Reusable business/content capability |
| Gallery | GENERIC_PLUGIN | Reusable content capability |
| Maps presentation | GENERIC_PLUGIN | Reusable presentation with provider contracts |
| Reviews presentation | GENERIC_PLUGIN + shared service | Presentation is reusable; review authority stays external |
| Payments/deposits presentation | GENERIC_PLUGIN + shared service | Sites must not own payment authority |
| CRM integration | GENERIC_PLUGIN + GlenTown Biz | Horizontal business capability |
| Destinations | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism semantics |
| Places discovery | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism discovery semantics; source authority still requires Phase 0 decision |
| Experiences/tours | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism semantics |
| Accommodation/stays | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism semantics and booking contracts |
| Food tourism discovery | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism discovery semantics |
| Tourism events | TOWNTRAVELER_VERTICAL_PLUGIN | Tourism context over authoritative event source |
| Trip Planner | TOWNTRAVELER_VERTICAL_PLUGIN + shared orchestration | Tourism experience; orchestration remains shared where justified |
| Tourism search/discovery | TOWNTRAVELER_VERTICAL_PLUGIN | Vertical ranking/filter semantics |
| TownTraveler homepage | SITE_CONFIGURATION | Composition/configuration, not a fork |
| TownTraveler visual identity | SITE_CONFIGURATION | Theme/configuration |

## Phased implementation direction
0. Architecture and canonical reconciliation.
1. Sites Core sufficient for TownTraveler.
2. TownTraveler pilot/migration without loss of vertical capability.
3. Selected GlenTown organization website MVP.
4. First-party plugin catalog and entitlements.
5. Commercialization/site plans/billing integration.
6. Third-party ecosystem only after security, signing/provenance, compatibility, review, rollback, billing and publisher governance mature.

## Explicit non-goals for initial implementation
- General-purpose WordPress replacement.
- Arbitrary user-uploaded server code.
- Public third-party marketplace.
- Implementing every future extension surface.
- Duplicating GlenTown Biz or vertical-domain business logic.
- Rewriting working vertical functionality solely to generalize it.

## Acceptance gates before implementation
- TownTraveler Phase 0 ownership decisions remain mandatory.
- Plugin trust/permission contract reviewed.
- Core-vs-plugin-vs-vertical boundaries reviewed.
- SEO/public rendering architecture remains first-class for TownTraveler.
- Initial Sites Core scope is small enough to prove through TownTraveler rather than speculative platform breadth.
