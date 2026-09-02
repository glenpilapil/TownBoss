# TownBoss Capability Boundaries

**Status:** Canonical foundation v1

## Boundary test

Every substantial capability must answer:

1. What does it own?
2. What explicitly does it not own?
3. Which layer owns it: Platform Core, Shared Domain, or Product?
4. Which products currently consume it?
5. Which products are plausible future consumers?
6. What interfaces may consumers use?
7. Does any dependency point upward into product-specific semantics?
8. Is physical extraction justified now, or is a logical boundary sufficient?

## Ownership principle

A capability owns its generic concepts and lifecycle, not every business workflow that happens to use those concepts.

Examples:

- Messaging may own conversations, participants, messages, attachments, and delivery/read state. It does not own marketplace orders, property inquiries, or travel bookings.
- Payments may own payment intents, settlement state, ledgers/credits where applicable, and payment-provider integration. It does not own the commercial meaning of a property reservation or food order.
- Evidence/Provenance may own sources, observations, confidence, verification, supersession, and temporal evidence relationships. It does not decide whether a GeoPlotter tree must be preserved or whether a RealWise listing is commercially acceptable.
- Orchestration may own task/dependency/gate execution primitives. It does not own the domain-specific eligibility rule that a government service, trip, or development workflow supplies.

## Dependency direction

Preferred:

`Product -> Shared Domain -> Platform Core`

Forbidden by default:

`Platform Core -> Product-specific implementation`

Exceptions require an explicit architecture decision and evidence that the supposed product concept is actually a missing generic abstraction.

## Contract discipline

Shared capabilities should expose stable interfaces rather than inviting consumers to depend on undocumented internals. Internal application APIs, intentionally exposed public APIs, and external-integration APIs must remain distinguishable.

## Status discipline

The registry must distinguish architectural approval from implementation reality. `planned`, `partial`, `implemented`, `mock`, `blocked`, and `deferred` are materially different states. Documentation must not imply that a capability exists merely because its architecture is approved.
