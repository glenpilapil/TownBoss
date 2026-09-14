# GlenTown Web/Windows Visual Authority

**Status:** CANONICAL / APPROVED DIRECTION
**Scope:** GlenTown Flutter Web and Windows consumer surfaces
**Date established:** 2026-09-14

This document records approved Web/Windows visual and interaction authority. It is distinct from the Samsung/mobile physical-audit stream. Generated concept images are layout/proportion references only; written rules here are authoritative where image details drift.

## Product principle

GlenTown Web/Windows should feel like a **Digital Town operating surface**, not a stretched mobile application.

Home priority: **resident dashboard first, Community/social feed second, marketplace/discovery portal third**, integrated around the active geographic context.

Use responsive disclosure and contextual modules rather than exposing every capability merely because desktop space exists.

## Persistent desktop shell

### Left sidebar

Use one GlenTown brand anchor in the sidebar. Do not duplicate the GlenTown logo/brand in the topbar.

Preserve four primary navigation authorities with visible desktop submenus where applicable:

- **Home**
- **Explore**
  - Products
  - Foods
  - Services
  - Tourism
  - Jobs
  - Events
  - Properties
  - Suppliers
  - Directory
- **Create**
  - Update
  - Looking For
  - Alert
  - Poll
  - additional Create types only according to established taxonomy, authorization and capability truth
- **Chat**

Keep **Help & Support** in the lower utility area and **You/Profile** at the bottom with the latest saved avatar.

Explore submenu items are children of Explore, not peer primary navigation. Do not change the authoritative Explore primary taxonomy as part of desktop work.

Places and Professionals retain their established uses (including Explore suggestion/discovery contexts); Places also retains its established Tourism role. Editor's Pick and other suggestion concepts retain their existing placements. Do not promote these into top-level Explore categories without an explicit later taxonomy decision.

### Topbar

Approved conceptual order:

**Location context | Map | Universal Search | Notifications | Calendar | Cart**

Location presentation uses precise geography on Web/Windows rather than the mobile compact `Town` abstraction. Example:

**Puerto Princesa**  
**City · Palawan | Map | Search GlenTown…**

For a municipality, show **Municipality**; for other supported geographic scopes, use the correct geographic type.

Map belongs to the location-context cluster. Activating Map converts the main content workspace into the full GlenTown Map experience. Its initial viewport/scope follows the active geographic context. Changing the active location changes the Map starting location accordingly. Normal map panning does not implicitly change the global GlenTown location context unless the user explicitly chooses to do so.

No fake/demo pins may be restored to conceal missing real map listing data.

Topbar utility order is binding: **Notifications → Calendar → Cart**.

Universal Search should be a substantial desktop search field, not merely a mobile-style icon.

## Platform entry/auth behavior

- Remove mobile onboarding entirely on **Web and Windows**.
- Remove Auth Landing entirely on **Web and Windows**. Public desktop surfaces enter the normal consumer experience; authentication actions route directly to Login/Register/etc.
- Mobile onboarding and mobile auth visuals are frozen and must not be modified by Web/Windows work without explicit authorization.
- Login, Register and Forgot Password layouts are currently acceptable.
- Web/Windows auth screens use a **landscape background asset**; asset to be supplied separately. Do not alter accepted mobile auth imagery.
- `Already joined? Sign in` needs additional vertical padding on Web/Windows only.
- Development registration must not be blocked by unavailable email delivery. Reconcile the existing `GLENTOWN_DEV_BYPASS_EMAIL_VERIFICATION` behavior without weakening production verification.

## Web routing and customer-safe errors

Web uses clean path URLs, e.g. `/home`, not hash URLs such as `/#/home`.

Routing must support refresh, direct navigation, deep links and server fallback. Windows is not subject to browser URL strategy.

Provide branded customer-facing handling for applicable common states: **400, 401, 403, 404, 408, 409, 422, 429, 500, 502, 503, 504, offline/network unavailable**. 404 integrates with clean path routing.

Never expose raw Flutter assertions, Laravel/PHP exceptions, stack traces, internal class names or similar technical failures to customers. Reusable error-state architecture should serve Windows where applicable.

## Web interaction and design-system behavior

Desktop must deliberately support hover, focus, cursor and keyboard states. Improve surface hierarchy in dark mode and other themes through the design system rather than indiscriminate font scaling. Secondary typography must remain readable, but desktop width/density is the primary layout concern.

## Home — approved layout direction

Use the persistent left sidebar + topbar shell, with two principal content columns:

1. **Main resident/Town operating column**
2. **Community column**

This supersedes the earlier stretched-feed composition.

### Main resident/Town operating column

Start with a substantial Town/location hero/cover using approved local/destination media. Increase hero height from the first concept so normal high-quality landscape photography is practical; do not require extreme panoramic assets or solve the problem through aggressive cropping. Use responsive focal-point handling.

The hero establishes the user's Town/local context and resident operating dashboard.

Expose orchestration actions:

- Plan my day
- Plan a trip
- Plan an event
- Achieve a goal

These connect to GlenTown's established orchestration/planner architecture.

Remove the earlier row of static Explore-category cards below the Community composer. The sidebar already exposes Explore categories and duplicate Home discovery cards are unnecessary.

The main operating column can then carry existing/contextual resident modules formerly envisioned in the right rail, such as **Around You, Your Day, Local Pulse, upcoming bookings/calendar context, recommendations, important local information, saved/pending activities**, and appropriate banner/ad placement. Do not invent filler solely to occupy space and do not redefine existing capability semantics.

### Community column

Quick Community Composer and Community Feed remain together as one social unit in the Community column.

Composer requirements include latest avatar, Display Name rather than legal/account name, and the prompt **“Share something with your town…”**. Current quick citizen taxonomy direction includes Update, Looking For, Alert and Poll, with media/check-in/tagging as capabilities where supported rather than invented peer taxonomies.

Community feed tabs are:

**For You · Following · Local · Events · Announcements · Looking For · Alerts · Polls**

Do not imply that **For You** is constrained to the active Town. Local is the location-scoped feed. A neutral `Community` section identity is safe; location-specific wording should match the selected feed scope.

Normal Community posts remain vertically composed:

**Author/metadata → Caption → Media → Engagement/actions**

Do not flatten ordinary social posts into horizontal desktop cards.

Community media preserves its source/intended ratio rather than being forced into a universal landscape rectangle:

- 4:5 portrait — 1080×1350 preferred feed portrait
- 1:1 square — 1080×1080
- 9:16 vertical — 1080×1920, constrained sensibly on desktop with immersive viewing where appropriate
- 1.91:1 landscape — 1200×630
- other legitimate upload ratios — preserve rather than arbitrarily crop

The Community column constrains post width; fixed-height landscape containers must not distort the media model.

Representative fixtures should look production-realistic. Do not expose wording such as `Synthetic ... demo content for GlenTown testing` in customer-facing fixture presentation.

## Explore — approved top-level page

The top-level **Explore** button has its own substantial discovery page; it must not merely redirect to one of its categories.

Retain the persistent desktop shell and show Explore as active with its nine authoritative submenu categories.

### Explore main content

Use a substantial, location-aware Explore hero with appropriate destination imagery and copy such as **Discover more in Puerto Princesa** when Puerto Princesa is the active context.

Explore may provide Explore-specific search/discovery controls without replacing persistent Universal Search.

Immediately below the hero, provide strong visual entry cards for exactly the authoritative top-level categories:

**Products · Foods · Services · Tourism · Jobs · Events · Properties · Suppliers · Directory**

Below the categories, progressively contextualize discovery rather than merely repeating taxonomy.

A **Featured in [current location]** section may surface curated useful discovery across appropriate GlenTown capabilities.

An **Explore by Location** section may enable geographic discovery beyond the immediate context while respecting the canonical geographic hierarchy and location-scope rules.

Approved Explore information flow:

**location → discovery → categories → curated content → geographic exploration**

Use legitimate backend data and representative fixtures; do not make decorative frontend mocks authoritative.

## Visual-reference status

The approved generated Home concept is authoritative only for broad framing/proportions after the written corrections above. Its invented labels, taxonomy, generic filler and forced landscape Community-media treatment are explicitly not authoritative.

The generated Explore concept is **strongly approved as the top-level Explore visual baseline**, subject to this document's exact shell, taxonomy, data-truthfulness and interaction rules.

## Verification rule

These are approved design/product decisions, not implementation or physical-verification evidence. Implementation must receive automated/source review and then Web/Windows visual verification. Do not mark a surface visually passed merely because it matches a concept image or worker report.
