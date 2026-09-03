# Scheduling & Shared Resource Calendar v1

Status: canonical-design-v1
Classification: Platform Core
Current canonical home: TownBoss
Initial consumer: GlenTown
Future consumers: TownTraveler, RealWise, TownDeveloper, Glen AI

## Purpose

Scheduling provides reusable portfolio semantics for time windows, availability, reservations, holds, conflicts, deadlines, calendar projections, and resource allocation without becoming the source of truth for bookings, orders, professional authority, or external calendar systems.

Core rule:

`schedule != availability truth != reservation confirmation != execution authority`

A planned time or conflict-free window does not by itself prove that a resource is still available, that a booking is confirmed, or that an action is authorized to execute.

## Capability boundary

Scheduling owns generic time/resource coordination semantics. Product domains own the business state that makes a resource schedulable and the rules that determine whether a booking, appointment, trip item, service slot, event, professional engagement, property viewing, delivery, or task is valid.

Orchestration may bind tasks to schedule windows, but Scheduling remains a separate capability. Scheduling determines temporal/resource feasibility; Orchestration coordinates lifecycle progression.

## Core entities

- schedule-window
- resource-reference
- availability-rule
- availability-observation
- reservation
- hold
- calendar-entry
- conflict
- recurrence-rule
- schedule-constraint
- timezone-context
- external-calendar-reference

## Resource model

A schedulable resource may represent a person, professional, organization, room, property, vehicle, equipment item, service capacity, booking inventory, delivery capacity, time budget, or other domain-defined resource.

Resource identity and authorization remain with the owning domain or Platform Core capability. Scheduling stores or consumes references, not ownership authority.

## Availability

Availability can be derived from one or more of:

- declared working hours or service hours;
- existing reservations or holds;
- resource capacity;
- travel or setup buffers;
- domain constraints;
- external calendar busy state;
- external provider availability;
- planner-defined arrival/departure windows;
- product-specific blackout periods.

Availability is time-sensitive. A previously valid slot must be revalidated before consequential reservation or execution when freshness matters.

Core invariant:

`available at planning time != guaranteed available at execution time`

## Holds and reservations

The capability distinguishes tentative holds from confirmed reservations.

A hold may temporarily reduce available capacity but must have explicit expiry or release semantics. A confirmed reservation must retain the authoritative domain reference that caused it.

Scheduling must not locally convert a tentative hold, pending booking, or external request into a confirmed reservation without confirmation from the owning domain or authoritative external system.

## Conflict semantics

A conflict is a typed incompatibility between proposed and existing schedule/resource state. Examples include:

- time overlap;
- capacity exceeded;
- outside availability window;
- insufficient travel/setup buffer;
- blackout period;
- incompatible resource assignment;
- deadline violation;
- stale external availability.

Conflicts may be blocking or advisory according to product policy. Scheduling reports the conflict; it does not manufacture an override.

## Capacity

Resources may be single-capacity or multi-capacity. Capacity evaluation must be deterministic for the same inputs and must distinguish quantity requested from quantity remaining.

Capacity state owned by another domain must be revalidated against that domain before confirmation.

## Timezones and time semantics

All schedule-bearing records must retain enough timezone context to reconstruct the intended local time. Implementations should prefer an explicit timezone identifier over relying solely on a numeric UTC offset when recurring or future events are involved.

The capability must distinguish:

- instant timestamps;
- local date/time;
- date-only commitments;
- open/closed intervals;
- all-day entries;
- deadlines;
- recurring windows.

Ambiguous local times caused by daylight-saving transitions must be resolved deterministically where applicable.

## Recurrence

Recurring availability or schedule entries should use a structured recurrence contract rather than duplicated ad hoc rows where practical. Exceptions, overrides, cancellations, and one-off additions must remain attributable.

Expansion of recurrence into concrete occurrences is a derived view and must preserve the source recurrence rule.

## Shared resource calendar

TownBoss Scheduling provides the logical boundary for a shared resource calendar across planners and products.

The shared calendar may combine authorized schedule projections from Trip Planner, Event Planner, Day Planner, Achieve, service bookings, property viewings, deliveries, professional appointments, and future product workflows.

The shared view is a coordination surface, not a new source of truth. Each entry retains its source capability/domain reference.

## Calendar entries and projections

A calendar entry may be authoritative within a product or a projection of another domain record. Projection entries must preserve source reference and synchronization state.

Deleting or editing a projection must not silently mutate the source domain unless the operation is explicitly routed through the owning domain with authorization.

## External calendar integration

Google Calendar, Microsoft 365, Apple Calendar, operator calendars, booking providers, government appointment systems, and other external systems remain authoritative for their own records.

Adapters may:

- read busy/free state when authorized;
- create or update events when explicitly authorized;
- reconcile external identifiers and state;
- detect divergence;
- map provider errors and rate limits;
- preserve provider attribution.

A local `synced` state must not be treated as authoritative if the provider response is unknown, stale, rejected, or later diverges.

## Scheduling vs booking

Scheduling determines whether and when something can fit. Booking is a business-domain commitment.

Examples:

- a stay booking owns check-in/check-out business state;
- a service domain owns appointment confirmation rules;
- a travel domain owns trip confirmation;
- an event domain owns event publication and attendance semantics.

Scheduling may hold or project those times but does not replace their state machines.

## Orchestration integration

The Orchestration Engine may request feasible windows, bind a task to a window, detect conflicts, and react to schedule changes.

Scheduling does not grant execution authority. A scheduled task may still be blocked by authorization, AI Authority, constraints, missing evidence, unavailable resources, payment state, external rejection, or human approval requirements.

## Constraint Engine integration

Scheduling can consume deterministic constraints such as:

- earliest/latest times;
- maximum duration;
- required buffer;
- operating hours;
- dependency timing;
- blackout windows;
- maximum concurrent capacity.

Constraint Engine remains responsible for generic constraint representation/evaluation; Scheduling applies time/resource semantics and returns scheduling outcomes.

## Search & Discovery integration

Search & Discovery may consume availability summaries for filtering or ranking where the product permits it. Search indexes must not be treated as authoritative real-time availability.

Before a booking or other consequential commitment, the owning domain and Scheduling adapter must revalidate current state.

## Notifications integration

Scheduling may emit notification intents for reminders, changes, cancellations, upcoming deadlines, hold expiry, or conflicts. Notifications owns delivery coordination, not schedule truth.

## Evidence, audit, and observability

Important scheduling actions should be attributable, including:

- hold-created
- hold-expired
- reservation-created
- reservation-released
- schedule-entry-created
- schedule-entry-updated
- schedule-entry-cancelled
- conflict-detected
- conflict-overridden
- availability-refreshed
- external-sync-attempted
- external-sync-reconciled

Operational metrics may include conflict rate, stale-availability rate, hold expiry rate, sync failures, scheduling latency, capacity contention, and reconciliation failures.

## Reliability and concurrency

Scheduling is inherently race-sensitive. Implementations must account for concurrent attempts to claim the same limited resource.

Consequential reservation mutations should use stable idempotency identities and appropriate concurrency control. Depending on the domain this may include transactions, locking, unique constraints, compare-and-set/version checks, provider-side idempotency, or equivalent mechanisms.

A conflict-free read followed by an unguarded write is not sufficient for scarce capacity.

## Cancellation and release

Cancellation must distinguish local calendar removal from cancellation of the underlying booking or external appointment.

Resource release should be explicit and idempotent. Expired holds must not continue consuming capacity.

## Privacy and authorization

Calendar and availability data can reveal sensitive behavioral information. Implementations must enforce visibility and authorization for schedule details, participant identities, locations, and private notes.

Free/busy disclosure should reveal the minimum necessary information where full details are not required.

## AI / Glen AI boundary

Glen AI may inspect authorized availability, propose times, explain conflicts, and draft schedule changes. It may prepare consequential reservations at A2.

Autonomous creation, rescheduling, cancellation, or external-calendar mutation requires the applicable AI Authority level, explicit bounded authorization/delegation, current availability, and domain-specific execution gates.

AI cannot convert a suggested slot into a confirmed business commitment without the owning domain's confirmation path.

## Product adapter responsibilities

Each consumer defines:

- schedulable resource types;
- resource identity mapping;
- availability source and freshness;
- capacity rules;
- business-specific reservation/booking mapping;
- hold duration and expiry;
- conflict policy;
- buffers and travel/setup rules;
- timezone requirements;
- recurrence support;
- external calendar/provider adapters;
- authorization and privacy policy bindings;
- idempotency and concurrency controls;
- reconciliation and cancellation semantics.

## GlenTown implementation truth

Current GlenTown-API contains concrete scheduling evidence in Travel: `DailyAvailabilityWindow` derives per-day windows from trip dates and arrival/departure times; `ConflictDetector` detects overlaps and entries outside available windows; `AvailabilityValidator` performs domain-specific availability checks; `BookingOrchestrator` blocks booking transitions on scheduling conflicts; and `TravelCalendarSyncService` projects confirmed trips, stays, and experiences into Event calendar records.

GlenTown also has an `Event` model with start/end/timezone-related calendar fields and a `StayBooking` model with check-in/check-out dates.

These are real product-level scheduling patterns, but they do not constitute a centralized portfolio Scheduling runtime. TownBoss therefore defines the logical shared boundary as `canonical-design-v1` while preserving GlenTown as an implementation proving ground.

## Non-goals

Scheduling v1 does not:

- create a new scheduling microservice;
- replace booking/order/service/event state machines;
- own payment or inventory truth;
- grant authorization or AI authority;
- guarantee external calendar state;
- mandate one calendar provider;
- require Day Planner implementation before Beta;
- require cross-product physical extraction before reuse evidence exists;
- treat search-index availability as authoritative;
- silently reserve scarce capacity without concurrency protection.
