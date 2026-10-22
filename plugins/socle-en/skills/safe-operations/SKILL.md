---
name: safe-operations
description: Run a product without surprises — scheduled tasks, locks, one task one clock, actions that reach real people, deployment and measuring what is served, files protected by the hosting provider, incidents. Load before deploying, enabling or suspending a task, starting an import or a notification, or diagnosing an incident.
---

# Safe operations

## Scheduled tasks

- **One task, one clock**: a single trigger per task (the scheduler the profile
  names). Never two schedulers for the same task, nor a scheduler embedded in
  the code on top.
- A task's logic lives in a service shared by its command and its HTTP entry
  point; the entry point is authenticated and allow-listed.
- Tasks are due by **elapsed delay**, not by clock minute.
- No file or deployment enables a task (declared ≠ enabled,
  `working-principles`). Enabling or suspending a task changes operations: it is
  a decision, not a side effect of a piece of work.
- In test, tasks stay suspended outside qualification, unless justified in
  writing.

## Locks and concurrency

- Processes that must not overlap share a lock (file or database) visible to
  every process in the environment.
- Never delete a lock file under a live process.
- Do not manually restart a process whose run holds the lock; read the state
  (`doctor`, status) first.

## Actions that reach real people

Notifications, reminders, emails, publications: **simulate first** (`dry_run`),
check the recipients, follow the order of a documented switchover. A backlog of
notifications is fixed at the source (transport), then by an explicit retry of
the failures — never by deleting incidents.

## Deploying

- A deployment delivers **code**. An import, a seed or a data migration is
  started by its own action.
- Read the `--dry-run` of a publication that deletes (`--delete`); files the
  hosting provider drops in (maintenance, PHP configuration, robots…) are
  protected from deletion.
- A deployment is **done** only after measuring what is served: version,
  commit, health. Otherwise it is "not verified".
- Order of steps after transfer (dependencies, migrations, checks): the one the
  repository documents, not another.
- The server's data or cache folders are neither transferred nor recursively
  reopened; their permissions (owner, group, setgid) are set once and checked.

## Measuring

- An HTTP 200 code does not prove the success of a backup, a task or an import:
  read the result, the size, the date.
- Health (`/health`) tells the truth: 200 only if configuration, database,
  schema and critical dependencies are available.
- A version endpoint exposes version, commit and canonical environment.

## Slowness and incidents

- Do not raise a ceiling (execution time, request timeout) to let a slow task
  through: read its steps and fix the cause.
- An external outage does not require a manual rebuild: the product keeps its
  last valid state and says so.
- `--unlock`, `--rollback` and any command acting on a real target: only after
  examination.
