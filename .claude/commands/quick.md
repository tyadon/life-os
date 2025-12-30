---
description: Fast capture for later processing
argument-hint: <quick note>
allowed-tools: Write, Bash
---

# Quick Capture

Fast capture without processing. Will be handled in evening check-in.

## Process

### 1. Capture Immediately

Get current timestamp and save to `/inbox/captures/[YYYY-MM-DD]-[HHMM].md`:

```markdown
# Quick Capture | [Date] [Time]

$ARGUMENTS
```

### 2. Confirm

Respond simply:

"✅ Captured. Will process in evening check-in."

That's it. No analysis, no follow-up questions. Just capture and confirm.

### 3. If Empty

If no arguments provided:

"What do you want to capture?"

Then save whatever they provide.
