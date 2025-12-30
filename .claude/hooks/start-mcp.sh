#!/bin/bash

# Start Google Workspace MCP server if not already running
#
# Configuration (via environment variables):
#   MCP_DIR        - Local MCP repo directory (optional - uses uvx if not set)
#   MCP_CONFIG_DIR - Directory containing .env with OAuth credentials
#                    Default: ~/.mcp/google-workspace
#
# If MCP_DIR is set and exists, runs from local repo with `uv run`
# Otherwise, runs with `uvx workspace-mcp` (PyPI package)

MCP_CONFIG_DIR="${MCP_CONFIG_DIR:-$HOME/.mcp/google-workspace}"

if lsof -i :8000 &> /dev/null; then
    echo "MCP server already running on port 8000"
else
    echo "Starting Google Workspace MCP server..."

    # Load credentials if config directory exists
    if [[ -f "$MCP_CONFIG_DIR/.env" ]]; then
        source "$MCP_CONFIG_DIR/.env"
    fi

    # Choose how to run MCP server
    if [[ -n "$MCP_DIR" && -d "$MCP_DIR" ]]; then
        # Run from local repository
        echo "Using local MCP repo: $MCP_DIR"
        cd "$MCP_DIR"
        if [[ -f ".env" ]]; then
            source .env
        fi
        nohup uv run python main.py --tools gmail drive calendar docs tasks --transport streamable-http > /tmp/mcp-server.log 2>&1 &
    else
        # Run from PyPI via uvx
        echo "Using uvx workspace-mcp from PyPI"
        nohup uvx workspace-mcp --tools gmail drive calendar docs tasks --transport streamable-http > /tmp/mcp-server.log 2>&1 &
    fi

    # Wait for server to be ready
    for i in {1..10}; do
        if lsof -i :8000 &> /dev/null; then
            echo "MCP server started on port 8000"
            exit 0
        fi
        sleep 0.5
    done

    echo "Warning: MCP server may not have started properly"
    echo "Check /tmp/mcp-server.log for details"
fi

exit 0
