---
name: parallel-git-work
description: Git rules when several sessions or agents work on the same repositories at the same time — measure the state, one worktree per piece of work, what is never touched, branch housekeeping. Load before any write in a Git repository, before a commit, a push, a stash, a reset, or deleting a branch or a worktree.
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

## Housekeeping

A worktree or a local branch is removed only if it is:

- clean;
- pushed;
- contained in the remote published branch;
- unused by another session.

Useful remote branches stay. Another piece of work's branch or worktree is
never deleted.
