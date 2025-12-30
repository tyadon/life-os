# LifeOS

A personal operating system powered by Claude Code. Track goals, manage projects, build habits, and maintain accountability with an AI chief of staff.

## What is LifeOS?

LifeOS is a structured system for managing your life using Claude Code as your AI assistant. It combines:

- **Living documents** - Projects, goals, and decisions that evolve with you
- **Daily rituals** - Morning briefs and evening check-ins for accountability
- **Habit tracking** - Scorecards and pattern analysis
- **Task management** - Integration with Google Tasks
- **Decision documentation** - Structured frameworks for important choices
- **Email/Calendar integration** - Via Google Workspace MCP

## Features

### Slash Commands

| Command | Description |
|---------|-------------|
| `/morning-brief` | Start your day with planning and prioritization |
| `/evening-checkin` | End-of-day reflection, journaling, and habit scoring |
| `/tasks` | View all active tasks across projects |
| `/add-task` | Add a new task to Google Tasks |
| `/brain-dump` | Capture unstructured thoughts for processing |
| `/decide` | Work through a decision with structured framework |
| `/weekly-review` | Sunday planning ritual |
| `/monthly-review` | First-of-month deep analysis |

### AI Agents

- **Chief of Staff** - Strategic oversight, prioritization, accountability
- **Accountability Coach** - No-bullshit partner who holds you to commitments
- **Decision Helper** - Guides structured decision-making
- **Pattern Analyst** - Finds trends in your habits and productivity
- **Email Processor** - Extracts tasks from emails
- **Task Extractor** - Pulls actionable items from unstructured content

### Integrations

- **Google Tasks** - Single source of truth for all tasks
- **Google Calendar** - Schedule awareness and conflict detection
- **Gmail** - Email triage and processing
- **Google Drive/Docs** - Document storage and retrieval

## Quick Start

### 1. Fork this repository

```bash
gh repo fork [username]/life-os --clone
cd life-os
```

### 2. Configure CLAUDE.md

Copy the template and customize it:

```bash
cp CLAUDE.md.template CLAUDE.md
```

Edit `CLAUDE.md` to add:
- Your name and context
- Your goals and priorities
- Your Google account(s)
- Key people in your life
- Project → task list mapping

### 3. Set up MCP (optional but recommended)

The Google Workspace MCP enables email, calendar, and task integrations.

See [docs/MCP-SETUP.md](docs/MCP-SETUP.md) for detailed instructions.

Quick version:
```bash
# Install via uvx (recommended)
uvx workspace-mcp --help

# Or see docs for full OAuth setup
```

### 4. Start using it

```bash
claude

# In Claude Code:
/morning-brief
```

## Directory Structure

```
life-os/
├── .claude/
│   ├── agents/          # AI agent definitions
│   ├── commands/        # Slash command definitions
│   └── hooks/           # Automation hooks (MCP startup)
├── projects/
│   ├── work/            # Work projects
│   └── personal/        # Personal projects
├── journal/
│   └── daily/           # Daily journal entries
├── metrics/
│   ├── habits/          # Weekly habit scorecards
│   └── health/          # Health tracking
├── decisions/           # Decision documents
├── travel/
│   ├── upcoming/        # Trip planning
│   └── packing-lists/   # Reusable packing templates
├── reference/
│   ├── people/          # Key people context
│   ├── goals/           # Annual/quarterly goals
│   ├── routines/        # Morning/evening routines
│   └── frameworks/      # Decision frameworks
├── interests/           # Hobbies and interests
├── reviews/             # Weekly/monthly/quarterly reviews
├── inbox/               # Capture folders
│   ├── brain-dumps/
│   ├── meetings/
│   └── quick-capture/
└── archive/             # Completed/old items
```

## Customization

See [docs/CUSTOMIZATION.md](docs/CUSTOMIZATION.md) for detailed guidance on:

- Personalizing CLAUDE.md
- Adding your own commands
- Creating custom agents
- Modifying routines and habits
- Setting up project templates

## Philosophy

### Living Documents

Every file in LifeOS is a living document. When you process brain dumps, meetings, or daily check-ins, information flows into the relevant project files. This keeps context current and accessible.

### Aggressive Accountability

The AI agents are designed to be direct and hold you accountable. They'll call out missed commitments, identify patterns of avoidance, and push you toward your stated goals. This is by design.

### Single Source of Truth

- **Tasks** live in Google Tasks (not scattered in markdown files)
- **CLAUDE.md** is the master context file
- **Project files** are living documents, not static plans

### Safety by Default

The `.gitignore` is configured to ignore personal content by default. Only templates and system files are tracked, so you can safely push to a public repo without exposing personal data.

## Pulling Updates

If you forked this repo, you can pull improvements:

```bash
git remote add upstream https://github.com/[original]/life-os.git
git fetch upstream
git merge upstream/main
```

Conflicts will typically be in `CLAUDE.md` (your personal config) which is gitignored anyway.

## Requirements

- [Claude Code](https://claude.ai/claude-code) CLI
- Git
- (Optional) Google Cloud project with OAuth credentials for MCP

## License

MIT - See [LICENSE](LICENSE)

## Contributing

Contributions welcome! Please open an issue first to discuss changes.

---

*"The system is the goal. Trust the process."*
