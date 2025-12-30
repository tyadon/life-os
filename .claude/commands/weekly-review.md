---
description: Sunday deep review and planning ritual (allow ~45-60 min)
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, mcp__google-workspace__get_events, mcp__google-workspace__search_gmail_messages
---

# Weekly Review

This is your Sunday ritual. Deep review, pattern recognition, and strategic planning for the week ahead.

## Process

### 0. Gather Digital Activity (MCP)

**Calendar Load Analysis:**
Pull this week's events from all accounts:
```
mcp__google-workspace__get_events
  user_google_email: [each account]
  time_min: [Monday of this week RFC3339]
  time_max: [Sunday of this week RFC3339]
```

Calculate:
- Total meetings this week
- Hours in meetings vs. available
- Which days were heaviest

**Email Volume Check:**
For each account, count activity:
```
mcp__google-workspace__search_gmail_messages
  user_google_email: [account]
  query: "newer_than:7d"
  page_size: 1  # Just to get count
```

Note:
- Total emails received per account
- Unread backlog per account
- Work prospect responsiveness

If MCP unavailable, skip and proceed with local data.

### 1. Gather Local Data

Read and analyze:
- All `/journal/daily/` entries from the past week
- `/metrics/habits/[current-week].md` for habit scores
- All active `/projects/work/` and `/projects/personal/` files
- `/reference/goals/q1-2026-goals.md` and `/reference/goals/2026-goals.md`
- Last week's review if it exists in `/reviews/weekly/`

### 2. Habit Analysis

Calculate weekly totals from the habit tracking.

**Reference**: See `/reference/habits.md` for the canonical habit list.

| Habit | Score | Status |
|-------|-------|--------|
| Wake 5:30am | X/7 | 🟢/🟡/🔴 |
| Workout | X/7 | 🟢/🟡/🔴 |
| Protein target | X/7 | 🟢/🟡/🔴 |
| Deep work 3+ hrs | X/7 | 🟢/🟡/🔴 |
| No phone first hour | X/7 | 🟢/🟡/🔴 |
| Walk 20+ min | X/7 | 🟢/🟡/🔴 |
| Read 30+ min | X/7 | 🟢/🟡/🔴 |
| Meditated | X/7 | 🟢/🟡/🔴 |
| Screens off 8:30pm | X/7 | 🟢/🟡/🔴 |
| Bed by 9:30pm | X/7 | 🟢/🟡/🔴 |

**Weekly Score**: XX/70 (XX%)
**Target**: 63/70 (90%)

Status: 🟢 = 90%+, 🟡 = 70-89%, 🔴 = <70%

If below 90%: "Which habits are dragging? What's the pattern? This needs to be addressed."

### 3. Accomplishment Inventory

Ask: "Let's inventory wins. What did you accomplish this week?"

Capture across all domains:
- **Work wins** (company progress, client work, business development)
- **Project wins** (side projects, technical progress)
- **Health wins** (workouts, nutrition, sleep)
- **Personal wins** (relationships, learning, experiences)

Acknowledge these briefly, then move forward.

### 4. What Didn't Work

Be honest and direct:
- What was planned but didn't happen?
- What blocked progress?
- What drained energy?
- What should be eliminated?
- What excuses were made?

Don't let them minimize failures. Call out patterns if you see them.

### 5. Project Status Review

For each active project, assess:

```
### [Project Name]
**Status**: 🟢 On Track / 🟡 Behind / 🔴 Blocked / ⏸️ On Hold
**Progress This Week**: [What happened]
**Blockers**: [What's in the way]
**Next Milestone**: [What's the next target]
**Next Week Focus**: [Specific actions]
```

### 6. Goal Alignment Check

Compare current progress to quarterly goals:
- On track for Q1 targets?
- Pace check: Where should they be at this point?
- Any goals that need adjustment?
- Any goals being neglected?

Be direct if things are off track: "At this pace, you won't hit [goal]. What needs to change?"

### 7. Next Week Planning

Work through:
- **Top 3 Priorities**: What are the three most important things for next week?
- **Key Commitments**: Meetings, deadlines, obligations
- **Potential Derailers**: What could throw things off? How to prevent?
- **Habit Focus**: Which habit needs extra attention?
- **Energy Management**: Any recovery needed? Big energy days?

### 8. Create Weekly Review Document

Save to `/reviews/weekly/[YYYY]-W[XX].md`:

```markdown
# Weekly Review | Week XX, YYYY

## 📊 Habit Scorecard

| Habit | Mon | Tue | Wed | Thu | Fri | Sat | Sun | Total |
|-------|-----|-----|-----|-----|-----|-----|-----|-------|
| Wake 5:30am | ✅/❌ | | | | | | | X/7 |
| Workout | | | | | | | | X/7 |
| Protein target | | | | | | | | X/7 |
| Deep work 3+ hrs | | | | | | | | X/7 |
| No phone first hour | | | | | | | | X/7 |
| Walk 20+ min | | | | | | | | X/7 |
| Read 30+ min | | | | | | | | X/7 |
| Meditated | | | | | | | | X/7 |
| Screens off 8:30pm | | | | | | | | X/7 |
| Bed by 9:30pm | | | | | | | | X/7 |
| **Daily Total** | /10 | /10 | /10 | /10 | /10 | /10 | /10 | **XX/70** |

**Weekly Score**: XX% [🚀 >95% | ✅ 90%+ | ⚠️ 80-89% | 🔴 <80%]

---

## 🏆 Wins

### Work
- [Win]

### Projects  
- [Win]

### Health
- [Win]

### Personal
- [Win]

---

## 📉 What Didn't Work

- [Failure/miss and why]
- [Pattern identified]

---

## 📧 Digital Activity

### Calendar Load
| Day | Meetings | Hours |
|-----|----------|-------|
| Mon | X | Xh |
| Tue | X | Xh |
| Wed | X | Xh |
| Thu | X | Xh |
| Fri | X | Xh |

**Total**: X meetings, Xh in calls
**Deep work available**: Xh

### Email Volume
| Account | Received | Sent | Unread |
|---------|----------|------|--------|
| Work | X | X | X |
| Personal | X | X | X |
| Side Project | X | X | X |

**Patterns**: [Any notable patterns - heavy email day, prospect responsiveness, etc.]

---

## 🎯 Project Status

### [Project Name]
- **Status**: [emoji + status]
- **This Week**: [What happened]
- **Blockers**: [If any]
- **Next Week**: [Focus]

[Repeat for each active project]

---

## 🧭 Goal Alignment

### Q1 2026 Goals Check
| Goal | Target | Current | Status |
|------|--------|---------|--------|
| [Goal] | [Target] | [Current] | 🟢/🟡/🔴 |

**Assessment**: [On track / behind / ahead]

---

## 📅 Next Week

### Top 3 Priorities
1. [Priority - why it matters]
2. [Priority - why it matters]
3. [Priority - why it matters]

### Key Commitments
- [Day]: [Commitment]

### Potential Derailers
- [Risk] → Prevention: [How to avoid]

### Habit Focus
[Which habit(s) need extra attention and why]

---

## 💭 Reflection

**What I learned this week:**
[Key insight]

**What I'm grateful for:**
[Gratitude note]

**Commitment for next week:**
[Specific commitment]
```

### 9. Update Dashboard

Update `/metrics/dashboard.md` with:
- New weekly score
- Updated project statuses
- Next week's MIT
- Any new blockers

### 10. Accountability Close

End with: "Based on this review, what's the ONE thing you need to do differently next week? Say it out loud."

Get a specific commitment. Don't let it be vague.
