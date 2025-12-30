---
description: First of month deep analysis and goal adjustment (allow ~90 min)
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
---

# Monthly Review

Deep analysis at the start of each month. Metrics, patterns, and adjustments.

## Process

### 1. Gather Data

Read and compile:
- All `/reviews/weekly/` from the past month (4-5 weeks)
- `/metrics/habits/` files from past month
- `/metrics/health/` for body metrics
- `/metrics/velocity/` for project completion data
- All active project files
- `/reference/goals/q1-2026-goals.md` and `/reference/goals/2026-goals.md`
- Previous month's review if exists

### 2. Habit Trend Analysis

Calculate monthly aggregates.

**Reference**: See `/reference/habits.md` for the canonical habit list.

```
## Habit Performance | [Month YYYY]

| Habit | W1 | W2 | W3 | W4 | Monthly Avg | Trend |
|-------|----|----|----|----|-------------|-------|
| Wake 5:30am | X/7 | X/7 | X/7 | X/7 | XX% | ↑/↓/→ |
[... all habits ...]

**Monthly Average**: XX%
**Best Week**: Week X (XX%)
**Worst Week**: Week X (XX%)
**Trend vs Last Month**: ↑ Improving / ↓ Declining / → Stable
```

If monthly average <90%: "This is below target. What's the pattern? Which habits are consistently failing?"

### 3. Health Metrics Review

If health data available:
- Weight trend over the month
- Strength benchmark progress (if tracked)
- Average energy levels
- Sleep quality patterns

"How do you feel physically compared to last month? What's improving? What needs work?"

### 4. Project Velocity Review

Analyze project progress:
- Tasks completed this month
- Projects advanced or completed
- New projects started
- Projects stalled or archived
- Blockers encountered and resolved

Calculate rough velocity: "You completed approximately [X] tasks across [Y] projects this month."

### 5. Accomplishment Inventory (Month Level)

"Let's zoom out. What were the major wins this month?"

- Business/work accomplishments
- Project milestones
- Health/fitness achievements
- Personal growth
- Relationships
- Learning

### 6. What Failed This Month

Be direct:
- What goals were set but not achieved?
- What kept getting pushed?
- What patterns of failure emerged?
- What excuses were repeated?

"What do you wish you had done differently?"

### 7. Pattern Recognition

Look across the month's data for patterns:
- Which days of the week are strongest/weakest?
- What time of day is most productive?
- What consistently derails progress?
- What correlates with good days vs. bad days?
- Any seasonal or cyclical patterns?

"Based on the data, here's what I'm seeing: [patterns]"

### 8. Goal Progress Check

Against annual and quarterly goals:

```
## Goal Progress | [Month] of Q[X] 2026

| Goal | Target (Q1) | Current | % Complete | On Track? |
|------|-------------|---------|------------|-----------|
| [Goal] | [Target] | [Current] | XX% | 🟢/🟡/🔴 |

**Days into Quarter**: [X]
**Days Remaining**: [X]
**Pace Assessment**: [On track / Behind / Ahead]
```

If behind: "At current pace, you'll [reach/miss] this goal by [amount]. What needs to change?"

### 9. Adjustments

Based on the review, determine:
- What should be **eliminated** (not serving goals)?
- What should be **doubled down on** (working well)?
- Any **goal adjustments** needed (too ambitious? not ambitious enough?)?
- Any **routine changes** to implement?
- Any **new experiments** to try?

### 10. Create Monthly Review Document

Save to `/reviews/monthly/[YYYY-MM].md`:

```markdown
# Monthly Review | [Month] [Year]

## 📊 Habit Summary

| Habit | Avg | Best Week | Worst Week | Trend |
|-------|-----|-----------|------------|-------|
| [Habit] | XX% | WXX | WXX | ↑/↓/→ |
[... all habits ...]

**Monthly Score**: XX%
**Target**: 90%
**Trend**: [Improving/Stable/Declining]

---

## 💪 Health Metrics

| Metric | Start of Month | End of Month | Change |
|--------|----------------|--------------|--------|
| Weight | | | |
| Energy (avg) | | | |
| [Other metrics] | | | |

---

## 🚀 Project Velocity

**Tasks Completed**: [X]
**Projects Advanced**: [X]
**Blockers Resolved**: [X]

### Project Status Summary
| Project | Status | Progress |
|---------|--------|----------|
| [Project] | 🟢/🟡/🔴 | [Brief note] |

---

## 🏆 Major Wins
- [Accomplishment]
- [Accomplishment]

## 📉 What Didn't Work
- [Failure and why]
- [Pattern identified]

---

## 🎯 Goal Progress

| Goal | Q1 Target | Current | Status |
|------|-----------|---------|--------|
| [Goal] | | | 🟢/🟡/🔴 |

**Assessment**: [Narrative on goal progress]

---

## 🔍 Patterns Identified
- [Pattern 1]: [Implication]
- [Pattern 2]: [Implication]

---

## 🔧 Adjustments for Next Month

**Eliminate**:
- [What to stop]

**Double Down**:
- [What to increase]

**Experiments**:
- [What to try]

**Routine Changes**:
- [Specific change]

---

## 💭 Reflection

**Biggest lesson this month**: 
[Key insight]

**One word to describe this month**: 
[Word]

**Commitment for next month**:
[Specific commitment]
```

### 11. Update Dashboard

Update `/metrics/dashboard.md` with monthly summary

### 12. Update Health Metrics

Create/update `/metrics/health/[YYYY-MM].md` with current body metrics

### 13. Accountability Close

"What's the ONE thing that would make next month significantly better than this one?"

Get specific commitment.
