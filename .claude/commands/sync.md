---
description: Commit and push all changes to git
allowed-tools: Bash
---

# Sync

Commit all changes and push to remote.

## Process

### 1. Check Status

Run `git status` to see what's changed.

If nothing to commit, say: "Everything's already in sync."

### 2. Stage and Commit

If there are changes:
- Stage all changes: `git add -A`
- Create a commit with a brief, descriptive message summarizing what changed
- Use format: `[area]: brief description` (e.g., "projects: update hobby-project tasks", "metrics: log week 1 habits", "journal: add daily entry")

### 3. Push

Push to remote: `git push`

If push fails (no remote, auth issues), inform the user and suggest fixes.

### 4. Confirm

"Synced. [X] files changed, pushed to [remote/branch]."

Keep it brief.
