#!/bin/bash

# LifeOS Setup Script
# Run this after cloning the repository

set -e

echo "🚀 LifeOS Setup"
echo "==============="
echo ""

# Check for Claude Code
if ! command -v claude &> /dev/null; then
    echo "⚠️  Claude Code CLI not found."
    echo "   Install it from: https://claude.ai/claude-code"
    echo ""
fi

# Create CLAUDE.md from template if it doesn't exist
if [[ ! -f "CLAUDE.md" ]]; then
    echo "📝 Creating CLAUDE.md from template..."
    cp CLAUDE.md.template CLAUDE.md
    echo "   ✓ Created CLAUDE.md"
    echo "   → Edit this file to personalize your LifeOS"
    echo ""
else
    echo "✓ CLAUDE.md already exists"
fi

# Create reference files if they don't exist
echo "📁 Setting up reference files..."

if [[ ! -f "reference/habits.md" ]]; then
    cat > reference/habits.md << 'EOF'
# Daily Habits

## Target: 90% consistency

| # | Habit | Description |
|---|-------|-------------|
| 1 | Wake on time | Feet on floor by target time |
| 2 | Exercise | Any intentional movement |
| 3 | Protein breakfast | High protein first meal |
| 4 | No phone first hour | Device-free morning |
| 5 | Deep work | 60+ min focused work |
| 6 | Read | 30+ min reading |
| 7 | Journal | Morning or evening reflection |
| 8 | Evening routine | Wind-down ritual |
| 9 | Bed on time | Lights out by target |
| 10 | Track habits | Complete daily scorecard |

---

*Customize these habits in your CLAUDE.md and this file.*
EOF
    echo "   ✓ Created reference/habits.md"
fi

if [[ ! -f "reference/accounts.md" ]]; then
    cat > reference/accounts.md << 'EOF'
# Accounts Reference

## Google Accounts

| Account | Purpose | Priority |
|---------|---------|----------|
| your.email@gmail.com | Personal | High |

## Task List Mapping

| Project | Account | Task List |
|---------|---------|-----------|
| Personal | your.email@gmail.com | Personal Tasks |

---

*Update with your actual accounts after MCP setup.*
EOF
    echo "   ✓ Created reference/accounts.md"
fi

# Set up MCP config directory
echo ""
echo "🔧 MCP Configuration..."

MCP_DIR="${HOME}/.mcp/google-workspace"
if [[ ! -d "$MCP_DIR" ]]; then
    mkdir -p "$MCP_DIR"
    echo "   ✓ Created $MCP_DIR"
    echo "   → Place your Google OAuth credentials.json here"
else
    echo "   ✓ MCP config directory exists"
fi

# Make hook executable
if [[ -f ".claude/hooks/start-mcp.sh" ]]; then
    chmod +x .claude/hooks/start-mcp.sh
    echo "   ✓ Made MCP hook executable"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Edit CLAUDE.md with your personal info"
echo "  2. (Optional) Set up Google Workspace MCP - see docs/MCP-SETUP.md"
echo "  3. Run 'claude' and try '/morning-brief'"
echo ""
echo "For help: see README.md and docs/"
echo ""
