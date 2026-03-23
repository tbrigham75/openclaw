# Skill - ollama-add-llms

Task: Create a new skill named ollama-add-llms that automates the synchronization of local Ollama models into the OpenClaw configuration.

Environment Context: * OS: Ubuntu / Bash environment.

    Target File: ~/.openclaw/openclaw.json

    Backup Directory: ~/.openclaw/backups/

Step-by-Step Instructions for OC:

    Initialize Skill Metadata:

        Create a SKILL.md file.

        Name: ollama-add-llms

        Description: Automatically detects local Ollama models via CLI, backs up the current configuration, and merges new models into the OpenClaw providers list without duplication.

    Safety & Backup Logic:

        Check for the existence of ~/.openclaw/backups/. Create it if it does not exist.

        Before any file modification, copy openclaw.json to the backup folder.

        Filename Format: openclaw.json.$(date +%Y%m%d_%H%M%S)-before-add-ollama-llms.bak

    Data Extraction:

        Execute the bash command: ollama list.

        Parse the output to extract the NAME of each model (ignoring the header and metadata like ID/Size).

    Configuration Injection:

        Read the existing ~/.openclaw/openclaw.json.

        Navigate to the models.providers.ollama.models array.

        For each model name found in the ollama list output:

            Check if a model with that id already exists.

            If it is new, append a new object to the array using the following schema:

                id: [Model Name]

                name: [Model Name]

                reasoning: false

                input: ["text"]

                cost: { "input": 0, "output": 0, "cacheRead": 0, "cacheWrite": 0 }

                contextWindow: 128000 (Default)

                maxTokens: 8192 (Default)

        Ensure the baseUrl is set to http://127.0.0.1:11434 and api is set to ollama.

    Service Refresh:

        After successfully saving the JSON, execute the command to restart the OpenClaw gateway to apply the changes.

    Verification:

        Confirm to the user that the backup was created and list which new models (if any) were added to the rig.