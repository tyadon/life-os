---
description: View calendar across all accounts with conflict detection
argument-hint: [timeframe: today|tomorrow|week|YYYY-MM-DD]
allowed-tools: Read, Glob, mcp__google-workspace__get_events, mcp__google-workspace__list_calendars
---

# Calendar Check

Quick view of schedule with conflict detection and prep prompts.

**Read-only command** - no modifications without separate confirmation.

## Process

### 1. Determine Timeframe

Parse $ARGUMENTS:
- `today` (default) → Current day
- `tomorrow` → Next day
- `week` → Next 7 days
- `YYYY-MM-DD` → Specific date

Get current date/time for RFC3339 formatting.

### 2. Pull Events

<!-- ONBOARDING: Replace example accounts below with user's actual accounts from /reference/system-config.md -->

For each account:
```
mcp__google-workspace__get_events
  user_google_email: your.personal@gmail.com
  time_min: [start of range RFC3339]
  time_max: [end of range RFC3339]
  detailed: true

mcp__google-workspace__get_events
  user_google_email: you@company.com
  time_min: [start of range RFC3339]
  time_max: [end of range RFC3339]
  detailed: true

mcp__google-workspace__get_events
  user_google_email: you@sideproject.com
  time_min: [start of range RFC3339]
  time_max: [end of range RFC3339]
  detailed: true
```

### 3. Consolidate and Analyze

Merge events from all accounts into single timeline.

**Detect**:
- **Conflicts**: Events overlapping across accounts
- **Back-to-back**: Less than 15 min between meetings
- **Long gaps**: 2+ hours free (deep work opportunities)

### 4. Display - Single Day View

```
## 📅 CALENDAR | [Day], [Date]

### Timeline

**Morning**
| Time | Event | Duration | Account |
|------|-------|----------|---------|
| 9:00-9:30 | Standup | 30m | Work |
| 10:00-11:00 | Discovery call - Prospect X | 1h | Work |

**Afternoon**
| Time | Event | Duration | Account |
|------|-------|----------|---------|
| 2:00-3:00 | Co-founder sync | 1h | Side Project |
| 4:00-4:30 | 1:1 with [Colleague] | 30m | Work |

**Evening**
| Time | Event | Duration | Account |
|------|-------|----------|---------|
| 7:00-8:00 | Dinner with [Friend] | 1h | Personal |

---

### ⚠️ Conflicts
[If any conflicts detected]
- **CONFLICT**: [Event 1] overlaps with [Event 2] from [time] to [time]
  → Which takes priority?

### 🎯 Deep Work Windows
- 6:00am - 9:00am: **3 hours** (before meetings start)
- 11:00am - 2:00pm: **3 hours**
- 3:00pm - 4:00pm: **1 hour**

**Total available**: [X] hours for deep work

### 📋 Prep Required

| Event | Time | Prep Needed |
|-------|------|-------------|
| Discovery call | 10:00am | Review company, prep questions |
| Co-founder sync | 2:00pm | Check side project status |
| 1:1 with [Colleague] | 4:00pm | Review pipeline, bring updates |

---

**Meeting load**: [X] meetings, [Y] hours in calls
**Free time**: [Z] hours available
```

### 5. Display - Week View

If timeframe is `week`:

```
## 📅 WEEK OVERVIEW | [Start Date] - [End Date]

### Daily Summary

| Day | Meetings | Hours Blocked | Deep Work Available |
|-----|----------|---------------|---------------------|
| Mon | 3 | 2.5h | 5.5h |
| Tue | 5 | 4h | 4h |
| Wed | 2 | 1.5h | 6.5h |
| Thu | 4 | 3h | 5h |
| Fri | 1 | 1h | 7h |
| Sat | 0 | 0h | 8h |
| Sun | 0 | 0h | 8h |

### Key Events This Week

**Work** (Priority):
- [Day]: [Event] at [time]
- [Day]: [Event] at [time]

**Side Project**:
- [Day]: [Event] at [time]

**Personal**:
- [Day]: [Event] at [time]

### ⚠️ Watch Out

- **Busiest day**: [Day] with [X] meetings
- **Conflicts**: [Any conflicts detected]
- **Back-to-back risk**: [Days with tight scheduling]

### Deep Work Opportunities

- **Best day for deep work**: [Day] - [X] hours free
- **Morning blocks**: [List days with free mornings]

---

**Week totals**:
- Meetings: [X] total
- Hours in meetings: [Y] hours
- Deep work potential: [Z] hours
```

### 6. Flag Issues

If analysis reveals problems:

**Too many meetings**:
"You have [X] hours in meetings this week. That leaves [Y] for deep work. Is that sustainable?"

**No deep work blocks**:
"No 2+ hour blocks available on [days]. When will you do focused work?"

**Work light**:
"Only [X] work meetings this week. Revenue is critical - are there calls you should be scheduling?"

## Integration with Projects

If events relate to known projects:
- Link to project file
- Suggest reviewing project status before meeting
- Flag if meeting is with a prospect from pipeline
