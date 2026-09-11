# GlenTown Decision & Architecture Reconciliation Audit — 2026-09-11

**Status:** Read-only reconciliation audit; remediation not yet applied  
**Repositories reviewed:** `glenpilapil/GlenTown-API` (`dev/post-backup-2026-08-25`) and `glenpilapil/TownBoss` (`main`)  
**Purpose:** Detect approved product decisions that are missing, scattered, stale, contradicted, or not propagated between GlenTown product documentation, TownBoss portfolio architecture, and current implementation truth.

## 1. Authority model confirmed

GlenTown's documentation explicitly defines an authority order in which approved product/business decisions outrank requirements, rollout matrices, architecture, module specifications, implementation contracts, ADRs, and code/tests. It also requires every meaningful implementation change to be evaluated for documentation impact in the same implementation cycle.

TownBoss separately defines the portfolio architecture baseline and reusable capability contracts, while implementation truth is tracked independently. Therefore:

- GlenTown remains authoritative for GlenTown product decisions and product/domain behavior.
- TownBoss is canonical for reusable portfolio-wide capability semantics.
- Implementation evidence must not silently redefine either product decisions or portfolio architecture.
- Product decisions that affect shared capabilities must be propagated in both directions rather than living only in chat, one repo, or one module specification.

## 2. Existing decisions that were correctly documented but were not consulted before implementation

### 2.1 Seed / Claim / Verify

This was already approved and documented before the 2026-09-11 business-claim implementation.

Relevant existing sources:

- `GlenTown-API/docs/03-architecture/ARCHITECTURE-DECISIONS.md` — ADR-029, **Seed, Claim, Verify, Then Delegate Scoped Management**.
- `GlenTown-API/docs/04-modules/organizations/CLAIMED-PROFILES-DESTINATION-MANAGEMENT-SPECIFICATION.md` — explicit `Claim This Business`, claim evidence, conflicts, revocation, scoped authority, audit history and claimant-uploaded media.
- `GlenTown-API/docs/00-governance/PRODUCT-SCOPE-ROLLOUT-MATRIX.md` — claimed Business/Profile foundation is staged MVP scope.
- `GlenTown-API/docs/00-governance/TRACEABILITY-MATRIX.md` — Claimed Business Profiles already had a traceability row.

**Finding:** The architecture existed. The implementation task was started as though the feature were newly designed. This is a process failure: applicable canonical documentation was not read first.

### 2.2 Map/discovery was already an MVP concern

Existing GlenTown documents already require:

- location-aware maps/navigation for supported content;
- map/discovery entry points on Destination Profiles;
- maps/directions for public discovery;
- map-first discovery readiness;
- canonical Geography ownership while Search/Discovery consumes derived location context.

TownBoss Search & Discovery also formalizes geospatial/proximity discovery while preserving Location & Geography as the location source of truth.

**Finding:** Map pins are not a newly invented product concept. What is missing is the canonical place/location-record and community-correction lifecycle needed to maintain map quality.

## 3. Missing canonical decision: Community Map Contributions / Place Corrections

No governing GlenTown or TownBoss document reviewed defines the full user-contribution workflow previously intended for map maintenance, comparable to `Suggest an edit` / community map-update programs.

The missing product contract includes at least:

- suggest an edit to an existing place/business;
- correct a map pin by moving it to the actual establishment/building/entrance location;
- correct address, phone, category, hours or other public factual fields;
- report `temporarily closed`, `permanently closed`, `reopened`, duplicate or moved establishment;
- submit an unlisted/missing place;
- submit establishment photos;
- attach notes/evidence;
- retain original values and proposed values;
- moderation/review/corroboration before canonical mutation;
- attribution/audit history;
- contributor abuse/rate-limit controls;
- different trust treatment for ordinary users, verified organization claimants and authoritative sources;
- accepted corrections updating the authoritative GlenTown Place/Business record and search/map projections;
- rejected/duplicate/superseded contribution states.

### 3.1 Approved coordinate rule requiring documentation

The current approved rule is:

- business/place coordinates should be as precise as reasonably possible and establishment-specific;
- do not substitute a town/municipality centroid or guessed point for the establishment;
- if the real establishment cannot be confidently located, leave coordinates `null`;
- only records with valid coordinates should emit precise map pins;
- coordinate provenance should be retained internally;
- community corrections may later improve the pin through the governed contribution workflow.

**Gap:** This rule is not represented in the current GlenTown decision ledger, Requirements Catalog, Traceability Matrix, module specifications, or TownBoss shared capability contracts.

### 3.2 Recommended canonical ownership

This should not become an isolated `Map` authority.

Recommended composition:

- **Location & Geography / Businesses-Organizations:** authoritative place/business location state and coordinate fields.
- **Community Map Contributions:** contribution proposal lifecycle only; it does not directly overwrite canonical place state.
- **Evidence & Provenance:** source/evidence/lineage for contributed corrections.
- **Human Verification / Administration & Trust & Safety:** moderation/review where required.
- **Media:** establishment photos and media security/rights lifecycle.
- **Search & Discovery:** derived place/business map/search projections.
- **Public Data Gateway:** externally sourced public place/location data, provenance, freshness and reconciliation.

The first implementation may remain inside GlenTown. TownBoss extraction is not required until reuse justifies it.

## 4. Claim architecture conflict requiring reconciliation

The existing Claimed Profiles specification describes a successful claim as following an approved verification process that demonstrates authority to represent the organization, and uses logical states such as `verified_claimed`, `claim_suspended` and `claim_revoked`.

The 2026-09-11 `BUSINESS_CLAIM_FOUNDATION` implementation intentionally separates claim approval from general business verification/accreditation and does not set `verified_at` merely because a claim is approved.

These two ideas can coexist, but the documentation currently does not distinguish them clearly enough.

### Required clarification

Use separate concepts:

1. **Relationship / representation verification** — sufficient evidence that the claimant may manage the specific organization/profile.
2. **Business verification / trust signal** — independent evidence that the organization satisfies a business/registration/trust criterion.
3. **Accreditation / regulated authority** — independent domain-specific approval where applicable.

An approved claim should grant scoped management only after relationship/representation verification, but must not automatically create a `Business Verified`, `Developer Verified`, accreditation or other trust signal.

**Remediation priority:** P0 because the implementation is already merged.

## 5. GlenTown current decision ledger is incomplete and structurally stale

`docs/01-current/CURRENT_PRODUCT_DECISIONS.md` is authoritative by its own header, but it contains only a narrow subset of the decisions actually governing the product. Material approved decisions are instead scattered across ADRs, module specs, TownBoss contracts, implementation conversations and later work.

Examples not represented adequately in the current decision ledger include:

- seed/claim/verify as an MVP/staged product direction;
- nationwide pre-Beta seeding with Puerto Princesa as the deepest operational pilot;
- precise public-business coordinate policy and map-pin behavior;
- community map/place correction program;
- shared Orchestration Engine and planner family (`Day`, `Trip`, `Event`, `Financial`, `Achieve`);
- Glen AI / Ask Glen product entry and orchestration role;
- TownTraveler web-first vertical and shared-domain relationship;
- Government Service Interoperability / DICT eGov direction;
- organization-address UX using Province -> Town -> Barangay -> Street Address while keeping Barangay out of discovery scope;
- newer organization/business claim semantics;
- nationwide organic-content posture vs Puerto Princesa pilot/deep-density operations;
- newer onboarding/auth/brand decisions made during physical-device preparation.

Some of these exist in other architecture documents. The failure is that the file explicitly labeled the **authoritative decision record** is no longer a reliable consolidated decision ledger.

## 6. Documentation hierarchy drift

The repository README says the authority order is:

1. approved product/business decisions;
2. Requirements Catalog;
3. Product Scope & Rollout Matrix;
4. product volumes;
5. architecture matrices/contracts;
6. canonical module specs;
7. implementation contracts;
8. ADRs;
9. implementation evidence.

However, newer decisions often appear only in lower-level architecture documents or TownBoss, while `CURRENT_PRODUCT_DECISIONS.md`, Requirements Catalog and Scope Matrix are not updated in the same cycle.

**Risk:** An implementation agent that correctly follows the documented authority hierarchy can still receive an incomplete or outdated view of the actual approved product.

## 7. Implementation-truth records are materially stale

### 7.1 GlenTown `IMPLEMENTATION_STATUS.md`

The current document still records:

- 753 backend tests;
- Messaging as partial/mock with no tests found;
- older Flutter mock/integration status;
- last verification dates in August 2026.

Current local regression evidence on 2026-09-11 is **1289 passing tests / 4082 assertions** after BUSINESS_CLAIM_FOUNDATION. The repository has also gained material messaging backend functionality, eGov eVerify adapter groundwork, more commerce work, realistic Palawan seeding and business-claim implementation since the status document was last verified.

### 7.2 TownBoss `IMPLEMENTATION_TRUTH_MATRIX.yaml`

TownBoss' implementation-truth audit is explicitly pinned to a 2026-09-04 snapshot and states that no GlenTown messaging, reviews/reputation, Human Verification or Public Data Gateway runtime was verified in that snapshot.

At minimum, the following now require re-audit rather than continued reliance on the old truth matrix:

- Messaging backend foundation;
- Reviews/reputation implementation state;
- National ID eVerify adapter as a Human Verification / external identity-verification integration foundation;
- PSGC/public-data integration state;
- Business Claim foundation;
- current test/route surface.

This is not an architecture error; it is stale implementation evidence.

## 8. TownBoss/GlenTown propagation gaps

TownBoss correctly states that its baseline is canonical for reusable semantics and that GlenTown is often the first implementation home. The cross-repo propagation process is nevertheless incomplete.

Examples:

- TownBoss has canonical Orchestration, Glen AI, Human Verification, Evidence & Provenance, Search & Discovery and Public Data Gateway contracts, while GlenTown's current decision/status documents do not consistently link them.
- GlenTown contains product-specific approved decisions such as seed/claim/destination management that are not represented as explicit portfolio capability entries because they remain product/domain behavior.
- New provider/adaptor work can land in GlenTown without an immediate update to TownBoss implementation truth.

**Needed control:** every substantial GlenTown implementation should answer both:

1. Which GlenTown governing decision/specification changed or was implemented?
2. Which TownBoss capability, if any, gained new implementation evidence or adapter status?

## 9. Public-data and map-source boundary

TownBoss Public Data Gateway already provides the appropriate shared semantics for external public data:

- source attribution;
- authority class;
- freshness;
- coordinate-system/precision preservation;
- reconciliation;
- supersession/corrections;
- data-quality checks;
- no conversion of cached/derived data into authoritative truth.

This should govern future externally seeded business/place coordinates and public registries.

However, community-contributed map corrections are not the same as Public Data Gateway ingestion. They require their own product/domain workflow because a resident's correction is a proposal/evidence observation, not an authoritative external dataset.

## 10. Recommended remediation sequence

### P0 — before scaling Palawan public-business seeding

1. Reconcile claim terminology and lifecycle so relationship/representation verification is explicitly separate from business verification/trust/accreditation.
2. Add an approved `COMMUNITY_MAP_CONTRIBUTIONS` product decision/specification including coordinate correction, closure status, missing places and establishment-photo submissions.
3. Add the coordinate precision/null rule to the governing place/business contract.
4. Define canonical Place/Business coordinate fields, provenance, precision/source metadata and map-pin eligibility.
5. Update `CURRENT_PRODUCT_DECISIONS.md`, Requirements Catalog, Product Scope & Rollout Matrix, Architecture Matrix, Domain Ownership Matrix and Traceability Matrix for these decisions.

### P1 — documentation truth repair

6. Refresh GlenTown `IMPLEMENTATION_STATUS.md` from current code/tests rather than August snapshots.
7. Re-audit and refresh TownBoss `IMPLEMENTATION_TRUTH_MATRIX.yaml` using current GlenTown branches.
8. Add explicit links from GlenTown product decisions to applicable TownBoss shared capability contracts.
9. Add a documentation-sync gate to implementation workflow: no meaningful merged feature is complete until governing decision/spec/traceability and implementation-truth impact are checked.

### P1 — decision-ledger reconciliation

10. Reconcile later approved product decisions into `CURRENT_PRODUCT_DECISIONS.md`, especially nationwide pre-Beta seeding, planners/Orchestration, Glen AI, TownTraveler, government interoperability, organization address hierarchy and current onboarding/device-audit decisions.
11. Mark superseded decisions explicitly rather than allowing old and new descriptions to coexist without precedence.

## 11. Immediate implementation hold

Do **not** scale public-business seeding or implement community map corrections until P0 documentation reconciliation defines the authoritative place/business location model and contribution lifecycle.

Existing synthetic Palawan demo data may remain for testing, but real/public claimable business seeding should wait for the coordinate/provenance/correction contract so the project does not create a second migration/refactor immediately afterward.

## 12. Audit conclusion

The architecture is not missing wholesale. The larger problem is **decision propagation and implementation-truth drift**:

- some important decisions were already documented but not consulted;
- some newer decisions are scattered across lower-level documents or TownBoss rather than the authoritative GlenTown decision ledger;
- the community map-contribution program is genuinely missing from the canonical architecture;
- claim terminology needs reconciliation with the newly implemented foundation;
- implementation-status records in both repositories are stale relative to current GlenTown development.

**Audit verdict:** `ATTENTION REQUIRED — DOCUMENTATION RECONCILIATION BEFORE FURTHER PUBLIC-BUSINESS SEED SCALE`.
