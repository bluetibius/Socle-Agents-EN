---
name: product-autonomy
description: Doctrine of functional and operational autonomy — code builds the product, the product runs its own operation. The six autonomies, the ten questions and the verdict grid. Load to design or qualify a feature, audit a product, or when a business datum, a date, a list or a recurring task seems to require a code change or regular human intervention.
---

# Product autonomy

**Code builds the product. The product runs its own operation.**

## A. Business data

Any business datum that normally changes is persisted in suitable storage and
editable through an authorised mechanism of the product, or computed from its
source of truth. An ordinary list, date, association or offer does not require a
code change each time it evolves.

## B. Configuration

Evolving operational parameters have a suitable mechanism: administration,
controlled persistent configuration, inter-product contract, synchronisation or
discovery. Secrets and infrastructure parameters stay in a protected environment
configuration. Reuse what exists; no table per parameter is required.

## C. Time

Periodic operations go through the scheduler named by the profile. No new
parallel cron job, nor a recurring manual script. An event-driven operation
stays native to the product. Frequencies respect the sources and their
freshness.

## D. Maintenance

Imports and synchronisations repeat without normal human intervention.
Depending on the case: idempotence, observability, resumption, resilience, last
valid state kept. Each process has a trigger, an owner and failure handling. No
fictitious success. Identities and exceptions survive imports and restarts.

## E. Administration

An ordinary business correction goes through an interface of the product, with
permissions, validation and audit. Direct SQL, a source change, an exception
constant or a dedicated commit are not normal procedures.

## F. After deployment

A release keeps working without recurring data upkeep by a developer or an AI.
**No normal operating function depends on recurring intervention by an AI
model.** AI develops, analyses, tests, documents, proposes and assists; it is not
essential to day-to-day operation, even for months.

## Proportion

These remain legitimate in code: protocol constants, algorithms, security
constraints, types, API contracts, stable business invariants, startup
parameters, migrations, tests and fixtures. A reasonable default in code is
acceptable if its effective value stays editable. Distinguish a software
invariant from evolving data, without multiplying parameters and screens.

## The ten questions

For every new feature, answer them in its qualification:

1. How is the data created?
2. How does it evolve?
3. How is it corrected?
4. How is it deleted or archived?
5. Who can perform these actions?
6. Which operations must be automatic?
7. Which operations must be scheduled?
8. What happens if a source becomes unavailable?
9. What happens after a new import or a restart?
10. Does normal operation still require an intervention in the code?

A feature is not done if an unjustified recurring human intervention remains
essential. Qualify: permissions, change without a commit, persistence after a
restart or import, resumption, absence of duplication.

## Verdicts

Each finding is classified: **COMPLIANT**, **PARTIALLY COMPLIANT**,
**NON-COMPLIANT**, **JUSTIFIED EXCEPTION**, **PRODUCT DECISION**,
**OUT OF SCOPE**.

A remaining debt carries: owner, priority, evidence, scope, observable closing
criterion. It reuses an existing piece of work rather than duplicate one. A
business decision not yet taken stays with the owner.
