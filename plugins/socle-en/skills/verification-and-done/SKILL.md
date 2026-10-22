---
name: verification-and-done
description: What "done" means and how to prove it — the repository's gate, the machine that runs tests, evidence in a report, interface checks. Load before declaring work done, running a test suite or a gate, or writing a closing report.
---

# Verify, finish

## Done

**Done** = the repository's gate is green, on the machine the profile names;
the change is committed; it is pushed if the repository expects it. A report
does not replace evidence.

The number of tests is **read in the gate's log** and reported; it is not
written in the instructions, where it goes stale. If a drop must block, the
gate itself checks a minimum.

The repository names its gate in its `AGENTS.md`. Without a named gate, say so,
and do not invent one.

## Where tests run

The profile often separates:

- **the workstation**: editing, versioning, orchestrating, static inspection
  (lint, analysis, formatting), building;
- **the test machine**: suites, gates, smoke tests, test databases, release
  qualifications.

When the profile provides for it:

- a successful build on the workstation is never evidence;
- test entry points refuse the workstation (guard); no attempt is made to lift
  it;
- test machine busy: wait, never move the gate to the workstation;
- a test database is dedicated to its suite: never a served database, never a
  copy of production data.

## Never

- bypass, disable or weaken a test or a security check;
- announce green on the strength of a subset;
- announce a fictitious success: the error is reported as it is.

## The report

Each gate cited carries:

- the command and the exact commit;
- the machine (`hostname`, `uname -s`);
- the path of the log;
- the result and the number of tests.

## Long work

- When a step does not need the human, carry on; give the status in the same
  message as the next action.
- Stop and ask only when you cannot continue without them, or before a
  destructive or irreversible action.

## Closing report

Any long piece of work ends with three headings, in this order:

1. **Blocked on me** — what no agent can do: a decision, a human action,
   missing access. "Nothing" if nothing.
2. **Changed** — what changed: files, commits, versions, environments; what was
   **not** done or verified.
3. **Found** — what was learned: findings, risks, deviations, evidence.

A failure is reported with its output; a skipped step is stated.

## Interface

- Qualify **without a browser** first: scripted HTTP requests (`curl`, form
  token read from the page). When an authenticated session is needed, a
  **versioned tool** of the repository creates it; it refuses to run outside
  the test environment and deletes what it created.
- A driven browser (built-in, extension, the repository's Playwright) only if
  it holds up in the session. If it blocks with no visible request, drop it and
  record that in the profile.
- What no tool can prove (visual reading, 200 % zoom) is asked of the human and
  named in the report as not verified by the agent.
- No particular MCP server is required.

## Proportion

A purely documentation or tooling change justifies neither a functional
release nor a deployment.
