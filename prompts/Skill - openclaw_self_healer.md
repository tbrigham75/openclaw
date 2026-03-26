# Skill - gateway_health_monitor.md

Prompt for OpenClaw Agent:

Design and write a complete OpenClaw skill (a SKILL.md file with YAML frontmatter and markdown instructions) named openclaw_self_healer that ensures the OpenClaw gateway stays healthy and responsive at all times.

The skill you generate should:

    Describe, in its instructions, a clear playbook for monitoring gateway health and taking corrective actions using the OpenClaw CLI.

    Include procedures for detecting when the agent becomes unresponsive, fails to answer messages, or when the gateway appears locked up.

    When unresponsiveness is detected, instruct the agent to run:

    openclaw gateway restart

    As proactive maintenance, instruct the agent to periodically run:

    openclaw doctor --fix (for example every 12 hours, or when repeated issues are detected).

    Consider using other relevant diagnostic commands if helpful, such as openclaw status --all --deep, openclaw health --json --verbose, or additional doctor modes if they improve reliability.

In the skill, define a maintenance strategy that includes:

    Regular health checks for the gateway and model backends.

    Checks for high CPU, memory pressure, or disk issues when possible via available tools.

    A strategy for when to restart the gateway versus when to run doctor, and how often to do both under normal conditions.

    Guidance to keep a simple log (for example, appending to a text file) of each health check and any corrective actions taken.  The log should be stored here in this format:  ~/.openclaw/logs/openclaw_self_healer.YYYYMMDD-HHMMSS.log

    Escalation behavior if multiple restarts or fixes are needed in a short time window (for example, increasing diagnostic depth or frequency of checks).

    The skill’s instructions should prioritize maintaining responsiveness to user prompts even after restarts. Assume this skill will be enabled in openclaw.json and used as part of the system prompt for the agent.

    Your output should be only the contents of a complete SKILL.md file, including:

    Valid YAML frontmatter with a name (use gateway_health_monitor), description, and useful metadata.openclaw.requires.bins (for example, openclaw, bash).

Clear, step-by-step markdown instructions that teach the agent exactly how and when to:

    Run health checks.

    Decide that the gateway is unhealthy.

    Run openclaw gateway restart.

    Run openclaw doctor --fix and any other diagnostic commands you recommend.

    Handle repeated failures and escalate its diagnostics.