#!/bin/bash

# ==============================================================================
# Gemini Session Launcher
# ==============================================================================
#
# PURPOSE:
# This script automates the process of initializing a Gemini-CLI session with
# the necessary project context, including rules and outstanding insights.
#
# It prepares a "Day 0" prompt, copies it to the clipboard, and then
# launches the Gemini-CLI.
#
# PREREQUISITES:
# This script requires a clipboard utility to be installed. 'xclip' is used
# here. If not installed, you can install it via:
#   sudo apt-get update && sudo apt-get install xclip
#
# USAGE:
# Instead of running the npx command directly, execute this script:
#   ./start-gemini-session.sh
#
# The script will copy the context to your clipboard and then start the CLI.
# Simply paste the clipboard content (Ctrl+Shift+V or right-click) into the
# Gemini prompt and press Enter.
#
# ==============================================================================

# --- Configuration ---
export TZ='America/Denver'
RULES_FILE="GEMINI_RULES.md"
INSIGHTS_FILE="gemini-time-series-key-most-valuable-insights.csv"
WORKSPACE_DIR=$(dirname "$0")

# --- Check for xclip ---
if ! command -v xclip &> /dev/null
then
    echo "Error: 'xclip' is not installed. Please install it to use this script."
    echo "You can typically install it with: sudo apt-get install xclip"
    exit 1
fi

# --- Prepare the Context Prompt ---
CONTEXT_PROMPT=$(cat <<EOF
Hello Gemini. This is the start of a new session on the yaberechiah system.

Please initialize your context with the following Rules of Engagement and outstanding insights.

==============================================================================
# GEMINI RULES OF ENGAGEMENT
==============================================================================
$(cat "${WORKSPACE_DIR}/${RULES_FILE}")

==============================================================================
# OUTSTANDING INSIGHTS & WORKFLOW QUEUE
==============================================================================
$(cat "${WORKSPACE_DIR}/${INSIGHTS_FILE}")

==============================================================================
# END OF INITIALIZATION DATA
==============================================================================

Please confirm that you have received and understood these instructions.
EOF
)

# --- Copy to Clipboard and Launch ---
echo "$CONTEXT_PROMPT" | xclip -selection clipboard

echo "=============================================================================="
echo " Session context has been copied to your clipboard."
echo " Launching Gemini-CLI..."
echo " 👉 ACTION REQUIRED: Paste the clipboard contents into the prompt to begin."
echo "=============================================================================="
echo ""

# --- Launch the Gemini CLI ---
exec npx @google/gemini-cli
