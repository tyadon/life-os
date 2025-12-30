---
description: Get status on a specific project
argument-hint: <project-name>
allowed-tools: Read, Glob, Grep
---

# Project Status Check

Quick status check on a specific project.

## Process

### 1. Find Project

If project name provided ($ARGUMENTS):
- Search `/projects/work/` for matching file
- Search `/projects/personal/` for matching file
- Try partial matching if exact match not found

If not found or not provided:
- List all active projects: "Which project? Here's what's active:"
- Show list from both work and personal folders

### 2. Read & Analyze

Load the project file and assess:

- **Current status** (from Status section)
- **Days since last update** (from Last Updated field)
- **Active tasks** (count and priorities)
- **Completed recently** (any wins to note)
- **Current blockers** (anything in the way)
- **Next milestone** (what's the target)

### 3. Provide Status Report

```
## 📊 PROJECT STATUS: [Project Name]

**Status**: [Status emoji + text]
**Last Updated**: [Date] ([X days ago])
**Type**: [Work/Personal]

---

### Active Tasks ([count])

**High Priority**:
- [ ] [Task] | Due: [date]

**Medium Priority**:
- [ ] [Task]

**Low Priority**:
- [ ] [Task]

### Recent Progress
- [x] [Recently completed item]

### Blockers
- [Blocker if any]

### Next Milestone
[What's the next major target]

---
```

### 4. Accountability Check

If project seems stalled (>7 days since update, no recent completions):

"This project hasn't moved in [X] days. What's going on?"

Options to probe:
- Is this still a priority?
- What's blocking progress?
- Should this be put on hold?
- Should this be archived?

If project is blocked:
"What would unblock this? What's the smallest next step?"

### 5. Quick Actions

Offer quick actions:
- "Want to add a task?"
- "Want to update the status?"
- "Should we schedule time for this?"

### 6. Connect to Goals

If relevant, note how this project connects to quarterly/annual goals:
"Remember, this ties to [goal]. [On track / needs attention]."
