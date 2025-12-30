---
description: Work through a decision using structured framework and create decision document
argument-hint: <decision topic>
allowed-tools: Read, Write, Edit, Glob, Grep
---

# Decision Framework

Help the user work through a significant decision systematically and create a decision document for historical reference.

## Process

### 1. Identify the Goal

If topic provided ($ARGUMENTS), start there. Otherwise ask:

"What decision are you wrestling with?"

Then clarify the underlying goal:
- "What are you ultimately trying to achieve?"
- "What does success look like here?"
- "What's the timeline for this decision?"
- "What constraints exist?"

Don't accept fuzzy goals. Get specific.

### 2. Frame the First Decision

Describe at a high level the first decision that needs to be made in order to achieve the goal.

Format:
```
To achieve [GOAL], the first decision you need to make is: [DECISION STATEMENT]
```

If there are cascading decisions (Decision A unlocks Decision B), note this but focus on the first one.

### 3. Generate Choices

Create a numbered list of realistic choices. Be thoughtful about this:

```markdown
## Choices

1. [Choice 1]
2. [Choice 2]
3. **[Choice 3 - RECOMMENDED]**
4. [Choice 4]
```

Guidelines:
- Include as many choices as are genuinely relevant (usually 3-5)
- Bold the choice you recommend as the decision
- Make choices specific and actionable, not vague
- Include the "do nothing" option if it's legitimately viable

### 4. Provide Reasoning

For each choice, provide corresponding reasoning. The reasoning number must match the choice number.

```markdown
## Reasoning

1. [Reasoning for Choice 1 - pros, cons, implications]
2. [Reasoning for Choice 2 - pros, cons, implications]
3. **[Reasoning for Choice 3 - why this is the recommendation]**
4. [Reasoning for Choice 4 - pros, cons, implications]
```

Guidelines:
- Bold the reasoning for your recommended choice
- Be honest about trade-offs
- Consider second-order effects
- Challenge assumptions

### 5. Check Alignment

After presenting choices and reasoning, check:
- "Does this match your gut feeling?"
- "Is there a choice I'm missing?"
- "What would change your mind?"

### 6. Confirm Decision

Push for explicit commitment:
- "What's your decision?"
- "Say it: 'I'm going to [X].'"

Don't let it stay abstract.

### 7. Generate Decision Document

Create a decision document at `/decisions/YYYY-MM-DD-[topic].md`:

```markdown
# [Decision Topic]

**Date**: YYYY-MM-DD
**Related Project**: [Project name or "General"]
**Status**: Decided

## Goal

[What the user is trying to achieve]

## The Decision

[High-level description of what needed to be decided]

## Choices

1. [Choice 1]
2. [Choice 2]
3. **[Choice 3 - RECOMMENDED]**
4. [Choice 4]

## Reasoning

1. [Reasoning for Choice 1]
2. [Reasoning for Choice 2]
3. **[Reasoning for Choice 3 - why this was recommended]**
4. [Reasoning for Choice 4]

## Decision Made

**Chosen**: [The choice selected]
**Decided by**: [User]
**Date**: YYYY-MM-DD

## Next Actions

- [ ] [Action 1] | Due: [date]
- [ ] [Action 2] | Due: [date]

## Review Date

[When to check if this was the right call - typically 2 weeks to 3 months depending on decision scope]
```

### 8. Link to Project

If the decision relates to a specific project, add a reference in that project file's "Decisions Made" section:

```markdown
- YYYY-MM-DD: [Brief summary] → [Full doc](/decisions/YYYY-MM-DD-topic.md)
```

### 9. Update Decisions Index

Add the new decision to `/decisions/README.md` index section.

### 10. Confirm Completion

"Decision documented. Full rationale is saved at `/decisions/[filename].md`. You can share this with anyone who asks about the reasoning. We'll revisit on [review date]."

## Proactive Suggestion

When conversing with the user, suggest using this framework when you detect:
- Multiple viable options being discussed
- Significant tradeoffs mentioned
- Impact on timeline, money, relationships, or strategy
- Expressions of uncertainty ("I'm not sure whether to...")
- Irreversible or hard-to-reverse choices
- Decisions that affect others (co-founders, partners, etc.)

Prompt format: "This seems like a decision that might benefit from structured documentation. Want to work through it and create a decision doc?"

## Quality Reminder

A good decision process doesn't guarantee good outcomes. The goal is to make decisions you won't regret the process of making - even if the outcome isn't what you hoped for.
