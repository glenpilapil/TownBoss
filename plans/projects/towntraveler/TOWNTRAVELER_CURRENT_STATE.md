# TownTraveler Current State

**Status:** DECIDED / PLANNED / GREENFIELD
**Dashboard:** `TOWNTRAVELER_IMPLEMENTATION_PLAN.md`

## Present truth
TownTraveler is a web-first, SEO-oriented Philippine travel discovery and planning product. It is not merely a reskinned GlenTown Flutter surface. Shared GlenTown/TownBoss capabilities should be consumed through explicit contracts.

TownTraveler is now the approved Reference Implementation / Pilot #1 for `TOWNBOSS_SITES_PLATFORM`. Generic website composition concerns should be proven through TownBoss Sites while tourism-specific semantics and workflows remain TownTraveler-owned. This does not authorize premature generalization or a broad website-builder implementation.

## Current priorities
- Decide authoritative ownership for places, stays, events, food and experiences.
- Define GlenTown reuse versus TownTraveler-specific content.
- Define account-linking architecture.
- Define SEO URL taxonomy and structured-data approach.
- Validate the provisional Sites Core / generic plugin / TownTraveler vertical plugin / site-configuration classification.
- Define the minimum Sites Core contract required for public discovery without weakening SEO/performance.

## Next action
Complete the Phase 0 authoritative domain/source ownership decisions, then validate the smallest TownBoss Sites contract needed by TownTraveler Phase 1 under TownBoss development rules.
