# Directions

Place the skills folder into ~/.openclaw/workspace/skills/[Skill Folder]

Run openclaw doctor to scan skills:
    - openclaw doctor

Test: 
    - Ask agent to "config set agents.defaults.model.primary 'new-model'" ​
    - It Should backs up openclaw.json first.

Why This Works:
    - OpenClaw skills trigger on keywords before config CLI runs, using shell/file tools for mkdir/cp. Matches your Docker/CLI setup from past chats. Uses openclaw config file for robust path detection.