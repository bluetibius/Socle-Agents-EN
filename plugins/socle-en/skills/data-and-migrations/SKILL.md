---
name: data-and-migrations
description: Protect real data — isolated test databases, destructive commands, migrations, simulation before writing, backup and restore, encryption keys, truthfulness of displayed data (absence ≠ zero). Load before writing a migration, running a command that writes, purges, imports or restores, touching an encryption key, or displaying data that may be missing.
---

# Data and migrations

## Test databases

- A test suite has **its own** dedicated database: never a served database
  (even a test one), never a copy of production data.
- Destructive commands (wipe, recreate, roll back) **refuse** any database whose
  name does not carry the agreed test marker (for example the `_test` suffix).
  The suite's account has no rights on the served database. Never weaken these
  barriers; a variable that lifts them is a deliberate action on one's own
  database, not a workaround.
- The suite refuses a cached configuration that would target another database.

## Migrations

- We **add** a migration; we never modify a migration already shipped.
- A migration never deletes users' data; a rollback (`down()`) does not touch
  real data and is not run in production without preparation.
- Schema or rebuild scripts read in **plan** mode by default and only write with
  an explicit option (`--apply`); the plan is read.
- Never generate a schema from production, nor create a table by hand.
- Before a risky migration: a **verified** backup (not merely started), and a
  separate backup of the configuration that holds the keys.

## Writing to real data

- Simulate first: `--dry-run`, `--simulate`, plan. Read the result line by line
  before executing.
- A manual write (import, synchronisation, recomputation) may race with a
  scheduled run: check the lock or the window, read the state (`doctor`,
  status) first.
- **Irreplaceable** data (field measurements, human decisions, declared
  overrides, secret configuration) is named in the repository's `AGENTS.md`: no
  bulk write, no foreign key that would recompute it, never overwritten by a
  seed or an import.
- A purge or a permanent deletion runs knowing the retention policy, after a
  simulation.
- An ordinary deletion goes through the product's service (rules, audit, last
  administrator protected), never through SQL.

## Incidents, backups, restore

- A database is never recreated to fix an application incident.
- Restoring goes through the intended tool (which requires a confirmation naming
  the database); never a file copy over a database being written (SQLite in WAL
  mode, for example).
- A restore tool refuses production by default: a production restore is a
  decision.
- The backup of reference is the one the profile names; a local dump is only a
  safety net.

## Keys and configuration

- The encryption keys of an instance that holds data never change: encrypted
  documents and identifiers would become unreadable. A rotation follows its
  written procedure.
- A published signing key is not withdrawn before the tokens it signed expire.
- Do not edit a server configuration by in-place text substitution (`sed -i`):
  owner, group or permissions may be lost. After a change, reload the
  configuration atomically when the framework caches it.
- Changing a technical identifier (application name, cookie name, database
  name) has knock-on effects (lost sessions, paths): not "in passing".

## Truthfulness of displayed data

- An absence is not a zero; `null` is not `0`; "unknown" is never a conclusion,
  nor a favourable state.
- Stale data is not real time: date what is displayed.
- Display no state the source does not publish; invent nothing, backfill
  nothing, merge nothing without a rule.
- Provenances (official, observed, inferred, validated) are not mixed; an
  observation does not overwrite official data.
- Data that is not kept is displayed "not kept", not 0.
- A failed measurement does not close a period: "last known value".
- A translated label is not persisted; store the key or the value.
