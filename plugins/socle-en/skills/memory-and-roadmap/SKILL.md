---
name: memory-and-roadmap
description: Keep a product memory and a roadmap shared between agents — read before the work, record decisions during it, reconcile at closing, levels of evidence, concurrent writes under a lock. Load at the start and end of any piece of work when the profile names a memory or a roadmap, and as soon as the owner decides something new.
---

# Memory and roadmap

The profile names where the memory lives (product records, roadmap, decisions,
reports) and may specify the procedure. What follows is the floor.

## Before the work

Read the memory's index, the product record, the roadmap and the repository's
instructions. Compare the request with the decisions, achievements, limits and
remaining items. Point out gaps rather than repeat work already closed. The
short starting state names the references read and what remains to be checked.

## During

As soon as something new is **decided by the owner**, record it (product record
and roadmap) with need, expected behaviour, criteria, dependencies and status. A
suggestion stays a "proposal to discuss": neither a decision, nor an
achievement, nor a priority.

## At closing

A **mandatory** step, done by the agent on its own, before its final answer,
even for a fix, an audit or documentation:

- product record: achievements, state, decisions, limits, next action;
- roadmap: closures, remaining items, dependencies — without inventing a
  priority, date or release;
- a dated report of the work: objective, result, version/commit, state per
  environment, evidence, limits, next action.

Stopping for a human decision: record the achievements and pending steps at the
handover.

## Levels of evidence

proposed, implemented, tested, published in Git, served in test, served in
production, adopted, enabled, effect observed. Do not infer one from another. A
state not re-measured keeps its date and its reservation.

## Concurrency

- Historical sources and closed reports are evidence: do not rewrite them.
- Re-read just before writing; keep concurrent contributions; a conflict is
  never resolved by overwriting.
- If the profile provides a lock (a directory created atomically) or a checksum
  manifest, respect them; never remove another agent's lock.
- No secret, token or personal data in summaries.

## Missing access

Prepare the addition in an authorised location, with its destination, and
announce "memory not synchronised — documentation closing pending" with the
cause. The memory describes evidence; it authorises no operation.
