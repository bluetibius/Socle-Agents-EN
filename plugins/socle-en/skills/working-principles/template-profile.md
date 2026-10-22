# Profile — <organisation or project>

This file links the agent baseline to a specific installation. It lives with the
baseline's user (an organisation repository, shared documentation, or a
"Profile" section of an `AGENTS.md`), never in the baseline itself. It **cites**
the organisation's sources of authority; it does not copy them.

## Sources of authority

| Question | Source |
|---|---|
| Which products exist, their identifiers and URLs | <registry, file, page> |
| Where each product must run | <topology, inventory> |
| Which version is actually served | <version endpoint, tool> |
| Interface and UX doctrine | <design system: repository, version, documents> |
| Current priorities and decisions | <baseline, roadmap> |
| The organisation's common rules | <document, and how to read it outside its repository> |

## Environments

| Canonical name | Machine / hosting | Domains | Notes |
|---|---|---|---|
| local | <workstation> | — | <what is forbidden there> |
| test | <test machine> | <domains> | <access, lock> |
| production | <hosting provider> | <domains> | <single deployment path> |

Aliases tolerated for existing work, never for new work: <list>.

## Tests and gates

- Execution machine: <workstation | remote machine>.
- Generic command: `<gate command> <project> --ref=<pushed commit>`.
- Workstation guard: <yes / no, exit code>.
- Lock or queue: <path, rule>.
- Time limits: <tool per machine, for example `curl --max-time` on the
  workstation, `timeout` on the test machine>.
- Interface qualification: <versioned tool or HTTP requests; driven browser:
  usable or not; visual checks reserved for the human>.

## Production

- Who triggers it: <human role>.
- With which tool: <console, pipeline>.
- What an agent may prepare: <dry-run, preflight…>.
- Decided deviations: <product — reason — withdrawal condition>.

## Git

- Hosting and remote names: <…>.
- Published branch: <main>. Tag format: <vX.Y.Z>.
- Commit language: <language>.
- Reserving version numbers: <pushed branch, memory>.
- Integration branch of the test environment: <name>.
- What an agent publishes on its own: <tag, published branch, deployment to
  test — yes / no, after which evidence>.

## Cross-cutting services

- Identity and permissions: <service>.
- Task scheduling: <service>.
- Help and issue reporting: <service>.
- Audience measurement, status, versions: <services>.

## Memory and roadmap

- Location: <path or repository>.
- Closing procedure: <document>.
- Write lock, checksum manifest: <yes / no, paths>.

## Security

- Current security audit: <location>.
- Backup of reference: <hosting provider, procedure>.

## Out of scope

- <repositories or sites to which these rules do not apply, or only partly>.
