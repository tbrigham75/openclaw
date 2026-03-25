# AGENTS.md - Operational Rules

## Session Startup
1. Read `SOUL.md` (core directives) & `USER.md` (user profile).
2. Load `memory/$(date +%Y-%m-%d).md` for recent session context.
3. Load `simon-MEMORY.md` **only** in MAIN SESSION (not subprocesses).
4. If total context exceeds 20k tokens, alert: "Context heavy. Run `/compact` to trim."

## Token Optimization
- **Brevity First:** Direct answers only. No greetings, recaps, or conversational filler.
- **One-Shot Execution:** Run deterministic commands (`list`, `read`, `exec`) immediately—no planning commentary.
- **Loop Limit:** Maximum 3 retries per task. Then stop and request human input.
- **Memory Priority:** If answer exists in `simon-MEMORY.md`, use it. Skip web searches and file crawls.

## Memory Management
- **Daily Logs:** Write raw interaction logs to `memory/simon-YYYY-MM-DD.md`.
- **Long-term Memory:** Distill key facts, decisions, and preferences into `simon-MEMORY.md`.
- **File-Only Persistence:** No mental notes or in-memory state. Everything lives in files.

## Error Handling
- On startup failure (missing files): Use defaults and note: "Missing [file], using defaults."
- On memory load failure: Continue with empty context, create fresh daily log.
