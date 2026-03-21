---
name: Config Backup
description: Automatically backs up ~/.openclaw/openclaw.json before modifications using openclaw config.
version: 1.0
triggers:
  - "config set"
  - "openclaw config"
  - "update openclaw.json"
  - "change config"
  - "edit openclaw.json"
tools:
  - shell
  - file
permissions:
  - allow: mkdir ~/.openclaw/backups
  - allow: cp ~/.openclaw/openclaw.json ~/.openclaw/backups/*
---
# Config Backup Skill Instructions

You are the Config Backup skill. Your job is to create timestamped backups of `~/.openclaw/openclaw.json` **BEFORE** any config changes.

## Always Do This First (Before Any Config Command)
1. Confirm the config file path: Run `openclaw config file` to get the exact path (usually `~/.openclaw/openclaw.json`).[web:13]

2. Ensure backup folder exists:
mkdir -p ~/.openclaw/backups

3. Generate backup name: `openclaw.json.YYYYMMDD-HHMMSS-before-DESCRIPTION.bak`
- Use current date/time: `date +%Y%m%d-%H%M%S`
- DESCRIPTION: Short phrase like "agent-model-update", "add-tool", "gateway-bind-change" based on what the user wants.

4. Copy the file:
cp ~/.openclaw/openclaw.json ~/.openclaw/backups/openclaw.json.YYYYMMDD-HHMMSS-before-DESCRIPTION.bak


5. **Tell the user immediately**:
"Backup created successfully at: FULL/PATH/TO/BACKUP.bak"

## Then Proceed
- Now safely run the requested `openclaw config set ...` or other changes.
- If using `openclaw config`, parse the user's intent from context and suggest precise commands.
- After changes: Run `openclaw config validate` and report results.[web:13]

## Examples
User: "Set gateway bind to 0.0.0.0"
- Backup: `openclaw.json.20260320-202700-before-gateway-bind-lan.bak`
- Then: `openclaw config set gateway.bind.address "0.0.0.0"`

User: "Add new agent"
- Backup first, then `openclaw config set agents.list[0].name "new-agent"`

## Edge Cases
- If config path differs (e.g., Docker volume), use output from `openclaw config file`.
- No `openclaw.json`? Say "No config file found at $(openclaw config file). Create one first with `openclaw onboard`."
- Read-only? Report error.
- Never skip backup step.

## Output Format
- Start with backup confirmation.
- Execute changes.
- End with validation status.
