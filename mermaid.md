# Gemini Workspace Diagrams

This file contains Mermaid diagrams to visualize the workflow and architecture of our collaborative environment on the Yaberechiah system.

## Session Initialization Flowchart

This diagram illustrates the step-by-step process for starting a new, context-aware Gemini session using the `start-gemini-session.sh` launcher.

```mermaid
flowchart TD
    A[Start: Systems Administrator] --> B{Execute ./start-gemini-session.sh};
    B --> C[Script reads GEMINI_RULES.md];
    B --> D[Script reads insights CSV];
    C & D --> E[Script formats a 'Day 0' prompt];
    E --> F[Prompt is copied to system clipboard];
    F --> G[Script launches Gemini-CLI];
    G --> H{Action: Paste clipboard into CLI};
    H --> I[Gemini is initialized with full context];
    I --> J[End: Ready for collaboration];
```

## System Components Diagram

This diagram shows the key files in our workspace and how they relate to each other and to the core Gemini-CLI tool.

```mermaid
graph TD
    subgraph "Gemini-CLI Environment"
        A(Gemini-CLI)
    end

    subgraph "Workspace: ~/AIUX/Google/Gemini-CLI/"
        B(start-gemini-session.sh)
        C(GEMINI_RULES.md)
        D(Google Gemini contributions.md)
        E(gemini-time-series-key-most-valuable-insights.csv)
        F(system-administrator-session-initialization-script.sh)
    end

    subgraph "Actors"
        G[Systems Administrator]
    end

    G -- executes --> B;
    B -- reads --> C;
    B -- reads --> E;
    B -- launches --> A;
    G -- pastes context into --> A;
    A -- modifies --> D;
    A -- modifies --> C;
    A -- modifies --> E;
    G -- can execute (fallback) --> F;
    F -- reads --> C;

    style B fill:#cde4f9,stroke:#333,stroke-width:2px
    style C fill:#f9f2cd,stroke:#333,stroke-width:1px
    style D fill:#f9f2cd,stroke:#333,stroke-width:1px
    style E fill:#f9f2cd,stroke:#333,stroke-width:1px
    style F fill:#f9dcd,stroke:#333,stroke-width:1px
```
