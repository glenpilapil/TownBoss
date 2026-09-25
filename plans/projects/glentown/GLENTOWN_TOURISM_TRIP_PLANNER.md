# GlenTown Tourism Browse Mode and Trip Planner Orchestration

**Status:** CANONICAL PRODUCT DIRECTION / BROWSE MODE IMPLEMENTATION NEXT / PLAN MODE DEFERRED

**Date:** 2026-09-25

This document defines the current Tourism mobile UX direction and the Trip Planner orchestration contract discussed and approved on 2026-09-25. It complements the GlenTown Implementation Plan, Decisions and Rules, Current State, Capability Matrix, Scheduling architecture, and Orchestration Engine. Browse Mode is the next bounded App implementation target. Plan Mode is documented here but intentionally deferred until a later governed implementation pass.

## 1. Tourism has two persistent modes

Tourism is one screen with two explicit persistent modes:

- **Browse Mode** — ordinary Tourism discovery/search.
- **Plan Mode** — Trip Planner-oriented orchestration.

The top bar is intentionally compact:

- Browse: `Back | Tourism (Browse Mode) | Mode Toggle`
- Plan: `Back | Tourism (Plan Mode) | Mode Toggle`

The former Filter icon is removed from the Tourism top bar. The selected mode persists as a user-scoped UI preference until the resident switches it again.

Browse search never implicitly starts Plan Mode. Plan Mode is entered only through the explicit mode control or another authoritative Trip Planner entry.

## 2. Browse Mode

Browse Mode retains the Tourism discovery banner and ordinary Tourism search.

### 2.1 Primary discovery pills

The first content taxonomy depends on geographic context.

**City / Municipality / Town context**
- All
- Places
- Experiences
- Stays
- Deals

**Province / National / above-Town context**
- All
- Destinations
- Experiences
- Stays
- Deals

The distinction is semantic: a resident already inside a Town discovers local Places; a resident browsing a Province or National scope discovers Destinations. Place records must not be relabeled as Destinations merely to satisfy the UI.

### 2.2 Deals filters

When Deals is selected, expose the compact secondary filters:

- All Deals
- Tour Packages
- Last Minute
- Promos
- Solo
- Joiner
- Private

These are filters, not sort options.

**Solo** describes traveler/party eligibility. **Joiner** and **Private** describe group fulfillment and are not the same dimension. Valid combinations include Solo + Joiner and, where the offer permits it, Solo + Private.

Last Minute is an eligibility condition based on authoritative travel/booking timing; it is not synonymous with discounting and must not become a sort order.

### 2.3 Sort

Tourism Sort follows the Product-style interaction pattern and remains independent from category/deal filters:

- Recommended
- Price: Highest to Lowest
- Price: Lowest to Highest
- Top Rated

Price sort is exposed only where an authoritative comparable price exists. Experiences, Stays, and Deals may support all four. Places/Destinations/All should default to Recommended and Top Rated unless a valid comparable-price contract is established. Do not fabricate price or rating data.

### 2.4 Browse truthfulness

Unsupported lanes or filters may be visible as approved taxonomy but must remain truthfully unavailable/disabled until authoritative API contracts exist. Do not populate Destinations, Experiences, Stays, or Deals with unrelated Place records or mock cards.

## 3. Plan Mode overview

Plan Mode hides the Browse banner and makes the trip-building context the primary visual hierarchy.

The planning surface should expose:

1. **Planning Destination**
2. **Natural-language Search**
3. **Inclusive Dates**
4. **Travelers: Adults and Kids**
5. **Rooms and/or Budget**, as relevant

The resident may type unrestricted travel intent in the search field. Structured controls are authoritative constraints and should not be inferred away by free text.

The Trip Planning Destination is separate from GlenTown's general browsing geographic scope. A resident may browse GlenTown at Philippines scope while planning a Puerto Princesa trip. Changing the trip destination must not silently change the whole app's selected geographic scope.

## 4. Conditional planning steps

The guided plan is dependency-aware, not a fixed OTA form.

### Step 0 — Destination

Step 0 appears when the orchestrator has not resolved a sufficiently specific destination.

Destinations/Places may be **multi-selected and ordered**. Multiple selections form a route, not merely a filter set.

Example:
- Puerto Princesa -> El Nido

A route such as El Nido -> Coron remains valid only if an authoritative feasible inter-destination connection (for example ferry or flight) can fit the trip dates. The planner should not prohibit an island destination categorically; it should surface the transport dependency.

The resident should be able to reorder destinations. The orchestrator must validate route feasibility and allocate the inclusive trip dates across destinations.

### Step 1 — Experiences

When a destination is already sufficiently resolved, planning begins here.

Experiences are multi-selectable. Selection is constrained by:
- inclusive dates;
- duration;
- schedule conflicts;
- participant count/eligibility;
- authoritative availability;
- budget where available;
- transport/pickup requirements.

The planner should not silently accept an obviously impossible set of full-day activities into a shorter trip. It should surface conflicts and propose feasible scheduling.

### Step 2 — Stay and Room

Select accommodation, then the applicable room/unit.

Stay recommendations should consider:
- selected destination(s);
- dates;
- party composition;
- selected Experiences and their locations/times;
- remaining budget;
- transport convenience;
- authoritative availability.

Accommodation inclusions become orchestration facts, not decorative badges. Examples include:
- Breakfast Included
- Airport Pickup Included
- Airport Drop-Off Included
- Round-Trip Airport Transfer Included
- Shuttle Available
- Transfer Fee Required

### Add-On — Food Stops

Food Stops are optional and multi-selectable before the final Trip Planner schedule is assembled.

The planner may surface Restaurants, cafés, and other eligible Food Providers using the trip's emerging context:
- stay location;
- selected experiences;
- free meal windows;
- party size;
- budget;
- included meals.

The user does not need to pre-plan every meal. If breakfast is already included by a Stay, that is treated as covered context so Trip Planner can focus on remaining meal opportunities.

### Add-On — Transportation

Transportation is resolved after the planner understands what selected components already include.

Every selected trip component may contribute:
- schedule;
- location;
- included pickup/drop-off;
- meeting-point rules;
- transport coverage.

The planner identifies uncovered movement segments rather than blindly recommending transport.

## 5. Starting and end points

Trip configuration includes:

**Starting Point**
- Airport
- Local Address

**End Point**
- Airport
- Local Address

Future supported transport hubs such as ports may be added without changing the underlying model.

If Airport is selected, capture relevant flight details where available:
- airport;
- arrival/departure date;
- arrival/departure time;
- airline;
- flight number (optional when not yet known).

Local Address should use a saved/pinned GlenTown address where available rather than relying only on free text.

Start and end points may differ. A multi-destination trip may start at Puerto Princesa Airport and end at Busuanga/Coron Airport.

## 6. Transport coverage and commute guidance

Accommodation and Experience transport inclusions must be respected.

Examples:
- hotel offers free airport transfer;
- tour operator offers hotel pickup and drop-off;
- package includes inter-destination transfer.

Covered segments must not be recommended again as paid transport.

Until GlenTown has Riders/on-demand dispatch, simple one-way or round-trip transport remains **informational** through **Commute Options**. Where authoritative data exists, Trip Planner may show available commute modes, route/terminal information, expected duration, operating window, and indicative fare. It must not imply that GlenTown can dispatch a ride.

## 7. Vehicle Rentals

Vehicle Rentals are a conditional, bookable recommendation when authoritative inventory exists and the trip has meaningful uncovered transport needs.

Minimum rental duration:
- **Car: 8 hours**
- **Motorcycle: 24 hours**

Availability must cover the required rental period. Recommendations should consider:
- party size;
- luggage capacity;
- self-drive vs with driver;
- pickup/drop-off location;
- delivery availability;
- minimum duration;
- daily/hourly rules;
- deposit;
- fuel/mileage policy;
- trip budget.

A short transfer should normally receive commute guidance rather than an inappropriate vehicle-rental recommendation.

The same orchestration pattern may later apply to boat rentals.

## 8. Inter-destination transport

Transportation has two separate responsibilities:

1. **Inter-destination connectivity** — required to make a multi-destination route physically feasible.
2. **Local transport gaps** — airport/hotel/activity/food/free-time movements within a destination.

Inter-destination segments such as Puerto Princesa -> El Nido or El Nido -> Coron are hard itinerary dependencies. The trip cannot be treated as complete until each consecutive destination has a feasible connection or an explicit unresolved-transport warning.

## 9. Free Time orchestration

Trip Planner must not stop after arranging Tours/Experiences, Accommodation, Meals, and Transport.

After hard commitments are scheduled, identify genuine free-time windows and offer optional context-aware suggestions such as:
- walking/jogging/cycling/swimming;
- bars, live music, nightlife, karaoke;
- cafés and snacks;
- massage/spa/wellness;
- cinema/entertainment;
- parks, markets, shopping;
- sunrise/sunset/stargazing;
- culture/community/local events;
- beach/pool/rest;
- intentionally doing nothing.

Rest is a valid option. GlenTown must not try to fill every empty minute.

Free-time recommendations may draw from Tourism, Places, Foods, Services, Events, and other eligible GlenTown content. They should account for:
- true free duration after required buffers;
- current location;
- next scheduled location;
- travel time;
- opening/operating hours;
- weather/daylight where available;
- party context;
- budget;
- prior activity exertion;
- transport feasibility.

Suggestions remain soft/optional until selected. Once chosen, they become itinerary items and the planner recalculates schedule, budget, transport, and remaining free time.

## 10. Scheduling and orchestration rule

The governing principle is:

**Every selected trip component contributes schedule, location, inclusion, availability, and fulfillment facts. Trip Planner resolves what is already covered before recommending anything additional.**

A conceptual route is:

`Start Point -> Destination(s) -> Experiences -> Stay -> Food Stops -> Required Transport -> Free Time Suggestions -> End Point`

The actual timeline may interleave these by day. Calendar/Scheduling owns conflict and buffer evaluation; travel-domain capabilities retain authoritative booking/availability semantics.

## 11. Current implementation sequencing

**Next App pass: Browse Mode only**
- mode-aware top bar;
- persistent Browse/Plan toggle;
- Browse banner/search;
- context-sensitive primary pills;
- Deals subfilters;
- context-sensitive Sort;
- preserve existing Place media and geographic-scope behavior.

**Plan Mode implementation is deferred.** The toggle may expose only truthful Plan Mode scaffolding/placeholder state until the dedicated Plan Mode pass implements destination scope, structured trip context, orchestration steps, transport, food, and free-time behavior.

No Browse Mode search action may silently trigger the deferred Plan Mode.
