# Optimize the LLM - Must do for my 12GB GPU

The "12GB GPU" "Goldilocks" 16k Setup

To keep the speed of the 4k model but satisfy the 16k requirement, we need to use KV Cache Quantization. This shrinks the "memory" of the conversation so it fits on your 12GB card without slowing down to 27% utilization.

1.  Rebuild with the "Fast 16k" Modelfile

Run this to create a model that reserves the 16k space but uses refined parameters for your scripts.
Bash:

ollama stop qwen-opus-16k #Fill in whatever model name u were running

cat <<EOF > opus-16k.modelfile
FROM sorc/qwen3.5-claude-4.6-opus-q4:latest
PARAMETER num_ctx 16384
PARAMETER num_predict 2040
PARAMETER repeat_penalty 1.1
PARAMETER top_k 40
PARAMETER top_p 0.9
EOF

ollama create qwen-opus-16k -f opus-16k.modelfile

2.  Put this in openclaw.json file under the model array:
    JSON:
          {
            "id": "qwen-opus-16k",
            "name": "Qwen Opus",
            "reasoning": false,
            "input": ["text"],
            "cost": {
              "input": 0,
              "output": 0,
              "cacheRead": 0,
              "cacheWrite": 0
          },
          "contextWindow": 16384,
          "maxTokens": 2040
          },

    AND under agents array:
            "primary": "ollama/qwen-opus-16k"

3.  Restart Gateway:
    Bash:
    openclaw gateway restart

4. The "Secret Sauce" for 12GB GPU Speed

    Since we are forced back to 16k, we must ensure Ollama is using every trick to save memory. Run this in your terminal before starting:
    Bash:
    sudo SYSTEMD_EDITOR=vi systemctl edit ollama.service

        [Service]
        Environment="OLLAMA_NUM_GPU=1"
        Environment="OLLAMA_FLASH_ATTENTION=1"  #Part of the magic sauce
        Environment="OLLAMA_KV_CACHE_TYPE=q4_0" #Part of the magic sauce
        Environment="OLLAMA_NUM_CTX=16384"
        Environment="OLLAMA_MAX_LOADED_MODELS=2"
        Environment="OLLAMA_NUM_PARALLEL=2"
        Environment="OLLAMA_KEEP_ALIVE=-1"
        Environment="OLLAMA_ORIGINS=*"

5.  Reload Ollama Service
    # Reload the configuration
    sudo systemctl daemon-reload

    # Restart the engine
    sudo systemctl restart ollama

6.  Testing it:
    Bash:  Open 2 Terminals:
        • Watch Nvidia card:
          watch -n 1 nvidia-smi
        • Ask your AI to give you a status of everything you have discussed today

    • Results you are looking for:
        • Better timing in seconds from 36s - 1 min (Just saying Hi) to 15s in my case for asking for status where it reads through all that happened over 12 hour period. 
        • You are looking that the GPU is between 95% - 100% [2nd block down on right below the CUDA Version]
        • Another thing you are watching is the power usage spikes 138W / 250W below.  Not sure what you are looking for still learning this part.
        
        Tue Mar 24 05:00:19 2026
        +---------------------------------------------------------------------------------------+
        | NVIDIA-SMI 535.288.01             Driver Version: 535.288.01   CUDA Version: 12.2     |
        |-----------------------------------------+----------------------+----------------------+
        | GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
        | Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
        |                                         |                      |               MIG M. |
        |=========================================+======================+======================|
        |   0  NVIDIA                         Off | 00000000:01:00.0 Off |                  N/A |
        | 29%   50C    P2             138W / 250W |   8354MiB / 12288MiB |    100%      Default |
        |                                         |                      |                  N/A |
        +-----------------------------------------+----------------------+----------------------+

        +---------------------------------------------------------------------------------------+
        | Processes:                                                                            |
        |  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
        |        ID   ID                                                             Usage      |
        |=======================================================================================|
        |    0   N/A  N/A    564170      C   /usr/local/bin/ollama                      8350MiB |
        +----------------------------------------------------------------------------------------