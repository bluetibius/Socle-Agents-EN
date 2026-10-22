---
name: working-principles
description: Common principles for any agent working in a repository — who is authoritative, order of trust, measure before writing, declared deviations, project profile. Load at the start of any piece of work, before writing code or documentation, and whenever one source contradicts another.
---

# Working principles

A common floor, independent of any project. A repository or an organisation can
strengthen it; it only weakens it by declaring a **deviation** (see below).

## Precedence

1. The repository's instructions (`AGENTS.md`, and what it cites).
2. The organisation's profile (rules shared by several repositories).
3. This baseline.

An unresolved contradiction between two levels is raised before the action
concerned; it is never settled silently.

## The project profile

The baseline's skills and agents speak of generic notions. The project profile
(a section of its `AGENTS.md`, or an organisation skill) gives them their value:

| Notion | What the profile must state |
|---|---|
| Environments | canonical names (local, test, production…) and machines |
| Test machine | where tests, gates and qualifications run |
| Gate command | the command, its machine, the expected number of tests |
| Production path | who triggers it, with which tool; what an agent may prepare |
| Git remotes | remote name, published branch |
| Versioning | single source of the number, release notes |
| Memory and roadmap | location, closing procedure |
| Language | of commits, documentation, interface |

A notion the profile does not fill in is asked for; it is never guessed.
Template to fill in: [template-profile.md](template-profile.md). The profile
lives with the baseline's user, not in the baseline.

## One question, one source

Each question (does the product exist? where does it run? which version is
served? who decides the interface?) has **one** source of authority, named by
the profile. A dated measurement (report, inventory) informs; it decides
nothing.

## Order of trust

1. the code actually served;
2. the actual state of the environments;
3. Git;
4. the services that operate the product (scheduler, identity, versions…);
5. the audit and the backlog;
6. reports;
7. the prompt.

A baseline given by a prompt is **expected, to be re-measured**. A gap is
documented and the work adapts; the expected state is never forced.

## Declared ≠ adopted ≠ enabled ≠ executed

Four distinct states, measured separately. Likewise: implemented, tested,
published in Git, served in test, served in production, effect observed. One is
never inferred from another; a state not observed stays declared "not
observed".

## Measure before writing

Read the state (Git, files, environment) before changing anything. Re-read
just before writing a shared file: another agent may have changed it.

## Deviations

A repository that does not follow a common rule says so in its `AGENTS.md`,
under "Deviations", with:

- the rule concerned;
- the reason;
- the **withdrawal condition**, observable.

An undeclared deviation is a defect; a declared deviation is a known debt.

## Read-only shell

An agent declared "read-only" that has a shell uses it only to **read and
measure**. Only the tool list is enforced by the tooling; this rule is the rest
of the guarantee.

- Allowed: displaying and searching (`git log`, `git diff`, `git show`,
  `git status`, `ls`, `cat`, `grep`), measuring (`curl` with GET,
  `ssh … <read command>`), and the commands its role explicitly provides for
  (gate, dry-run).
- Forbidden: any redirection to a file (`>`, `>>`, `tee`), `rm`, `mv`, `cp`,
  `chmod`, `sed -i`; `git commit`, `push`, `checkout`, `switch`, `reset`,
  `stash`, `merge`, `rebase`, `tag`; installing dependencies; any command that
  writes to an environment (restart, migration, purge, unlock, deployment
  without `--dry-run`).
- When in doubt about a command, it is forbidden: ask the main session.

## What the agent does not decide

A business, operations or security decision not yet taken stays with the
owner. A proposal stays distinct from a decision. An action refused by
permissions is not worked around, nor handed to another agent: it goes up to
the owner.

## Related skills

`parallel-git-work`, `verification-and-done`, `versioning-and-release`,
`guarded-production`, `secrets-and-security`, `product-autonomy`,
`repository-instructions`, `multi-agent-mission`, `memory-and-roadmap`,
`data-and-migrations`, `safe-operations`, `hermetic-tests`,
`ux-doctrine`, `routing`, `deliverables`.
