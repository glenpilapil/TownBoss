# TownBoss Feature Flags & Experimentation v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Feature Flags & Experimentation is the shared TownBoss capability for controlled feature exposure, progressive rollout, targeting, emergency disablement, and evidence-producing product experiments across portfolio products.

It separates **deployment** from **release**, and separates **feature exposure** from **authorization**. A flag can decide whether an eligible user or context is offered a capability; it cannot grant access, AI authority, professional authority, government authority, or permission to perform an otherwise prohibited action.

## Core rule

`flag exposure != authorization != AI authority != approval`

A disabled flag may prevent use of a capability. An enabled flag must never be treated as sufficient permission to use protected data, execute a consequential action, bypass a constraint, or cross an AI Authority boundary.

## Architectural posture

TownBoss owns the canonical semantics and governance. Products consume the capability through thin adapters/SDK boundaries. Physical centralization is deferred until implementation evidence justifies it.

GrowthBook is an approved major architectural reference and production dependency candidate for implementation. The canonical TownBoss contract remains provider-neutral so products are not coupled to one vendor's terminology, persistence model, or runtime.

## Core entities

### Feature Flag
A stable, versioned control with an owner, purpose, lifecycle state, default/fallback behavior, targeting policy, variants, dependencies, and expiry/review metadata.

### Flag Evaluation Context
The minimum authorized context used to evaluate exposure, such as product, environment, account/user pseudonymous key, organization/tenant, town/geography, cohort, app version, device capability, subscription/entitlement state, or explicitly approved attributes.

Evaluation context must not become an unrestricted profile store. Sensitive attributes require a legitimate product purpose and appropriate privacy controls.

### Targeting Rule
A deterministic rule that maps an evaluation context to a variant or no exposure. Rules are ordered/versioned and auditable.

### Variant
A named configuration or treatment. Boolean on/off is a special case; multivariate flags are supported.

### Rollout
A controlled exposure strategy, including percentage, cohort, geography, tenant, environment, version, allowlist, or staged progression.

### Experiment
A hypothesis-driven controlled comparison with defined population, variants, assignment unit, metrics, guardrails, start/stop criteria, analysis method, and decision record.

### Metric
A defined measurable outcome or guardrail. Metric ownership may remain with product analytics/domain systems; this capability owns experiment bindings and interpretation metadata, not the underlying business record.

### Assignment
The attributable result of experiment/flag evaluation for a unit. Where consistency matters, assignment should be stable for the experiment/flag version.

### Decision Record
The documented conclusion from a rollout or experiment: ship, iterate, stop, revert, extend, or inconclusive, with evidence and limitations.

## Flag lifecycle

Canonical lifecycle:

`PROPOSED -> ACTIVE -> RAMPING -> FULLY_RELEASED -> RETIRING -> RETIRED`

Exceptional states may include:

- `PAUSED`
- `KILLED`
- `EXPIRED`

Flags must have an owner and lifecycle intent. Temporary release flags require a removal/retirement condition. Permanent operational controls must be explicitly classified as such rather than silently becoming stale release flags.

## Flag classes

### Release flag
Separates deployment from user exposure for a new capability. Expected to be temporary.

### Experiment flag
Assigns controlled variants for a defined experiment. Expected to end when the experiment decision is made.

### Operational flag
Controls runtime behavior for operational safety/recovery. May be longer-lived but requires ownership and audit.

### Permission-adjacent presentation flag
Controls whether an already-authorized capability is shown or offered. It is not an authorization source.

### Kill switch
A fail-safe operational control that can disable a risky capability or integration quickly. Kill switches should default toward the safer state on evaluation failure where feasible.

## Evaluation rules

Flag evaluation should be deterministic for the same flag version and material context unless the flag explicitly uses a time/rollout transition.

Every evaluation must have a defined fallback. For consequential or risky capabilities, evaluation failure/unknown should resolve to the safer non-exposed state unless an explicit reviewed policy says otherwise.

Server-side enforcement is required when a flag protects backend behavior or side effects. Client-side hiding alone is never a security boundary.

## Targeting

Supported targeting dimensions may include:

- product/application;
- environment;
- user/account pseudonymous identifier;
- organization/tenant;
- town/city/municipality/province/national geography;
- Beta/test cohort;
- app/client version;
- device/platform/capability;
- subscription/entitlement state;
- explicitly defined behavioral cohort where privacy policy permits;
- approved internal/test accounts.

Targeting must not be used to bypass anti-discrimination, privacy, authorization, or other policy obligations. Protected/sensitive attributes should not be used merely because a flag platform technically supports them.

## Geographic rollout

TownBoss products may use geographic rollout for staged activation, including GlenTown town activation. Geography used for exposure must remain distinct from authoritative eligibility, jurisdiction, residency, or government status unless the owning domain explicitly defines that relationship.

## Progressive rollout

Progressive rollout should support stages such as internal -> invited testers -> small percentage/cohort -> larger cohort/geography -> general availability.

Each material ramp should be observable and reversible. High-risk rollouts should define guardrails and rollback/kill criteria before expansion.

## Dependencies

Flags may depend on other flags or capabilities, but dependency graphs must be explicit and acyclic where feasible. A dependent flag cannot make an unavailable or unauthorized underlying capability valid.

Complex flag chains should be avoided because they make exposure difficult to reason about and retire.

## Experiments

Experiments must be hypothesis-driven rather than arbitrary UI randomization.

An experiment definition should include:

- experiment ID/version and owner;
- hypothesis and expected direction;
- population and exclusions;
- assignment unit;
- variants and allocation;
- primary metric(s);
- guardrail metric(s);
- minimum observation/decision criteria where applicable;
- start/end or stop conditions;
- known risks and privacy considerations;
- analysis method;
- final decision and evidence.

Experiment exposure must be logged consistently enough to avoid analyzing users who were never actually exposed.

## Experiment integrity

Do not silently change the hypothesis, primary metric, population, or variant semantics mid-experiment. Material changes require a new version/restart or an explicit amendment recorded before interpretation.

Repeated peeking or selective stopping must not be presented as statistically rigorous evidence unless the chosen analysis method supports sequential decisions.

An inconclusive experiment is a valid result. The platform must not manufacture certainty merely to choose a winner.

## Metrics and evidence

Experiment results should link to Evidence & Provenance when used for consequential portfolio/product decisions. Record metric definitions, observation windows, population, exclusions, analysis version, confidence/uncertainty where applicable, and known limitations.

Feature exposure itself is not proof that a feature caused an observed outcome.

## AI and Glen AI use

Flags may control exposure to Glen AI capabilities such as:

- Ask Glen availability;
- Anji availability;
- voice/multimodal surfaces;
- specific skills;
- model/provider routing experiments;
- context-default character suggestions;
- new planner integrations.

A flag must not change the canonical AI Authority classification of an operation. Experiments involving AI models/prompts/providers must preserve safety, authorization, grounding, privacy, and authority invariants across all variants.

No experiment variant may intentionally weaken a mandatory safety/authority gate merely to measure conversion or engagement.

## Character profiles

Glen/Anji/other profile availability may be feature-flagged or progressively rolled out. Character assignment or experimentation changes presentation only and must preserve the Character Profile invariants: capability, authorization, AI Authority, evidence truth, constraints, and orchestration state remain independent.

Real-person likeness/voice consent scope must be checked independently of a feature flag. A flag cannot override expired/revoked/missing likeness or voice authorization.

## Orchestration

Orchestration may evaluate flags when determining whether an optional capability/path is available. It must not interpret a flag as approval to execute a task.

For long-running workflows, the product must define whether flag state is snapshotted, re-evaluated at each relevant step, or safely migrated when a flag changes. Consequential execution gates must always be re-evaluated independently.

## Authorization and entitlements

Feature flags and entitlements are distinct. A flag controls rollout/exposure; an entitlement expresses a product/business right to use something; Authorization controls access to protected resources/actions.

Where all are relevant, the effective rule is conjunctive: required entitlement AND exposure AND authorization AND any authority/approval/constraint gates.

## Kill switches and incident response

Critical integrations or risky new capabilities should have a fast, auditable disable path where practical.

Kill-switch changes must record actor, timestamp, reason, affected scope, and restoration decision. A kill switch must not erase in-flight side effects; Orchestration/recovery remains responsible for reconciliation.

## Privacy

Use the minimum targeting attributes needed. Prefer pseudonymous stable assignment keys over raw PII. Do not send unnecessary sensitive product records to an external experimentation provider.

Provider integrations must define which attributes leave TownBoss-controlled systems and apply data-processing/privacy requirements accordingly.

## Security

Flags are not secrets. Client-delivered flag configuration must not contain credentials, private keys, privileged endpoints, or security assumptions that depend on users being unable to inspect them.

Server-side security/authorization checks remain mandatory regardless of client flag state.

Administrative mutation of production flags is a consequential operation and requires authenticated, authorized, auditable control. AI may prepare flag changes at A2; autonomous A3 flag mutation requires an explicit bounded policy and must never allow AI to disable its own authority/safety controls. A4 boundaries remain prohibited.

## Observability

The capability should support answering:

- what flag/experiment version was evaluated;
- what variant was returned;
- which rule/rollout caused the result;
- what fallback occurred on error;
- when rollout percentage/scope changed;
- who changed production configuration and why;
- which experiments are active;
- whether guardrails are degrading;
- which flags are stale or overdue for retirement.

Observability must avoid logging unnecessary PII.

## Stale-flag management

Every temporary flag should declare an owner and expected review/removal trigger. Tooling should surface flags that are fully released, expired, ownerless, unused, or past review date.

Retiring a flag means removing dead branches/configuration from consuming products when safe, not merely marking the remote flag inactive forever.

## Provider abstraction and GrowthBook

GrowthBook is an approved reference and candidate implementation provider because its concepts align with TownBoss needs: feature flags, targeting, progressive/cohort rollouts, experiments, metrics, dependencies, governance, stale-flag management, product analytics, and agent-assisted experimentation.

TownBoss adapters should map canonical concepts to GrowthBook or another provider. Product/domain code should depend on TownBoss flag/experiment semantics rather than vendor-specific objects where practical.

Provider replacement must preserve stable flag keys/meaning or use an explicit migration.

## Fail-closed rules

For consequential/risky capability exposure, resolve to non-exposed when:

- flag configuration cannot be verified;
- required targeting context is missing/ambiguous;
- a required dependency is unavailable;
- consent/rights required by the feature are missing/revoked/expired;
- exposure would violate a mandatory safety/authority rule;
- provider failure leaves no locally safe evaluated state.

Unknown must not be treated as enabled merely to preserve engagement.

## Product adapter responsibilities

Consumers define:

- flag keys and business meaning;
- allowed targeting attributes;
- default/fallback behavior;
- server/client evaluation location;
- rollout plan and guardrails;
- entitlement/authorization composition;
- experiment hypotheses/metrics;
- telemetry bindings;
- provider mapping;
- retirement/removal work.

Adapters must not turn feature flags into an alternate permission system.

## Initial consumers

Initial proving-ground consumers are expected to include GlenTown and Glen AI surfaces. Future consumers include GeoPlotter, RealWise, TownTraveler, TownDeveloper, and Development Supervisor where controlled rollout/experimentation is justified.

## Implementation truth

No current implementation evidence was found in TownBoss, GlenTown-API, or CodeBisor for a shared feature-flag/experimentation runtime. This is therefore `canonical-design-v1`, not an implemented capability.

Adopting GrowthBook as a production dependency remains a candidate implementation decision, not a claim that it is installed or deployed today.

## Non-goals

This contract does not:

- install GrowthBook or another provider;
- create experiments merely to increase activity;
- replace Authorization, entitlements, AI Authority, consent, or domain policy;
- permit experimentation on mandatory safety controls;
- require GlenTown Beta to ship experimentation infrastructure;
- make every configuration value a feature flag;
- require a centralized microservice before reuse evidence exists.
