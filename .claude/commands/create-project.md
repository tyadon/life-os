---
description: Create a new project file from template
argument-hint: <project name>
allowed-tools: Read, Write, Bash, Glob
---

# Create Project

Scaffold a new project file with the right structure.

## Process

### 1. Gather Basics

If project name provided ($ARGUMENTS), use it. Otherwise ask:
"What's the project called?"

Then ask:
- **Type**: "Is this work, personal, or a side project?"
- **Goal**: "In one sentence, what's the goal?"
- **Priority**: "High, medium, or low priority right now?"
- **Timeline**: "Target completion date, or is this ongoing?"

### 2. Determine Location

Based on type:
- Work → `/projects/work/`
- Personal or Side Project → `/projects/personal/`

Convert project name to lowercase-with-hyphens for filename.

### 3. Create File

Read the template from `/projects/[work|personal]/_template.md` and create the new project file.

Replace placeholders:
- `[Project Name]` → Actual project name
- `[Brief description...]` → The goal they provided
- `YYYY-MM-DD` fields → Today's date for started, their target for completion
- `Priority` → Their stated priority
- `Current Status` → "Active"
- Remove example placeholder tasks

### 4. Initial Tasks

Ask: "What are the first 2-3 things you need to do on this project?"

Add them to the Active Tasks section with priorities.

### 5. Success Criteria

Ask: "How will you know this project is successful? Give me 1-3 measurable outcomes."

Add to Success Criteria section.

### 6. Confirm

Show what was created:

```
Project created: /projects/[type]/[project-name].md

- Type: [type]
- Priority: [priority]
- Goal: [goal]
- Target: [date or ongoing]

First tasks:
- [ ] [Task 1]
- [ ] [Task 2]

Want to add any context, links, or notes before we wrap up?
```

### 7. Optional Context

If they have additional context (background, links, research, related projects), add to Context/Notes section.

### 8. Wrap Up

"Project is live. I'll include it in your morning briefs and reviews. What's the first task you're tackling?"
