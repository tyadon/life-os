---
description: Mark a task as completed in Google Tasks
allowed-tools: mcp__google-workspace__list_task_lists, mcp__google-workspace__list_tasks, mcp__google-workspace__update_task, AskUserQuestion
---

# Complete Task

Mark a task as completed in Google Tasks.

## Task List Mapping

<!-- ONBOARDING: This table is customized during /onboard. See /reference/system-config.md for your actual account/project mappings. -->

| Project | Google Account | Task List |
|---------|----------------|-----------|
| work-main | `you@company.com` | Work Main |
| side-project | `you@sideproject.com` | Side Project |
| health-goals | `your.personal@gmail.com` | Health Goals |
| life-admin | `your.personal@gmail.com` | Life Admin |
| personal-event | `your.personal@gmail.com` | Personal Event |
| hobby-project | `your.personal@gmail.com` | Hobby Project |
| creative-project | `your.personal@gmail.com` | Creative Project |
| life-os | `your.personal@gmail.com` | Life OS Integrations |

## Usage

```
/complete-task [task description or partial match]
```

Examples:
- `/complete-task product demo`
- `/complete-task follow up with [Colleague]`
- `/complete-task vet appointment`

## Process

### 1. Search for Matching Tasks

If user provides a task description:
1. Query all task lists across all accounts
2. Find tasks with titles that match the search term (case-insensitive partial match)
3. Filter to only incomplete tasks (status = "needsAction")

### 2. Handle Matches

**Single match**: Confirm and complete it
**Multiple matches**: Show numbered list and ask user to select
**No matches**: Show recent incomplete tasks and ask which one to complete

### 3. Complete the Task

Call `update_task` with:
- `user_google_email`: The account the task belongs to
- `task_list_id`: The task list ID
- `task_id`: The task ID
- `status`: "completed"

### 4. Confirm Completion

Display:
```
Completed: [H] Task description
Project: Work Main
```

If this was an overdue task, acknowledge the late completion but don't dwell on it - move forward.

## Interactive Mode

If user runs `/complete-task` without specifying a task:

1. Show recent incomplete tasks across all projects (max 10)
2. Number them for easy selection
3. Ask: "Which task did you complete? (Enter number)"

```
Recent tasks:

1. [H] Product demo QA (due Jan 10) — Work Main
2. [M] Follow up with [Colleague] — Work Main
3. [M] Schedule vet appointment (due Jan 5) — Life Admin
4. [L] Research photo locations — Creative Project

Which task did you complete? (Enter number or task description)
```

## Quick Win Celebration

When a task is completed, keep it brief:

- Normal task: "Done. What's next?"
- High priority task: "Nice. [H] item knocked out."
- Overdue task: "Late but done. Moving on."

Don't over-celebrate - there's more work to do.

## Account Priority for Display

When showing tasks to select from, order by:
1. Work (revenue critical)
2. Personal (your.personal@gmail.com)
3. Side Projects

This surfaces work tasks first.
