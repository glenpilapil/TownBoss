# GlenTown App Site Decisions and Rules

**Status:** ACTIVE

## Product / Release Truth

- `app.glentown.com` is the public product/download/acquisition/Beta site for GlenTown.
- `glentown.com` remains the consumer web application.
- Release/download CTAs are configuration-driven.
- Never fabricate app-store links, Windows artifacts, Beta links, ratings, reviews, testimonials, download counts, partners, adoption, scarcity, merchant/provider density, government endorsement, or unrestricted API access.
- If a required authoritative URL/artifact is missing, render a truthful non-actionable or informational fallback rather than a dead link.
- Planned/approved capabilities must not be presented as already live without evidence.

## Public Terminology

- Public marketing uses **Digital Town**.
- Do not use `DTOS` in public App Site copy.
- Do not use `Digital Town Operating System` in public App Site copy unless later explicitly approved.
- Use `Town` as the friendly shared term for City/Municipality where appropriate.
- Approved Explore labels are:
  - Products
  - Foods
  - Services
  - Tourism
  - Events
  - Jobs
  - Properties
  - Suppliers
  - Directory
- Superseded public labels `Shopping`, `Food & Dining`, and `Travel & Tours` must not return.
- `Achieve` is the approved public name; do not revert to `Aspirations`.

## Geography / Rollout

- Palawan is the Day-1 supported pilot province.
- Puerto Princesa is the deepest initial concentration / operational-density market.
- Other Palawan towns/municipalities may be supported from Day 1 while local supply and feature depth vary by readiness.
- Nationwide registration and selected low-dependency capabilities may coexist with staged local depth.
- Do not imply equal commercial density across Palawan or nationwide.

## Brand Assets

- Use official GlenTown brand assets unchanged.
- Do not redraw, recolor, stylize, or invent alternate logos.
- Platform identity must use appropriate official marks/assets where available.

## Theme

- Default to device/system appearance.
- User can explicitly choose System / Light / Dark.
- Persist user preference.
- Both themes require visual review.
- Theme control belongs in the Header.
- Footer must not duplicate theme controls.

## Navigation

Approved desktop structure:

`Logo | Home | Features ▾ | Beta | Download | Open Web App | Theme`

Rules:

- Logo -> `/`.
- Home -> `/`.
- Features is itself clickable -> `/features`.
- Features submenu:
  - For Tourists -> `/features/tourists`
  - For Residents -> `/features/residents`
  - For Organizations -> `/features/organizations`
  - For Developers -> `/features/developers`
- Beta -> `/beta`.
- Download -> `/download`.
- `Open Web App` is a persistent header utility action and is removed from Hero.
- Desktop active route = active text color + underline.
- Preserve `aria-current="page"`.
- Mobile navigation must be keyboard/touch accessible and keep Features expandable.
- Header may be sticky with subtle readability treatment on scroll if accepted visually.

## Hero

- Hero primary CTA: `Join the Beta`.
- Hero secondary CTA: `Learn More`.
- `Learn More` scrolls to the first explanatory Home section.
- `Open Web App` is not a Hero CTA.
- Preserve an affordance that more content follows, subject to reduced-motion/accessibility.
- Do not overload Hero with planner names or architecture terms.

## Information Architecture

The prior one-page-only approach is superseded.

Home remains a concise narrative/acquisition page; deeper content moves to focused routes.

Approved route family:

- `/`
- `/features`
- `/features/tourists`
- `/features/residents`
- `/features/organizations`
- `/features/developers`
- `/beta`
- `/download`

Home must summarize Features, Beta, and Download without duplicating their complete content.

## Features / Digital Town Scope

The public Digital Town must not be simplified into only the orchestration/planner features.

It should connect, where accurate:

- Community and participation
- Products / Pre-Loved
- Foods
- Services / professionals
- Tourism
- Events
- Jobs/opportunities
- Properties
- Suppliers
- Directory / Places / discovery
- Messaging / requests / group participation
- reviews / reputation / Trust & Verification
- orders / bookings / reservations / scheduling / checkout
- Personal Timeline
- private Diary
- Memory Albums
- Day Planner
- Trip Planner
- Event Planner
- Financial Planner
- Achieve
- businesses / organization participation
- government/civic-service access and integrations
- shared platform/developer capabilities

Availability and maturity must remain truthful.

## Timeline / Diary / Memories

- Personal Timeline, Diary, and Memory Albums are distinct product concepts.
- Diary is private and must never be marketed as automatically public.
- Timeline/public sharing must respect actual privacy and conversion rules.
- Memories may be used in storytelling where supported, especially Residents and Tourists.

## Government / Civic Services

Government integration is a major Digital Town direction and should be visible in Features and relevant audience stories.

Rules:

- government systems remain authoritative;
- GlenTown is not an LGU system and does not replace government databases;
- do not imply government endorsement;
- describe requirements, discovery, planning, identity/verification, messaging, payments, citizen-report, and related integrations only where authorized/implemented;
- DICT eGov ecosystem services such as eGov SSO, eVerify/PhilSys, eMessage, eGovPay, liveness, citizen reports, and DBM Compass are high-priority integration references, not automatic claims of current availability.

## Audience Pages

Every Features submenu page requires both audience-specific capability groups and a realistic story section showing how connected GlenTown features help that audience.

### For Tourists

Story pattern:

`Discover Palawan -> Build your trip -> Book and coordinate -> Experience locally -> Keep the memories`

### For Residents

Story pattern:

`See what's happening -> Find what you need -> Get it done -> Stay connected -> Keep your story`

The page should show multi-role identity: the same person may buy, sell, work, learn, travel, provide services, join organizations, and participate in community life.

### For Organizations

The taxonomy remains general `Organizations`, but public marketing emphasis is **business organizations first**.

Story pattern:

`Establish your presence -> Get discovered -> Receive an inquiry/order/booking -> Serve and communicate -> Build reputation -> Grow operations`

Do not represent future full Business Platform capabilities as current MVP functionality.

### For Developers

Story pattern:

`Register interest -> Approved access when available -> Use shared GlenTown capabilities -> Build a specialized experience -> Respect domain authority`

Do not imply unrestricted API access.

## Developer / Partner Interest

- Use an accessible modal, not a dedicated form route.
- The form must not consume a whole page unnecessarily.
- Provide keyboard/focus/escape/close behavior, validation, success/error states, and production anti-abuse controls.
- Do not promise immediate API credentials.

## Beta

- `/beta` is the definitive Beta participation/rollout page.
- It must explain Palawan Day-1 support and Puerto Princesa deepest initial density.
- It must explain local capability depth/readiness honestly.
- Include a `Help shape GlenTown` Survey Forms section using only current authoritative survey URLs.
- Survey links must be verified before implementation and labeled by audience.

## Download

`/download` presents four access surfaces:

- Android
- iOS
- Windows
- Web

Rules:

- Windows is an approved future deployment target and should appear with truthful roadmap/status language.
- Do not show a Windows download action until an authoritative artifact/source exists.
- Web access routes to the authoritative GlenTown Web destination.
- Version / Requires / Updated values must remain evidence-aware; temporary values requiring later release verification must not silently become permanent truth.

## Device Frames

- Approved direction remains Samsung Galaxy A55-inspired where a phone frame is useful.
- Small centered circular punch-hole only.
- No notch or Dynamic Island.
- Do not force screenshots into excessively rounded clipping masks.
- Device frames are optional presentation tools, not the default treatment for all product media.

## Composition / Photography

- Do not use arbitrary/random device angles.
- Avoid a repeated wall-of-phones visual language.
- Use photography, UI fragments, raw screenshot crops, icons, typography, and restrained artwork where better suited.
- Story sections must preserve recognizable people/context and avoid destructive cropping.
- Current screenshot content is replaceable and must not become the structural authority of the site.

## Visual Design Authority

Major sections should adapt named reference patterns where useful rather than rely on unconstrained AI art direction.

Current controlled hybrid references remain:

- bohd4nx/app-landing — typography, restraint, screenshot gallery/lightbox, FAQ patterns.
- Sofiyev mobile-app landing — media diversity, photography-led sections, adapted hero/decorative patterns.
- Prooland / Allon / Appilo — premium visual benchmark.
- GlenTown — product/content/brand/release truth.

## Content / Psychology Rules

- One section = one primary communication job.
- Home summarizes; Features expands; audience pages contextualize.
- Use progressive disclosure.
- Avoid taxonomy fatigue.
- Prefer outcomes over internal module names.
- Audience cards must not resemble pricing tiers.
- No fake urgency, scarcity, testimonials, ratings, metrics, press, or partner logos.
- Trust/product proof should precede high-commitment conversion where practical.
- Connected stories should demonstrate why GlenTown's breadth belongs in one Digital Town.

## Engineering vs Visual Gates

- lint/typecheck/tests/build passing = engineering evidence.
- human browser/device visual acceptance = visual evidence.
- Neither substitutes for the other.
- Agents must not claim visual success from code inspection alone.

## Documentation Discipline

- Later explicit user decisions supersede earlier assumptions.
- Superseded rules must be reconciled, not silently duplicated.
- Update Current State, Implementation Plan, Visual Audit Ledger, and Memory after material changes.
- The Implementation Plan is the primary UI/UX cross-check document for the next architecture pass.