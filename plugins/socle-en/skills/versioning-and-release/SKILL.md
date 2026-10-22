---
name: versioning-and-release
description: SemVer versioning and release cycle — choosing the rank, development number, release notes, the gate → main → tag → push → test sequence, distinct states of evidence. Load when opening a piece of work that will change a product's version, and before any release decision, tag or release note.
---

# Versioning and release

## Choosing the rank

| Rank | Meaning |
|---|---|
| X.0.0 | technical break, public contract break, or major interface change |
| X.Y.0 | new backward-compatible capability |
| X.Y.Z | fix, hardening, improvement of a flow or internal refactoring with no new capability |

The question: "Can we do something we could not do before?" For a contract or a
library: "does a consumer get a new capability?". An incompatible removal
requires a major, however small. Compare versions with a semantic comparator
(`0.10.0 > 0.9.0`).

The rank is chosen **when the work opens**, then checked against the final
scope. Existing series are not renumbered.

## During the work

1. Read what exists, the memory and the roadmap; choose the target and
   **reserve** its number (skill `parallel-git-work`).
2. A **single source** for the number in the repository; other projections are
   generated or checked.
3. Development number `X.Y.Z-dev.YYYYMMDDHHMMSS`, timestamped at the branch's
   actual opening (creation reflog, otherwise first commit), time zone
   recorded. Missing traces: declare the reservation rather than invent.
4. Destination notes prepared without the suffix.

## Release

A green gate does not remove the suffix: the release is a separate
**decision**.

1. Finalise the notes (new features, fixes, breaking changes, required
   operations); remove the suffix in the stable commit; check the projections.
2. Push the candidate; gate on its exact commit.
3. Fast-forward merge onto the published branch; annotated tag `vX.Y.Z` on that
   commit; push branch and tag. Divergence: reconcile, then requalify.
4. Deliver to test through the product's path, after measuring what is served
   there, and qualify (served version and commit equal to the tag, health,
   smoke test).
5. Production: according to the `guarded-production` skill.

A published tag is **immutable**: a failure is resumed with that code or by a
new version. A Git publication never proves a delivery.

## Several numbers

A component may carry several independent numbers (application, API contract,
data format, connector, schema). Each is declared once, with its own tags
(`api-vX.Y.Z`…); a consumer refuses what it cannot read and says so. A monotonic
build number (native platform) stays distinct from the product number.

## Checked consistency

- The declared version is never behind the latest tag.
- Version mentions (README, changelog, version endpoint) follow the single
  source; a test checks it.
- A vendored copy matches a published commit, never a local state.

## Release notes

One note per tag, matching its version exactly. No second history kept by hand:
`CHANGELOG.md` or whatever the repository declares.

## Evidence

Qualification cites separately, with date and evidence: development target,
qualified commit, Git publication, version served in test, version served in
production (or distributed). A state not observed stays "not observed".
