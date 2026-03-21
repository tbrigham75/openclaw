---
name: Security Audit
description: Runs a deep security audit of the OpenClaw deployment, extracts a concise posture summary, and posts it to a configured Discord channel.
---

# Security Audit Skill

## What it does
1. Runs `openclaw security audit --deep` and captures the full output.
2. Parses the output to produce a **"OpenClaw Security Posture"** section containing:
   - Overall risk level (low/medium/high) with a one‑line justification.
   - Top 5 critical findings with remediation steps.
   - Changes since the previous day (new skills, config tweaks, new channels, nodes).
   - Status of prior remediation items.
3. Writes the summary to `$HOME/.openclaw/workspace/security_morning_brief.md`.
4. Sends the summary as an **announce** message to the Discord channel bound to the agent (via the agent’s routing bindings).

## How to use
Run the skill manually (for testing) or schedule it via a cron job:
```bash
openclaw skill run security-audit
```
The skill will automatically post the generated section to the Discord channel(s) bound to the agent that executes it.

---