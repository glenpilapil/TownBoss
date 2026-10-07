# GlenTown Synthetic Population / Scenario Validation Pre-Beta Gate

**Status:** CANONICAL / PLANNED PRE-BETA GATE  
**Adopted:** 2026-10-07  
**Initial candidate stack:** MiroFish + OASIS, subject to pre-execution technical benchmarking and repository/security review.

## Purpose

GlenTown is a multi-sided Digital Town ecosystem involving residents, visitors, businesses, organizations, service providers, government-facing workflows, community interactions, commerce, planners, and Glen AI. Functional QA alone cannot expose all interaction-level, supply/demand, trust, adoption, and policy failures that can emerge when these actors interact at scale.

This gate introduces controlled **synthetic-population and multi-agent scenario validation before public Beta**.

The gate is intended to:

- discover ecosystem-level failure modes before real users encounter them;
- stress assumptions about onboarding, discovery, verification, commerce, community, travel, services, planners, government-facing flows, and Glen AI;
- test activation, geographic rollout, supply/demand, trust, abuse, scarcity, and adoption scenarios;
- produce a prioritized risk/experiment backlog for Beta;
- establish hypotheses that must later be checked against real Beta telemetry and research.

## Governing principle

Synthetic-agent behavior is **not evidence of real human behavior**.

MiroFish/OASIS or any successor simulation stack may generate hypotheses, failure modes, scenario comparisons, and prioritization evidence. It must not be used to claim:

- product-market fit;
- statistically representative demand;
- real usability;
- real conversion or retention;
- real trust or willingness to verify;
- real safety outcomes;
- real demographic behavior.

Simulation findings must be labeled **SYNTHETIC** and kept analytically separate from observed user research and production/Beta telemetry.

## Gate position

The required sequence for Beta-critical validation is:

1. automated/unit/integration/regression QA;
2. real API and release-build integrity;
3. Android physical-device and Web/browser acceptance;
4. critical-journey and operational acceptance;
5. security/privacy/compliance and enabled-geography readiness;
6. **Synthetic Population / Scenario Validation Pre-Beta Gate**;
7. Beta release decision;
8. real Beta research, telemetry, survey evidence, and simulation recalibration.

Synthetic simulation supplements the preceding gates. It does not replace them.

## Candidate simulation architecture

The initial candidate is **MiroFish using OASIS** or an equivalent audited multi-agent simulation stack.

Before execution, the selected stack must be reviewed for:

- active maintenance and reproducibility;
- licensing and permitted use;
- data handling and privacy;
- graph/vector/LLM dependencies;
- model/API cost;
- local versus hosted execution boundaries;
- observability and exportability of agent state/actions;
- deterministic/replay controls where available;
- practical agent-count and token/compute ceilings on the chosen infrastructure.

Do not encode a vendor-specific implementation as permanent architecture. The gate survives replacement of MiroFish/OASIS.

## Population model

Agents must be generated from explicit, documented strata rather than as an undifferentiated random crowd.

Relevant strata may include:

- geography: Province, Town, Barangay context, urban/rural classification;
- resident, visitor, tourist, returning resident;
- age band and household context where legitimately modeled;
- occupation/employment state;
- income or purchasing-power band;
- student, employee, self-employed, professional, retiree;
- MSME/business/organization type;
- accommodation, food, tourism, transport, property, services, retail and supplier actors;
- government/public-institution actors where appropriate;
- buyer/seller/provider/employer/applicant roles;
- digital proficiency and connectivity conditions;
- trust/verification propensity;
- high-, medium-, low-frequency app usage;
- accessibility and language-related personas where supported;
- adversarial, abusive, spam, fraud, and policy-edge personas for bounded safety testing.

Population strata must be traceable to legitimate public statistics, GlenTown survey findings, observed Beta data, or explicitly documented assumptions.

## Weighted representation

One synthetic agent does not need to equal one real person.

Simulation runs may use weighted agents so that a manageable synthetic population represents a much larger real-world population. Weights, sampling assumptions, and known distortions must be recorded with every run.

A larger simulation is not automatically better. Calibration quality and scenario validity take precedence over raw agent count.

## Planned scale ladder

These are **planning targets, not guaranteed engine limits or mandatory counts**:

| Stage | Target synthetic population | Primary purpose |
|---|---:|---|
| Workflow / policy micro-simulation | 50–200 | Find obvious UX, policy, and interaction failures |
| Puerto Princesa calibration environment | 2,000–5,000 | Deep-pilot ecosystem calibration against surveys and later observed Beta behavior |
| Palawan simulation | 5,000–20,000 | Cross-Town supply/demand, mobility, tourism, marketplace and network effects |
| Regional / multi-province | 20,000–50,000 | Geographic rollout and heterogeneous readiness |
| Philippines representative simulation | 50,000–250,000 | National ecosystem scenarios using weighted strata |
| Extreme selected stress experiments | up to the validated practical engine ceiling | Large-scale emergent/network behavior only after benchmarking |

OASIS advertises very large agent simulations, but GlenTown must not claim a practical million-agent MiroFish deployment until the exact stack and infrastructure are benchmarked. Any experiment approaching that scale requires an explicit compute/cost/reproducibility record.

## Puerto Princesa calibration role

Puerto Princesa is the **first calibration environment**, not the geographic ceiling of the gate.

The initial deep-pilot simulation should be compared against:

- GlenTown Puerto Princesa survey evidence;
- known local business/service/tourism composition;
- seeded GlenTown inventory;
- observed onboarding and critical-journey data from controlled testing;
- later Beta telemetry and qualitative research.

When simulated and observed behavior diverge materially, the simulation assumptions must be revised. The model is not allowed to override real-world evidence.

## Required scenario families

At minimum, the pre-Beta runbook must cover representative scenarios from these families:

1. **Acquisition and onboarding** — registration, profile completion, verification friction, first-value discovery.
2. **Discovery and geographic activation** — nationwide access with uneven local capability depth; Town activation and limited-supply conditions.
3. **Marketplace/service liquidity** — supply shortage, oversupply, thin categories, price/availability changes, failed fulfillment.
4. **Travel and tourism** — accommodation, tours/experiences, transport, itinerary planning, seasonal demand and last-minute behavior.
5. **Community and trust** — local posts, anonymity boundaries, moderation, misinformation/abuse pressure, trust and reputation.
6. **Government/public-service interaction** — truthful external-authority boundaries, dependency outage, stale information, verification requirements.
7. **Planner/orchestration behavior** — Trip, Event, Financial, Day Planner and Achieve interactions across realistic competing goals.
8. **Glen AI** — recommendation/action boundaries, ambiguous intent, unavailable capability, incorrect assumptions, escalation/handoff.
9. **Commerce/payment constraints** — capability-aware payment options, pay-at flows, failed checkout, duplicate actions, cancellations.
10. **Reliability/connectivity** — degraded connectivity, GlenTown Free/zero-rated concepts where applicable, cached/offline behavior.
11. **Adversarial ecosystem conditions** — spam, scams, coordinated abuse, fake supply, suspicious verification behavior, manipulation attempts.
12. **Growth shocks** — sudden local or national user influx, viral content, event-driven spikes and geographically concentrated demand.

## Required run artifacts

Each material run must record:

- simulation identifier and date;
- exact GlenTown source/data/config checkpoint;
- exact simulator/tool/model versions;
- seed corpus and provenance;
- population definition and weights;
- active-agent scheduling/activation assumptions;
- scenario parameters and interventions;
- run duration/steps;
- model/provider and token/compute/cost information where applicable;
- failures, anomalies and reproducibility notes;
- quantitative outputs;
- qualitative agent traces sampled for review;
- findings grouped by severity/confidence;
- proposed experiments/fixes;
- disposition owner and status.

## Exit criteria

The pre-Beta synthetic-population gate may be marked **PASS** only when:

- the selected simulation stack has passed the required technical/security/license review;
- the Puerto Princesa calibration population and assumptions are documented;
- required scenario families have been executed at a practical calibrated scale;
- results are reproducible enough for review or limitations are explicitly documented;
- critical/high-confidence material findings have been fixed, mitigated, accepted by authority, or converted into explicit Beta experiments;
- no synthetic finding is misrepresented as observed real-user evidence;
- the final risk/experiment backlog is linked into the canonical GlenTown implementation/blocker/risk artifacts;
- release authority explicitly accepts residual simulation risk.

A simulation run itself does not pass the gate. **Disposition of material findings is part of the gate.**

## Post-Beta recalibration

After Beta begins, observed telemetry, research, support incidents, survey results, conversion/retention behavior, supply/demand data, and safety/moderation outcomes must be used to recalibrate or invalidate synthetic assumptions.

The simulation system should become progressively evidence-grounded rather than remaining a static pre-launch model.

## Status semantics

Use these states:

- **NOT_STARTED**
- **STACK_REVIEW**
- **POPULATION_MODELING**
- **CALIBRATION**
- **SCENARIO_EXECUTION**
- **FINDINGS_DISPOSITION**
- **PASS**
- **BLOCKED**
- **DEFERRED_BY_AUTHORITY**

Until this document's exit criteria are satisfied on a concrete pre-Beta release candidate, this gate is **NOT_STARTED / PLANNED** and does not establish Beta readiness.
