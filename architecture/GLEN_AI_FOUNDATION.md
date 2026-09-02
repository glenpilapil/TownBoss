# Glen AI Foundation v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Glen AI Foundation is the reusable TownBoss intelligence layer for understanding user intent, assembling authorized context, selecting appropriate skills, invoking model/provider capabilities, grounding outputs, proposing actions, and handing consequential work to the canonical Orchestration and AI Authority capabilities.

It is the shared intelligence and interface substrate behind product experiences such as GlenTown's future **Ask Glen**, GeoPlotter assistance, RealWise assistance, TownTraveler assistance, and TownDeveloper assistance.

The foundation is intentionally product-neutral. Products own their user experience, domain semantics, available skills, data, workflows, and business rules.

## Capability-company rule

TownBoss owns the generic Glen AI Foundation contract. Products implement thin adapters and register domain skills. No product should create a competing AI foundation with different authority, grounding, context, or skill-routing semantics.

Logical boundary comes before physical extraction. This contract does not require a shared AI microservice, a specific model vendor, a new assistant UI, or immediate product implementation.

## Core responsibilities

Glen AI Foundation owns these generic concerns:

1. **Interaction intake** — normalize an AI interaction request from supported product surfaces and modalities.
2. **Intent interpretation** — determine likely user goal(s), ambiguity, and whether clarification or non-executing guidance is sufficient.
3. **Skill discovery and routing** — identify registered skills capable of addressing the request and select an allowed route.
4. **Context assembly** — gather the minimum authorized product/domain/user/session context needed for the task.
5. **Grounding coordination** — prefer authoritative or attributable sources and preserve evidence/provenance links when material.
6. **Model/provider abstraction** — invoke an appropriate model or deterministic intelligence component through a provider-neutral interface.
7. **Response shaping** — return explanations, recommendations, drafts, structured outputs, or action proposals appropriate to the consumer.
8. **Action handoff** — convert action-seeking outcomes into bounded proposals for Orchestration/AI Authority rather than directly manufacturing execution authority.
9. **Safety and policy routing** — apply platform safety/policy boundaries before exposing or acting on model output.
10. **Observability** — make material routing, grounding, model, authority, and action-handoff decisions attributable without exposing secrets or unnecessary private data.

## Core entities

### AI Interaction
An attributable request for intelligence assistance, including product context, authenticated/guest state where applicable, locale, modality, input, and requested outcome.

### Intent
A normalized interpretation of the user's current goal. Intent is probabilistic and must not be treated as authorization, legal intent, professional instruction, or an authoritative record.

### Skill Definition
A machine-readable declaration of a reusable or product/domain-specific AI skill.

A skill declares at minimum:

- stable skill identifier and version;
- owning capability/product;
- supported intents/tasks;
- accepted input/output schemas where structured;
- required context scopes;
- required tools/capabilities;
- maximum AI Authority level it may request;
- whether it is read-only, recommendatory, preparatory, or potentially executable;
- evidence/grounding requirements;
- relevant constraints/policies;
- failure and escalation behavior.

### Skill Route
The selected skill or skill composition for an interaction, including selection rationale, eligibility, fallback route, and any unresolved ambiguity.

### Context Packet
A bounded, attributable set of information supplied to a skill/model. Context packets should identify source classes and data scopes rather than becoming an unrestricted dump of product state.

### Grounding Reference
A link to evidence, domain records, authoritative external information, or other attributable source material supporting a material claim or recommendation.

### Model Invocation
An attributable invocation of an AI/model/deterministic intelligence provider with model family, policy class, input contract, output contract, latency/cost metadata where applicable, and result status.

### AI Output
A typed output such as explanation, answer, recommendation, draft, structured extraction, classification, plan proposal, scenario proposal, verification request proposal, or action proposal.

### Action Proposal
A bounded proposed consequential operation. It is not execution authority. It must declare operation, resources, parameters, evidence/assumptions, required authority, and handoff destination.

## Interaction lifecycle

A canonical AI interaction follows:

`Input -> Normalize -> Interpret Intent -> Determine Scope -> Discover Skills -> Authorize Context -> Assemble Context -> Ground -> Invoke Intelligence -> Evaluate Output -> Shape Response -> Propose/Handoff Actions -> Observe`

The lifecycle may stop early when the request can be answered safely without model invocation, when required context is unavailable, when authority is insufficient, or when clarification is necessary.

## Open-domain versus product-domain behavior

Glen AI may support open-domain informational interaction, but open-domain capability does not override product boundaries.

The system must distinguish:

- general knowledge/explanation;
- product help and navigation;
- domain advice/recommendation;
- product data retrieval;
- scenario/simulation;
- planning/orchestration;
- professional or regulated matters;
- consequential actions.

As interaction moves toward domain-specific or consequential behavior, grounding, authorization, AI Authority, constraints, and human verification requirements become stricter.

## Skill registry and routing

Skills are the canonical extension mechanism for Glen AI.

A product should register capabilities as skills instead of embedding a monolithic prompt containing every product behavior.

Routing must consider:

- user intent and requested outcome;
- product and domain context;
- required data/tool availability;
- user/resource authorization;
- maximum permitted AI Authority;
- evidence freshness/quality;
- applicable constraints and policies;
- skill health/version/feature-flag state;
- cost/latency/provider limits where relevant.

A skill that is technically available but not authorized or safe must not be selected for execution.

Skill composition is allowed, but composing skills must not create authority that no component has individually. Tool chaining and sub-agent chaining cannot be used to bypass A4 or other platform boundaries.

## Context assembly

Glen AI should use **context on demand**, not unrestricted global context.

Context may include:

- current user/session identity attributes permitted for the task;
- organization/tenant context;
- current product/screen/workflow context;
- explicitly relevant records;
- user preferences or durable memory where separately permitted;
- recent interaction context;
- evidence/provenance references;
- authoritative external information;
- orchestration/scenario/constraint state;
- product help/LMS material.

Context providers remain responsible for access control and source truth. Glen AI does not own the underlying domain record simply because it retrieves it.

Sensitive context should be minimized. Secrets, credentials, unrestricted privileged tokens, and unrelated personal data must not be inserted into model context.

## Memory boundary

Glen AI Foundation may consume short-term conversational/session context and separately governed durable user memory/preferences, but it does not own all user data or silently convert observed behavior into durable memory.

Durable memory must have an explicit source, scope, retention/deletion policy, and privacy basis. Product/domain records remain authoritative in their owning capabilities.

AI-generated summaries of prior interactions are derived context, not substitutes for authoritative records.

## Grounding and truth hierarchy

The system should prefer, in descending order where applicable:

1. authoritative current domain/system records;
2. verified Evidence & Provenance records;
3. current authoritative external sources;
4. attributable product knowledge/help content;
5. validated structured inference/simulation;
6. general model knowledge.

This hierarchy is contextual rather than absolute, but lower-authority information must not overwrite higher-authority records.

When evidence is material, Glen AI should preserve enough provenance to explain where a claim came from and when the source was observed/effective.

Confidence is not authority. A highly confident model answer cannot replace required evidence, professional verification, or authoritative external state.

## Model/provider abstraction

Glen AI must not depend architecturally on a single model vendor.

A provider/model gateway should allow skills to express requirements such as:

- text/reasoning;
- vision;
- speech input/output;
- structured output;
- tool/function calling;
- context size;
- latency class;
- cost class;
- privacy/data-residency requirements;
- deterministic or high-reliability preference.

Provider selection is an implementation concern governed by policy, feature flags, health, evaluation evidence, and cost/reliability constraints.

Model replacement must not silently change AI Authority or weaken deterministic execution gates.

## Deterministic components

Not every Glen AI task should use a generative model. Skills may route to deterministic parsers, search, rules, calculators, constraint evaluators, scenario engines, or domain services when those are more reliable or appropriate.

Generative models should not be used to recreate deterministic domain logic that already exists in an authoritative capability.

## Integration with AI Authority

Portfolio AI Authority is mandatory for any Glen AI action path.

- **A0:** explain or surface information.
- **A1:** recommend, draft, classify, summarize, or propose.
- **A2:** prepare a consequential action for attributable human approval.
- **A3:** bounded autonomous execution only through the canonical gates and explicit delegation/policy.
- **A4:** prohibited autonomous authority.

A skill declaration may state the maximum authority it could request, but the runtime derived authority and current policy control the actual behavior.

Model confidence, user phrasing, tool access, past approval, or skill selection cannot self-escalate authority.

## Integration with Orchestration

Glen AI provides intelligence and proposes/initiates orchestration; Orchestration owns execution lifecycle.

For multi-step goals, Glen AI may:

- interpret the goal;
- suggest/decompose tasks;
- gather missing information;
- select relevant scenario/constraint/verification skills;
- prepare a plan proposal;
- explain blockers or exceptions;
- help the user choose among options.

Once a consequential workflow exists, Orchestration owns dependencies, readiness, gates, retries, scheduling, execution attempts, exceptions, recovery, cancellation, and completion state.

Glen AI must not maintain a hidden parallel workflow state that conflicts with Orchestration.

## Integration with Scenario Engine

Glen AI may create or explain scenario proposals and compare scenario outcomes through the Scenario Engine.

Generated assumptions must be explicit. A model-generated scenario is not an authoritative forecast or approval.

## Integration with Constraint Engine

Glen AI may explain constraints, prepare evaluation contexts, and interpret structured constraint results for users.

It must not hallucinate a constraint result or convert an unknown/failed hard constraint into a pass.

## Integration with Evidence & Provenance

Glen AI should use Evidence & Provenance for material claims, verification state, source attribution, freshness, supersession, and auditability where appropriate.

Model-generated claims may be recorded as derived/inferred observations only when clearly identified as such; inference is not authoritative evidence.

## Integration with Human Verification

When uncertainty, professional reservation, stale evidence, or authority limitations require a human, Glen AI may prepare a Human Verification request and explain why human review is needed.

The model may recommend a reviewer class but cannot manufacture credentials or professional authority.

## Help Center and LMS boundary

Product Help Center/LMS content may be a high-priority grounding source for questions about how to use a product, policies, workflows, training, and educational material.

Glen AI may act as a conversational interface over that content. It does not own the canonical help/training material and must not silently invent product policy when authoritative documentation is absent.

## Tool and connector use

Tools are execution interfaces, not authority grants.

Every tool declaration used by Glen AI should identify:

- owning capability/product;
- read/write/consequential classification;
- required authorization;
- authority level/gates;
- input/output contract;
- idempotency requirements where applicable;
- safe retry/recovery behavior;
- data sensitivity.

Read access must still respect tenant/resource authorization. Write access must flow through AI Authority and Orchestration where consequential.

## Safety and uncertainty

Glen AI must distinguish among:

- known/current fact;
- retrieved authoritative fact;
- inferred conclusion;
- estimate;
- recommendation;
- scenario assumption;
- uncertain/unknown state.

The foundation should not force false certainty. When information is insufficient, the appropriate result may be clarification, retrieval, verification, escalation, or refusal to execute.

For safety-, legal-, financial-, professional-, government-, identity-, or high-impact matters, domain policies may require stricter grounding, verification, authority, and disclosure.

## Identity and disclosure

Products may present Glen AI with product-specific names, avatars, voice, or personality, including **Ask Glen** in GlenTown. Such presentation is a product-layer concern.

The interface must not misrepresent AI-generated content as human-authored or imply professional/government authority the system does not possess. Any synthetic voice/avatar using a real person's likeness must be disclosed according to applicable product policy.

## Multimodal interface

The foundation may support text, voice, image, document, map/spatial, and other modalities through adapters.

A modality does not change authority semantics. Voice commands do not grant more authority than typed commands; image recognition does not turn inference into authoritative evidence.

## Privacy and tenancy

Context assembly, skill routing, model invocation, and tool use must preserve tenant/resource isolation.

Provider-bound data should be minimized to what is necessary for the interaction and governed by provider/data-processing policy. Products must be able to exclude classes of sensitive data from external model providers where required.

Cross-product context sharing must be explicitly authorized and must follow the relevant data ownership/privacy rules. Glen AI being portfolio-wide does not make all portfolio data globally visible.

## Prompt and instruction hierarchy

Implementation should distinguish canonical platform policy, product policy, skill instructions, retrieved context, tool results, and user input.

Untrusted retrieved content or user-provided documents must not be treated as higher-priority system instructions. Prompt-injection resistance must be part of tool/context handling.

## Evaluation and release discipline

A Glen AI skill should not be considered production-ready solely because it appears to work in a few conversations.

Where material, evaluation should cover:

- task success and factuality;
- grounding quality;
- authorization/tenant isolation;
- AI Authority compliance;
- unsafe tool/action attempts;
- hallucination/unknown handling;
- prompt injection/tool injection;
- latency/cost;
- provider degradation/fallback;
- regression across supported locales/modalities.

Feature Flags/Experimentation may later govern staged skill/model/provider rollout.

## Observability

Material interactions should make it possible to determine, subject to privacy controls:

- which skill(s) were selected and why;
- which context sources/classes were used;
- which model/provider/version was invoked;
- which evidence supported material claims;
- what AI Authority level applied;
- which action proposals were produced;
- whether Orchestration/Verification was invoked;
- failures, fallbacks, refusals, and policy blocks;
- latency/cost/token or equivalent usage where operationally useful.

Logs must avoid exposing secrets and should minimize raw sensitive prompts/context where structured telemetry suffices.

## Fail-closed rules

Glen AI MUST NOT perform consequential autonomous execution when:

- AI Authority is insufficient or ambiguous;
- required authorization is missing;
- the selected skill/tool does not explicitly permit the operation;
- required constraints/verification/evidence are unresolved;
- context isolation cannot be guaranteed;
- an external authoritative state materially conflicts with assumptions;
- the action would cross an A4 boundary;
- the model output cannot be bounded to a deterministic operation contract;
- tool execution requires unsafe credential exposure or unrestricted access.

In these cases Glen AI may explain, ask for missing information, prepare an A2 proposal, route to verification, or stop.

## Product adapters

Each consuming product should define a thin Glen AI adapter containing:

- branded interaction surfaces and modalities;
- product/domain skill registrations;
- context providers and allowed scopes;
- help/LMS knowledge sources;
- domain tool registrations;
- domain authorization and AI Authority mappings;
- evidence/grounding requirements;
- domain safety/policy overlays;
- supported locales/personality/voice presentation;
- product-specific escalation and fallback behavior.

The adapter must not fork the canonical skill, context, authority, or action-handoff principles.

## Current implementation truth

As of this v1 definition, GlenTown has the product-side `AiAuthorityGate` enforcement boundary but no implemented general Glen AI assistant, model gateway, skill registry/router, context assembler, or conversational execution layer.

Therefore Glen AI Foundation is `canonical-design-v1`, not `implemented`.

Future implementation should begin with the smallest real consumer needs and reuse existing product capabilities rather than creating a speculative all-knowing assistant subsystem.

## Non-goals

This contract does not:

- implement the Ask Glen UI;
- select a permanent model vendor;
- create a portfolio-wide unrestricted memory store;
- duplicate Search, Messaging, Orchestration, Authorization, Evidence, Scenario, Constraint, Human Verification, or domain services;
- authorize new autonomous actions;
- create professional or government authority;
- add post-Beta GlenTown features merely to demonstrate AI;
- require a microservice or separate repository;
- require every product to expose the same AI features.
