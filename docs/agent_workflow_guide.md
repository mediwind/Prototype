# Agent Workflow Guide: "Start-End Routine"

This guide defines the standard workflow for maintaining project continuity across different AI sessions.

## 1. Start of Session (Open)
When starting a new chat session, always instruct the Agent to read the project context first.

> **Command:** "Read `docs/task.md` to understand the current progress, and then let's start [Phase X: ...]."

*   **Why:** This gives the Agent immediate context without you needing to explain the entire history. The file serves as the project's memory.

## 2. End of Session (Close)
Before closing the chat or checking out, ensure the Agent persists its memory to the project files.

> **Command:** "Update `docs/task.md` with today's progress and summarize new features in `docs/walkthrough.md`. Then save the files."

*   **Why:** Agents cannot see previous session chats. Writing to these files is the only way to "save the game" of development progress for the next Agent.

## 3. Maintenance
*   **Archiving:** If `task.md` gets too long (e.g., >100 lines of completed tasks), command: *"Move completed phases to `docs/task_archive.md`"*.
*   **Rules:** If core architectural rules change, update `godot-rpg-game-dev-rules.md`.
