---
description: Add a new task to Google Tasks
allowed-tools: mcp__google-workspace__list_task_lists, mcp__google-workspace__create_task, AskUserQuestion
---

# Add Task

Create a new task in Google Tasks (single source of truth for all tasks).

**IMPORTANT**: Read `CLAUDE.md` first to get the project → account → task list mapping.

## Usage

The user can provide task details in natural language. Parse the following:

```
/add-task [priority] Task description @due(YYYY-MM-DD) | project-slug
```

Examples:
- `/add-task Demo QA @due(2026-01-10) | work-project`
- `/add-task [H] Follow up with team | work-project`
- `/add-task [M] Schedule appointment @due(2026-01-05) | life-admin`
- `/add-task First full protocol day | health`

## Process

### 1. Parse User Input

Extract:
- **Priority**: `[H]`, `[M]`, or `[L]` - defaults to `[M]` if not specified
- **Task description**: The main task text
- **Due date**: `@due(YYYY-MM-DD)` format - optional
- **Project**: After the `|` separator

If project is not specified, ask the user which project this task belongs to.

### 2. Look Up Task List

Based on the project, determine from CLAUDE.md:
- Which Google account to use
- The task list name

Call `list_task_lists` for that account to get the task list ID.

### 3. Create the Task

Call `create_task` with:
- `user_google_email`: The appropriate account
- `task_list_id`: The task list ID from step 2
- `title`: `[H/M/L] Task description` (include priority prefix in title)
- `due`: RFC 3339 format if due date was provided (e.g., `2026-01-10T00:00:00Z`)
- `notes`: Optional - add if user provides additional context

### 4. Confirm Creation

Display:
```
Task created in [Project Name]:
- [H] Task description
- Due: January 10, 2026
- Project: [Project Name] ([account@email.com])
```

## Priority Guide

When user doesn't specify priority, help them determine it:

- **[H] High**: Blocking other work, client-facing, has hard deadline
- **[M] Medium**: Important but not urgent, should do soon
- **[L] Low**: Nice to have, do if time permits

## Project Aliases

Accept common shortcuts for project names. Map these to the actual project slugs in CLAUDE.md.

Common patterns:
- Short names like `admin`, `health`, `work`
- First word of project names
- Abbreviations

## If Project Not Specified

Ask the user:
"Which project does this task belong to?"

List the active projects from CLAUDE.md with brief descriptions.
