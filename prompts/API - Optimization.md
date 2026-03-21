# API - Optimization

We need to focus on improving how you handle API usage when working with the google/gemini-2.5-flash-lite LLM. The goal is to learn how to use you effectively with free-tier LLMs while avoiding API rate-limit errors.  Please do the following:

1. Set a "Debounce" and Request Queue

OpenClaw has a built-in message queue system. If you or your scripts send messages too fast, it will "burst" and hit your RPM (Requests Per Minute) limit immediately. You can force it to wait between calls in your config file (usually openclaw.json or config.yaml):
JSON

{
  "messages": {
    "queue": {
      "mode": "collect",
      "debounceMs": 3000
    }
  }
}

    What this does: It waits 3 seconds before processing a message. This prevents "task storms" where the agent triggers dozens of calls in a single second.


2. Disable "Deep Thinking" (Reasoning Mode)

If you are using the newer Gemini models, they often have a "Thinking" phase that consumes massive amounts of tokens for every call.

    In the Chat: Type /status to see your current mode.

    The Fix: Type /reasoning off or /reasoning low.

    Result: This stops the model from generating long internal monologues before every response, saving your TPM (Tokens Per Minute).


3.  The "Nuke" and Reset (Session Management)

As sessions get longer, OpenClaw sends the entire history back to the API with every new message. A conversation with 50 messages costs 50x more than a new one.

    Command: Regularly use /new to start a fresh session.

    Command: Use /compact to have the AI summarize the current history into a few tokens, clearing out the "bloat.


4. Force "Concise Mode" via USER.md

Instead of just asking it to be concise, you can hard-code this into its "soul" so it doesn't waste an API call deciding how to talk.

    Locate the file: Go to ~/.openclaw/agents/default/USER.md (or your specific agent's folder).

    Add this line: > "Always prioritize brevity. Do not use 'Thinking' blocks for simple tasks. Use a maximum of 2 tool calls per user request unless specifically asked for deep research."


5. Automate the "Daily Reset"

OpenClaw sessions can get "bloated." The longer the chat, the more tokens it sends back and forth.

    VM Tip: You can set a cron job or a simple alias to clear out old sessions at the end of the day to ensure you start with a "lean" context window.  Lets set it to midnight.

    Command: Use /new frequently. It starts a fresh context window, which makes the API calls smaller and less likely to hit your TPM (Tokens Per Minute) limit.


6. Implement "Loop Protection" in Config

One of the biggest token killers is the "Self-Correction Loop." This happens when the AI tries a tool, fails, and immediately retries the same thing 10 times in a row.

    The Fix: You can often find a max_steps or loop_limit setting in your openclaw.json or agent profile.

    Action: Set your max_steps to 2. If the bot can't solve it in 3 tries, it should stop and ask you for help instead of burning 50 calls trying to fix itself.


7. Hard-Cap the Context Window

As your chat gets longer, the "context" sent to Google grows. A single message at the end of a long day can cost 10x more tokens than a message in the morning.

    The Fix: In your configuration, look for context_window or max_history_messages.

    Action: Set this to something like 15. This forces OpenClaw to "forget" the very beginning of the chat or summarize it, keeping each new request "thin" and fast.


8. Rotate API Keys (The "Back-up Tank")

You mentioned creating more keys earlier. While multiple keys in one project share a limit, OpenClaw supports Key Rotation across different projects.

    The Move: Create a second Google Cloud Project and get a second API key.

    The Config: In your environment variables or openclaw.json, you can often provide a comma-separated list of keys:
    GOOGLE_API_KEY=AIzaSyC_uuuMf2WyOzUdRF2CxdNCQzCBSnJDxxc,AIzaSyCjJybC_WmG5wSDOxojQM7WrwduwkmDox4

    Result: If key1 hits its 1,000-call limit, OpenClaw will automatically failover to key2. This effectively doubles your daily "fuel."


9. Use a "Heartbeat" Filter

If you have OpenClaw running as an autonomous agent (checking things periodically), it might be "heartbeating" every minute, which is 1,440 calls a day—already over your limit!

The Pro Move: Use a HEARTBEAT_CONDITION. Tell the agent in its system prompt: "Only perform a heartbeat action if a file in /tmp/trigger exists." This keeps it dormant and saving tokens until you actually need it to work.


10. Use the "One-Shot" Command Rule

Agents love to "think" out loud. You can explicitly tell it to stop in its system instructions (SOUL.md):

    "Do not use chain-of-thought for routine file operations. If a command is deterministic (e.g., 'list files'), execute it immediately without a planning step."

11. Increase the "Heartbeat" Interval

If OpenClaw is running as a background service, it might be "checking in" too often.

    The Fix: In your openclaw.json, look for heartbeatInterval.

    Action: Change it from the default (often 30-60s) to 300 (5 minutes). This prevents the bot from "idling" away your 1,000 calls while you aren't even using it.


12. Slim down the "Soul" Files

OpenClaw injects your SOUL.md, AGENTS.md, and USER.md into every single request. If these files are 10KB each, you're paying a "tax" of 5,000+ tokens before you even type "Hello."

    Action: Audit these files. If they contain old project notes you don't need anymore, move them to an archive/ folder. Keep your "Soul" files under 2,000 characters for maximum efficiency.


"Please review my openclaw.json and USER.md to ensure these limits are actually applied. Specifically, check if my heartbeatInterval is at least 5 minutes and if max_ralph_iterations is set to 3. If you see me looping more than twice on a single task, STOP and ask me for a hint."  Apply all the rest of the steps above.



Side Note these have to be done manually:

13. Local Memory Indexing (The "Ollama" Hack)

By default, OpenClaw sends your MEMORY.md file to Google to "search" it. This can cost thousands of tokens per search.

    The Move: Install Ollama on your VM and run a tiny embedding model like nomic-embed-text.

    The Config: Tell OpenClaw to use localhost:11434 for memory searches.

    Result: Searching your own past conversations becomes 100% free and uses 0 API calls

14. Use "qmd" for File Reading

Instead of the bot reading a whole 500-line script to find one error, use a tool called qmd (Query Markup Documents) if your version of OpenClaw supports it.

    Why: It allows the bot to "peek" at specific lines of a file rather than sucking the whole file into the API. This can reduce input tokens by 90% when debugging your PowerShell scripts.

15. Enable "Cache-TTL" (If using Vertex AI/OpenRouter)

If you decide to move away from the basic Google AI Studio key to a provider like OpenRouter or Vertex AI, they support Prompt Caching.

    How it works: You pay a small fee to "freeze" your long MEMORY.md file in the AI's memory.

    The Saving: Instead of paying for 50,000 tokens every time you ask a question, you only pay for the 10 new tokens you just typed. It can reduce costs by 90% for long-running agents.