# The OpenClaw “Vibe Armor” Rig (2026 Edition)

This configuration creates a **Hybrid Intelligence** setup on your Ryzen 7 VM. It uses local hardware via **Ollama** to handle the “heavy lifting” of reading and indexing your files for free, while rotating through multiple **Google Gemini API keys** to give you a combined **3,000+ daily request budget** for high‑speed coding.

> **Note:**  
> You can add up to **10 API keys** on the free tier.  
> Ensure each key lives in its own **Google Cloud project** so quotas stay independent.

---

## 1. Google AI Studio: API Key Generation & Management

To build your “Armor” for vibe coding, create independent projects in **Google AI Studio**. Each project gets its own **1,000‑call daily quota**, which OpenClaw can rotate across.

    ### Step‑by‑step key creation

    - **Log in**  
      Go to `aistudio.google.com` and sign in with your Google account.

    - **Create a new project**
      - Click **“Get API key”** in the top‑left sidebar.  
      - Select **“Create API key in new project.”**  
      - **Do not** create multiple keys in the same project; they share the same 1,000‑call limit.

    - **Copy the key**  
      Copy the generated API key string immediately.

    - **Label your projects**  
      In the **Google Cloud Console** (linked from AI Studio), name your projects clearly (for example: `OpenClaw-Key-1`, `OpenClaw-Key-2`) so you can track which keys are hitting their limits.

    - **Repeat for rotation**  
      Repeat this process up to **10 times** to reach a theoretical maximum of **10,000 requests per day** when combined.

    ### Important limits (free tier)

    - **Requests per day (RPD):**  
      - **1,500** (standard Gemini) or **1,000** (Gemini‑Flash‑Lite) per project.

    - **Requests per minute (RPM):**  
      - **15 RPM per project.**  
      - OpenClaw handles rate‑limiting by rotating to your next key as soon as one hits its cap.

    - **Data privacy:**  
      - On the free tier, Google **may use inputs and outputs** to improve its models.  
      - Avoid pasting **sensitive credentials** or private keys.  
2. Ollama Installation & Verification

    - The foundation of your local "Hardware Shield." This installs the Ollama engine and ensures it’s running as a background service on your Linux VM.
    
    ###Bash

    # Install Ollama
    curl -fsSL https://ollama.com/install.sh | sh

    # Verify the service is active
    systemctl status ollama

3. Local Model Provisioning

    Before coding, you must "pull" the specific models that handle your project's memory and local fallbacks.
    Bash

    # Pull the "Shield" (Free local file indexing)
    ollama pull nomic-embed-text

    # Pull the "Safety Net" (Local LLM for offline work)
    ollama pull llama3.2:3b

    # Confirm models are loaded
    ollama list

4. Hybrid Configuration (config.yaml)

    This is the logic that connects your hardware to the cloud. It designates Gemini as the "Brain" and Ollama as the "Memory Search."
    YAML

    models:
      providers:
        google:
          apiKey: "google:default" 
        ollama:
          baseUrl: "http://127.0.0.1:11434" #Put IP to your Ollama server here

    agents:
      defaults:
        model: "google/gemini-flash-lite-latest"
        memorySearch:
          provider: "ollama"
          model: "nomic-embed-text:latest"
        fallbacks:
          - "ollama/llama3.2:3b"

5. "Armor" Maintenance Toolkit

    Use these commands to monitor your API "fuel" and keep the rotation active.
    Task	                    Command
    ----                      -------
    Check Local Status	      ollama list
    Refresh Gateway	          openclaw gateway restart
    Add New API Key	          openclaw models auth add --profile google:key4
    Update Key Rotation	      openclaw config set auth.order.google '["google:default", "key2", "key3", "key4"]' --json
    Verify API Key Health	    openclaw models status --probe --probe-provider google