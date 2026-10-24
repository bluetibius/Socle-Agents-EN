---
name: multi-agent-mission
description: Template for a mission entrusted to several agents — prior reading, lanes and repository ownership, delivery sequence, independent review by refutation, keeping the audit and backlog, shape of the final report. Load to orchestrate sub-agents or parallel sessions, write a mission prompt, or run one of its lanes.
---

# Multi-agent mission

A mission prompt says "Apply the mission template" and carries only the
**delta**: objectives, expected baseline, lanes, specific prohibitions, fallback
priorities. Template: [template-mission-prompt.md](template-mission-prompt.md).

## 0. Route first

Before composing the lanes, the session applies `routing`: which roles are
useful, which are set aside and why. A mission does not use every role on
principle.

| Phase | Roles (baseline agents) |
|---|---|
| Need | `business-analyst`, then the owner's decision |
| Design | `architect`, `ux-designer`, `data-manager` |
| Plan | `technical-analyst`, `tester` (qualification plan) |
| Build | `developer` (one instance per lane), `devops`, `data-manager`, `tester` |
| Verification | `gate-runner`, `security-review`, `design-system-compliance`, `declutter-review`, `autonomy-auditor`, `refutation-reviewer` |
| Delivery | `release`, `production-preparer` |
| Operations, closing | `incident-diagnostician`, `memory-keeper` |

The deliverables passed from one phase to the next follow the `deliverables`
skill.

## 1. Read before acting

The orchestrator **and every** sub-agent read: this template, the common rules
(`working-principles` and the profile), the `AGENTS.md` of every repository
touched. A sub-agent does not see the mission prompt: the orchestrator passes it
the delta that concerns it and points it to this template rather than copying
its content.

## 2. Measurement

Order of trust and "expected baseline, to be re-measured": `working-principles`.
Do not confuse declared, adopted, enabled, executed.

## 3. Lanes

- A lane **owns** named repositories. Two lanes never write to the same
  repository at the same time. A finding outside the scope is relayed to the
  orchestrator.
- Each lane works in its own worktree (`parallel-git-work`).
- A cross-cutting responsibility (deployment, lock, backlog) has **one** named
  owner, or the rule says "each lane, under the lock".

## 4. Security

No write to production without an explicit request in the mission
(`guarded-production`). Nothing sensitive in outputs (`secrets-and-security`).
A refused action goes up to the owner.

## 5. Delivery, per modified product

1. full gate green on the intended machine;
2. merge onto the published branch;
3. tag;
4. push;
5. deployment to test, under the lock if there is one, without holding the
   lock during a gate;
6. qualification: served version and commit equal to the tag, health, smoke
   test.

Autonomy criterion (`product-autonomy`) applied before closing. A tooling or
documentation change does not justify a release.

## 6. Independent review

An agent **that fixed nothing** tries to **refute** each verdict
(`refutation-reviewer` agent). A blocking or major defect within scope is fixed
before the verdict, then the corresponding check is redone.

## 7. Audit, backlog, housekeeping

- Re-read just before writing.
- Add a dated section, without rewriting earlier ones.
- Update an existing entry rather than create a new one.
- Close an entry only on evidence; cite each identifier with its title.
- Git housekeeping: `parallel-git-work`.

## 8. Final report

1. The verdict, in the terms the mission asks for.
2. **Blocked on me**: only what no agent can do.
3. The notable facts.
4. The version table: product, before, published branch, tag, test, production.
5. A pointer to the audit section that holds the evidence.

The audit is the source; the report does not copy it.
