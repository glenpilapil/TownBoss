# GlenTown Supersession Register

**Status:** CANONICAL / PROJECT-SPECIFIC

This register preserves replaced product and documentation decisions without
rewriting their historical evidence. It is read with `GLENTOWN_DECISIONS_AND_RULES.md`
and the project implementation plan. App-local documents must link here rather
than creating competing governance authorities.

| Superseded decision | Historical source / date | Replacement decision | Current authority | Implementation impact |
| --- | --- | --- | --- | --- |
| Visible navigation label `Messages` | Early MVP navigation/inventory documents | Visible label is `Chat`; `/messages`, `MessagesScreen`, and messaging internals remain valid technical names. | This register; App UI Authority Recovery | Do not rename technical identifiers only to change customer copy. |
| Oversized/special Create FAB or notch | Historical mobile-shell variants | Create is a regular peer destination. | This register; App UI Authority Recovery | Do not restore a center FAB, logo button, notch, or cradle. |
| Create long-press AI entry | Historical shell variants | Long-press on the You avatar is reserved for Ask Glen when real functionality exists. | This register; App UI Authority Recovery | Do not expose a placeholder or move the reservation to Create. |
| Shopping / Food & Dining / Travel & Tours / Community primary grid | Original MVP Explore intent grid | Products, Foods, Services, Tourism, Jobs, Events, Properties, Suppliers, Directory. | This register; GlenTown Decisions and Rules | Historical grids may remain only when marked `SUPERSEDED` or `HISTORICAL`. |
| Places / Foods / Services / Products / Events / Tourism / Jobs / Professionals / Directory primary taxonomy | 2026-09-11 Explore recovery taxonomy | Products, Foods, Services, Tourism, Jobs, Events, Properties, Suppliers, Directory. Places and Professionals remain valid concepts, not primary categories. | This register; GlenTown Decisions and Rules | Do not restore Places or Professionals as primary Explore categories. |
| Puerto-Princesa-only product availability | Early MVP/pilot documents | Puerto Princesa is the deepest operational pilot; nationwide signup/access may coexist with staged activation, seeding, and location-specific capability availability. | GlenTown Decisions and Rules; GlenTown Implementation Plan | Keep pilot density, account availability, capability availability, seeded readiness, and commercial activation distinct. |
| Consumer-facing City/Municipality terminology | Earlier App architecture documents | Use `Town` in shared consumer UI; retain City/Municipality for precise official, API, model, analytics, legal, and admin contexts. Addresses are Province -> Town -> Barangay; Barangay is not normal discovery scope. | This register; App Architecture Baseline amendment | Do not weaken precise geographic domain semantics. |

## Platform and persistence clarification

- Android physical acceptance is the current Beta release gate. Web/Windows
  adaptive implementation remains active; iOS is operationally deferred until
  Android Beta readiness.
- Offline GlenTown is **DECIDED** as a roadmap principle: preserve appropriate
  cached information, permit safe selected actions to queue, communicate
  freshness, and never fake real-time availability, payments, or authoritative
  completion.
- The current Flutter App has only narrow persistence (secure token storage,
  limited preferences, image disk cache, in-memory feed reuse, and connectivity
  awareness). General persisted content caching, offline reads/writes,
  synchronization, conflicts, and offline-first architecture are not implemented.
  A Beta persistent-content-cache contract is the next bounded decision; no
  encrypted-SQLite decision is established by this register.
