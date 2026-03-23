# Essential Env Configs for Local Ollama

These setting are HUGE in my case!!!   My GPU is only 12GB and my OpenClaw was taking 3+ mins to respond, no matter which LLM I was using.  After setting these variables the response time dropped to 6 seconds... HUGE FIX!!!!!

Great Ollama Resource:  FAQ:
https://github.com/ollama/ollama/blob/main/docs/faq.mdx

To set up your 12GB GPU for high-velocity "vibe coding" with 16k context, follow these steps in order:

1. Open the Config Editor

Run this command to create the override file:
Bash:
sudo SYSTEMD_EDITOR=vi systemctl edit ollama.service

2. Copy and Paste this Block

Paste this exactly into the editor (between the comment lines or at the top):
Ini, TOML

[Service]
Environment="OLLAMA_NUM_GPU=1"
Environment="OLLAMA_FLASH_ATTENTION=1"
Environment="OLLAMA_KV_CACHE_TYPE=q8_0"
Environment="OLLAMA_NUM_CTX=16384"
Environment="OLLAMA_MAX_LOADED_MODELS=2"
Environment="OLLAMA_NUM_PARALLEL=2"
Environment="OLLAMA_KEEP_ALIVE=-1"
Environment="OLLAMA_ORIGINS=*"

(In vi, press i to enter Insert mode, paste, then press Esc and type :wq to save and exit.)

Quick Reference of what each of the Vars do:
Variable	            Purpose
NUM_GPU=1	            Locks Ollama to your primary GPU for stability.
FLASH_ATTENTION=1	    Uses a faster algorithm for processing long code blocks.
KV_CACHE_TYPE=q8_0	    Compresses the "chat memory" so you can use larger contexts.
NUM_CTX=16384	        The "Sweet Spot" for 12GB VRAM—plenty of room for Next.js files.
MAX_LOADED_MODELS=2	    Lets you keep a coding model and a secondary model ready at once.
NUM_PARALLEL=2	        Allows your IDE and Browser to talk to the AI simultaneously.
KEEP_ALIVE=-1	        Keeps the model loaded in VRAM so responses are instant (no 15s delay).
ORIGINS=*	            If you decide to use a web-based "Mission Control" dashboard to talk to your local Ollama
                        You might hit "CORS" errors (browser security blocking the connection).
                        Setting this to * allows any local web app to connect to your Ollama API.

NOTE:  The only catch about setting KEEP_ALIVE=-1: If you switch between many different models (e.g., jumping from Llama 3 to Mistral to a Vision model), your VRAM can get fragmented. If things feel buggy after hours of switching models, a quick sudo systemctl restart ollama is the "manual" cleanup process.

3. Reload and Apply

Run these two commands to make the changes live:
Bash:
sudo systemctl daemon-reload
sudo systemctl restart ollama

4. Verify the Setup

Run this while you have a chat active to ensure it's using your GPU:
Bash:
ollama ps

    [!TIP]
    Look for 100% GPU in the output. If it says anything less (e.g., 80% GPU / 20% CPU), your model is too large for 12GB VRAM at 16k context—try dropping OLLAMA_NUM_CTX to 8192 if it feels slow.

5.  Monitor the Hardware:
Open a second terminal and run:
Bash:
nvidia-smi -l 1

Now, ask your AI a complex coding question. You should see the Memory Usage jump up (filling that 16k context buffer) and the GPU-Util percentage spike.