# Changelog

Version X.Y.Z of this repository translates version X.Y.Z of the French
original, Socle Agents.

## 0.7.0 — 30/10/2026

Developed as 0.7.0-dev.20261029182619. No existing skill or agent name changes.

### New

- `security-auditor` agent (French: `auditeur-securite`): full security audit
  of a product, read-only — threat model, `security-review`'s checkpoints over
  the whole code, dependencies and known vulnerabilities, served configuration
  measured in test through `GET` and `HEAD` requests, operations (rotation,
  logs, backups). Findings with a stable identifier, severity and closing
  criterion. Never active probing; production only at the owner's request,
  under `guarded-production`.
- `secrets-and-security`: "Dependencies" (lock, justification, vulnerability
  audit, dated exceptions) and "Served configuration" (HTTPS, headers, cookies,
  error pages, exposed files, ports, read-only measurement) sections; "Audits"
  adds the threat model and when to redo a full audit.
- `routing`: signal "first production release, change of architecture or
  exposure, audit due date from the profile" → `security-auditor`.

### Changes

- `security-review`: an eleventh point, a dependency added or upgraded in the
  diff. Its scope is the change; a whole product belongs to
  `security-auditor`.

## 0.6.0 — 25/10/2026

Developed as 0.6.0-dev.20261024191937. No existing skill or agent name changes.

### New

- `finish-inspector` agent (French: `inspecteur-finitions`): looks at an
  interface as the person who receives it and reports what looks sloppy —
  information said twice, mixed languages, typography, mismatched series of
  logos or images, alignment, cut-off or hidden text, raw or placeholder
  content, a forgotten theme — with a severity (blocking, visible, finish) and
  a proposed fix. Read-only; complements `design-system-compliance` (the
  rules) and `declutter-review` (what is useful).
- `ux-doctrine`: one language on screen, the interface's, including for proper
  nouns that have a form in that language; a logo that already carries the
  name is not doubled by the name in text; a series of logos shares height,
  margin and background, readable in each theme.
- `routing`: signal "visible work ready to be declared done, a screen that
  looks sloppy" → `finish-inspector`.

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
| `inspecteur-finitions` (0.6.0) | `finish-inspector` |
| `auditeur-securite` (0.7.0) | `security-auditor` |
