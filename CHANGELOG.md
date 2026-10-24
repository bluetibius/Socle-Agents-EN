# Changelog

Version X.Y.Z of this repository translates version X.Y.Z of the French
original, Socle Agents.

## 0.5.0 — 24/10/2026

Developed as 0.5.0-dev.20261024111150. No existing skill or agent name changes.

### New

- `declutter-review` agent (French: `revue-epure`): states a screen's purpose
  in one sentence, puts each visible element through the test of that purpose
  and returns what can be removed, simplified, collapsed, moved or merged
  without losing a capability, with a before / after measure. Read-only;
  complements `design-system-compliance` (which checks the rules) by
  questioning even what complies.
- `routing`: signal "a crowded screen, or lightening requested" →
  `declutter-review`.

## 0.4.0 — 22/10/2026

Developed as 0.4.0-dev.20261022130747.

Rules drawn from feedback on a release run by two agent tools on the same
product. No skill or agent name changes.

### New

- `parallel-git-work`: section "Several agents on the same product" — reserve
  a version number before the first commit that carries it, integrate by
  merging and never by re-applying someone else's work, deploy a shared
  environment from a single integration branch after measuring what is served
  (the deployed commit contains the served commit).
- `verification-and-done`, "Interface": qualify without a browser first (HTTP
  requests, a versioned repository tool limited to test); a driven browser only
  if it holds up in the session; visual checks asked of the human and named in
  the report.
- `safe-operations`: measure what is served before a shared deployment; a time
  limit on every command that waits on the network, with the machine's tool.
- Profile template: time limits per machine, qualification tool, reserving
  numbers, test integration branch, what an agent publishes on its own.

### Changes

- The number of tests is no longer written in the instructions (`AGENTS.md`,
  profile, template): it is read in the gate's log. `gate-runner` returns GREEN
  on exit code 0 and a complete suite, and flags a clear drop.
- `release` and `tester` measure what is served before deploying and qualify
  through HTTP requests first.

## 0.3.3 — 22/10/2026

Developed as 0.3.3-dev.20261022104048.

Patch: no skill or agent changes.

- The alignment with the French original is presented as a maintainer check:
  neutral message when the original is absent, and its own README section,
  "Maintaining the translation", outside "Check". Using or adapting the
  baseline never needs the French repository.
- `AGENTS.md`: "a translation, not a fork" applies to the plugin; the
  repository's own tooling may differ.

## 0.3.2 — 22/10/2026

Developed as 0.3.2-dev.20261022101128.

First English release: a complete translation of Socle Agents 0.3.2.

### New

- Plugin `socle-en` (marketplace `socle-agents-en`): 16 skills, 11 templates,
  20 agents, entirely in English, names included.
- `bin/verify.sh`: the original's static checks, plus alignment with the French
  original (same number of skills, templates and agents; a release requires the
  French tag of the same number).
- Author declared in the manifests, `LICENSE` and `README.md`.

### Name mapping (French → English)

Skills:

| French | English |
|---|---|
| `principes-de-travail` | `working-principles` |
| `git-travail-parallele` | `parallel-git-work` |
| `verification-et-terminaison` | `verification-and-done` |
| `versionnement-release` | `versioning-and-release` |
| `production-gardee` | `guarded-production` |
| `secrets-securite` | `secrets-and-security` |
| `autonomie-produit` | `product-autonomy` |
| `instructions-depot` | `repository-instructions` |
| `mission-multi-agents` | `multi-agent-mission` |
| `memoire-roadmap` | `memory-and-roadmap` |
| `donnees-et-migrations` | `data-and-migrations` |
| `exploitation-sure` | `safe-operations` |
| `tests-hermetiques` | `hermetic-tests` |
| `doctrine-ux` | `ux-doctrine` |
| `aiguillage` | `routing` |
| `livrables` | `deliverables` |

Agents:

| French | English |
|---|---|
| `aiguilleur` | `router` |
| `analyste-metier` | `business-analyst` |
| `architecte` | `architect` |
| `analyste-technique` | `technical-analyst` |
| `concepteur-ux` | `ux-designer` |
| `gestionnaire-donnees` | `data-manager` |
| `developpeur` | `developer` |
| `testeur` | `tester` |
| `devops` | `devops` |
| `diagnostic-incident` | `incident-diagnostician` |
| `reviewer-refutation` | `refutation-reviewer` |
| `auditeur-autonomie` | `autonomy-auditor` |
| `gate-runner` | `gate-runner` |
| `release` | `release` |
| `preparateur-prod` | `production-preparer` |
| `gardien-memoire` | `memory-keeper` |
| `redacteur-instructions` | `instructions-writer` |
| `conformite-design-system` | `design-system-compliance` |
| `revue-securite` | `security-review` |
| `contenu-promotionnel` | `promotional-content` |
| `revue-epure` (0.5.0) | `declutter-review` |
