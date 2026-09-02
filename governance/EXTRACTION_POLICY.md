# TownBoss Shared Capability Extraction Policy

**Status:** Canonical foundation v1

## Principle

Logical sharing comes before physical extraction. A capability does not become a microservice, separate repository, package, or deployment merely because more than one product may eventually use it.

## Extraction triggers

Consider physical extraction when one or more are supported by evidence:

- a second real product needs the capability;
- duplicate implementations are beginning to form;
- an independent release lifecycle materially helps;
- independent scaling or availability requirements exist;
- a security/privacy boundary requires isolation;
- multiple technology stacks need a stable network/API contract;
- ownership and maintenance are clearer when separated;
- independent testing/deployment materially reduces portfolio risk.

## Extraction blockers

Do not extract primarily because:

- the architecture diagram looks cleaner;
- a future product might someday need it;
- microservices are considered inherently more mature;
- a repository is becoming large without evidence of a bounded-context problem;
- extraction would jeopardize an active Beta/production milestone without compensating benefit.

## Extraction ladder

Prefer the least expensive boundary that solves the actual problem:

1. logical module/bounded context;
2. internal package/library;
3. stable internal API or event contract;
4. independently versioned package;
5. independently deployed service;
6. separate repository only when lifecycle/ownership/tooling justify it.

Not every capability must traverse every stage.

## Migration safety

Extraction must preserve behavior and authorization, tenancy, idempotency, transactional/event reliability, auditability, privacy, and observability requirements. A migration is not complete until consumers use the new contract and the old duplicated path is retired or explicitly retained with documented ownership.
