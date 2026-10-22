# Socle Agents EN — repository instructions

The English translation of the Socle Agents baseline (rules, skills and agents
for coding agents), published as a Claude Code plugin marketplace
(`.claude-plugin/marketplace.json`, plugin `plugins/socle-en`). Markdown and
JSON only; no code runs outside the `bin/verify.sh` check.

Common rules: the baseline applies to itself
(`plugins/socle-en/skills/working-principles/SKILL.md` and the skills it cites).
The rules of the installation where this repository is cloned are added through
its profile, never through this repository.

**Done** = `sh bin/verify.sh` prints `GREEN`, with the local list of forbidden
terms present and the French original next to this repository; change
committed; pushed if a remote exists.

## Commands

- `sh bin/verify.sh` — static check (structure, links, versions, alignment with
  the French original, genericity). File inspection: runs on the workstation.
- `claude plugin validate .` — manifest validation by Claude Code.

## Structure

- `VERSION` — **single source** of the number; `plugin.json` and
  `marketplace.json` are checked projections of it.
- `plugins/socle-en/skills/<name>/SKILL.md` — one rule per domain; its templates
  next to it (`template-*.md`, `forms-states-anti-patterns.md`).
- `plugins/socle-en/agents/<name>.md` — specialised agents; their `skills` field
  only cites skills of the plugin.
- `CHANGELOG.md` — version history.

## Repository-specific rules

- **A translation, not a fork.** The French repository "Socle Agents" is the
  reference. A change is made there first, then translated here; nothing is
  added here that does not exist there.
- **Aligned versions.** Version X.Y.Z here translates exactly the French
  X.Y.Z; a release requires the French tag vX.Y.Z (checked by `bin/verify.sh`).
- **Translated names are stable.** The name mapping (French → English) is in
  `CHANGELOG.md`, 0.3.2; renaming a skill or an agent is a breaking change
  (major version), in both languages.
- **Absolute genericity**: no organisation, product, machine, real domain, IP
  address or personal path. The author is named only in the author files
  (manifests, `LICENSE`, `README.md`).
- A skill's or an agent's `description` says **when** to use it: it is what the
  tool reads to decide whether to load it.

## Precautions

- Do not import third-party skills (frameworks, libraries): they have their own
  distribution and update tooling.
