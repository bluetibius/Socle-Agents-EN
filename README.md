# Socle Agents EN

A baseline of rules, skills and specialised agents for coding agents (Claude
Code, Codex, and any tool that reads `AGENTS.md` or the `SKILL.md` format). It
names no installation: each user links it to their own through a **profile**.

This repository is the English translation of **Socle Agents**, the French
original. Versions are aligned: version X.Y.Z here translates exactly the French
version X.Y.Z.

## Three levels

1. **This baseline**: portable principles, valid for any repository.
2. **The profile** of an organisation or a project: machines, tools, deployment
   paths, sources of authority. It lives with the user, not here.
   Template: [template-profile.md](plugins/socle-en/skills/working-principles/template-profile.md).
3. **The `AGENTS.md`** of each repository: commands, gate, pitfalls, deviations.
   Template: [template-AGENTS.md](plugins/socle-en/skills/repository-instructions/template-AGENTS.md).

The level closest to the repository takes precedence; weakening the baseline is
declared as a deviation, with its withdrawal condition.

## Contents

### Skills (`plugins/socle-en/skills/`)

| Skill | For |
|---|---|
| `working-principles` | authority, order of trust, profile, deviations, read-only shell |
| `parallel-git-work` | several agents on the same repositories |
| `verification-and-done` | "done", gates, evidence, closing report |
| `versioning-and-release` | SemVer, development number, release |
| `guarded-production` | what an agent prepares and where it stops |
| `secrets-and-security` | what never leaves, entry points, privacy, backups |
| `product-autonomy` | the product runs its own operation; ten questions |
| `repository-instructions` | writing an `AGENTS.md` |
| `multi-agent-mission` | lanes, review by refutation, final report |
| `memory-and-roadmap` | shared product memory, documentation closing |
| `data-and-migrations` | test databases, migrations, simulation, restore, absence ≠ zero |
| `safe-operations` | one task one clock, locks, real-people actions, measuring after deployment |
| `hermetic-tests` | isolated suites, anonymised fixtures, guards, structural tests |
| `ux-doctrine` | principles, spaces, navigation, states, forms, anti-patterns |
| `routing` | which roles to start or set aside for a piece of work; proportion, escalation |
| `deliverables` | requirements, ADR, mockup, plans, qualification, incident: templates and handover |

### Agents (`plugins/socle-en/agents/`)

The main session orchestrates; the `routing` skill (or the `router` agent) says
which roles are useful for a given piece of work. A localised bug does not need
an architect.

A "no" in the last column is guaranteed by the tool list, except for the agents
that keep a shell to measure: their read-only status relies on the "Read-only
shell" rule of `working-principles`.

| Phase | Agent | Deliverable or role | Writes? |
|---|---|---|---|
| Routing | `router` | intervention plan: roles kept and set aside | no |
| Need | `business-analyst` | requirements record, criteria, ten questions | documentation |
| Design | `architect` | architecture decision record (ADR) | documentation |
| Design | `ux-designer` | screen mockup | documentation |
| Design | `data-manager` | migration plan, migrations | schema code |
| Plan | `technical-analyst` | technical plan, lanes | documentation |
| Plan / build | `tester` | qualification plan, tests | tests |
| Build | `developer` | one lane up to the gate | code |
| Build | `devops` | delivery and operations tooling | tooling |
| Verification | `gate-runner` | gate and evidence | no |
| Verification | `security-review` | targeted review of a change | no |
| Verification | `design-system-compliance` | interface against the design system and `ux-doctrine` | no |
| Verification | `declutter-review` | what a screen can remove without losing a capability | no |
| Verification | `autonomy-auditor` | autonomy verdicts and debts | no |
| Verification | `refutation-reviewer` | tries to refute a declared result | no |
| Delivery | `release` | decided release, up to test | yes |
| Delivery | `production-preparer` | prepares production, never triggers it | no |
| Operations | `incident-diagnostician` | incident report, read-only | report |
| Closing | `memory-keeper` | memory and roadmap | yes |
| Cross-cutting | `instructions-writer` | writes or checks an `AGENTS.md` | yes |
| Cross-cutting | `promotional-content` | accurate content from what is delivered | files |

## Installing

Claude Code, from a local clone or a Git remote:

```
/plugin marketplace add <path-or-url-of-the-repository>
/plugin install socle-en@socle-agents-en
```

Skills become `socle-en:<skill>` and agents are offered for delegation. For
another tool, point its instructions to the `SKILL.md` files (an open format),
for example from a repository's `AGENTS.md`. Install one language only: the
English and French plugins carry the same rules.

## Linking to an installation

1. Copy `template-profile.md` to your side and fill it in.
2. In each repository's `AGENTS.md`: point to the profile then to the baseline,
   and keep only what is specific to the repository.

## Check

```
sh bin/verify.sh
```

Static check: skill and agent front matter, links, manifests, single version
(`VERSION`), read-only agents, and **genericity** — no personal path, no private
IP, no real domain. Terms specific to an installation are listed outside the
repository, in `$SOCLE_FORBIDDEN_TERMS` or
`~/.config/socle-agents/termes-interdits.txt`.

## Maintaining the translation

Only for whoever keeps this repository aligned with the French original; using
or adapting the baseline does not need it. With the French repository next to
this one (`../Socle Agents`, or `$SOCLE_FR_PATH`), `bin/verify.sh` also checks
that both have the same skills, templates and agents, and that a released
version X.Y.Z has a French tag vX.Y.Z. Without it, that check is skipped.

## Author and licence

Author: Jonathan Estevez. MIT licence — see [LICENSE](LICENSE).
