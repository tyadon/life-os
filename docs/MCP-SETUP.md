# MCP Setup Guide

This guide walks through setting up the Google Workspace MCP server for LifeOS integrations.

## What is MCP?

MCP (Model Context Protocol) allows Claude Code to interact with external services. The Google Workspace MCP enables:

- **Gmail** - Search, read, send, draft emails
- **Google Calendar** - View and create events
- **Google Tasks** - Manage tasks (single source of truth for LifeOS)
- **Google Drive** - Search and read files
- **Google Docs** - Read and edit documents

## Quick Start (uvx)

The easiest way to run the MCP server:

```bash
uvx workspace-mcp --tools gmail calendar tasks drive docs --transport streamable-http
```

This uses the published PyPI package and handles dependencies automatically.

## Full Setup

### 1. Create Google Cloud Project

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project (e.g., "LifeOS MCP")
3. Note your project ID

### 2. Enable APIs

In your project, enable these APIs:

- Gmail API
- Google Calendar API
- Google Tasks API
- Google Drive API
- Google Docs API

Go to **APIs & Services > Library** and search for each.

### 3. Create OAuth Credentials

1. Go to **APIs & Services > Credentials**
2. Click **Create Credentials > OAuth client ID**
3. Select **Desktop app** as application type
4. Name it (e.g., "LifeOS Desktop")
5. Download the JSON file

### 4. Configure OAuth Consent Screen

1. Go to **APIs & Services > OAuth consent screen**
2. Choose **External** user type
3. Fill in required fields:
   - App name: "LifeOS"
   - User support email: your email
   - Developer contact: your email
4. Add scopes for Gmail, Calendar, Tasks, Drive, Docs
5. Add your email as a test user

### 5. Set Up Credentials Directory

```bash
# Create config directory
mkdir -p ~/.mcp/google-workspace

# Move your credentials file
mv ~/Downloads/client_secret_*.json ~/.mcp/google-workspace/credentials.json

# Create .env file
cat > ~/.mcp/google-workspace/.env << 'EOF'
GOOGLE_CREDENTIALS_PATH=~/.mcp/google-workspace/credentials.json
GOOGLE_TOKEN_PATH=~/.mcp/google-workspace/token.json
EOF
```

### 6. First-Time Authorization

Run the MCP server:

```bash
source ~/.mcp/google-workspace/.env
uvx workspace-mcp --tools gmail calendar tasks drive docs --transport streamable-http
```

A browser window will open for OAuth authorization. Sign in with your Google account and grant permissions.

### 7. Configure LifeOS Hook

The hook at `.claude/hooks/start-mcp.sh` automatically starts the MCP server. It supports two modes:

**Using uvx (recommended):**
```bash
# Set config directory (optional, defaults to ~/.mcp/google-workspace)
export MCP_CONFIG_DIR=~/.mcp/google-workspace
```

**Using local repository:**
```bash
# If you have the MCP repo cloned locally
export MCP_DIR=/path/to/google_workspace_mcp
```

## Multiple Google Accounts

To use multiple accounts:

1. Complete OAuth flow for first account
2. Rename token: `mv token.json token-account1.json`
3. Run authorization again for second account
4. Rename: `mv token.json token-account2.json`

The MCP server handles multiple accounts automatically based on the `user_google_email` parameter in each request.

## Troubleshooting

### "Access Denied" Error

- Ensure your email is added as a test user in OAuth consent screen
- Check that all required APIs are enabled
- Verify scopes match what the app requests

### Token Expired

Delete the token file and re-authorize:

```bash
rm ~/.mcp/google-workspace/token.json
# Run MCP server again to re-authorize
```

### Server Won't Start

Check the log file:

```bash
cat /tmp/mcp-server.log
```

Common issues:
- Port 8000 already in use: `lsof -i :8000` then kill the process
- Missing credentials file
- Invalid credentials format

### MCP Server Not Responding

Restart the server:

```bash
# Kill existing server
pkill -f "workspace-mcp"

# Start fresh
uvx workspace-mcp --tools gmail calendar tasks drive docs --transport streamable-http
```

## Security Notes

- **Never commit credentials** - The `.gitignore` excludes credential files
- **Use test users only** - Keep your app in testing mode unless you need broader access
- **Review permissions** - Only enable the APIs you actually need
- **Rotate credentials** if compromised

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `MCP_DIR` | Local MCP repo path | (uses uvx if not set) |
| `MCP_CONFIG_DIR` | Credentials directory | `~/.mcp/google-workspace` |
| `GOOGLE_CREDENTIALS_PATH` | OAuth credentials JSON | - |
| `GOOGLE_TOKEN_PATH` | OAuth token storage | - |

## Without MCP

LifeOS works without MCP - you just won't have:

- Email triage functionality
- Calendar integration in morning briefs
- Google Tasks as task source (use markdown tasks instead)

The core journaling, project management, and accountability features work locally.
