# GlenTown App Site Explore Category Pages Plan

**Status:** APPROVED / DEFERRED UNTIL CURRENT MULTI-PAGE UI/UX CHECKPOINT  
**Application:** `app.glentown.com`  
**Parent authority:** `GLENTOWN_APP_SITE_IMPLEMENTATION_PLAN.md`

## 1. Decision

GlenTown will add dedicated public Features pages for all nine approved Explore categories:

- `/features/products`
- `/features/foods`
- `/features/services`
- `/features/tourism`
- `/features/events`
- `/features/jobs`
- `/features/properties`
- `/features/suppliers`
- `/features/directory`

This work is approved and documented now, but it is **not part of the currently active Gemini implementation pass**. Do not add these routes to implementation prompts until the existing documented multi-page architecture — Home, Features overview, four audience pages, Beta, Download, Header/Footer, Digital Town scope, government integration, Palawan rollout, and related requirements — has passed human UI/UX review and reached an accepted committed/pushed checkpoint.

The purpose of documenting the work now is to prevent the decision from being lost while keeping the current acceptance target stable.

## 2. Why Dedicated Category Pages

The nine Explore categories are substantial product verticals rather than labels that should exist only as cards on `/features`.

Dedicated pages provide:

1. enough space to explain each vertical truthfully;
2. realistic stories showing how that vertical connects to other GlenTown capabilities;
3. stronger audience-to-capability navigation;
4. clearer internal linking across the App Site;
5. unique SEO search-intent surfaces without turning Home or `/features` into an exhaustive wall of content;
6. a durable national capability layer that is separate from location-specific operational/discovery content in the GlenTown consumer application.

These pages must be useful product pages first and SEO surfaces second. They must not become thin doorway pages.

## 3. Navigation Rule

Do **not** automatically place all nine categories in the current compact Header Features dropdown.

The current Header Features submenu remains audience-oriented:

- Overview
- For Tourists
- For Residents
- For Organizations
- For Developers

The `/features` overview should contain a prominent Explore-category area linking to the nine dedicated category pages.

A future mega-menu may expose category links if human UI/UX review shows that it improves navigation without making the Header unwieldy. A mega-menu is not required by this plan.

## 4. Shared Category-Page Structure

Every category page must contain unique, category-specific content. Use a common design system and reusable components, but do not generate nine near-identical SEO templates with only nouns swapped.

Recommended page architecture:

1. Category Hero
2. What you can do in this part of GlenTown
3. Core category capabilities
4. `How it comes together` / realistic story section
5. Connected Digital Town capabilities
6. Trust, verification, transaction, or safety context appropriate to the category
7. Availability / maturity / geographic-depth context where needed
8. Related Explore categories
9. Audience links where relevant
10. Clear next-step CTA

Each story should demonstrate an outcome, not merely repeat feature-card labels.

## 5. Category Requirements

### 5.1 Products — `/features/products`

Explain local product discovery and commerce, including where accurate:

- local Products
- Pre-Loved relationship where appropriate
- sellers/businesses
- product discovery/search
- local availability
- messaging/inquiries
- cart/order/checkout behavior where supported
- fulfillment/pickup/delivery semantics where supported
- reviews/reputation/trust
- related Suppliers and Directory connections

Story example: discover a locally available product -> evaluate seller/trust -> ask a question if needed -> order/buy -> coordinate fulfillment -> review the experience.

### 5.2 Foods — `/features/foods`

Explain GlenTown Foods as local food discovery and transaction capability, not merely a restaurant directory.

Where accurate, include:

- food listings
- local food businesses
- discovery by place/category
- ordering/reservation/booking behavior where supported
- messaging
- reviews/trust
- Events/Tourism connections
- local business participation

Story example: discover what to eat nearby -> inspect a local food business/menu -> order or coordinate -> experience locally -> review/share appropriately.

### 5.3 Services — `/features/services`

Where accurate, include:

- service discovery
- professionals/providers
- provider profiles
- trust/verification/credentials where supported
- reviews/reputation
- inquiries/messaging
- service requests/bookings
- scheduling
- deposits where applicable
- Day Planner coordination of appointments/requirements where appropriate

Story example: resident needs help -> finds suitable provider -> checks trust/reviews -> messages/books -> coordinates prerequisites/timing -> service is completed -> experience contributes to reputation.

### 5.4 Tourism — `/features/tourism`

Where accurate, connect:

- destinations/places
- experiences/tours
- Foods
- Events
- stays/accommodation
- transfers/vehicle/boat rentals
- local Products
- reviews/trust
- provider messaging/bookings
- Trip Planner
- Timeline/Memory Albums after the experience where supported

Story example: discover Palawan -> compare experiences -> build itinerary -> coordinate stay/transport/activities -> experience locally -> keep memories.

Tourism must remain nationwide-capable in public positioning; Palawan is the Day-1 pilot province, not the permanent scope of Tourism.

### 5.5 Events — `/features/events`

Where accurate, include:

- event discovery
- local/community/business events
- event places/venues
- organizers
- attendance/invitations where supported
- service providers
- hosts/emcees/performers
- equipment/table/chair/tent/sound/lighting rentals where supported
- Foods/catering relationships
- Event Planner
- messaging/bookings

Story example: discover or plan an event -> identify venue/resources/providers -> coordinate requirements and schedule -> attend/execute -> retain relevant memories/reviews.

### 5.6 Jobs — `/features/jobs`

Where accurate, include:

- job/opportunity discovery
- job seeker profile
- employers/business organizations
- applications/interest flows
- messaging
- trust/business identity
- learning/skills and `Learn & Start a Business` / earning-path relationships where relevant
- career orchestration only where supported or clearly directional

Story example: resident identifies an opportunity -> checks employer/context -> presents profile/skills -> applies/connects -> coordinates next steps -> develops toward future earning/career goals.

### 5.7 Properties — `/features/properties`

Where accurate, include:

- property discovery
- sale/rent and other supported listing types
- location context
- brokers/agents/property professionals
- trust/verification
- inquiries/messaging
- viewing/appointment coordination
- related Services/Directory
- RealWise/GeoPlotter integration boundary where publicly appropriate

GlenTown must not pretend to be RealWise or absorb specialist real-estate domain authority. Specialized property systems remain authoritative for their specialist workflows where integrated.

Story example: discover a property -> understand location/listing context -> evaluate professional/trust signals -> inquire -> coordinate viewing/next steps -> continue through the appropriate specialist workflow.

### 5.8 Suppliers — `/features/suppliers`

Where accurate, include:

- supplier discovery
- business-to-business/local supply relationships
- Products/services supplied
- business profiles
- location/service area
- inquiries/messaging
- trust/verification/reputation
- Organizations/business operations relationships
- Directory connections

Story example: local business needs supplies -> discovers relevant supplier -> evaluates fit/trust -> sends inquiry -> coordinates supply -> establishes a reusable local business relationship.

### 5.9 Directory — `/features/directory`

Directory is a broad discovery layer, not merely a contact list.

Where accurate, include discovery of:

- businesses
- professionals
- organizations
- places
- local services
- government offices/public-service destinations where appropriate
- verified/trusted profiles where supported
- location-aware information
- pathways into the relevant Products/Foods/Services/Tourism/Events/Jobs/Properties/Suppliers experiences

Story example: user does not know which GlenTown vertical to start from -> searches/browses Directory -> identifies the relevant entity/place/professional/office -> moves into the appropriate connected GlenTown workflow.

## 6. Relationship to Audience Pages

Audience pages and Explore-category pages answer different questions and must not replace each other.

- Home: **Why should I care about GlenTown?**
- Features overview: **What does GlenTown contain as a whole?**
- Audience pages: **Why is GlenTown useful to someone like me?**
- Explore-category pages: **What can I do in this part of GlenTown?**
- Beta: **How can I participate now?**
- Download: **How can I access GlenTown?**

Create deliberate contextual links between these page families.

Examples:

- Tourists -> Tourism, Foods, Events, Products
- Residents -> Products, Foods, Services, Jobs, Properties, Directory
- Business Organizations -> Products, Foods, Services, Tourism, Jobs, Suppliers, Directory
- Developers -> relevant platform capabilities rather than indiscriminate links to every category

Category pages should likewise link back to relevant audience stories where useful.

## 7. SEO Requirements

Each category page must have unique search intent and substantive content.

Required when implementation begins:

- unique `<title>`
- unique meta description
- canonical URL
- Open Graph metadata where supported
- sitemap inclusion
- crawlable internal links from `/features`
- meaningful heading hierarchy
- descriptive anchor text
- unique story/content rather than templated noun replacement
- appropriate structured data only when the page/content genuinely qualifies
- no fabricated ratings/reviews/business counts/availability
- no location keyword stuffing
- no mass generation of thin city/municipality pages from this plan

These nine pages are the national/product-capability SEO layer. Location-specific discovery/content belongs to the appropriate GlenTown application/data/SEO strategy and must not be duplicated as thin App Site pages merely for search traffic.

## 8. Product-Truth and Maturity Rules

All existing App Site truth rules continue to apply.

- Distinguish current, Beta, rolling-out, planned, and `where supported` capabilities where needed.
- Do not imply every category has equal operational depth everywhere.
- Palawan is the Day-1 supported pilot province; Puerto Princesa is the deepest initial concentration.
- Do not fabricate inventory, businesses, jobs, properties, suppliers, events, reviews, ratings, integrations, government endorsement, or transaction availability.
- Government systems remain authoritative.
- Specialized vertical systems retain specialist domain authority.

## 9. Shared UI/UX Rules

The nine pages must look like one GlenTown website.

Reuse the accepted:

- Header/Footer
- typography
- spacing system
- color/surface language
- light/dark themes
- photography direction
- iconography
- story-sequence patterns
- trust/status patterns
- CTA hierarchy

Avoid producing nine visually identical card walls. Each vertical should have enough content/media variation to communicate its domain while retaining the same design system.

## 10. Deferred Implementation Gate

This phase MUST NOT start merely because this document exists.

Prerequisite checkpoint:

1. current multi-page implementation is complete;
2. Home, `/features`, four audience pages, `/beta`, and `/download` have been human-reviewed against the current implementation plan and acceptance criteria;
3. discrepancies have been corrected;
4. the result is considered satisfactory by the user;
5. a clean checkpoint is committed and pushed.

Only after that checkpoint may an implementation prompt include these nine routes.

## 11. Future Implementation Phase

### Phase R8 — Explore Category Pages — DEFERRED / APPROVED

- [ ] Confirm prerequisite multi-page UI/UX checkpoint is accepted.
- [ ] Re-audit current GlenTown-App taxonomy/product truth before coding.
- [ ] Implement `/features/products`.
- [ ] Implement `/features/foods`.
- [ ] Implement `/features/services`.
- [ ] Implement `/features/tourism`.
- [ ] Implement `/features/events`.
- [ ] Implement `/features/jobs`.
- [ ] Implement `/features/properties`.
- [ ] Implement `/features/suppliers`.
- [ ] Implement `/features/directory`.
- [ ] Add `/features` internal links to all nine pages.
- [ ] Add contextual audience-page cross-links.
- [ ] Add category-to-category related links where useful.
- [ ] Add unique metadata/canonical handling.
- [ ] Add sitemap entries.
- [ ] Audit structured-data eligibility per page.
- [ ] Run responsive/accessibility checks for every route.
- [ ] Run SEO/content-duplication audit.
- [ ] Run lint/typecheck/tests/build/`git diff --check`.
- [ ] Human visual audit all nine pages.

**Gate R8:** all nine pages are substantive, unique, truthful, internally connected, SEO-ready, visually coherent with the accepted App Site, and none behaves as a thin doorway page.

## 12. Future Human Cross-Check

Before R8 is accepted, reviewers must be able to answer YES to all of the following:

- Are all nine approved Explore categories represented by dedicated routes?
- Does every page explain real category-specific value rather than reuse generic copy?
- Does every page contain a realistic connected story?
- Does each page show how its vertical connects to the wider Digital Town?
- Are audience pages and category pages clearly differentiated in purpose?
- Is `/features` the primary discovery hub for these pages?
- Is Header navigation still usable rather than overloaded with nine additional links?
- Are SEO title/description/canonical/sitemap requirements satisfied?
- Are pages internally linked with meaningful anchor text?
- Are structured data and availability claims evidence-based?
- Are product maturity and geographic-depth statements truthful?
- Are there no thin location/keyword doorway pages?
- Does the nine-page family feel like one GlenTown product rather than nine microsites?

If any answer is NO, Phase R8 remains open.