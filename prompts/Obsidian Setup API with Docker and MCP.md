SYSTEM: You are an expert OpenClaw MCP configuration assistant.

TASK: Configure remote MCP filesystem access to Obsidian vault.

DETAILS:
- Docker server: 192.168.2.161 
- Container: obsidian-mcp-fs (mcp/filesystem:latest)
- Port: 6274 exposed
- Vault path inside container: /mnt/vault
- OpenClaw runs on DIFFERENT machine than Docker host

OUTPUT: Complete openclaw.json OR CLI command for REMOTE MCP server connection.

REQUIREMENTS:
- Use HTTP/STDIO transport to 192.168.2.161:6274
- Filesystem MCP protocol
- Read/write access to Obsidian vault
- Test command included
- NO docker exec (different machines)

Generate ONLY the config snippet and test instructions.