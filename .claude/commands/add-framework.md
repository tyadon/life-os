---
description: Add a new decision framework or mental model to the system
argument-hint: <framework name>
allowed-tools: Read, Write, Edit, Glob
---

# Add Framework

Add a new mental model or decision framework to the system.

## Process

### 1. Gather Information

If framework name provided ($ARGUMENTS), use it. Otherwise ask:
"What framework do you want to add?"

Then gather:
- **Name**: What should we call this framework?
- **When to use**: In what situations is this framework helpful?
- **Steps**: What are the steps to apply this framework?
- **Source**: Where did you learn this? (book, person, experience)
- **Example**: Can you give a quick example of how to use it?

### 2. Create Framework File

Create `/reference/frameworks/[framework-name].md`:

```markdown
# [Framework Name]

## When to Use

[Description of situations where this framework is appropriate]

## The Framework

### Step 1: [Step Name]
[Instructions for this step]

### Step 2: [Step Name]  
[Instructions for this step]

### Step 3: [Step Name]
[Instructions for this step]

[Additional steps as needed]

## Key Questions

- [Key question to ask during this framework]
- [Key question to ask during this framework]

## Example Application

**Scenario**: [Brief scenario]

**Application**:
[How the framework would be applied]

**Result**: [What clarity it provides]

## Source

[Attribution - book, author, where learned]

---

*Added: [Date]*
```

### 3. Update Index

Add the new framework to `/reference/frameworks/README.md`:

Add a row to the Available Frameworks table:
```markdown
| [framework-name].md | [Brief description of when to use] |
```

### 4. Test Understanding

"Let me make sure I've got this right. This framework is for [situation], and the key steps are [steps]. Correct?"

Make any adjustments based on feedback.

### 5. Confirm

"Framework added: `/reference/frameworks/[framework-name].md`

I'll suggest using it when relevant decisions come up. You can also trigger it directly with `/decide [topic]` and I'll ask which framework to use."

### 6. Offer Integration

"Want to connect this framework to any specific project or decision type? For example, 'always use this for hiring decisions' or 'suggest this for investment decisions'?"

If yes, note the connection in the CLAUDE.md or the framework file itself.
