# Give OpenClaw File System Access

To give an OpenClaw AI agent filesystem access, you need to
configure its security settings to explicitly allow the group:fs and group:runtime tool groups and specify the allowed paths in the OpenClaw configuration. This is a powerful feature with significant security risks, so it should be done carefully, ideally on an isolated machine. 
Configuration Steps (Linux/macOS)

1. Ensure you are using the correct configuration file. The main configuration is usually located at ~/.openclaw/openclaw.json or ~/.openclaw/tools.yaml.

2. Add or modify the tools section in your configuration file to enable the necessary tool groups and define path restrictions. A recommended secure configuration involves a specific workspace directory and denial of sensitive system paths.
    A. Example configuration using tools.yaml to allow a specific workspace but deny sensitive system areas:
    yaml

    tools:
        filesystem:
        enabled: true
        allowedPaths:
            - "/home/openclaw/workspace"
            - "/home/openclaw/clawd"
        deniedPaths:
            - "/home/openclaw/.ssh"
            - "/home/openclaw/.openclaw/credentials"
            - "/etc"
            - "/root"
            - "/var"

    B. Alternatively, in your openclaw.json or by running a command, you can switch the agent profile or add the groups:
    bash
    # To switch to the 'coding' profile which generally includes FS access
    openclaw config set tools profile "coding"

    # Or, to keep the current profile and add specific groups
    openclaw config set tools allow '["group:fs", "group:runtime"]'

    C. Refer to the OpenClaw Docs for comprehensive details on tool policies and approval settings.

3. Restart the OpenClaw gateway after making configuration changes to ensure they are applied.
bash
openclaw gateway restart

4. Verify the changes using openclaw status --deep to confirm the correct config is loaded and filesystem tools are available. 

Important Security Precautions

    • Run OpenClaw in an isolated environment, such as a dedicated Virtual Private Server (VPS) or Docker container, not on your primary personal machine.
    • Do not expose the OpenClaw Gateway to the public internet; bind it to localhost and use a secure method like an SSH tunnel or VPN (e.g., Tailscale) for remote access.
    • Start with read-only access and gradually add write permissions after monitoring the agent's behavior and logs.
    • Lock down file permissions at the OS level (e.g., using chmod 600 on sensitive files) to limit the "blast radius" if the agent is compromised.
    • Use "burner" accounts for any integrations (email, GitHub, etc.) that you connect to OpenClaw.
    • Configure the agent to require human approval for sensitive actions using the exec ask mode or similar settings. 