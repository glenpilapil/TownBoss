# Reviews & Reputation v1

Status: canonical-design-v1
Classification: Platform Core
Current canonical home: TownBoss
Initial consumer: GlenTown
Future consumers: RealWise, TownTraveler, TownDeveloper, Glen AI

## Purpose

Reviews & Reputation provides shared portfolio semantics for attributable feedback, rating aggregation, review eligibility, moderation hooks, anti-abuse controls, and derived reputation signals without turning user feedback into professional verification, government authority, factual evidence, or permission to transact.

Core rule:

`review != verification != authority != evidence truth`

A favorable rating, high review count, badge, or reputation score may inform discovery and user judgment, but cannot substitute for authorization, professional qualification, government approval, transaction eligibility, identity verification, or authoritative source data.

## Boundary

Reviews & Reputation owns the reusable semantics for review records and reputation derivation. Product domains continue to own the underlying transaction, booking, service, stay, marketplace, property, professional, event, or other source records that determine whether a review is eligible.

The capability must not invent its own proof that a transaction occurred. It consumes an eligibility assertion or source reference from the owning domain.

## Core entities

- review
- rating
- review-subject-reference
- reviewer-reference
- eligibility-reference
- review-response
- moderation-state
- reputation-signal
- reputation-summary
- abuse-signal

## Review eligibility

Products define which interactions are reviewable and when. Common examples include completed orders, completed service bookings, completed stays, attended experiences, or other product-defined completed interactions.

Eligibility rules should support:

- attributable reviewer identity
- subject identity and subject type
- source interaction reference
- source interaction state
- allowed review window
- one-review-per-eligible-interaction where appropriate
- edit/update policy
- organization or tenancy boundary
- moderation and blocking state

A review UI must not be treated as the authority for eligibility. The server-side domain adapter must revalidate the source interaction.

## Review record semantics

A review should preserve, where applicable:

- reviewer reference
- subject reference and subject type
- source interaction reference
- rating dimensions
- text/body
- timestamps
- edit history or version metadata where policy requires
- publication state
- moderation state
- response from the reviewed subject
- provenance links for attached evidence where permitted

Review content remains user-generated content and is subject to moderation and abuse controls.

## Rating model

TownBoss does not require one universal rating scale for every product. Product adapters may define dimensions and scales, but the shared contract requires explicit scale metadata and deterministic aggregation semantics.

Examples include:

- 1–5 overall score
- service quality
- timeliness
- cleanliness
- communication
- accuracy

Cross-domain aggregation must not combine incomparable dimensions without an explicit mapping.

## Reputation

Reputation is a derived signal, not a source-of-truth business record.

Possible inputs include:

- eligible published reviews
- rating distribution
- review recency
- verified-interaction weighting
- moderation outcomes
- completion reliability
- dispute or cancellation signals when explicitly authorized and product-defined

Reputation algorithms must remain explainable enough to identify their major inputs and must not silently imply professional competence, legal reliability, financial trustworthiness, or government endorsement.

Core invariant:

`reputation score != professional verification != legal status != financial creditworthiness`

## Verified interaction vs verified person

A review may be marked as linked to a verified interaction when the owning product confirms the underlying transaction or booking. This does not mean the reviewer or subject has a professionally or government-verified status unless separately established by Identity & Trust, Human Verification, or an authoritative external source.

## Moderation and disputes

The capability exposes moderation hooks but does not author moderation policy.

It should support states such as:

- pending
- published
- hidden
- removed
- disputed
- restored

Products define escalation, appeal, prohibited content, harassment, conflict-of-interest, and legal handling policies.

Moderation actions affecting reputation aggregates must propagate deterministically.

## Anti-abuse

Implementations should defend against:

- duplicate reviews
- self-review
- coordinated manipulation
- review farming
- incentivized-review non-disclosure where prohibited by product policy
- retaliatory review patterns
- automated spam
- account cycling
- brigading

Signals may inform moderation or weighting, but opaque abuse scores must not be exposed as authoritative accusations.

## Subject responses

Reviewed subjects may be allowed to post one or more responses according to product policy. Responses are not allowed to alter the original review record or reviewer attribution.

## Edits and deletion

Product policy defines whether reviews may be edited or withdrawn. Where edits are allowed, the system should preserve sufficient history for moderation and audit requirements.

Deletion of a review must not leave stale aggregate scores. Aggregate repair/recalculation must be deterministic and observable.

## Aggregation

Aggregates should expose at least:

- count of eligible published reviews
- average or other defined aggregate
- rating distribution when useful
- aggregation version or policy identifier where algorithms vary

Low review counts should not be presented with misleading precision.

## Search & Discovery integration

Search & Discovery may consume rating and reputation signals for filtering, sorting, or ranking only after eligibility and visibility rules are applied.

Ranking by reputation must not convert reputation into endorsement. Sponsored placement remains separately disclosed.

## Human Verification integration

Professional verification, license checks, accreditation, and qualified-human review remain separate from Reviews & Reputation.

A high reputation score does not satisfy a Human Verification requirement.

## Evidence & Provenance integration

A review is attributable user feedback and may be stored with provenance references, but the content is not automatically accepted as factual evidence.

Attachments referenced by reviews use Media. Claims derived from reviews that become important evidence require separate Evidence & Provenance handling.

## Glen AI integration

Glen AI may summarize reviews or surface common themes using authorized, visible review content. It must distinguish:

- review-derived sentiment
- verified facts
- professional assessments
- authoritative records

AI-generated review summaries must not fabricate consensus, omit material uncertainty, or turn subjective feedback into factual authority.

AI may draft a review for a user at A1/A2, but autonomous submission of a review requires explicit bounded authority and product policy. AI cannot manufacture review eligibility.

## Privacy

The capability should minimize exposure of reviewer PII. Public display names may differ from verified legal identity according to Identity & Trust policy.

Private source interaction details must not be leaked simply because they support review eligibility.

## Audit & Observability

Important events include:

- review-created
- review-edited
- review-published
- review-hidden
- review-removed
- review-restored
- review-response-added
- eligibility-rejected
- abuse-flag-raised
- aggregate-recalculated

Operational metrics may include review volume, publication rate, moderation rate, abuse-detection rate, aggregate-rebuild failures, latency, and distribution anomalies.

## Reliability

Important review mutations should be idempotent where retries are possible. Aggregate updates may be synchronous or asynchronous, but stale state must converge and repair jobs must be available.

If asynchronous side effects are used, transactional-outbox/event patterns are preferred where supported.

## External review sources

Future adapters may ingest or display external review sources when terms permit. External reviews must preserve source attribution and must not be silently converted into first-party GlenTown reviews.

Cross-source aggregation requires explicit product policy and source labeling.

## Product adapter responsibilities

Each consumer defines:

- reviewable subject types
- source interaction types
- eligibility rules
- review window
- rating dimensions and scale
- edit/delete policy
- moderation policy integration
- response policy
- aggregate algorithm
- abuse controls
- public display rules
- search/discovery use
- external review-source handling

## GlenTown implementation truth

Current GlenTown-API inspection found no dedicated Review model, Rating model, review controller, review migration, reputation service, or rating/reputation runtime on the current master branch. Therefore TownBoss defines Reviews & Reputation as a canonical logical boundary only; it does not claim GlenTown currently implements the capability.

This architecture does not require premature pre-Beta extraction or a separate reputation service. GlenTown may implement the first adapter in-product when the product roadmap requires reviews.

## Non-goals

Reviews & Reputation v1 does not:

- replace Identity & Trust
- replace Human Verification
- establish professional authority
- establish government authority
- prove factual claims
- determine authorization
- determine payment or transaction state
- define universal moderation policy
- create a financial credit score
- mandate a machine-learning reputation model
- require cross-product physical centralization before reuse evidence exists
