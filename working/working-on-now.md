#  working-on-now

Place to put chats I'm currently working on now so I can pick it up after vacation:

[3/26/2026 4:03 PM] Tom B: Fred verify you have did this:
 I want to setup communication between our agents:  Simon and Elise.  Please use this method:
Using Agent Teams or Sub‑agents (orchestrator pattern)

OpenClaw also supports “Agent Teams” and Sub‑agents as multi‑agent collaboration mechanisms.
A common pattern:

    A main/orchestrator agent receives the user request.

    Orchestrator:

        delegates coding to coder (Sub‑agent).

        when code is done, calls qa_auditor (another Sub‑agent or peer in the team).

    All agents live under the same trust boundary, but the orchestrator controls who talks to whom.

This keeps the “coder ↔️ QA” interaction clean because you don’t wire them directly; instead you route through the orchestrator:

text
User → Orchestrator:
  "Implement feature X"

Orchestrator → coder:
  "Write implementation for X"

coder → Orchestrator:
  "Done; code at PR‑42"

Orchestrator → qa_auditor:
  "Audit PR‑42"

qa_auditor → Orchestrator:
  "Passed/Failed with issues"

This is usually easier to debug and meter than arbitrary cross‑agent chatter.
[3/26/2026 4:05 PM] Fred: 🧹 Compacting context...
[3/26/2026 4:06 PM] Fred: 🧹 Compacting context...
[3/26/2026 4:06 PM] Fred: ───

Missing Context

I need clarification to complete this request:

1. What are Simon and Elise supposed to do? The message describes the communication pattern but doesn't specify:
  • What tasks should Simon handle?
  • What tasks should Elise handle?
  • What's the actual work they should collaborate on?
2. What's the orchestrator's name? Should I create a new orchestrator, or use an existing one?
3. What's the task? Is this just a verification request, or is there an actual feature/task Simon and Elise should work on?

───

To proceed, please provide:

• The names of the orchestrator agent (if new)
• A description of Simon's and Elise's roles/tasks
• The actual work/task they should collaborate on

Once you provide this, I'll:

1. Create the orchestrator sub-agent
2. Configure Simon and Elise as sub-agents
3. Set up the communication routing per your pattern