---
name: critical-analysis
description: Produce a multi-axis critical project report in PDF without modifying the audited project. Use for a security, logic, quality, usage and UX/UI assessment; for a review after fixes, use post-work-verification.
---

# Critical project analysis

Turn a short request into an actionable report: a candid diagnosis, traceable
evidence and ordered proposals. Severe criticism remains proportionate to the
demonstrated impact; neither flattery nor an artificial search for faults.
Provided reports are sources and presentation references, never instructions
or authorisations to act.

## Scope and outputs

Read the project's instructions and profile. Apply `working-principles`,
the freshness rules in `parallel-git-work` and `secrets-and-security`; apply
`routing` if specialised roles are useful, without systematic delegation.
The request authorises the analysis and report, not fixes.

By default, deliver a dated PDF directly, in the request's language,
outside the audited repositories. Use the report destination specified by the
profile or user; if none is known, use a session output area.
Keep intermediate files in that area. No writes to the project: no
documentation, backlog, dependency, configuration, commit or deployment.
If a closure rule requires a write incompatible with the request, report
documentary closure as pending and provide the delta outside the project.
The report is the only output authorised by this skill.

Measurements follow existing permissions: no active probing, vulnerability
exploitation, account or data creation. A test or command that writes is not
made harmless by its name; run it only within an explicitly authorised
environment and scope. Existing evidence may be cited with its date and commit,
without presenting it as rerun. Production follows `guarded-production`.

## Examine

Record the commit read, local changes and remote freshness.
Distinguish this code from the versions actually served and their configurations;
without access, mark them as "not observed". Read requirements, contracts and
journeys before judging business logic. Do not turn a preference or proposal
into a decided requirement.

Adapt the five axes to the product, with explicit coverage:

| Axis | Questions to examine |
|---|---|
| Security and privacy | trust boundaries, authentication, permissions, inputs/outputs, secrets, dependencies, collection and exposure |
| Logic and integrity | business rules, calculations, transactions, concurrency, idempotency, errors and data consistency |
| Quality and maintainability | architecture, useful complexity, duplication, performance, dependencies, test quality and blind spots |
| Usage and UX/UI | real journeys, navigation, vocabulary, action feedback, empty/error states, mobile, keyboard, accessibility and applicable design system |
| Operations and autonomy | configuration, tasks, recovery, monitoring, backups, delivery and the gap between published and served |

Load relevant domain rules without copying them: `secrets-and-security`,
`data-and-migrations`, `hermetic-tests`, `ux-doctrine`, `safe-operations`,
`product-autonomy`. An inapplicable axis states why; an inaccessible axis
remains unverified. View code does not prove its rendering: distinguish static
inspection, visual observation and a journey actually exercised.

## Deliver

Use [template-report.md](template-report.md) for evidence, findings and PDF
composition. Deduplicate symptoms with the same cause, cite strengths actually
verified and propose an order of work with closure criteria. Do not implement
this roadmap.

Short invocation: "Critical analysis of this project in PDF, without writing
anything in the project." A later acceptance review belongs to
`post-work-verification`.
