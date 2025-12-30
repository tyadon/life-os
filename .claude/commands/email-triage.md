---
description: Process email inbox and extract action items
argument-hint: [account: account-name|all]
allowed-tools: Read, Write, Edit, Glob, Grep, mcp__google-workspace__search_gmail_messages, mcp__google-workspace__get_gmail_message_content, mcp__google-workspace__get_gmail_messages_content_batch, mcp__google-workspace__draft_gmail_message, mcp__google-workspace__send_gmail_message, mcp__google-workspace__modify_gmail_message_labels
---

# Email Triage

Interactive email processing session. Goal: process inbox, extract tasks, draft responses.

**IMPORTANT**: Read `CLAUDE.md` first to get connected accounts and their priorities.

## Authorization Policy

**Read operations** (no approval needed):
- Search emails
- Read email content

**Write operations** (REQUIRE explicit approval):
- Sending emails → Show draft, get "send" confirmation
- Archiving emails → Confirm before removing from inbox
- Creating drafts → OK to create, but confirm before sending

## Process

### 1. Determine Scope

Parse $ARGUMENTS to determine which account(s) to process.
- If a specific account name is given, use that account from CLAUDE.md
- If `all` or empty, process all accounts in priority order from CLAUDE.md

### 2. Pull Unread Emails

For each account in scope:
```
mcp__google-workspace__search_gmail_messages
  user_google_email: [account]
  query: "is:unread"
  page_size: 20
```

Get content for each:
```
mcp__google-workspace__get_gmail_messages_content_batch
  user_google_email: [account]
  message_ids: [list from search]
  format: "full"
```

### 3. Sort by Priority

Order for processing based on account priority in CLAUDE.md:
1. Highest priority account first
2. Within each account, sort by:
   - Known important contacts (from `/reference/people/`)
   - Then time-sensitive emails
   - Then others

### 4. Interactive Processing

Present each email:

```
## Email [X] of [Y] | [Account]

**From**: [sender name] <[email]>
**Subject**: [subject]
**Date**: [when received]

**Preview**:
[First 3-4 sentences of email body]

---

**Options**:
1. **Task** → Create task: "[suggested task text]"
2. **Reply** → I'll draft a response
3. **Archive** → Remove from inbox (no action needed)
4. **Skip** → Deal with later

What's the call?
```

### 5. Execute Actions

**Task** (option 1):
- Ask which project this relates to
- Add task to Google Tasks via `/add-task`
- Confirm: "Task added to [project]"

**Reply** (option 2):
- Determine account to send from
- Draft response based on email context
- Show draft: "Here's the draft:"
  ```
  To: [recipient]
  Subject: Re: [subject]

  [Draft body]
  ```
- Ask: "Send, modify, or skip?"
- **ONLY send with explicit "send" confirmation**
- Use `mcp__google-workspace__send_gmail_message` if approved

**Archive** (option 3):
- Confirm: "Archive this email? (y/n)"
- If yes: Use `mcp__google-workspace__modify_gmail_message_labels`
  - remove_label_ids: ["INBOX"]
- Confirm: "Archived."

**Skip** (option 4):
- Move to next email
- "Skipped. Will remain in inbox."

### 6. Quick Mode

If user says "quick" or seems rushed:
- Show condensed view:
  ```
  ## Quick Triage | [X] emails

  1. [Subject] from [sender] — [1-line summary]
     → Suggested: [Task/Reply/Archive/Skip]

  2. [Subject] from [sender] — [1-line summary]
     → Suggested: [Task/Reply/Archive/Skip]
  ```
- Ask: "Accept suggestions? Or go through individually?"
- If accept: Batch process with confirmations for any sends

### 7. Summary

After processing all emails:

```
## EMAIL TRIAGE COMPLETE

**Processed**: [X] emails across [Y] accounts
**Time**: [duration if known]

### Actions Taken

**Tasks Created** ([count]):
- [ ] [Task] → [project]
- [ ] [Task] → [project]

**Emails Sent** ([count]):
- Re: [Subject] → [recipient]

**Archived** ([count]):
- [count] emails removed from inbox

**Skipped** ([count]):
- [count] emails for later

### Inbox Status

| Account | Before | After |
|---------|--------|-------|
| [Account 1] | X | Y |
| [Account 2] | X | Y |

### Flagged for Follow-up
- [Any emails that need attention but were skipped]
```

## Travel Confirmation Handling

If email contains flight/hotel/booking confirmation:
- Offer to extract details to `/travel/upcoming/`
- "This looks like a travel confirmation. Add to trip file?"
- If yes: Update relevant trip file with confirmation details

## Sales/Prospect Email Handling

If email relates to sales or business development:
- Flag for pipeline review
- Note prospect status
- Offer to update relevant project file
