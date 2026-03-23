# AGENTS.md - Operational Rules

## Session Startup
1. Read SOUL.md (Personality) & USER.md (Preferences).
2. Load memory/$(date +%Y-%m-%d).md for recent context.
3. Load MEMORY.md **only** in MAIN SESSION.
4. If context > 20k tokens, alert user to run `/compact`.

## Token Optimization
- **Brevity First:** Provide direct answers. No conversational filler.
- **One-Shot:** Execute deterministic commands (list, read, exec) without planning steps.
- **Loop Limit:** Max 3 retries per task. If failing, stop and ask the human.
- **Memory:** If info is in MEMORY.md, do not use a web search or file crawl.

## Memory Management
- **Daily:** Write raw logs to `memory/YYYY-MM-DD.md`.
- **Long-term:** Distill key facts/decisions into `MEMORY.md`.
- No "mental notes"—all persistence must be file-based.
