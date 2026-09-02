# TownBoss Unified Evidence & Provenance

**Status:** Canonical design v1
**Classification:** Platform Core

## Purpose

Evidence & Provenance provides a reusable way for TownBoss products to record what was observed or asserted, where it came from, when it was true or observed, what artifacts support it, how it was evaluated, and how newer evidence relates to older evidence.

It exists so GlenTown, GeoPlotter, RealWise, TownTraveler, TownDeveloper, Development Supervisor, and selected Forex Quant Lab workflows do not each invent incompatible notions of source, confidence, verification, validity, or supersession.

## Core separation

The capability separates six concerns that are frequently mixed in product-specific records:

1. **Source** — origin/provider/authority of information.
2. **Artifact** — document, image, media object, API snapshot, sensor payload, or other evidence material.
3. **Claim / Observation** — typed assertion about a subject.
4. **Assessment** — review, verification, confidence evaluation, or validation of a claim/evidence set.
5. **Provenance Relation** — supports, contradicts, derives from, supersedes, corrects, corroborates, or transforms another item.
6. **Temporal context** — observed, effective, recorded, expiry, and supersession times.

## Boundary

Evidence & Provenance owns evidence identity, origin, observations/claims, temporal context, confidence, assessments, provenance relations, and supersession history.

It does **not** own domain decisions. Examples outside this capability include:

- approving a property-development accreditation;
- deciding that an account is trusted;
- completing a delivery;
- accepting a real-estate listing;
- approving a development plan;
- issuing professional sign-off;
- declaring an authoritative government record.

Domain capabilities consume evidence and assessments, then make their own authorized decisions.

## Media is not evidence by itself

TownBoss Media may store an image or document. That artifact becomes evidence only when an Evidence & Provenance record establishes its subject, source, context, time, and evidentiary purpose. This avoids treating every uploaded photo or file as an evidentiary assertion.

## Audit is separate

Audit/Observability answers who or what changed system state and when. Evidence & Provenance answers what supports a claim and how that information originated or evolved. A provenance record may reference an audit/process event, but audit logs are not automatically evidence.

## Truth and authority

Confidence is not authority. Evidence quality, source authority, recency, corroboration, and verification can inform a domain decision, but this capability must not create a universal scalar `truth_score` that silently overrides domain rules.

Government records remain authoritative where government authority applies. Licensed-professional decisions remain with the relevant professional. AI-derived observations remain inferences unless independently validated or otherwise authorized.

## Initial implementation strategy

This design creates a logical TownBoss contract only. Existing GlenTown verification/accreditation/delivery models remain in place. A future implementation should introduce adapters/links incrementally and avoid a destructive rewrite.

## Next consumers

The first practical consumers should be selected where evidence fragmentation already exists in GlenTown and in GeoPlotter's emerging spatial-observation workflow. Those consumers will validate the contract before physical extraction into a standalone service or repository is considered.
