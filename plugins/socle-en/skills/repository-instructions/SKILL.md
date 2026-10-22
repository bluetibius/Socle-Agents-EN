---
name: repository-instructions
description: Write or review a repository's instructions file (AGENTS.md, CLAUDE.md, GEMINI.md) — what it contains, what it does not, a single file read by every tool. Load to create a repository, write or check an AGENTS.md, or when an instruction looks like it should become permanent.
---

# Repository instructions

## A single file

- `AGENTS.md` at the root is **the** instructions file (read by Codex and other
  tools).
- `CLAUDE.md` contains the single line `@AGENTS.md` (an import read by Claude
  Code); `GEMINI.md` likewise if it exists.
- No copy, no symbolic link between these files.
- A subfolder may have its own `AGENTS.md` for what applies only there.

## Content

Short and actionable, in this order (template:
[template-AGENTS.md](template-AGENTS.md)):

1. What the product is, in a few lines.
2. The pointer to the common rules (organisation profile, then this baseline) —
   a pointer, **not a copy**.
3. **Done**: the gate, its machine, the expected number of tests.
4. Commands.
5. Structure: where things are, which documents are authoritative.
6. The product's environments.
7. Product-specific rules and pitfalls.
8. Deviations from the common rules, each with its withdrawal condition.
9. Precautions: operations that require approval or care.

## What does not belong in it

- History: it goes in `docs/` or in Git.
- An instruction for a one-off piece of work: it stays with that work, and only
  enters `AGENTS.md` if it becomes a permanent rule of the product.
- A copy of the common rules: cite, do not copy.
- A requirement for a tool not every agent has (a particular MCP server, for
  example).

## What an AGENTS.md must make visible

These situations get lost if they are not written down:

- **Deliberately duplicated code**: pairs of files "to change on both sides"
  (client ↔ server validator, a key computed in two languages), with the
  contract linking them.
- **Copies and sources**: vendored or synchronised files, the tool that updates
  them (from a published tag); they are never edited by hand.
- **A single list**: when a list is authoritative (exclusions, measured routes,
  tasks), say where it is; it is not copied.
- **Public contracts**: exit codes, formats, endpoints others depend on; their
  meaning does not change without a version.
- **Consumers**: who takes on this package or contract. A behaviour change is
  reported to each of them; adopting it is their own piece of work.
- **Kept legacy**: old identifiers not renamed "in passing" (application name,
  cookie, database, script called by a tool); the prose uses the current term.
- **Historical documents**: which root files are historical, and which are
  authoritative.
- **Irreplaceable data** and destructive commands (`data-and-migrations`).

## Documentation to keep after a major addition

The repository says what a **major addition** (new page, new module or visible
feature, new business logic, visual overhaul of a section) requires to be
updated — README, feature list, release notes shown to users (and their
languages) — and what does not count (fix, CSS adjustment, refactoring with no
visible effect).

## Check

If the organisation has an instructions checker, run it after every change.
Otherwise, check at least: `CLAUDE.md` == `@AGENTS.md`, the pointer to the
common rules present, a named gate, every deviation with its withdrawal
condition.
