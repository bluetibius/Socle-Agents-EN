---
name: hermetic-tests
description: Write hermetic test suites and guards that hold — no dependency on the network, neighbouring repositories or real services, anonymised fixtures, a machine guard imported everywhere, important rules held by structural tests. Load to write or review tests, add a test entry point, or turn an architecture rule into an automatic check.
---

# Hermetic tests

## Hermetic

- The suite depends on no neighbouring repository, no real service (identity,
  support, forge, provider) and no network. A test that needs a service sets up
  its own configuration or a double.
- Configuration, keys, language and paths are set by the test configuration; a
  file left in the copy by a deployment changes nothing.
- A test never opens a real third-party site: a recorded, **anonymised**
  fixture.
- The suite never destroys a real file of the repository or the environment.
- Database: `data-and-migrations` (dedicated database, name barriers).

## Fixtures

- No real data: no person, device identifier, address, organisation name or
  position. Reserved domains (`example.com`).
- Artificial values for negative security tests.
- Create only the records that set up the behaviour or serve an assertion.

## Machine guard

When the profile reserves tests for a machine:

- every entry point (gate script, test framework bootstrap, base class, every
  test file of a runner without a bootstrap) imports the guard **as its first
  statement**;
- the guard exits with a dedicated code before any test and points to the gate
  command;
- no bypass variable; a runner option (`--bootstrap`, `--no-configuration`)
  must not avoid it;
- every new test entry point carries it.

## Rules held by tests

An architecture rule that matters does not rely on agents' memory: a
**structural test** holds it. Examples:

- every route or entry point has its appropriate authentication guard;
- no provider URL, no HTTP client outside the intended module;
- no process started from served code when the hosting forbids it;
- vendored copies identical to their source (checksum);
- declared versions consistent between `VERSION`, README and CHANGELOG;
- a single scheduler;
- authoritative documentation cited by the code (host names, routes) aligned.

The test that holds a rule has a name that states it, and the `AGENTS.md` names
it next to the rule.

## Reviewing a suite

- Each test checks a behaviour, not an implementation.
- A fixed regression leaves a test that would have caught it.
- A slow or flaky test is fixed; it is not disabled.
