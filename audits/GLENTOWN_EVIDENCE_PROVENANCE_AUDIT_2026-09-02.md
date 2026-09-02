# GlenTown Evidence & Provenance Audit — 2026-09-02

**Status:** Evidence-based design audit
**Scope:** Existing GlenTown-API evidence, verification, media, delivery-proof, review, and audit concepts relevant to a future TownBoss shared Evidence & Provenance capability.

## Executive finding

GlenTown already contains multiple evidence-like concepts, but they are correctly rooted in product/domain workflows rather than a single reusable provenance model. The shared TownBoss capability should therefore be introduced as a new logical contract and adopted incrementally. It should not replace GlenTown's current verification, accreditation, media, delivery, review, or audit models wholesale.

## Existing patterns

### Property accreditation evidence

`AccreditationEvidence` combines a domain accreditation relationship with evidence type, issuing authority, reference number, issue/expiry dates, a Media reference, review state, reviewer notes, reviewer identity, and review time. It also explicitly treats raw evidence as not public-safe and exposes a reduced public reference.

This is a strong precursor for TownBoss Evidence & Provenance because it demonstrates:

- source/issuer context;
- an artifact reference;
- temporal validity;
- assessment/review state;
- privacy-aware public projection.

The corresponding database schema also enforces evidence-to-accreditation and media references, review metadata, indexes, and uniqueness within an accreditation/evidence-type/authority combination.

### User verification

`user_verifications` stores the identity-verification domain request, document type/number, front/back/selfie media references, review status/rejection reason, reviewer/time, and expiry.

This bundles three distinct shared concepts inside a valid domain record:

1. artifacts (ID front/back/selfie),
2. a verification assessment,
3. a domain verification lifecycle.

A shared Evidence & Provenance layer should be able to reference these without taking ownership of whether the user is ultimately treated as verified/trusted.

### Organization verification

`organization_verifications` follows the same pattern for organizations: document type + Media reference + review status/notes/rejection/reviewer/time + expiry. This reinforces that the reusable abstraction is evidence/artifact/assessment lineage, not a generic replacement for each domain's verification table.

### Delivery proof

Delivery proofs attach Media to a delivery with a proof type, description, and recorder. This is evidence-like but currently has little explicit provenance beyond normal record timestamps and user/media relations. A future integration could add explicit capture/observation/source metadata where required without forcing all delivery media through a separate service immediately.

### Reviews / reputation

Reviews include a `verification_status` alongside moderation state, but they do not yet expose a generalized evidence/provenance relationship. Future review entitlement/verification can consume the shared capability while the Reviews domain retains ownership of review publication and reputation semantics.

### Media

Media is already widely reused as storage/reference infrastructure. It is not itself an evidence model. An identity image, delivery photo, listing image, and decorative post image can all be Media, but only some become evidence in a particular context. The shared contract must therefore reference Media/artifacts rather than redefine Media.

### Audit logs

Audit logs record actor, organization, action, subject, old/new state, IP, user agent, and timestamps. This is change/accountability history and should remain separate. Evidence & Provenance may reference a process/audit event when that event explains a derivation or transformation, but audit records should not automatically be promoted to evidence.

## Boundary conclusions

### Evidence & Provenance should own

- reusable source identity/context;
- evidence-artifact references;
- claims/observations about subjects;
- observed/effective/recorded/expiry time distinctions;
- inference confidence where meaningful;
- assessments/verifications of evidence or claims;
- derivation, support, contradiction, corroboration, correction, and supersession relationships;
- privacy-aware evidence/public-reference separation.

### It should not own

- User Verification approval as a product/domain decision;
- Organization Verification approval;
- Property Development Accreditation approval;
- Delivery completion/dispute resolution;
- Review publication/entitlement decision;
- Media storage lifecycle;
- Audit logging;
- government authority or professional sign-off.

## Temporal gap identified

Current models often have useful fields such as `issued_at`, `expires_at`, `reviewed_at`, and normal `created_at`, but a reusable platform contract needs explicit semantics for `observed_at`, `effective_from/effective_until`, `recorded_at`, capture/retrieval time, and supersession. These are especially important for spatial observations, changing business status, changing government requirements, and repository/system-state evidence.

## GeoPlotter validation case

GeoPlotter provides a strong second-consumer design test. The same contract must support:

- satellite/aerial imagery as source/artifact;
- recent parcel photos with capture metadata when available and permitted;
- observations such as mature tree, structure, road, waterway, or site condition;
- AI inference confidence and pipeline/model provenance;
- user/professional correction or verification;
- spatial references without moving geometry ownership into Evidence & Provenance;
- supersession when newer site evidence shows that older imagery is stale.

This confirms that the abstraction can serve a materially different product rather than merely renaming GlenTown's verification tables.

## Migration recommendation

1. Keep current GlenTown domain tables intact.
2. Treat the TownBoss contract as canonical for new cross-product evidence/provenance work.
3. When a concrete GlenTown or GeoPlotter consumer requires it, add adapters/references or additive records rather than destructive replacement.
4. Do not backfill all historical data merely for architectural purity.
5. Require new material AI-derived or temporal/spatial evidence workflows to preserve source/time/provenance semantics from the outset.
6. Revisit physical extraction only after real multi-product use or another extraction-policy trigger.

## Outcome

**Canonical design is justified. Physical extraction is not yet justified.**
