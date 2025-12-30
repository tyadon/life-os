---
description: Review sales/business pipeline via email threads
allowed-tools: Read, Write, Edit, Glob, Grep, mcp__google-workspace__search_gmail_messages, mcp__google-workspace__get_gmail_message_content, mcp__google-workspace__get_gmail_thread_content
---

# Pipeline Check

Review your sales/business pipeline by analyzing email threads with prospects and clients.

**IMPORTANT**: Read `CLAUDE.md` first to identify:
- Which account handles sales/business development
- The related project file (e.g., a growth or sales project in `/projects/work/`)

## Process

### 1. Load Current Pipeline

Read the relevant project file from `/projects/work/` to identify:
- Known prospects/clients
- Current pipeline stages
- Last contact dates
- Active opportunities

### 2. Search for Prospect Emails

For each known prospect, search the business inbox:

```
mcp__google-workspace__search_gmail_messages
  user_google_email: [business account from CLAUDE.md]
  query: "from:[prospect domain] OR to:[prospect domain]"
  page_size: 10
```

Also search for general sales-related emails:
```
mcp__google-workspace__search_gmail_messages
  user_google_email: [business account]
  query: "subject:(proposal OR demo OR meeting OR interested OR follow up) newer_than:14d"
  page_size: 10
```

### 3. Get Thread Content

For active prospects, get full conversation:
```
mcp__google-workspace__get_gmail_thread_content
  user_google_email: [business account]
  thread_id: [from search results]
```

### 4. Analyze Pipeline Status

For each prospect, determine:

| Field | Analysis |
|-------|----------|
| **Last Contact** | Date of most recent email exchange |
| **Ball in Court** | Whose turn to respond? (You / Them) |
| **Days Since** | How long since last contact? |
| **Last Topic** | What was discussed? |
| **Next Step** | Logical next action |
| **Risk Level** | Active / Cooling / Cold |

**Risk Indicators**:
- **Active**: Contact within 5 days, engaged
- **Cooling**: 5-10 days, no response
- **Cold**: 10+ days, no engagement

### 5. Display Pipeline Dashboard

```
## PIPELINE CHECK | [Date]

### Business Context
- **Goal**: [From project file]
- **Priority**: [From CLAUDE.md]

---

### Active Prospects

#### [Prospect 1: Company/Person Name]
| Status | Value |
|--------|-------|
| Stage | [Discovery / Proposal / Negotiation / Closing] |
| Last Contact | [Date] - [Who sent last] |
| Ball in Court | [You / Them] |
| Days Since | [X] days |
| Risk | [Active/Cooling/Cold] |

**Latest Thread Summary**:
[2-3 sentence summary of recent conversation]

**Next Step**: [Recommended action]

---

#### [Prospect 2: Company/Person Name]
[Same format...]

---

### Pipeline Health

| Metric | Value |
|--------|-------|
| Active Prospects | [X] |
| Needing Follow-up | [X] |
| At Risk (Cooling/Cold) | [X] |
| Proposals Out | [X] |

### Urgent Actions

1. **[Prospect]**: No contact in [X] days. Follow up TODAY.
2. **[Prospect]**: Ball in your court for [X] days. Respond.
3. **[Prospect]**: They responded [X] days ago. Your move.

### Recommended Follow-ups

| Prospect | Action | Priority |
|----------|--------|----------|
| [Name] | [Send proposal / Schedule demo / Follow up] | [H/M/L] |
```

### 6. Offer Updates

After displaying pipeline:

"Should I update the project file with this pipeline status?"

If yes, update the relevant project file:
- Update prospect entries in pipeline section
- Add any new context
- Update last contact dates
- Flag action items

### 7. Draft Follow-up Emails

If any follow-ups are urgent (Cooling or Cold):

"Want me to draft a follow-up email for [Prospect]?"

If yes:
- Draft appropriate follow-up based on last conversation
- Show draft for approval
- **ONLY send with explicit "send" confirmation**

**Follow-up Templates**:

**Re-engagement (Cold)**:
```
Subject: Checking in - [Topic]

Hi [Name],

Hope things are going well. Wanted to follow up on our conversation about [topic].

Are you still exploring [solution area]? Happy to pick up where we left off.

Best,
[Your name]
```

**Next Step Push**:
```
Subject: Re: [Previous Topic] - Next Steps?

Hi [Name],

Following up on [previous discussion].

Would [specific next step] work for you? I'm available [date options].

[Your name]
```

## Partner Coordination

If you have a business partner handling some prospects (noted in CLAUDE.md or project file):
- Note their involvement
- Don't draft emails without confirming coordination
- Flag for discussion: "[Partner] is on this one - sync with them first?"

## New Prospect Detection

If emails found from unknown companies showing interest:
- Flag as potential new lead
- Ask: "New prospect detected: [Company]. Add to pipeline?"
- If yes, add to project file
