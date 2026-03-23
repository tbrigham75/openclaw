# Install - QMD CLI
QMD - Query Markup Documents

An on-device search engine for everything you need to remember. Index your markdown notes, meeting transcripts, documentation, and knowledge bases. Search with keywords or natural language. Ideal for your agentic flows.

QMD combines BM25 full-text search, vector semantic search, and LLM re-ranking—all running locally via node-llama-cpp with GGUF models.

PROMPT:

Write me a prompt for OC to create a skill:
1.  Backs up openclaw.json to this path:  ~/.openclaw/backups/
2.  Creates that folder if it doesn' exist
3.  This backup filename should be similiar to this and auto fill in the date:  openclaw.json.DATE-before-add-ollama-llms.bak
4.  Runs this CMD from bash:  ollama list
5.  Takes the NAME's from the output
6.  Setups LLM's in the openclaw.json file using the NAME's
7.  Restarts the openclaw gateway