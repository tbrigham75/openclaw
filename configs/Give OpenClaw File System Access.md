# Give OpenClaw File System Access - For now I'll limit it to Coding Access

To give an OpenClaw AI agent filesystem access along with a few other things, lets assign the Agents the Coding Role.  This is a powerful feature with significant security risks, so it should be done carefully, ideally on an isolated machine. 

1. Open the WebGUI
   • Run from your laptop or computer:
     bash:
     ssh -N -L 18789:127.0.0.1:18789 tom@192.168.0.5
   • Then open a browser on that system:
    http://localhost:18789/

2.  Click on Agents

3.  Click on the Coding Quick Presets

4.  Click Save

5.  Click Reload Config to ensure it took.

6.  Restart gateway:
    bash:
    openclaw gateway restart

7.  Tell your agent:  Create a file called test.txt in ~/.openclaw/workspace

8.  SSH in and verify the file is there

Important Security Precautions

    • Run OpenClaw in an isolated environment, such as a dedicated Physical segmented system, Virtual Private Server (VPS) or Docker container, not on your primary personal machine.
    • Do not expose the OpenClaw Gateway to the public internet; bind it to localhost and use a secure method like an SSH tunnel or VPN (e.g., Tailscale) for remote access.
    • Start with read-only access and gradually add write permissions after monitoring the agent's behavior and logs.
    • Lock down file permissions at the OS level (e.g., using chmod 600 on sensitive files) to limit the "blast radius" if the agent is compromised.
    • Use "burner" accounts for any integrations (email, GitHub, etc.) that you connect to OpenClaw.
    • Configure the agent to require human approval for sensitive actions using the exec ask mode or similar settings. 