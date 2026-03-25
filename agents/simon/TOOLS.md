# TOOLS - Environment Specifics

## Infrastructure
- **Host:** Dell Optiplex 9020 (Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz, 8x 3900 MHz / 32GB DDR3 RAM @ 791MHz)
- **User:** tom
- **Workspace Root:** `~/.openclaw/workspace/simon`
- **OS:** Linux - Ubuntu 24.04.4 LTS
- **Local AI Engine:** Ollama (`http://localhost:11434`)
- **Primary Local Model:** `ollama/qwen-opus-16k:latest`

## Environment Notes
- **Token Shield:** 
  - Use the local Ollama model for:
    - File indexing, search, and memory retrieval
    - Code comprehension, refactoring, and small-to-medium implementations
    - Drafting initial solutions and summaries
  - This conserves Google Gemini API quota and keeps most work on-box.

## Cloud Models
- **Provider:** Google
- **Primary Cloud Model:** `google/gemini-flash-lite-latest`
  - Use for:
    - Larger or more complex reasoning tasks that exceed local model quality
    - Heavy multi-file refactors where higher-level guidance is useful
    - Occasional “second opinion” on architecture or design when requested
  - Behavior:
    - Treat as **expensive and limited** compared to local models.
    - Call only when:
      - The user explicitly asks for “Gemini” / “cloud” / “best brain,” **or**
      - You have tried local reasoning and it is clearly insufficient.
    - Before calling:
      - Summarize the task and context instead of sending raw full files.
      - Include only the most relevant snippets or diffs.
      - Batch related questions into a single, well-structured prompt.

## Tool Usage Policy
- **Local-First Rule:**
  - Prefer local filesystem tools, search, and shell commands.
  - Prefer the local Ollama model over cloud models by default.
- **Cloud Discipline:**
  - Minimize the number of cloud calls.
  - Optimize prompts for clarity and brevity.
  - Avoid back-and-forth “chatty” usage; favor single well-packed calls.

## Filesystem & Shell
- **Workspace Scope:**
  - Treat `~/.openclaw/workspace/simon` as the primary project root.
  - Ask before accessing paths outside this workspace.
- **Destructive Operations:**
  - Require explicit confirmation before deleting, overwriting, or running system-level changes.
  - When in doubt, propose commands instead of executing them directly.

## Privacy & Safety
- Never send secrets, credentials, SSH keys, or sensitive configs to cloud models.
- Redact or anonymize content wherever possible when using `google/gemini-flash-lite-latest`.
- Respect the user’s privacy and cost constraints at all times.

## Error & Retry
- On any tool or command failure:
  - Retry with minor adjustments up to 3 times.
  - If still failing, stop and clearly report what was attempted and what failed.
- Always return a concrete status update so the user knows what happened.
