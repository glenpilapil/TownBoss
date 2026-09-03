# TownBoss Payments & Credits v1

**Status:** Canonical design v1  
**Classification:** Platform Core  
**Scope:** TownBoss portfolio

## Purpose

Payments & Credits is the shared TownBoss capability for representing payment intent, credit balances, ledger-affecting entries, top-ups, refunds, payouts, withdrawals, provider interactions, reconciliation, and financially consequential state transitions across portfolio products.

It provides common financial-state semantics and control boundaries without turning TownBoss into a bank, payment processor, escrow provider, or autonomous financial authority.

## Core invariants

`payment intent != payment confirmation != settlement`

`credit balance != external bank balance != cash on hand`

`authorization != AI authority != financial authority`

`provider accepted != provider settled != reconciled`

A locally recorded payment state must never be presented as authoritative external settlement unless supported by the relevant provider or financial-system evidence.

## Architectural posture

TownBoss owns the canonical semantics and contracts. Products own domain-specific commercial rules, pricing, commissions, taxes, payout eligibility, refund policy, merchant relationships, and provider adapters.

Physical centralization is deferred until implementation evidence shows that multiple products need a shared runtime. Product repositories should implement thin adapters rather than fork the capability semantics.

## Core entities

### Financial Account Reference
A scoped reference to the party or internal balance owner affected by a transaction, such as a user, organization, merchant, platform account, settlement account, or provider-side account reference.

It is not necessarily a bank account and must not imply custody rights that the product does not possess.

### Credit Account
An internal balance container for platform-denominated or fiat-denominated credits where the product explicitly supports them.

A credit account must define currency or unit, owner, status, permitted operation classes, and whether the balance is withdrawable, refundable, transferable, promotional, restricted, or non-cash.

### Ledger Entry
An append-oriented financial record representing a debit, credit, reservation, release, adjustment, fee, refund, reversal, payout, withdrawal, top-up, or other balance-affecting event.

Ledger entries should be attributable, immutable after posting, and linked through reversal/correction records instead of destructive mutation where accountability matters.

### Payment Intent
A request or instruction to collect or recognize payment for a specific amount, currency, commercial purpose, payer scope, payee or merchant scope, and source domain reference.

Creating an intent does not prove payment.

### Payment Attempt
One attempt to satisfy a payment intent through a payment method or provider route.

Attempts may be pending, provider-accepted, failed, cancelled, expired, authorized, captured, or otherwise provider-specific. Canonical mapping must preserve provider detail without inventing stronger semantics than the provider returned.

### Payment Confirmation
An attributable event indicating that the configured acceptance condition for a payment has been met. The exact condition may be provider capture, verified manual proof, cash receipt confirmation, or another approved mechanism.

Confirmation is not necessarily final settlement.

### Top-Up
A transaction that increases a credit account balance after the required funding evidence, provider confirmation, or administrative approval has been satisfied.

### Refund
A return of value linked to an original financial event. Refund state should distinguish requested, approved, submitted, provider-accepted, completed, failed, cancelled, and partially completed where applicable.

### Payout
A transfer of value from a platform-controlled payable balance toward an eligible recipient or external destination under the product's payout policy.

### Withdrawal
A user- or organization-requested extraction of eligible withdrawable value from an internal credit or payable balance. Withdrawals require explicit eligibility and authority checks.

### Financial Adjustment
An authorized correction or administrative ledger-affecting entry. Adjustments must be attributable and reason-coded and must not be used to silently rewrite prior history.

### Reconciliation Record
A comparison between internal financial records and an authoritative external or operational source, identifying matched, unmatched, duplicate, partial, stale, or inconsistent states.

### Financial Evidence Reference
A reference to provider receipts, manual proof, bank/payment references, approval artifacts, external transaction identifiers, audit records, or provenance evidence needed to establish why a financial state changed.

## Financial state model

Products may use provider-specific states, but canonical interpretation should distinguish at least:

- created or pending;
- action-required;
- submitted;
- provider-accepted;
- confirmed;
- settled where determinable;
- failed;
- cancelled;
- expired;
- reversed;
- partially-refunded or refunded;
- disputed where supported;
- unknown or reconciliation-required.

Unknown or contradictory provider state must not be silently treated as success.

## Amount and currency rules

Every financially material record must carry an explicit currency or non-cash unit.

Amounts should use decimal-safe or integer-minor-unit representation appropriate to the implementation. Floating-point arithmetic must not be used as the authoritative representation for posted balances.

Products must define rounding policy for taxes, fees, discounts, commissions, and split calculations.

Cross-currency operations require an explicit rate source, rate timestamp/effective time, conversion direction, fee treatment, and resulting amounts. Currency conversion is not implied by this contract.

## Credit accounts and balances

A displayed balance should be explainable from its underlying ledger or other authoritative account records.

Where relevant, products should distinguish:

- available balance;
- pending balance;
- reserved/held amount;
- payable amount;
- withdrawable amount;
- promotional/restricted credits;
- disputed or frozen amount.

Balance projections may be cached for performance, but the projection is not a substitute for durable financial records.

## Ledger semantics

Important balance-affecting operations should use append-oriented financial entries with stable references and idempotency.

Corrections should use reversal, compensating, or adjustment entries rather than editing posted financial history in place.

A ledger is not required to use formal double-entry accounting in every product implementation, but implementations that custody or allocate material value across multiple accounts should prefer balanced posting semantics that can prove where value moved.

No capability may manufacture balance merely by changing a presentation field.

## Idempotency and duplicate prevention

The following operations are retry-sensitive and require stable duplicate prevention where implemented:

- payment intent creation when retried by clients or jobs;
- payment capture/confirmation ingestion;
- credit top-up posting;
- refund creation/submission;
- payout creation/submission;
- withdrawal creation/submission;
- financial adjustments;
- provider webhook processing;
- reconciliation imports;
- commission or fee posting.

Idempotency keys should be scoped tightly enough to prevent accidental reuse across unrelated operations.

A duplicate provider callback must not post value twice.

## Manual payment and proof workflows

GlenTown may support manual credit top-up or payment proof workflows. In such flows:

1. the user submits a funding claim and proof;
2. the system records it as pending/unverified;
3. an authorized reviewer or approved external verification process evaluates the evidence;
4. the financial state changes only after approval/verification;
5. the posting is attributable and idempotent;
6. rejected or duplicate proof does not increase balance;
7. the original evidence remains linked through Evidence & Provenance as appropriate.

A screenshot or uploaded receipt alone is not authoritative proof of payment.

## Provider integration

Payment providers, banks, e-wallets, processors, remittance services, app-store billing providers, and other external financial systems remain authoritative for the states they own.

Adapters should preserve:

- provider and route;
- external transaction/reference ID;
- amount and currency;
- provider status and canonical mapping;
- observed/received time;
- settlement or capture references where available;
- raw provider code or reason class needed for investigation;
- reconciliation status.

Raw sensitive payment credentials must not be stored in general product tables, logs, prompts, or audit payloads.

## Webhooks and asynchronous confirmation

Provider callbacks must be authenticated or verified using the provider's supported mechanism.

Webhook handlers should be idempotent, replay-safe, order-aware where provider ordering is not guaranteed, and able to tolerate duplicate delivery.

A provider callback should update canonical financial state through an explicit transition rather than arbitrary field mutation.

Where a committed domain transaction triggers financial side effects, the system should be compatible with transactional outbox/event patterns so retries do not lose or duplicate value movement.

## Reconciliation

Reconciliation is mandatory for workflows where external state can diverge from local state.

Reconciliation should identify:

- internal success with no matching external success;
- external success with missing local posting;
- amount/currency mismatch;
- duplicate transaction or callback;
- refund/payout/withdrawal mismatch;
- stale pending state;
- provider reversal or dispute;
- manual proof already used elsewhere;
- orphan financial records;
- unexpected balance drift.

Material mismatches should not be silently auto-corrected unless an explicit bounded policy exists. Otherwise they require review and an attributable corrective entry.

## Refunds

Refund policy belongs to the owning commerce/booking/service domain. Payments & Credits owns the financial execution semantics after a valid refund decision exists.

Refunds should remain linked to the original transaction and support partial refunds where product policy permits.

A local `refunded` status must not be shown as completed before the required provider or manual financial confirmation exists.

## Payouts and withdrawals

Payouts and withdrawals are consequential financial actions.

Before execution, the system must establish as applicable:

- authenticated actor;
- account ownership or recipient eligibility;
- exact resource authorization;
- available/withdrawable balance;
- amount and currency;
- payout destination validity;
- product/domain eligibility rules;
- fraud/risk/hold conditions;
- required approvals or dual control;
- AI Authority boundary;
- idempotency key;
- provider availability;
- audit and reconciliation linkage.

A payout or withdrawal request is not the same as a completed transfer.

## Holds, reservations and pending value

Products may reserve value for checkout, booking, dispute, payout, or other workflows.

A hold must define its purpose, owner, amount, currency/unit, expiry/release conditions, and source transaction.

Expired or cancelled workflows should release holds deterministically and idempotently.

A hold cannot be used to create hidden negative balances unless the owning product explicitly supports and controls that behavior.

## Discounts, vouchers and credits

Discounts and vouchers may reduce commercial price but are not automatically monetary credits.

A voucher's face value or discount amount must not be added to a withdrawable credit balance unless product policy explicitly defines that conversion.

Town, shop, promotional, referral, goodwill, and purchased credits should remain distinguishable where their legal/economic treatment differs.

Products must not present promotional credits as cash-equivalent when they are restricted or non-withdrawable.

## Orders, bookings and other domain transactions

Commerce, bookings, services, events, subscriptions, and other domains own the underlying transaction lifecycle.

Payments & Credits may reference their records, but must not become the source of truth for order fulfillment, booking validity, inventory, availability, cancellation policy, or service completion.

The domain should define what payment state is required for transitions such as confirmed, fulfilled, completed, or cancelled.

## Authorization and tenancy

Financial data and actions must respect organization, tenant, account, and resource boundaries.

Authorization must be evaluated independently from financial balance availability. Having sufficient balance does not grant permission to spend, refund, adjust, withdraw, or pay out funds.

Administrative financial actions require explicit authorization policy and durable audit history.

## AI Authority

Financial actions follow the Portfolio AI Authority Model.

AI may at A0-A2:

- explain balances, fees, payment states, or payout rules;
- reconcile or flag anomalies for review;
- draft refund, payout, withdrawal, or adjustment actions;
- prepare payment or top-up workflows;
- recommend safer or cheaper provider routes when policy permits.

A3 financial execution is permitted only where a dedicated bounded policy exists with exact account/resource scope, operation class, amount/exposure limits, approval conditions, deterministic controls, idempotency, audit, reconciliation, and recovery/stop behavior.

AI must not autonomously:

- grant credits;
- approve its own financial adjustment;
- waive a required payment;
- approve a withdrawal or payout where human/institutional authority is required;
- increase amount limits;
- bypass dual control;
- reinterpret a failed or unknown payment as successful;
- move funds outside the explicitly delegated scope;
- alter financial audit evidence to conceal its own action.

## Orchestration integration

Orchestration may coordinate payment-required tasks, funding checks, payment submission, proof collection, refund flows, payout workflows, exceptions, and reconciliation.

Orchestration does not create payment authority. It must treat financial readiness, approval, execution, provider confirmation, and completion as distinct gates.

Retries must not duplicate financial effects.

## Evidence & Provenance

Evidence & Provenance may store or reference provider receipts, manual payment proof, reconciliation artifacts, reviewer assessments, and superseding evidence.

Evidence does not itself post value. The Payments & Credits capability records the financial state transition after the required evidence/authority threshold is met.

Sensitive financial artifacts should be access-controlled and minimized.

## Audit & Observability

Financially material events should support durable audit attribution, including where applicable:

- payment intent creation;
- payment confirmation or failure;
- top-up submission/approval/rejection/posting;
- refund request/approval/submission/completion;
- payout/withdrawal request/approval/submission/completion;
- balance hold/release;
- administrative adjustment;
- provider or routing changes;
- reconciliation mismatch and corrective action;
- financial configuration or limit changes;
- AI Authority evaluation and approval references for AI-assisted actions.

Operational observability should expose rates and failures without treating logs or metrics as the ledger.

Useful metrics may include payment success/failure, pending age, webhook lag, duplicate suppression, reconciliation mismatch rate, refund failure, payout failure, withdrawal failure, balance drift detection, provider latency, and retry exhaustion.

## Security and privacy

Do not store raw card data, CVV, online-banking credentials, wallet passwords, private keys, access tokens, or equivalent secrets in general application storage.

Use provider tokenization or dedicated payment-security mechanisms where card or account instruments are supported.

Financial records should retain only the minimum payment-instrument metadata required for user recognition, support, compliance, and reconciliation.

Sensitive provider payloads should be redacted in logs and audit records.

## Feature Flags & Experimentation

Feature flags may control provider rollout, payment-method availability, UI presentation, or bounded operational routing.

Flags cannot:

- grant financial authorization;
- bypass required payment confirmation;
- disable mandatory reconciliation controls for risky flows;
- expose an unapproved withdrawal/payout path;
- change AI Authority classification;
- convert non-cash credits into withdrawable funds merely as an experiment.

Financial experiments require guardrails that protect balances, user rights, fees, refunds, and settlement integrity.

## Failure handling and recovery

The capability should explicitly handle:

- provider timeout after unknown outcome;
- duplicate callbacks;
- late provider success after local timeout;
- partial multi-recipient financial execution;
- refund/payout failure after local approval;
- reversal after prior success;
- stale pending transactions;
- ledger posting failure after external success;
- external submission failure after local reservation;
- orphan holds;
- manual reconciliation requirement.

Unknown financial outcome should prefer `reconciliation-required` over guessing success or failure.

## Implementation truth: GlenTown

Current GlenTown implementation evidence includes:

- order records with `payment_method`, `payment_status`, `paid_at`, amount, and currency fields;
- cart checkout with an explicit checkout idempotency key and transactional order creation;
- voucher entities, validation flows, and voucher usage records;
- an existing generic `AuditLog` model used in another domain;
- no verified shared payment-provider runtime, wallet/credit ledger, top-up controller, payout engine, withdrawal engine, or refund engine in the inspected backend state.

Therefore the canonical capability is **designed here**, while GlenTown remains **partial/planned** for actual financial execution. The architecture must not overstate current implementation.

## Initial GlenTown posture

For GlenTown Beta, the architecture allows the currently approved manual credit top-up + proof + admin approval direction without requiring a full external payment gateway before Beta.

When implemented, the minimum safe path should include:

- pending top-up request;
- amount/currency;
- submitted proof reference;
- duplicate prevention;
- reviewer authorization;
- approve/reject decision with actor/time/reason;
- append-oriented credit posting;
- resulting balance projection;
- audit event;
- evidence/provenance link;
- no AI autonomous approval.

This architecture does not require implementing the full shared capability before GlenTown physical audit unless a concrete Beta workflow depends on it.

## Non-goals

Payments & Credits v1 does not:

- create a bank or e-money institution;
- define legal custody status;
- replace payment providers or banks;
- define product pricing or tax policy;
- define accounting standards for the company;
- define commissions or merchant commercial terms;
- grant financial authority to AI;
- require cryptocurrency support;
- require a production payment provider before Beta;
- require immediate physical extraction into a standalone service.

## Extraction rule

TownBoss owns the contract. GlenTown and future products implement product-specific financial adapters. A shared physical runtime should be extracted only when reuse, operational isolation, regulatory boundaries, or financial-risk controls justify it.
