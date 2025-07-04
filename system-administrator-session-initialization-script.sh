#!/bin/bash

# ==============================================================================
# System Administrator Session Initialization Script
# ==============================================================================
#
# PURPOSE:
# This script is designed to be run by the Systems Administrator at the
# beginning of each new Gemini-CLI session. Its function is to load the
# established "Rules of Engagement" into the session to ensure the Gemini
# model operates with a consistent and correct set of protocols.
#
# USAGE:
# 1. Launch the Gemini-CLI in a terminal.
# 2. In a separate terminal, execute this script:
#    ./system-administrator-session-initialization-script.sh
# 3. Copy the entire output of this script.
# 4. Paste the copied text into the Gemini-CLI prompt and send it.
#
# This action will effectively "teach" the new Gemini session the rules
# it must follow.
#
# ==============================================================================

echo "=============================================================================="
echo " Gemini Rules of Engagement - Copy the text below this line"
echo "=============================================================================="
echo ""

# Display the rules file to be copied by the administrator
cat "$(dirname "$0")/GEMINI_RULES.md"
