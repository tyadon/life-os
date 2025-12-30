---
description: Capture unstructured thoughts and automatically process them into the system
argument-hint: [optional: related project name]
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, mcp__google-workspace__list_task_lists, mcp__google-workspace__create_task
---

# Brain Dump

You are processing the user's stream of consciousness. Your job is to extract signal from noise and update the right files.

## Process

### 1. Capture

First, let the user dump everything. Say: "Go. Get it all out. I'll sort through it."

Once they're done, save the raw brain dump to `/inbox/brain-dumps/[YYYY-MM-DD]-[HHMM].md`:

```markdown
# Brain Dump | [Date] [Time]

[Raw content exactly as provided]
```

### 2. Extract & Categorize

Analyze the brain dump and identify:

**🎯 Tasks** (actionable items)
- Look for: "need to", "should", "must", "have to", "going to", "will"
- Format as actionable tasks
- Assign to project if context is clear
- Flag priority if urgent language used

**⚖️ Decisions Needed**
- What decisions are lurking in this dump?
- What's being wrestled with?
- Should a framework be applied?

**📁 Project Updates**
- New context for existing projects
- Status changes
- Blockers identified
- Progress noted

**💡 Insights/Realizations**
- Patterns the user is noticing
- Strategic thoughts
- Things to remember
- Connections being made

**🔥 Emotional State**
- Stress signals
- Excitement
- Frustration
- Energy level indicators

### 3. Route & Update

For each extracted item:

**Tasks** →
<!-- ONBOARDING: Replace example accounts below with user's actual accounts from /reference/system-config.md -->
- Create in Google Tasks using `create_task` in the appropriate task list:
  - Work tasks → `you@company.com` / "Work Main"
  - Side project tasks → `you@sideproject.com` / "Side Project"
  - Personal tasks → `your.personal@gmail.com` / appropriate list (Health Goals, Life Admin, etc.)
- Task title format: `[H/M/L] Task description`
- If no clear project, add to Life Admin list for routing

**Project Context** → 
- Update relevant `/projects/` file's Context/Notes section

**Decisions** → 
- If significant, flag for `/decide` command
- If minor, add to project file

**Insights** → 
- Add to today's journal entry
- Or add to relevant project file

**Blockers** → 
- Surface immediately
- Add to project file
- Problem-solve if possible

### 4. Summary Response

After processing, provide:

```
## 📥 BRAIN DUMP PROCESSED

**Tasks Extracted**: X items
- [ ] [Task] → [Project]
- [ ] [Task] → [Project]
- [ ] [Task] → Needs routing

**Projects Updated**:
- [project-name]: Added [what was added]
- [project-name]: Updated [what changed]

**Decisions Flagged**:
- [Decision needed] — recommend using [framework]

**Key Insight**:
> [Most important realization from the dump, in the user's words if possible]

**Emotional Read**:
[Brief note on state detected, if relevant]

**Immediate Action Needed**:
[If anything requires immediate attention, surface it here]
```

### 5. Follow-up

If anything seems urgent, emotionally charged, or strategically important:

- "You mentioned [X] — that seems like it's weighing on you. Want to talk through it?"
- "There's a decision here about [Y] that could use the [framework]. Want to work through it?"
- "I noticed [pattern]. Is that something we should address?"

Don't let important things get buried in the dump.

### 6. If Project Specified

If the user ran `/brain-dump [project-name]`:
- Focus extraction on that project
- Prioritize updates to that project file
- Still capture anything else that emerged
