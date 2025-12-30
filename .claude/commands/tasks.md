---
description: View all active tasks across projects, sorted by priority and due date
allowed-tools: Read, Glob, mcp__google-workspace__list_task_lists, mcp__google-workspace__list_tasks
---

# Tasks Dashboard

Display the user's consolidated task dashboard by pulling live data from Google Tasks (single source of truth).

**IMPORTANT**: Read `CLAUDE.md` first to get the project → account → task list mapping.

## Process

### 1. Query All Task Lists

For each Google account in CLAUDE.md:
1. Call `list_task_lists` to get all task lists with IDs
2. Call `list_tasks` for each project task list (skip "My Tasks" / default lists)

**Important**: Only query project-specific task lists, not default "My Tasks" lists.

### 2. Parse Task Format

Task titles in Google Tasks use this format:
```
[H/M/L] Task description
```

Priority parsing:
- `[H]` = High priority (must do)
- `[M]` = Medium priority (should do soon)
- `[L]` = Low priority (nice to have)
- No prefix = defaults to `[M]`

Due dates come from the Google Tasks `due` field (not in title).

### 3. Categorize and Sort

Get today's date and categorize:

**Overdue**: Tasks with due date before today
**Due Today**: Tasks with due date equal to today
**Due This Week**: Tasks with due date within 7 days
**Upcoming**: Tasks with due date > 7 days out
**No Due Date**: Tasks without due date

Within each category, sort by:
1. Priority (H first, then M, then L)
2. Due date (earliest first)
3. Account priority (from CLAUDE.md)

### 4. Display Output

```
## All Active Tasks | [Today's Date]

### OVERDUE
- [H] Task description (due Jan 2) — Project Name
- [M] Another overdue task (due Jan 3) — Project Name

### DUE TODAY
- [H] Urgent task for today — Project Name

### DUE THIS WEEK
- [M] Task due this week (due Jan 8) — Project Name

### HIGH PRIORITY (No Due Date)
- [H] Important task without deadline — Project Name

### MEDIUM PRIORITY
- [M] Medium priority task — Project Name

### LOW PRIORITY
- [L] Nice to have — Project Name

---
**Total**: X tasks across Y projects
**Overdue**: X | **Due Today**: X | **Due This Week**: X
```

### 5. Call Out Issues

If there are overdue tasks:
- Highlight them prominently
- Ask: "What's blocking these overdue items?"

If there are more than 10 high-priority tasks:
- Flag this as a prioritization problem
- Ask: "Everything can't be high priority. What's ACTUALLY most important?"

### Handling Edge Cases

- If a task title doesn't include priority prefix, default to `[M]`
- If no tasks found in any list, say: "No active tasks. Either you're done (unlikely) or tasks need to be captured. Run `/add-task` to add new tasks."
- Only show incomplete tasks (status = "needsAction")
- Skip completed tasks (status = "completed")

## Task Format Reference

Standard format for Google Tasks titles:
```
[H] Task description
[M] Task without due date
[L] Low priority task
```

Priority levels:
- `[H]` = High: Must do now, blocking other work
- `[M]` = Medium: Should do soon, important but not urgent
- `[L]` = Low: Nice to have, do if time permits

## Quick Actions

After displaying tasks, offer:
- "Run `/add-task` to add a new task"
- "Run `/complete-task` to mark a task done"
- "Open Google Tasks app for mobile access"
