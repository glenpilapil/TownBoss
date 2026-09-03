# TownBoss Media v1

**Status:** Canonical architecture v1

## Purpose

Media is the shared Platform Core capability for representing, storing, referencing, securing, processing, and delivering user- or system-supplied binary assets such as images, documents, audio, video, verification evidence, proofs, and other attachments.

Media owns the lifecycle and technical representation of an asset. It does not own the business meaning, authority, truth, moderation policy, or retention requirement of the domain record that references that asset.

The core invariant is:

**media asset != domain record != evidence truth != authorization**

A file may be technically present and valid while still being untrusted, unauthorized, unverified, prohibited, stale, or irrelevant to a domain decision.

## Canonical entities

### Media asset

A stable logical record for one uploaded or generated asset. Minimum useful metadata includes stable media ID, owning/uploader actor reference where applicable, storage provider/disk reference, storage key/path, original file name where safe to retain, normalized MIME type, byte size, media class/type, visibility/access class, checksum or integrity identifier where supported, dimensions or duration where applicable, lifecycle state, timestamps, optional provenance/evidence references, and schema/version information.

### Media attachment

A relation between a media asset and a domain object, with optional collection/role and ordering information. The attachment does not transfer business ownership of the domain record to Media.

### Media variant

A derived representation such as thumbnail, resized image, preview, compressed version, transcoded version, redacted copy, or document preview. Variants should retain lineage back to the source media asset.

### Media processing job

An asynchronous or synchronous operation that validates, scans, transforms, extracts safe metadata, or creates variants.

### Media access grant

A bounded authorization result or delivery token allowing access to a non-public media object. Access grants are not a substitute for source-domain authorization.

## Media classes

The contract supports, without requiring all of them immediately: images, documents, audio, video, archives, verification evidence, payment/top-up proof, delivery proof, identity documents, generated assets, and other explicitly supported binary content.

Products may define domain-specific categories while preserving the common lifecycle and security contract.

## Lifecycle

A canonical lifecycle may include:

```text
pending-upload
  -> uploaded
  -> validating/scanning
  -> ready
  -> rejected/quarantined
  -> superseded
  -> deleted/expired
```

Not every product needs every state. The important rule is that an asset must not be treated as safe or usable merely because bytes were accepted by storage.

## Upload contract

An upload boundary should enforce, as appropriate: authenticated or explicitly permitted uploader context; domain-specific authorization before binding the media to a protected resource; allowed media classes and MIME types; file-size limits; extension/MIME consistency checks where feasible; safe file naming and storage keys; rejection of path traversal or executable-content misuse; malware/content scanning where risk justifies it; hardened parsing for images/documents; metadata minimization; rate limits and abuse controls; and idempotency or duplicate handling where retry-sensitive.

Client-declared MIME type or file extension is not authoritative by itself.

## Storage-provider abstraction

Media is provider-neutral. Storage may be local filesystem, S3-compatible object storage, cloud blob storage, CDN-backed storage, or another approved provider.

Products should persist stable logical media references rather than expose provider-specific internal paths as the domain contract.

Provider migration must preserve media IDs, attachment relationships, access semantics, integrity metadata where available, required retention state, and audit/provenance relationships.

## Public vs private media

Visibility and authorization are separate concerns. Typical classes include public, authenticated-user, owner/participant-scoped, organization-scoped, privileged-reviewer/admin, and highly restricted verification/evidence.

A public product image and a government ID should never rely on the same default exposure policy.

Private media should normally be delivered through authorized application endpoints or short-lived signed access rather than permanently public URLs.

## Domain attachment boundary

Media owns the binary asset and generic attachment relation. The source domain owns why the media is attached and whether it satisfies a business requirement.

Examples:

- Product owns whether an image is the primary product image.
- Messaging owns whether a media object is attached to a message.
- Payments & Credits owns whether a receipt image is valid top-up evidence.
- Human Verification owns whether a document satisfies reviewer requirements.
- Identity & Trust owns whether an ID/selfie is sufficient for verification.
- Property Intelligence owns whether a property image/document is part of a listing or accreditation record.

Media must not infer business approval from attachment existence.

## Evidence & Provenance integration

A media asset may be an Evidence & Provenance artifact. Media owns storage, lifecycle, and access; Evidence & Provenance owns source, claim, observation, assessment, lineage, confidence, verification, and supersession semantics.

Deleting or replacing a media object must not silently rewrite evidence history. Where an evidence-bearing asset is superseded, the evidence layer should retain the appropriate lineage or supersession reference according to policy.

## Identity and sensitive documents

Identity documents, selfies, professional credentials, property documents, financial proofs, and other sensitive assets require stricter controls than ordinary public media.

Requirements may include least-privilege access, encryption at rest/in transit through the selected provider, short-lived delivery grants, access logging/audit where material, restricted operational tooling, explicit retention/deletion policy, no public indexing, and no reuse for model training or unrelated analytics without valid authority or consent.

## Moderation and safety boundary

Media exposes moderation/scanning hooks but does not author moderation policy.

A domain or shared moderation capability may classify or restrict an asset. Media then enforces the resulting visibility, quarantine, or removal state as instructed by the authorized policy source.

A moderation model's confidence does not itself create deletion or enforcement authority.

## Transformations and variants

Image resizing, thumbnails, previews, compression, transcode, document preview, metadata stripping, OCR preparation, and similar transformations should preserve source lineage.

Derived variants should not silently replace the original when the original is required as evidence or authoritative input.

Potentially sensitive metadata such as EXIF GPS coordinates should be stripped from public derivatives unless explicitly required and authorized.

## Deletion, retention, and legal hold

Deletion semantics must distinguish at least: detach from a domain record; hide from ordinary delivery; soft-delete logical media record; physical object deletion; retention/legal hold; and supersession by a newer asset.

Domain policy, legal/privacy requirements, evidence retention, financial reconciliation, or active investigations may prevent immediate physical deletion.

Media must not invent universal retention periods.

## Integrity and duplicate handling

Where practical, store an integrity hash/checksum and verify provider transfers. Hashes may support corruption detection and duplicate detection, but identical bytes do not necessarily mean identical business meaning or ownership.

Content deduplication must not leak whether another user's private asset already exists.

## Delivery and CDN

Delivery may use a CDN or image transformation service. Public caching policy must match asset visibility and revocation requirements.

Private or rapidly revocable assets should not be cached with long-lived public URLs.

## Messaging integration

Messaging references Media assets rather than owning raw blob storage. Message authorization controls who can access the attachment. Deleting a message does not automatically define the physical media-retention rule; the combined Messaging, Media, moderation, privacy, and legal policies decide.

## Notifications integration

Notifications may reference safe thumbnails or deep links to Media, but notification delivery should avoid embedding sensitive documents or durable private URLs in insecure channels.

## Search & Discovery integration

Only media explicitly intended for discovery should be indexed. Private assets, verification documents, payment proofs, message attachments, and other restricted media must not become searchable merely because metadata exists.

## Payments & Credits integration

Receipts, proofs of payment, top-up evidence, refund evidence, and reconciliation artifacts may be stored through Media. Their financial validity and approval state remain owned by Payments & Credits or the relevant provider/authority.

## Glen AI / AI Authority integration

Glen AI may inspect or transform media only within explicit authorization, privacy, consent, and AI Authority limits.

A0/A1 may describe an authorized image or extract candidate information from a document. A2 may prepare an action using document-derived data for human review. A3 may execute only under the bounded policy defined by the relevant domain.

Model access to a file is not permission to disclose, retain, train on, or repurpose it.

Real-person likeness/voice assets, including Anji, additionally follow their explicit consent and provenance requirements.

## Government and professional documents

Media may store or reference documents supplied by government systems, licensed professionals, or users. Storage does not grant TownBoss authority to certify authenticity, validity, ownership, or official status.

External authoritative references and Evidence & Provenance should be retained where appropriate.

## Audit & Observability

Material Media events may include upload accepted/rejected, validation/scanning result, variant creation failure, visibility change, privileged access to sensitive media, attachment/detachment where consequential, deletion/retention-hold action, provider delivery failure, integrity mismatch, and quarantine/release.

Operational metrics may include upload error rate, processing latency, queue depth, storage/provider failures, variant failure rate, and delivery errors.

Do not log raw private media contents into general logs.

## Reliability

Important asynchronous processing should be retry-safe and observable. A transient thumbnail failure must not corrupt the source asset. A retry must not create uncontrolled duplicate assets or attachments.

For consequential uploads such as verification evidence or payment proof, the application should be able to distinguish bytes accepted, metadata persisted, domain attachment created, processing complete, and review/verification complete. These are separate states.

## Security baseline

At minimum: validate type and size server-side; store outside executable web roots or equivalent safe object storage; use generated storage keys; prevent path traversal; use least-privilege provider credentials; protect private object URLs; avoid trusting user filenames for execution/content type; enforce upload rate limits; sanitize dangerous active content where applicable; strip sensitive metadata from public derivatives where appropriate; and audit privileged access to high-risk files where policy requires.

## GlenTown implementation truth

Current GlenTown evidence shows a real but partial media implementation:

- `Media` is a first-class model with uploader, polymorphic model relation, file name, MIME type, disk, path, size, dimensions, custom properties, type/category, visibility, and private flag.
- `Media` is already referenced by delivery proof, delivery vehicles, organization verification, organization logos/banners, posts, product variants, property accreditations/property media, supplier logos, profile/cover images, and identity-verification ID/selfie fields.
- Products use a `ProductMedia` join model with collection and sort order.

This is substantial implementation evidence for the logical capability boundary.

However, current inspection did not establish one canonical cross-domain upload controller/service, unified scanning pipeline, provider-neutral signed-delivery service, shared variant processor, or one enforced portfolio-wide retention/access policy. Therefore TownBoss defines canonical semantics without claiming those pieces already exist.

## Extraction posture

The capability remains physically implemented primarily in GlenTown while TownBoss owns the portfolio contract.

Do not extract a shared package solely because the architecture is canonical. Physical extraction should happen when two or more products require materially equivalent runtime behavior and the extraction reduces duplication without blocking product delivery.

## Non-goals

Media v1 does not define product-listing business rules, define moderation policy, determine evidence truth or verification outcome, grant access to domain records, define AI authority, certify official/professional documents, require a specific cloud-storage vendor, require video/audio transcoding before GlenTown Beta, mandate a global CDN, or require a new upload subsystem where existing GlenTown behavior already satisfies the product need.
