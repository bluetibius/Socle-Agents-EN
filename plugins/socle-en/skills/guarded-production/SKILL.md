---
name: guarded-production
description: The rule of production guarded by a human — what an agent prepares, where it stops, what it measures afterwards. Load as soon as a request, a plan or a script touches a production environment (deployment, migration, data, secrets, configuration), even read-only.
---

# Guarded production

## The rule

**An agent never deploys to production**, including by driving a console
(browser, API, script). A human, named by the profile, triggers it, through the
single path the profile names.

No other path, even on request, even urgent: no deployment script with a
production target, no manual transfer or shell to deliver code. A deviation
from this rule exists only if the owner decided it and it is declared in the
repository's `AGENTS.md`, with its withdrawal condition.

## What the agent prepares

1. Version tagged and pushed (`versioning-and-release`).
2. Test deployed and qualified on that same commit.
3. Dry-run and preflight, **read-only**.
4. Production state recorded (served version and commit).
5. The step-by-step procedure for the human.

Then it **stops and says so**. A successful test deployment never triggers a
production deployment.

## Afterwards

The agent may measure, read-only: served version and commit, health, smoke
test. Production is read with `SELECT` and read commands.

## Impossible through the intended path

It is a **defect to fix**, not a path to work around. The deployment tool or the
product is fixed until it can. Until then, the product does not go to
production, and its `AGENTS.md` declares it as a deviation, with the withdrawal
condition "deployable to production through the intended path".
