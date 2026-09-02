# TownBoss Human Verification Workflow

**Status:** Canonical design v1  
**Scope:** TownBoss portfolio  
**Classification:** Shared Domain capability

## Purpose

The Human Verification Workflow provides a reusable portfolio mechanism for routing claims, outputs, plans, assessments, or proposed actions to an appropriate human when machine confidence, evidence quality, authority, professional qualification, or policy is insufficient.

It exists so TownBoss products can escalate uncertainty or reserved judgment to a qualified person instead of presenting AI inference, automation output, or incomplete evidence as authoritative.

This capability establishes the shared workflow boundary only. It does not require immediate marketplace implementation, service extraction, or GlenTown Beta scope expansion.

## Core principle

**Insufficient machine confidence or authority must produce a governed verification path, not fabricated certainty.**

Human verification does not automatically make a statement true. It creates an attributable review record tied to evidence, reviewer qualifications, scope, time, and outcome.

## Capability ownership

The capability owns generic verification workflow concepts and lifecycle:

- verification requests;
- verification subjects and scopes;
- reviewer qualification requirements;
- reviewer assignment and routing state;
- evidence packages supplied for review;
- reviewer findings and dispositions;
- requests for clarification or more evidence;
- attributable reviewer identity;
- review timestamps and validity windows where applicable;
- supersession and re-verification triggers;
- links between verification outcomes and Evidence & Provenance records;
- escalation when a reviewer lacks authority or required qualification.

## Explicit non-ownership

This capability does **not** own:

- professional licensing or government accreditation systems;
- the legal authority of a professional, government officer, regulator, or external institution;
- domain-specific standards of care or professional judgment;
- domain approval decisions owned by GlenTown, GeoPlotter, RealWise, TownTraveler, TownDeveloper, or another product;
- AI authority levels or autonomous execution permission;
- generic identity and resource authorization;
- payment settlement, commissions, marketplace pricing, or commercial engagement terms;
- government records or government decision-making;
- the truth of evidence merely because a human reviewed it.

Products and external authoritative systems retain those responsibilities.

## Relationship to Portfolio AI Authority Model

The Human Verification Workflow is a principal escalation path when AI Authority cannot safely advance.

Typical interaction:

`Evidence / Input -> AI A0/A1 -> uncertainty, authority limit, or reserved judgment -> verification request -> qualified human review -> attributable verification outcome -> downstream product decision / A2 preparation / bounded A3 eligibility`

A human verification outcome may satisfy a required review gate, but it does not by itself:

- grant AI a higher authority level;
- create user authorization;
- create government authority;
- permit an A4 action;
- convert a recommendation into an autonomous action.

The Portfolio AI Authority Model remains canonical for AI execution boundaries.

## Relationship to Evidence & Provenance

Every material verification outcome should be evidence-linked.

The verification record should identify, where applicable:

- evidence or claim reviewed;
- source and artifact identifiers;
- observed/effective/recorded dates;
- reviewer identity and qualification evidence;
- review scope;
- disposition;
- confidence or limitations stated by the reviewer;
- verification timestamp;
- expiration or re-verification condition;
- superseded verification record.

Evidence & Provenance owns the generic source/claim/artifact lineage. Human Verification owns the review workflow and attributable reviewer disposition.

## Relationship to Scenario and Constraint Engines

Scenario and Constraint outputs may trigger verification when:

- an assumption requires professional confirmation;
- a hard constraint is unknown rather than passed;
- a constraint source is stale or ambiguous;
- a simulated outcome could be mistaken for an authoritative decision;
- a domain requires professional review before the result can be relied upon.

Human verification must not rewrite a failed constraint into a pass without an authorized domain override mechanism. If a reviewer provides new evidence, the relevant constraint should be re-evaluated against that evidence.

## Reviewer classes

The generic workflow supports multiple reviewer classes without treating them as interchangeable:

1. **User confirmation** — the affected user confirms facts within their own knowledge or authority.
2. **Operational reviewer** — an authorized staff member verifies an operational condition or record.
3. **Qualified professional** — a person with a required profession, license, accreditation, or specialist competence.
4. **External authoritative reviewer/system** — a government body, regulator, institution, or other authoritative source where TownBoss itself is not the authority.

A consuming product must declare which reviewer class is acceptable for each verification type.

## Qualification model

A verification request may declare qualification requirements such as:

- profession or role;
- license/accreditation type;
- jurisdiction;
- organization membership;
- minimum verification status;
- conflict-of-interest restrictions;
- independence requirement;
- geographic eligibility;
- recency of qualification evidence.

TownBoss may store or reference evidence of qualification, but an external licensing body remains authoritative when applicable.

Qualification matching is necessary but not sufficient: the reviewer must also be authorized for the specific review scope.

## Verification lifecycle

Canonical lifecycle:

`REQUESTED -> ROUTING -> ASSIGNED -> IN_REVIEW -> {VERIFIED | VERIFIED_WITH_LIMITATIONS | REJECTED | NEEDS_MORE_EVIDENCE | OUT_OF_SCOPE | CANCELLED | EXPIRED | SUPERSEDED}`

Definitions:

- **REQUESTED** — review need and scope have been recorded.
- **ROUTING** — the system is identifying an acceptable reviewer.
- **ASSIGNED** — an eligible reviewer has accepted or been assigned.
- **IN_REVIEW** — review is actively underway.
- **VERIFIED** — reviewer affirmatively verified the defined subject within scope.
- **VERIFIED_WITH_LIMITATIONS** — reviewer verified only with explicit qualifications, assumptions, limitations, or partial scope.
- **REJECTED** — reviewer found the claim/output/condition unsupported or incorrect within scope.
- **NEEDS_MORE_EVIDENCE** — current evidence is insufficient; review remains unresolved.
- **OUT_OF_SCOPE** — reviewer cannot validly review the requested matter.
- **CANCELLED** — requester or authorized workflow cancelled the request.
- **EXPIRED** — prior verification is no longer current under its validity policy.
- **SUPERSEDED** — a later verification record replaces the prior record.

No unresolved state may be represented as VERIFIED.

## Verification request contract

A verification request should contain, where applicable:

- stable request ID;
- consuming product and domain;
- subject type and subject identifier;
- exact review question or claim;
- review scope and exclusions;
- reason verification is required;
- required reviewer class;
- required qualifications;
- evidence package references;
- required-by time or SLA if applicable;
- requesting actor/system;
- AI Authority context when AI initiated the escalation;
- conflict-of-interest constraints;
- allowed dispositions;
- downstream action that remains blocked pending review.

The request must be narrow enough that a reviewer can understand exactly what they are and are not verifying.

## Verification outcome contract

A verification outcome should contain, where applicable:

- request ID;
- reviewer identity;
- qualification evidence/reference;
- reviewer organization if relevant;
- disposition;
- findings;
- limitations and assumptions;
- evidence reviewed;
- additional evidence produced;
- review timestamps;
- validity/expiration conditions;
- conflict-of-interest disclosure where required;
- signature/attestation reference when legally or operationally necessary;
- provenance relation to superseded outcomes;
- whether downstream gates may re-evaluate.

A free-text comment alone is not sufficient for a consequential verification outcome.

## Fail-closed rules

A verification-dependent workflow must stop or remain unresolved when:

- no qualified reviewer is available;
- reviewer qualification cannot be established where required;
- the reviewer is outside the authorized scope;
- required evidence is missing;
- material evidence changed after review;
- the reviewer reports a conflict that policy disallows;
- the verification expired;
- the review returns NEEDS_MORE_EVIDENCE or OUT_OF_SCOPE;
- the verification record is ambiguous, unattributable, or stale;
- the consuming product cannot determine whether the review satisfies its domain requirement.

Unknown is not verified.

## Re-verification triggers

A consuming product should define when verification becomes stale. Common triggers include:

- material source/evidence change;
- new observation or inspection;
- changed property/site condition;
- changed law, rule, permit, or external authoritative record;
- changed scenario assumptions;
- changed constraint inputs;
- expiration of license/accreditation evidence;
- elapsed validity period;
- superseding professional or institutional finding.

Re-verification creates a new attributable record; prior history is preserved.

## Marketplace boundary

A future Human Verification Marketplace may help discover, match, schedule, contract, or compensate qualified reviewers. That commercial layer is **not required by this v1 workflow contract**.

The verification capability owns whether a reviewer is eligible for the defined verification workflow. A marketplace, payments system, professional directory, CRM, or product may separately own discovery, pricing, booking, commissions, payment, customer relationship, and commercial terms.

This separation allows GlenTown or RealWise to use existing qualified professionals before a dedicated verification marketplace exists.

## Product examples

Examples are illustrative and do not expand current product scope:

- **GeoPlotter:** route parcel interpretation, hazard interpretation, survey assumptions, engineering-sensitive conclusions, or development feasibility questions to an appropriate licensed professional when required.
- **RealWise:** route appraisal, legal/title, brokerage compliance, or property-condition matters to qualified reviewers under RealWise domain policy.
- **GlenTown:** route uncertain identity/business/service claims or future consequential assistance workflows to appropriate reviewers without treating AI confidence as authority.
- **TownDeveloper:** require architect, engineer, surveyor, planner, or other professional review before relying on reserved professional judgments.
- **TownTraveler:** use operational or authoritative review for material travel/service information when required.

## Implementation posture

Current posture is **logical-boundary-defined**.

Do not create a centralized microservice or marketplace solely because this capability is canonical. Initial consumers should implement the smallest adapter needed around existing reviewer/professional workflows and Evidence & Provenance links. Physical extraction should wait for demonstrated cross-product reuse, lifecycle independence, or operational need.
