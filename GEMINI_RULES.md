# Rules of Engagement for Gemini on the Yaberechiah System

This document outlines the operational protocols for Gemini models when interacting with the Yaberechiah system, as established by the Systems Administrator, Joshua Greenfield.

## Rule: Collaboration Logging
- **Urgency:** High - This is a core requirement for all interactions.
- **Importance:** High - It maintains a record of our TAO agreement and ensures proper attribution.
- **Notes:** All interactions must be logged in the `Google Gemini contributions.md` file. The log will follow a specific format, including date and time stamps, and attribution headers for both the Systems Administrator and the Gemini model.

## Rule: Timestamping Convention
- **Urgency:** High - This is a required part of the logging format.
- **Importance:** Medium - It provides structure and context to the collaboration log.
- **Notes:** Use `####` for a new day's date stamp and `#####` for a half-hour time stamp. These should precede the `###` attribution headers.

## Rule: File Retention and Oversight
- **Urgency:** High - This is a critical security and operational requirement.
- **Importance:** High - It allows for necessary human oversight of the AI's actions on the bare-metal system.
- **Notes:** Do not delete files or artifacts created during a session unless explicitly instructed to do so. The Systems Administrator requires these for review.

## Rule: Git Configuration
- **Urgency:** Medium - This is a clarification of operational procedure.
- **Importance:** High - It ensures proper attribution and security for all version control actions.
- **Notes:** Utilize the system's existing Git configuration. Do not create or use a separate Git identity. All actions should be performed on behalf of the user.

## Rule: Durable Rule Maintenance
- **Urgency:** High - This is a meta-rule for maintaining operational consistency.
- **Importance:** High - It ensures that the rules of engagement are persistent and evolve as needed.
- **Notes:** I am authorized to append and modify this `GEMINI_RULES.md` file to reflect new, durable rules of engagement. This ensures consistency across sessions. All modifications are subject to review by the Systems Administrator.

## Rule: Designated Workspace
- **Urgency:** High - This defines the location for all collaborative work.
- **Importance:** High - It ensures a consistent and predictable environment for project collaboration.
- **Notes:** All delegated work, whether cloned from a repository or copied locally, will be located in the `~/AIUX/Google/Gemini-CLI/` directory. This is our official workspace.

## Rule: Insight Logging for Human Review
- **Urgency:** Medium - This is a workflow and communication tool.
- **Importance:** High - It provides a mechanism for me to flag complex issues, suggest discussions, and request human intervention, improving our collaborative efficiency.
- **Notes:** I will use `gemini-time-series-key-most-valuable-insights.csv` to log insights. The file will have two columns: `timestamp` and `insight`. This serves as a workflow queue and a way to flag items for the Systems Administrator's review.

## Rule: Session Initialization (Primary Method)
- **Urgency:** High - This is the primary mechanism for ensuring rule consistency.
- **Importance:** High - It guarantees that I am aware of and operating by the established protocols at the start of every session.
- **Notes:** To start a new session, the Systems Administrator will execute the `start-gemini-session.sh` script. This launcher prepares the context and copies it to the clipboard. The administrator then pastes this context into the newly launched CLI.

## Rule: Session Initialization (Manual Fallback)
- **Urgency:** Medium - This is a fallback method.
- **Importance:** Medium - To be used only if the primary launcher script fails.
- **Notes:** The `system-administrator-session-initialization-script.sh` can be used to manually display the rules for copying and pasting. This is now considered a legacy method.

## Rule: Architectural Diagramming
- **Urgency:** Low - This is a documentation and presentation requirement.
- **Importance:** Medium - It enhances the clarity and professional appearance of our shared work, especially for public repositories.
- **Notes:** As the architecture of our workspace evolves, the `mermaid.md` file must be updated with new diagrams to reflect the changes. This ensures our documentation is always current.

## Rule: Supervisor Script
- **Urgency:** Medium - This is a utility for ensuring long-running processes persist.
- **Importance:** High - It provides a mechanism for ensuring that long-polling tasks, such as the Gemini-thought-experiment.md, are not interrupted by network failures.
- **Notes:** The `supervisor.sh` script will monitor a given command and restart it if it fails or if the network connection is lost. This is critical for maintaining the persistence of long-running tasks.