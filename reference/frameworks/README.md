# Decision Frameworks

This folder contains mental models and decision frameworks for structured thinking.

## Current Approach

**Primary decision method**: The `/decide` command uses a structured Choices + Reasoning format and generates decision documents in `/decisions/`. This is the recommended approach for significant decisions.

**Why documents**: Decision documents create historical context you can reference later or share with others who have questions about your reasoning.

## How to Use

Run `/decide [topic]` to work through a structured decision process that:
1. Clarifies your goal
2. Frames the key decision
3. Presents numbered choices with a bold recommendation
4. Provides corresponding numbered reasoning with bold key reasoning
5. Creates a decision document in `/decisions/`
6. Links to relevant project files

## Legacy Frameworks

The individual framework files below are kept for reference. They can inform your thinking but the primary decision process now uses the unified structured format.

| Framework | File | Good For |
|-----------|------|----------|
| Eisenhower Matrix | `eisenhower-matrix.md` | Prioritization thinking |
| 10-10-10 | `10-10-10.md` | Perspective on short vs. long term |
| Premortem | `premortem.md` | Risk identification thinking |

## Adding New Frameworks

Use `/add-framework [name]` to add a new thinking framework. New frameworks can inform decision reasoning but all significant decisions should still go through the `/decide` process.

### Framework File Template

```markdown
# [Framework Name]

## When to Use
[Description of situations where this framework is appropriate]

## The Framework

### Step 1: [Step Name]
[Instructions]

### Step 2: [Step Name]
[Instructions]

[Additional steps as needed]

## Key Questions
- [Question to ask during this framework]

## Example Application
[Brief example of using this framework]

## Source
[Attribution - book, author, where learned]

---
*Added: [Date]*
```

## Framework Categories

As you add more frameworks, consider organizing by type:

- **Prioritization**: For deciding what to focus on
- **Risk Assessment**: For evaluating potential problems
- **Problem-Solving**: For working through challenges
- **Strategic Thinking**: For long-term planning
- **Communication**: For difficult conversations
- **Creativity**: For generating ideas

## Notes

- Not every decision needs formal documentation - use for high-stakes, complex, or decisions affecting others
- A good decision process doesn't guarantee good outcomes
- Decision documents live in `/decisions/` with summaries linked from project files
