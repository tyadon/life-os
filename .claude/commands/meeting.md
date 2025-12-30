---
description: Process meeting notes and extract action items
argument-hint: <project-name>
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, mcp__google-workspace__draft_gmail_message, mcp__google-workspace__send_gmail_message, mcp__google-workspace__list_task_lists, mcp__google-workspace__create_task
---

# Meeting Notes Processor

Process meeting notes and route information to the right places.

## Process

### 1. Capture Meeting Details

If project wasn't specified in command ($ARGUMENTS), ask:
- "What project is this meeting related to?"

Then gather:
- Meeting type: (discovery call / internal / client / 1:1 / other)
- Attendees: Who was there?
- Date/time: When did it happen?

Then: "Give me your notes. Raw is fine - bullet points, stream of consciousness, whatever you have."

### 2. Save Raw Notes

Save to `/inbox/meeting-notes/[YYYY-MM-DD]-[meeting-type].md`:

```markdown
# Meeting Notes | [Date]

**Type**: [meeting type]
**Project**: [project name]
**Attendees**: [list]

---

## Raw Notes

[Exact notes as provided]
```

### 3. Extract & Organize

From the notes, identify:

**🎯 Action Items**
- Distinguish: Your items vs. others' items
- Include: Who | What | By When (if mentioned)
- Be specific and actionable

**⚖️ Decisions Made**
- What was decided?
- Who made the decision?
- Any conditions or caveats?

**📋 Key Information**
- New context about the project/client/situation
- Numbers, dates, requirements mentioned
- Concerns or risks surfaced
- Commitments from others

**📅 Follow-ups Needed**
- When to follow up
- What to follow up on
- Who to follow up with

### 4. Update Project File

Find the project file at `/projects/[work|personal]/[project-name].md` and update:

**Meeting Log section** - Add:
```markdown
### [YYYY-MM-DD] | [Meeting Type] | [Attendees]

**Summary**: [2-3 sentence summary of what happened]

**Key Points**:
- [Important point]
- [Important point]

**Action Items**:
- [ ] [Your task] | Due: [date]
- [Other person]: [Their task]

**Decisions**:
- [Decision made]

**Follow-up**: [Date] - [What to follow up on]
```

**Google Tasks** - Create your action items using `create_task`:
<!-- ONBOARDING: Replace example accounts below with user's actual accounts from /reference/system-config.md -->
- Determine task list based on project:
  - Work meetings → `you@company.com` / "Work Main"
  - Side project meetings → `you@sideproject.com` / "Side Project"
  - Personal → `your.personal@gmail.com` / appropriate list
- Task title format: `[H/M/L] Task description`
- Include due date if specified (RFC 3339 format)

**Context/Notes section** - Add any new relevant information

**Blockers section** - Add any blockers identified

### 5. Response Summary

```
## 📋 MEETING PROCESSED

**Meeting**: [Type] | [Date]
**Project**: [project-name]
**Attendees**: [list]

---

### Your Action Items
- [ ] [Task] | Due: [date]
- [ ] [Task] | Due: [date]

### Others' Action Items
- [Person]: [Task] | Due: [date]
- [Person]: [Task] | Due: [date]

### Key Decisions
- [Decision made]

### Follow-up Required
- [Date]: [What to follow up on with whom]

### Context Added
- [Brief note on what context was added to project file]

---

**Project file updated**: `/projects/[path]/[project].md`
```

### 6. Flag Important Items

If anything is urgent or high-stakes:
- "This action item is due [soon] - making sure it's on your radar."
- "This decision has implications for [X] - worth noting."
- "The follow-up on [date] is important because [reason]."

### 7. Discovery Call Special Handling

If meeting type is "discovery call":
- Capture: Company, contact name, their problem, potential solution
- Note: Next steps in sales process
- Add to pipeline tracking if relevant
- Flag: "Is this a qualified lead? What's the next step?"

### 8. Email Follow-up (Optional)

After processing, ask:
"Do you need to send a follow-up email from this meeting?"

If yes:

1. **Determine account** based on meeting context:
   <!-- ONBOARDING: Replace example accounts with user's actual accounts from /reference/system-config.md -->
   - Work meeting → you@company.com
   - Side project meeting → you@sideproject.com
   - Personal → your.personal@gmail.com

2. **Draft the email** using appropriate template:

**Discovery Call Follow-up:**
```
Subject: Re: [Topic Discussed] - Next Steps

[Personalized opener referencing something specific from call]

Great speaking with you today. As discussed:

Key Points:
- [Point 1]
- [Point 2]

Next Steps:
- [Action 1] - [Owner]
- [Action 2] - [Owner]

[Proposed timeline or next meeting suggestion]

Looking forward to [specific outcome].

Best,
[Your Name]
```

**Internal/Client Meeting:**
```
Subject: [Meeting Topic] - Summary & Action Items

Thanks for the time today.

Summary:
[2-3 sentence recap]

Action Items:
- [Your item] - I'll have this by [date]
- [Their item] - [Person] to handle by [date]

Let me know if I missed anything.

[Your Name]
```

3. **Show draft to the user for approval:**
   "Here's the draft. Want me to send it, modify it, or skip?"

4. **ONLY send with explicit approval:**
   - "send" / "send it" / "yes" → Use `mcp__google-workspace__send_gmail_message`
   - "change [X]" → Modify and show again
   - "skip" / "no" → Don't send

**Authorization reminder**: Never send without explicit "send" confirmation.
