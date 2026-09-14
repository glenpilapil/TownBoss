# GlenTown Web/Windows Chat and Profile Authority

**Status:** CANONICAL / APPROVED DIRECTION
**Scope:** GlenTown Flutter Web and Windows consumer surfaces
**Parent authority:** `GLENTOWN_WEB_WINDOWS_VISUAL_AUTHORITY.md`
**Date established:** 2026-09-14

This document extends the canonical Web/Windows visual authority with the approved Chat, owner You/Profile, public Profile and shared right-rail geometry decisions. It does not replace the parent authority. Where generated concept imagery differs from these written rules, the written rules are authoritative.

## Shared desktop content grid

All reviewed desktop surfaces use the same shell authority: persistent left sidebar and persistent topbar, with the page changing the main workspace rather than rebuilding navigation per screen.

Whenever a page uses a contextual right rail, the rail uses the **same standard width and gutter across GlenTown Web/Windows**. This applies to Home, Explore, Create, Chat, owner You/Profile, public Profile and future surfaces that adopt the same pattern.

The main workspace consumes the remaining bounded width. The right-rail boundary should not jump horizontally when the user moves between screens. A page that does not need contextual rail content must not invent filler simply to occupy the space; it may use the available workspace according to that page's approved composition.

## Chat — approved desktop baseline

The generated Chat concept is **structurally approved**. Remaining visual issues are minor polish such as gaps, spacing and corner radii rather than a major layout redesign.

Chat remains inside the persistent GlenTown desktop shell.

### Chat information architecture

Chat contains three internal communication/discovery destinations:

- **Chats** — direct conversations, group conversations, unread state, requests and conversation search/filtering according to implementation truth.
- **Contacts** — eligible people/connections with whom the user can initiate a conversation.
- **Chatrooms** — GlenTown's established chatroom/community-room capability, including anonymous behavior only where the real domain contract supports it.

Contacts and Chatrooms belong **inside Chat**. They are not additional primary left-sidebar navigation peers beside Home, Explore, Create and Chat.

### Conversation workspace

The approved desktop structure is conceptually:

**Chat inbox/navigation column → active conversation workspace → standard contextual right rail**

The active conversation remains the dominant surface. The right rail may show capability-truthful counterpart/listing/organization context and useful actions without becoming filler.

### Transactions inside Chat

Chat is a **transaction-capable communication surface**, not a separate commerce or booking engine.

Where the conversation counterpart and domain genuinely support them, Chat may expose contextual actions such as:

- Book
- Order
- Reserve
- Request Quote
- Add to Cart
- other domain-appropriate actions

Actions may appear as clear buttons in the conversation/context panel rather than forcing an entire transaction form into message bubbles.

Approved flow:

**conversation → contextual action → authoritative GlenTown transaction flow → structured transaction/status card returned to conversation**

Pricing, inventory, availability, booking confirmation, payment, refund, cancellation and other protected transaction state remain authoritative in the relevant GlenTown backend/domain services. Chat may display and initiate those workflows but does not independently own their truth.

Structured cards may represent booking requests, order summaries, quotes, deposits/payment status, confirmations, cancellations, rescheduling and similar real domain events.

### Future organization Glen AI

Organizations may eventually opt into **Glen AI for organization chats** so Glen AI can answer customer inquiries using organization-approved knowledge and permitted GlenTown capability context.

This is optional and organization-configurable. Configuration should cover enabled/disabled state, allowed knowledge sources, permitted actions, escalation/handoff behavior and other appropriate boundaries.

Customers must be able to tell when they are interacting with **Glen AI on behalf of the organization** rather than a human staff member.

Glen AI may answer capability-truthful questions and guide users toward native actions such as Book, Order, Reserve or Request Quote. It must not become an alternate authority for protected pricing, inventory, availability, payments, refunds, account changes or other backend-authoritative state. Human escalation/handoff is required as part of the future design.

## Owner You/Profile — approved desktop baseline

The generated owner-facing You/Profile concept is a **strong visual baseline**, subject to the shared grid and the corrections in this document.

It remains inside the persistent desktop shell and uses the standard main-workspace/right-rail geometry.

### Owner profile tabs

The approved profile tab set is:

**Overview · Timeline · Activity · Details · Posts · Saved · Followers · Following**

Semantics:

- **Overview** — high-value summary of the user's GlenTown identity and personal operating context.
- **Timeline** — the user's chronological personal history/timeline surface.
- **Activity** — actions/interactions across GlenTown such as listings, bookings, reviews and other capability-truthful activity.
- **Details** — profile/about information that should not overload Overview.
- **Posts** — Community posts owned/published by the user.
- **Saved** — the user's saved content according to supported domains.
- **Followers** — users following the profile.
- **Following** — profiles/accounts the user follows.

### Owner operating capabilities

Owner mode may expose established personal-management destinations including:

- Your Orders
- Your Calendar — bookings, reservations and invitations according to existing authority
- Your Places
- Job Seeker Profile
- App & Account Settings
- Trust & Verification
- Achieve/goals
- other personal capabilities only when supported by current GlenTown product/domain truth

Profile completion and other contextual owner modules may use the standard right rail where useful. Do not expose invented capability states merely to fill the rail.

The latest saved avatar and current Display Name must propagate consistently to owner identity surfaces.

## Public-facing Profile — approved desktop baseline

Public Profile and owner You/Profile are **not separate visual systems**. They share one desktop Profile architecture and size structure.

The governing principle is:

**one Profile architecture → owner and visitor modes → capability/privacy-driven differences**

### Shared profile structure

Use the same:

- persistent GlenTown shell
- standard main-column/right-rail geometry
- profile header architecture
- cover/avatar/identity hierarchy
- profile tab system where visibility is permitted
- content-card design language

The public-profile concept's original full-width cover is superseded. The cover/header must be **bounded to the standard main-column width**, approximately matching the owner-profile main card structure, rather than spanning across both the main workspace and right rail.

The **standard-width right rail begins at the top alongside the profile header**, preserving the same horizontal grid used elsewhere in GlenTown Web/Windows.

### Visitor-mode differences

When someone views another user's profile, owner-management controls are replaced by capability- and relationship-appropriate public actions such as:

- Follow
- Message
- appropriate relationship/context actions where supported
- overflow/context actions
- Report

Only information the profile owner is permitted to expose should render publicly. Public Profile must not leak owner-only management state merely because the owner version uses the same structural component.

Public-facing tabs/content follow the same semantic model as the owner profile, but visibility of Timeline, Activity, Details, Posts, Saved, Followers and Following is governed by privacy and capability rules. `Saved` in particular must not be assumed public merely because it exists in the shared owner tab architecture.

## Relationship to previously approved pages

The cross-screen right-rail rule applies retroactively to the reviewed Home, Explore and Create concepts. Generated images may show slightly different rail widths; those differences are not authoritative.

Home retains its approved resident-dashboard/community composition and media-ratio rules. Explore retains its approved top-level discovery architecture and exact primary taxonomy. Create retains its approved choice-first creation hub and prerequisite-routing rules. Chat and Profile now join those surfaces under the same desktop shell/grid discipline.

## Verification boundary

These are approved design/product decisions only. They are not implementation, automated verification, browser verification, Windows verification or physical PASS evidence. Implementation must be source/automated reviewed and then visually verified against this written authority before promotion.
