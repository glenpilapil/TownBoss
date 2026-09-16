# TownTraveler Implementation Plan / Development Dashboard

**Status:** DECIDED / PLANNED; greenfield implementation  
**Dashboard rule:** checkboxes are authoritative completion markers.

## Dashboard summary
- [ ] Phase 0 — Product/domain contracts complete.
- [ ] Phase 1 — Public discovery MVP complete.
- [ ] Phase 2 — Accounts and saved travel complete.
- [ ] Phase 3 — Trip Planner integration complete.
- [ ] Phase 4 — Shared-service integration complete.
- [ ] Phase 5 — Growth/content operations complete.
- [ ] Operational acceptance gate complete.
- [x] TownTraveler designated Reference Implementation / Pilot #1 for `TOWNBOSS_SITES_PLATFORM`.

## Mission
Web-first, SEO-oriented Philippine travel discovery and planning product connected to the TownBoss ecosystem. TownTraveler is also the first proving consumer of TownBoss Sites: generic website composition should be supplied by Sites while tourism semantics remain TownTraveler-owned.

## Product direction checklist
- [ ] Guest browsing implemented.
- [ ] Google/Facebook and GlenTown sign-in paths designed and verified where approved.
- [ ] Places, Experiences, Stays, Events, Food and Marketplace discovery implemented.
- [ ] Nationwide travel coverage supported through quality-controlled content operations.
- [ ] Shared Trip Planner/orchestration integration implemented.
- [ ] Daily travel-business seeding process defined with provenance and quality rules.
- [ ] TownTraveler site composition validated through TownBoss Sites without weakening SEO/public performance.

## Architecture principles
- [x] TownTraveler is a web product, not merely a reskinned GlenTown Flutter route.
- [x] TownTraveler is the approved TownBoss Sites Reference Implementation / Pilot #1.
- [ ] SEO/shareability/structured data/fast public pages remain first-class acceptance criteria.
- [ ] Shared TownBoss/GlenTown APIs are consumed through explicit contracts.
- [ ] Authoritative ownership of shared travel data is documented before implementation.
- [ ] Generic site/page/theme/block concerns are delegated to TownBoss Sites where the abstraction is proven.
- [ ] Tourism-specific discovery, ranking, content semantics and travel workflows remain TownTraveler-owned.
- [ ] Dynamic website blocks bind to authoritative providers rather than copying business-domain data into page content.

## Phase 0 — Product/domain contracts
**Status:** NEXT
- [ ] Decide authoritative ownership for places.
- [ ] Decide authoritative ownership for stays.
- [ ] Decide authoritative ownership for events.
- [ ] Decide authoritative ownership for food.
- [ ] Decide authoritative ownership for experiences.
- [ ] Define GlenTown reuse vs TownTraveler-specific content.
- [ ] Define account-linking architecture.
- [ ] Define SEO URL taxonomy.
- [x] Register TownBoss Sites as the generic website/platform boundary and TownTraveler as Pilot #1.
- [ ] Validate the provisional Sites classification matrix against concrete TownTraveler implementation requirements.
- [ ] Approve the minimum Sites Core contract required by Phase 1.
- [ ] Approve the TownTraveler vertical-extension boundary.

### Provisional Sites classification
- **SITES_CORE:** site/page routing, navigation, domains, media, themes/design tokens, page/section/block composition, publishing and generic SEO metadata hooks.
- **GENERIC_PLUGIN / SHARED SERVICE:** forms, gallery, maps presentation, reviews presentation, payments/deposits presentation, CRM integration and other reusable capabilities where authoritative services remain external.
- **TOWNTRAVELER_VERTICAL_PLUGIN:** destinations, tourism places/discovery, experiences/tours, accommodation/stays, food tourism discovery, tourism events, tourism search/filter semantics and Trip Planner presentation/integration.
- **SITE_CONFIGURATION:** TownTraveler homepage composition and visual identity.

This classification is a planning baseline, not permission to prematurely generalize. Use extract-now, contract-now, extract-later and keep-vertical decisions as implementation evidence becomes available.

### Gate
- [ ] Domain/ownership/SEO contract review passes.
- [ ] TownBoss Sites core/plugin/vertical boundary review passes.

## Phase 1 — Public discovery MVP
- [ ] Destination pages implemented.
- [ ] Place/stay/food/event/experience pages implemented.
- [ ] Search/filter implemented.
- [ ] Maps integrated.
- [ ] Structured data and OpenGraph implemented.
- [ ] Guest-first browsing verified.
- [ ] Generic site composition is provided through the approved Sites Core boundary where justified.

### Gate
- [ ] Public discovery SEO/performance/quality criteria pass.
- [ ] TownBoss Sites integration does not degrade SEO, performance or domain authority.

## Phase 2 — Accounts and saved travel
- [ ] Sign-in implemented.
- [ ] Favorites/saved places implemented.
- [ ] Trip workspace implemented.
- [ ] Cross-device persistence verified.

### Gate
- [ ] Account/privacy/session acceptance criteria pass.

## Phase 3 — Trip Planner
- [ ] Shared orchestration contract identified.
- [ ] Itinerary goals/constraints supported.
- [ ] Dependencies/resources/bookings modeled without duplicating authoritative systems.
- [ ] Route/time/cost/exception handling integrated.

### Gate
- [ ] Trip Planner end-to-end acceptance passes.

## Phase 4 — Shared-service integration
- [ ] Supported GlenTown/TownBoss service integrations identified.
- [ ] Integration contracts preserve authoritative ownership.
- [ ] Duplicate business logic is avoided.
- [ ] Reusable website-facing integrations use governed Sites plugin contracts where appropriate.

### Gate
- [ ] Shared-service integration review passes.

## Phase 5 — Growth and operations
- [ ] Nationwide content seeding process operational.
- [ ] Business onboarding pathways operational.
- [ ] Analytics/SEO dashboards operational.
- [ ] Editorial/quality workflow operational.

### Gate
- [ ] Growth/content quality gate passes.

## Operational release checklist
- [ ] All activated phase gates passed.
- [ ] Security/privacy/compliance review complete.
- [ ] SEO/performance acceptance complete.
- [ ] TownBoss Sites plugin/permission trust boundary passes for activated extensions.
- [ ] Memory and Current State reflect verified release state.
