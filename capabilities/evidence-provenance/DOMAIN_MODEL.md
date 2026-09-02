# Evidence & Provenance Domain Model

**Status:** Canonical design v1

## 1. Evidence Source

Represents where information originated.

Recommended fields/semantics:

- `source_id` — stable identifier.
- `source_type` — e.g. human-upload, authority-record, business-owned-record, public-api, satellite-imagery, aerial-imagery, site-photo, device-sensor, system-record, imported-document, ai-generated-output.
- `provider_name` / `provider_reference` — provider, issuing authority, dataset, agency, operator, system, or user context where appropriate.
- `external_reference` — external record/dataset identifier when permitted.
- `authority_class` — descriptive classification such as authoritative, professional, first-party, third-party, observational, inferred. This is context, not an automatic truth rank.
- `retrieved_at` / `captured_at` when known.
- `metadata` — source-specific metadata with privacy controls.

A source describes origin; it is not itself a claim.

## 2. Evidence Artifact

Represents material that can support or contradict claims.

Examples: ID image, title document, accreditation certificate, delivery photo, satellite tile/snapshot, site photo, spreadsheet, PDF, API response snapshot, device observation payload.

Recommended semantics:

- `artifact_id`
- `artifact_type`
- optional `media_id` or other storage-reference abstraction
- immutable content hash/checksum when practical
- original filename/reference where safe
- capture/retrieval time
- sensitivity/access classification
- retention policy/classification
- source linkage
- artifact metadata

The capability must not expose raw sensitive artifacts merely because a public claim/reference can be exposed.

## 3. Claim / Observation

A typed assertion about a subject.

Examples:

- `identity.document_matches_person`
- `organization.registration_document_present`
- `property.accreditation_certificate_issued`
- `delivery.package_at_destination`
- `spatial.mature_tree_present`
- `spatial.structure_present`
- `business.operating_status`
- `repository.test_gate_passed`

Recommended semantics:

- `claim_id`
- `claim_type`
- `subject_type` / `subject_id` or a portable subject reference
- structured `value` / payload
- `asserted_by` or observer identity/type
- `source_id`
- zero or more supporting artifacts
- `observed_at` — when the condition was observed
- `effective_from` / `effective_until` — period in which the assertion is intended to apply
- `recorded_at` — when TownBoss recorded it
- optional `expires_at` for evidence validity where distinct from effective time
- optional `confidence` for inference/uncertainty
- optional spatial anchor/geometry reference where relevant
- status such as active, superseded, withdrawn, invalidated

`created_at` must not be used as a substitute for `observed_at` or `effective_from` when those concepts materially differ.

## 4. Assessment / Verification

Represents an evaluation of evidence or a claim, not the downstream business decision.

Recommended semantics:

- `assessment_id`
- `target_type` / `target_id` — claim, artifact, or evidence set
- `assessment_type` — human-review, professional-validation, authority-check, automated-validation, ai-classification-review, reconciliation, etc.
- `assessor_type` / `assessor_id`
- `method`
- `method_version` when relevant
- `status` — pending, verified, rejected, inconclusive, needs-review, expired, superseded, etc.
- `confidence` when appropriate
- `reason_code` / notes
- `assessed_at`
- optional `valid_until`

A verified assessment does not automatically approve a domain object. For example, verified accreditation evidence can support a Real Estate accreditation decision, but the accreditation domain still owns approval/rejection.

## 5. Provenance Relation

Represents how evidence, claims, artifacts, or outputs relate.

Initial relation vocabulary:

- `supports`
- `contradicts`
- `corroborates`
- `derived_from`
- `transformed_from`
- `supersedes`
- `corrects`
- `replaces`
- `references`

Recommended semantics:

- `relation_id`
- `from_type` / `from_id`
- `relation_type`
- `to_type` / `to_id`
- optional `created_by`
- `created_at`
- optional reason/metadata

Relationships should preserve history rather than mutate old evidence into appearing as though the earlier state never existed.

## 6. Temporal and supersession model

The platform should distinguish at least:

- **captured/retrieved time** — when an artifact/source was obtained;
- **observed time** — when a condition was observed;
- **effective time** — when a fact/record is legally or operationally intended to apply;
- **recorded time** — when TownBoss stored the record;
- **expiry time** — when validity ends if known;
- **superseded time** — when a newer claim/evidence replaces the earlier representation.

Example: satellite imagery captured in January may be analyzed in March and superseded by a recent parcel photo captured in April. The January observation remains part of history; it is not overwritten.

## 7. Spatial extension

Evidence & Provenance must support spatial consumers without becoming the Spatial Intelligence capability itself.

A claim may reference:

- parcel/property identity;
- point/centroid;
- bounding box;
- geometry/feature identity;
- orientation/camera position when available;
- coordinate reference metadata.

Spatial Intelligence owns geometry semantics, reconciliation, mapping, and feature models. Evidence & Provenance owns the source/evidence trail for observations about those spatial objects.

## 8. AI/model provenance

For material AI-derived claims, retain where practical:

- model/provider family;
- model or pipeline version;
- inference timestamp;
- input artifact/source references;
- method/prompt or transformation identifier where governance requires it;
- confidence or uncertainty representation where meaningful;
- human correction/verification relations.

Do not store sensitive prompts or raw personal data merely for completeness if doing so conflicts with privacy/minimization policy.

## 9. Privacy and disclosure

Evidence may contain identity documents, property records, private photos, precise locations, business documents, or other sensitive material. Raw evidence and public-safe references must be treated separately.

A public projection should expose only approved derived/reference fields and never infer that a record is public because its underlying subject is public.

## 10. Domain-decision boundary examples

| Evidence/assessment | Domain decision that remains outside this capability |
|---|---|
| Registration certificate and verification | Approve organization verification |
| Property accreditation evidence verified | Approve development accreditation |
| Delivery photo / GPS observation | Mark delivery complete or resolve dispute |
| Site photo showing mature tree | Preserve/remove tree in a development scenario |
| Government API response | Determine user eligibility or submit authoritative government transaction |
| Repository test result | Development Supervisor acceptance/release decision |

## 11. Migration posture

Existing product records are valid domain implementations and should not be renamed or replaced immediately. Introduce the shared contract through adapters, cross-references, or new records when a concrete consumer requires it. Backfill only where business value or traceability warrants the cost.
