# Customization Guide

This guide walks through how to personalize LifeOS for your specific needs.

## Recommended: Run /onboard First

The easiest way to customize LifeOS is to run the `/onboard` command. It walks you through:

1. **Google Account Setup** - Connects your personal, work, and project accounts
2. **Life Audit** - Captures your current situation across all life domains
3. **Vision & Goals** - Sets annual and quarterly targets
4. **Project Inventory** - Creates files for everything you're working on
5. **Daily Rhythm** - Customizes routines to your schedule
6. **Habit Selection** - Defines what you want to track
7. **Full Configuration** - Updates ALL system files with your actual data

**Time required**: 60-90 minutes (can be done in multiple sessions)

After onboarding, the system is fully personalized. All commands, templates, and agents will use your actual accounts and project names.

---

## System Architecture

### Configuration Files

```
/reference/system-config.md    ← Single source of truth for accounts & projects
CLAUDE.md                      ← Your personal context (created from template)
```

**system-config.md** stores:
- Your Google accounts (personal, work, projects)
- Project → Task List mappings
- Account priority order
- Quick reference for common accounts

**CLAUDE.md** stores:
- Your identity and situation
- Current priorities
- Key people
- Interaction preferences

### How Commands Use Configuration

When you run commands like `/tasks`, `/add-task`, or `/complete-task`, they reference the mappings in `/reference/system-config.md` to route tasks to the correct Google account and task list.

---

## Manual Setup (Alternative to /onboard)

If you prefer to customize manually:

### 1. Copy the Template

```bash
cp CLAUDE.md.template CLAUDE.md
```

### 2. Create System Config

Create `/reference/system-config.md` with your accounts:

```markdown
# System Configuration

## Google Accounts

| Account | Type | Primary Use |
|---------|------|-------------|
| `your.email@gmail.com` | Personal | Personal tasks, calendar, travel |
| `you@company.com` | Work | Work tasks, meetings, email |

## Project → Task List Mapping

| Project Slug | Google Account | Task List Name | Priority |
|--------------|----------------|----------------|----------|
| work-main | `you@company.com` | Work | High |
| side-project | `your.email@gmail.com` | Side Project | Medium |
| health-goals | `your.email@gmail.com` | Health | High |

## Quick Reference

**Personal email**: `your.email@gmail.com`
**Work email**: `you@company.com`
**Default task account**: `your.email@gmail.com`
**Travel confirmations**: `your.email@gmail.com`
```

### 3. Essential Sections to Customize in CLAUDE.md

#### Your Identity

```markdown
## WHO IS [YOUR NAME]

[YOUR NAME] is a [AGE] year old [PROFESSION/ROLE]. They are:
- [Key fact about current work/career]
- [Key fact about personal situation]
- [Key hobby or interest]
- Based in [CITY, STATE/COUNTRY]
```

#### Key People

```markdown
## KEY PEOPLE

- **[Partner name]** - partner/spouse
- **[Friend name]** - best friend
- **[Coworker name]** - colleague at [company]
- **[Family member]** - [relationship]
```

Create detailed files in `/reference/people/` for anyone you'll discuss regularly.

#### Current Priorities

```markdown
## CURRENT PRIORITIES (Q1 2025)

### Health
- [Your health goals]
- [Exercise routine]
- [Key metrics]

### Work
- [Primary work project]
- [Secondary focus]

### Personal
- [Personal projects]
- [Side interests]
```

#### Google Account Mapping

```markdown
## MCP INTEGRATIONS

**Connected accounts**:
- `your.personal@gmail.com` - Personal
- `you@work.com` - Work

### Google Tasks - Project Mapping

| Project | Google Account | Task List Name |
|---------|---------------|----------------|
| Work Project | `you@work.com` | Work Project |
| Side Project | `your.personal@gmail.com` | Side Project |
| Health Goals | `your.personal@gmail.com` | Health |
```

## Optional: Custom Commands

### Creating a New Command

Commands live in `.claude/commands/`. Create a new file:

```markdown
---
description: Brief description shown in /help
allowed-tools: Read, Write, Edit, Glob, Grep
---

# Command Name

Instructions for Claude on how to execute this command.

## Process

1. Step one
2. Step two
3. Step three
```

### Example: Custom Weekly Review

Create `.claude/commands/my-weekly-review.md`:

```markdown
---
description: My custom weekly review format
allowed-tools: Read, Write, Edit, Glob, Grep
---

# My Weekly Review

**IMPORTANT**: Read `CLAUDE.md` first for context.

## Process

### 1. Review Last Week
- Check journal entries from `/journal/daily/`
- Review completed tasks
- Note wins and misses

### 2. Plan Next Week
- Identify top 3 priorities
- Block time for deep work
- Schedule key meetings

### 3. Update Files
- Update `/reviews/weekly/YYYY-WXX.md`
- Update relevant project files
```

## Optional: Custom Agents

### Creating a New Agent

Agents live in `.claude/agents/`. They're specialized personas for specific tasks.

```markdown
---
name: my-custom-agent
description: What this agent does
tools: Read, Write, Edit, Glob, Grep
model: sonnet
---

You are a [description of persona and purpose].

**IMPORTANT**: Read `CLAUDE.md` first for user context.

## Your Role

[Detailed instructions on behavior]

## When Invoked

1. [Step one]
2. [Step two]
```

### Agent Models

- `sonnet` - Default, good balance of speed and capability
- `opus` - Most capable, use for complex reasoning
- `haiku` - Fastest, use for simple extraction tasks

## Modifying Routines

### Morning Routine

Edit `/reference/routines/morning-routine.md` to match your schedule:

- Adjust wake time
- Modify workout schedule
- Add/remove phases

### Evening Routine

Edit `/reference/routines/evening-routine.md`:

- Adjust bedtime targets
- Modify wind-down activities
- Customize shutdown ritual

## Habit Tracking

### Defining Your Habits

Create `/reference/habits.md` with your daily habits:

```markdown
# Daily Habits

## Target: 90% (9/10 daily)

| # | Habit | Description |
|---|-------|-------------|
| 1 | Wake by 6am | Feet on floor by target time |
| 2 | Exercise | Any intentional movement |
| 3 | Protein breakfast | 30g+ protein |
| 4 | No phone first hour | Device-free morning |
| 5 | Deep work | 60+ min focused work |
| 6 | Read | 30+ min reading |
| 7 | Journal | Morning or evening |
| 8 | Evening routine | Wind-down by target time |
| 9 | Bed by 10pm | Lights out |
| 10 | Track habits | Complete this scorecard |
```

### Habit Scorecard Format

Weekly scorecards in `/metrics/habits/` use this format:

```markdown
# Habit Tracking | Week 01, 2025

| Habit | Mon | Tue | Wed | Thu | Fri | Sat | Sun | Total |
|-------|-----|-----|-----|-----|-----|-----|-----|-------|
| Wake by 6am | ✓ | ✓ | ✗ | ✓ | ✓ | ✓ | ✓ | 6/7 |
| Exercise | ✓ | ✓ | ✓ | ✗ | ✓ | ✓ | ✗ | 5/7 |
...

**Weekly Score**: 58/70 (83%)
**Target**: 63/70 (90%)
```

## Project Templates

### Work Projects

Edit `/projects/work/_template.md` to match your workflow:

- Add company-specific sections
- Include relevant stakeholders
- Add required fields

### Personal Projects

Edit `/projects/personal/_template.md`:

- Simplify if needed
- Add hobby-specific sections

## Tips

### Start Simple

Don't try to customize everything at once. Start with:

1. Basic CLAUDE.md configuration
2. One or two active projects
3. Morning and evening check-ins

Add complexity as you build the habit.

### Iterate

The system should evolve with you. After a few weeks:

- Remove commands you don't use
- Add shortcuts for frequent actions
- Adjust routines that don't fit

### Keep CLAUDE.md Current

Update CLAUDE.md when:

- Projects change
- Priorities shift
- New people become relevant
- Goals evolve

The more current your context, the better Claude can help.
