# Migration — <topic>

Produced by: <role>, on <date>. Inputs: <requirements record, ADR, technical plan>.

## Schema change

| Object | Before | After | Compatible with the old code? |
|---|---|---|---|

## Data

- Volume concerned (measured): <…>.
- Backfill or filling: <rule; never invented, absence ≠ zero>.
- Irreplaceable data affected: none | <which, protection>.

## Execution

1. Verified backup: <reference, verification>.
2. Plan / simulation: <command> → <expected result>.
3. Application: <command>, window: <outside scheduled runs>.
4. Check afterwards: <read queries, counters>.

## Rollback

<Procedure; what is lost when going back; never a destructive `down()` on real
data.>

## Indexes and performance

<Queries concerned, indexes added, cost measured in test.>

## Tests

<Migrations applied on a dedicated test database; edge cases.>
