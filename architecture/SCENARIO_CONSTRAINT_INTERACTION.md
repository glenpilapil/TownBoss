# TownBoss Scenario + Constraint Interaction Model

**Status:** Canonical design v1

## Purpose

TownBoss uses Scenario Engine and Constraint Engine as complementary Platform Core capabilities. The Scenario Engine models possible futures and compares outcomes. The Constraint Engine determines whether a subject, plan, or scenario satisfies explicit rules and limits.

They are separate because scenarios answer **“what if?”**, while constraints answer **“is this allowed, feasible, available, affordable, safe, or otherwise acceptable under these rules?”**

## Canonical flow

```text
Subject / Goal / Baseline
        |
        v
Evidence & Provenance
(source facts, observations, dates, confidence)
        |
        v
Scenario Definition
(assumptions + candidate choices)
        |
        v
Constraint Binding
(hard / soft / advisory constraints)
        |
        v
Constraint Evaluation
(pass / fail / warning / unknown / N/A / error)
        |
        v
Scenario Run / Simulation
        |
        v
Outcomes + Trade-offs
        |
        v
Scenario Comparison
        |
        v
Human / Domain Decision
        |
        v
Orchestration / Execution
```

Execution is deliberately outside both engines.

## Responsibility split

### Scenario Engine owns

- scenario identity and lineage;
- assumptions;
- scenario runs;
- outcome records;
- comparisons and trade-offs;
- baseline/alternative relationships;
- reproducibility metadata where practical.

### Constraint Engine owns

- reusable constraint definitions and sets;
- severity: hard, soft, advisory;
- evaluation contexts;
- evaluation results and explanations;
- effective dates, jurisdiction and scope references;
- authorized override records.

### Domain capabilities own

- the actual meaning of the scenario;
- authoritative policy/rule authorship;
- business decisions;
- professional sign-off;
- government authority;
- external mutations or execution.

## Hard, soft and advisory constraints

A **hard** constraint normally blocks feasibility when it fails. Examples include a legally required setback, expired eligibility, unavailable inventory, missing authorization, or a strict budget ceiling.

A **soft** constraint is a preference or optimization target that can be violated with an explicit trade-off, such as desired travel duration, preferred density, desired monthly payment, or preferred tree preservation.

An **advisory** constraint surfaces guidance or risk but does not itself determine feasibility.

A hard constraint may be overridable only where the owning domain explicitly allows it and an authorized actor performs the override. The Constraint Engine does not invent override authority.

## Unknown is not pass

If evidence is missing, stale, ambiguous, inaccessible, or the evaluation cannot be performed, the result is `unknown` or `error`, not `pass`.

This is especially important for government requirements, professional rules, spatial hazards, financial eligibility, availability, and any other consequential workflow.

## Evidence integration

Material assumptions and constraint sources should reference Evidence & Provenance when practical. This allows a scenario to explain not only its result but also which source facts, dates, observations and assessments shaped the result.

Examples:

- GeoPlotter setback constraint derived from a planning rule or professional input;
- a mature-tree preservation scenario based on recent site photos and imagery;
- Day Planner eligibility constraint based on current agency requirements;
- Trip Planner availability constraint based on inventory or schedule data;
- a financial scenario based on income, rates, balances or user-entered assumptions.

## AI authority

AI may generate candidate scenarios, assumptions, optimizations and explanations at A1 by default. It may prepare more consequential scenario-backed actions at A2 where the domain allows it. Scenario results never grant A3 execution authority by themselves.

High confidence does not convert a scenario into authoritative fact, nor does a passing constraint evaluation substitute for a professional, government or other authorized decision.

## Domain examples

### GeoPlotter / TownDeveloper

A development scenario may define subdivision layout, preserved trees, development type and architectural theme. Constraint Engine evaluates setbacks, easements, access, terrain, hazards, density, preservation requirements and other available constraints. Scenario Engine compares buildable area, lot count, estimated cost, preservation impact and other outcomes.

### GlenTown Day Planner

A scenario may represent one possible errand plan. Constraints can test office hours, eligibility, cooldowns, required documents, travel windows, budget and dependencies. Orchestration then turns an approved feasible plan into ordered tasks.

### TownTraveler

Scenarios can compare itineraries while constraints test opening hours, travel times, availability, budget, accessibility or user preferences.

### RealWise

Scenarios can compare property choices or financing assumptions. Constraint evaluations may test buyer requirements, availability, affordability or accreditation conditions without taking over brokerage or approval decisions.

### Forex Quant Lab

The Scenario Engine can be reused for backtest/forward-test scenario comparison, but trading-specific risk controls remain a separate domain policy. Constraint Engine may support deterministic limits, yet it does not grant execution authority or replace the trading system's own risk controls.

## Interaction with Orchestration Engine

Scenario and Constraint Engines determine candidate feasibility and trade-offs. Orchestration owns the lifecycle from approved goal/plan into tasks, dependencies, validation gates, resources, schedule, execution, exceptions and completion.

Recommended pattern:

```text
Plan -> Simulate -> Validate -> Approve -> Execute -> Observe
```

The engines cover the `Simulate` and major parts of `Validate` stages. They must not silently cross into `Execute`.

## Extraction posture

Both capabilities begin as canonical logical contracts. They should not become standalone services or repositories until real multi-product consumption, independent scaling/deployment, security isolation, operational ownership or another approved extraction trigger justifies it.
