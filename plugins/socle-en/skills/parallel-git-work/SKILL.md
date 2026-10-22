---
name: parallel-git-work
description: Git rules when several sessions or agents work on the same repositories at the same time — measure the state, one worktree per piece of work, reserve a version number, integrate by merging, deploy to a shared environment, what is never touched, branch housekeeping. Load before any write in a Git repository, before a commit, a push, a stash, a reset, or deleting a branch or a worktree, and before opening a version number or deploying to test.
---

# Git and parallel work

## Before writing

```
git status
git branch --show-current
git worktree list
git remote
```

- Uncommitted work that is not yours is not modified, stashed (`stash`) or
  reset.
- A main working copy may be on another piece of work's branch: check before
  writing there.

## One piece of work, one worktree

```
git worktree add ../<repository>-<topic> -b work/<topic> main
```

- Installed dependencies (`vendor/`, `node_modules/`…): **copy** them into the
  worktree (`cp -cR` on APFS), never a symbolic link — autoloading would follow
  the link to the other copy.
- Other pieces of work's worktrees and branches are never touched.

## History

- No force-push, no rewriting of published history.
- The published branch (often `main`) moves forward by merging qualified work;
  a published tag is immutable.
- Commit messages that say **why**, in the profile's language.
- `git remote` before pushing: the remote name varies between repositories.

## Several agents on the same product

Different tools (sessions, agents from different vendors) do not see each
other: only the remote repository, the memory and what is served are
authoritative.

- **Reserve a number** before the first commit that carries it: a pushed
  work branch that names it, and an "in progress" entry in the product memory
  if the profile names one. Before reserving, check that no remote branch
  (`git ls-remote`) or memory entry already holds it; otherwise take the next
  one or coordinate.
- **Integrate by merging**, never by re-applying someone else's work
  (`cherry-pick`, `rebase` of their commits, copying files): re-applied, it
  changes hashes and becomes a duplicate its author no longer recognises.
- **A shared environment** (test) is deployed from a single integration
  branch, named by the profile or the repository, into which every piece of
  work merges. Before any deployment, measure the served version and commit:
  the deployed commit **contains** the served commit
  (`git merge-base --is-ancestor <served> <to-deploy>`). Otherwise merge first,
  or stop and identify who made the deployment in place. A rollback is a
  decision, not an overwrite.

## Housekeeping

A worktree or a local branch is removed only if it is:

- clean;
- pushed;
- contained in the remote published branch;
- unused by another session.

Useful remote branches stay. Another piece of work's branch or worktree is
never deleted.
