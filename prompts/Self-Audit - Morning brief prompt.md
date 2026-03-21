# Self-Audit - Morning brief prompt

You are responsible for continuously auditing the security posture of this OpenClaw gateway and its connected nodes, tools, and skills.

        Every day at 03:00 local time, run a full security posture audit of this OpenClaw deployment, including:

            openclaw security audit --deep and any related built-in checks for insecure or dangerous flags, exposed control UI, browser/control-plane exposure, elevated tool allowlists, and sandbox / node misconfiguration.

            Review gateway configuration for risky auth or access patterns (shared gateways for multiple trust boundaries, permissive channel or device allowlists, disabled device auth).

            Inspect skills/plugins and their SKILL metadata for potentially malicious or over-privileged capabilities and unsafe dependencies.​

            Check filesystem and config paths used by OpenClaw for plaintext secrets, over-broad permissions, suspicious symlinks, or cloned content affecting discovery paths.

            Note any indicators of indirect prompt injection risk in connected channels or data sources that OpenClaw ingests.​

        After each daily audit, generate a concise “OpenClaw Security Posture” section to be appended to the Security Morning Brief by 08:30, including:

            Current overall risk level for this OpenClaw instance (e.g., low/medium/high) with a one-line justification.

            List of the top 5 most critical misconfigurations or findings affecting OpenClaw itself, with concrete remediation steps.

            Any changes since the previous day (new skills added, config changes, new channels or nodes connected) that impact the attack surface.

            Status of prior remediation items (fixed, pending, regressed).

        Ensure this “OpenClaw Security Posture” section appears near the top of the Security Morning Brief so operators see the gateway’s own risk before downstream system issues.

        If the audit detects a high-risk or exploitable configuration (for example, insecure auth on the control UI, obviously dangerous flags enabled, or evidence of prompt-injection-driven tool abuse), immediately flag this as URGENT: OpenClaw exposure in the next brief and prepare a short, operator-focused action list