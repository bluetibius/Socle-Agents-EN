---
name: deliverables
description: The deliverables passed from one role to another in a piece of work — requirements record, architecture decision record (ADR), screen mockup, migration plan, technical plan, qualification plan, incident report — their templates, where to store them and how to cite them. Load to produce or consume a deliverable between agents, or to brief a specialised agent.
---

# Work deliverables

A specialised role is only worth its **deliverable**: a short, dated document,
stored in the repository, that the next role **cites** instead of redoing the
analysis.

## The chain

| Phase | Role | Deliverable | Template |
|---|---|---|---|
| Need | `business-analyst` | requirements record | [template-requirements.md](template-requirements.md) |
| Decision | the owner | status of the record: decided / to discuss / refused | — |
| Design | `architect` | architecture decision record (ADR) | [template-adr.md](template-adr.md) |
| Design | `ux-designer` | screen mockup | [template-screen-mockup.md](template-screen-mockup.md) |
| Design | `data-manager` | migration plan | [template-migration-plan.md](template-migration-plan.md) |
| Plan | `technical-analyst` | technical plan | [template-technical-plan.md](template-technical-plan.md) |
| Plan | `tester` | qualification plan | [template-qualification-plan.md](template-qualification-plan.md) |
| Build | `developer`, `devops`, `data-manager`, `tester` | commits, green gate | — |
| Verification | `gate-runner`, `security-review`, `design-system-compliance`, `autonomy-auditor`, `refutation-reviewer` | check reports | — |
| Delivery | `release`, `production-preparer` | tag, qualified test, step-by-step procedure | — |
| Operations | `incident-diagnostician` | incident report | [template-incident-report.md](template-incident-report.md) |
| Closing | `memory-keeper` | memory and roadmap reconciled | — |

The `routing` skill decides which links are useful; none is mandatory on
principle.

## Where to store them

Wherever the repository declares (`AGENTS.md`). Otherwise:

- `docs/requirements/YYYY-MM-DD-<topic>.md`
- `docs/adr/NNNN-<topic>.md` (continuous numbering)
- `docs/work/<topic>/` for mockup, plans and qualification
- `docs/incidents/YYYY-MM-DD-<topic>.md`

## Common rules

- A deliverable says **who** produced it, **when**, and from **which** input
  deliverables (paths).
- It separates what is **measured**, what is **decided** and what is
  **proposed**.
- It is short: what does not serve the next role does not go in.
- A decision later taken by the owner is recorded in it, dated; a closed
  deliverable's history is not rewritten, a new one is added.
- No secret or personal data (`secrets-and-security`).
