#!/usr/bin/env bash
set -euo pipefail

WORKSPACE="${HOME}/.openclaw/workspace"
AUDIT_OUT="${WORKSPACE}/security_audit_output.txt"
BRIEF_MD="${WORKSPACE}/security_morning_brief.md"

# 1️⃣ Run the deep audit and capture raw output
openclaw security audit --deep > "${AUDIT_OUT}" 2>&1

# 2️⃣ Build a concise OpenClaw Security Posture” section
{
  echo "## OpenClaw Security Posture"
  echo ""
  # Overall risk – very rough placeholder (you can improve parsing later)
  echo "- **Overall risk:** $(grep -i "risk" "${AUDIT_OUT}" | head -n1 || echo "unknown")"
  echo ""
  echo "- **Top 5 critical findings**"
  grep -i -E "error|warning|critical" "${AUDIT_OUT}" | head -n5 || echo "  none detected"
  echo ""
  echo "- **Changes since yesterday**"
  echo "  (placeholder – you can fill this in manually or add diff logic later)"
  echo ""
  echo "- **Prior remediation status**"
  echo "  (placeholder – update when you close tickets)"
} > "${BRIEF_MD}"

# 3️⃣ Echo the summary so the skill can announce it
cat "${BRIEF_MD}"