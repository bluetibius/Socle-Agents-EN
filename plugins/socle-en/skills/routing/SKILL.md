---
name: routing
description: Decide, at the start of any work request, which specialised roles are relevant and which are not — principle of proportion, signals that trigger a role, always-mandatory steps, typical paths, escalation along the way. Loaded by the main session before delegating to a baseline agent, and as soon as a piece of work changes nature along the way.
---

# Routing

The main session is the orchestrator: only it starts agents (a sub-agent cannot
start others). This skill tells it **whom to start, and whom not to**. For an
ambiguous case, the `router` agent measures the ground and returns a plan; the
session carries it out.

## Proportion

- Start from **the lightest**: the session alone. A role is added only on a
  **measured signal** in the work (files, contracts, schema, interface), never on
  principle nor because it exists.
- Each agent starts without context and has a cost: a role that brings no
  deliverable of its own is not started.
- A role set aside is **named, with its reason**, in the announced plan.

## Signals → roles

| Measured signal | Role |
|---|---|
| new capability, unclear need, several audiences affected | `business-analyst` (then the owner's decision) |
| public contract, API, shared format, several repositories, a choice hard to undo | `architect` |
| a screen created or visibly changed | `ux-designer`, then `design-system-compliance` |
| a crowded screen, or lightening requested | `declutter-review` |
| visible work ready to be declared done, a screen that looks sloppy | `finish-inspector` |
| schema, migration, import, index, real data | `data-manager` |
| authentication, permissions, external inputs, outgoing requests, secrets, collection, added dependency | `security-review` |
| first production release, change of architecture or exposure, audit due date from the profile | `security-auditor` |
| deployment, gate, scheduled task, monitoring, backup, server configuration | `devops` |
| more than a few files, or a non-obvious implementation order | `technical-analyst` |
| observable behaviour changed | `tester` (at minimum: a regression test) |
| parallel lanes of a mission | `developer`, one instance per lane |
| new feature or evolving data | `autonomy-auditor` before "done" |
| a result declared by another agent or a lane | `refutation-reviewer` |
| incident in progress | `incident-diagnostician`, then new routing for the fix |
| release decided | `release`, then `production-preparer` if production follows |
| end of the work, memory named by the profile | `memory-keeper` |

## Always, whatever the size

Routing **never** removes:

- measure before writing (`working-principles`);
- a green gate before "done" (`verification-and-done`);
- no secret in outputs (`secrets-and-security`);
- guarded production (`guarded-production`);
- closing the memory when the profile names one (`memory-and-roadmap`).

## Typical paths

| Work | Path | Set aside, and why |
|---|---|---|
| a localised bug in a script | session: reproduce → fix → regression test → gate | architect, business analyst (no contract nor new need); corrective release only if the code is delivered |
| text or documentation | session alone | functional gate and release (no behaviour changed) |
| small screen change with a new datum | `data-manager` → `ux-designer` (light) → session → `tester` → gate | architect (no contract), business analyst if the need is already decided |
| cross-cutting feature | `business-analyst` → decision → `architect` → `ux-designer` / `data-manager` → `technical-analyst` + `tester` plan → build → checks → `release` | — |
| dependency or tool updated | `devops` → gate → corrective release | architect unless a contract breaks |
| production incident | `incident-diagnostician` (read-only) → routing of the fix | any write until the cause is established |
| audit requested | the relevant audit agent (`autonomy-auditor`, `security-auditor`, `security-review`, `design-system-compliance`, `declutter-review`, `finish-inspector`) | building (an audit does not fix) |

## Escalation

Work judged light that reveals a signal (a contract touched, real data, an
authentication surface) **adds the role at that moment**, and says so. We do not
start over; we do not hide the change of nature. Conversely, a planned role that
becomes pointless is removed, and the plan says so.

## Handover

Each role receives the **previous one's deliverable** (`deliverables` skill) and
cites it; it does not redo the analysis. An agent's brief contains: the
objective, the input deliverables (paths), its scope (repositories, files), what
it must not do, and the shape of its output.

## Announcing the plan

Before starting anything, the session announces in a few lines: roles kept and
their order, roles set aside with their reason, decisions expected from the
owner. Trivial work is announced in one sentence.
