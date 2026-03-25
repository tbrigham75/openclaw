# Setup Fallback LLM

# URL:  https://www.youtube.com/watch?v=vhf_FzF0dCg

1. Run this to get a list of LLMs that openclaw see:
    openclaw models list

2.  Run this to set the fallbacks.  Do same CMD to add multiple fallbacks (Replace LLM names for other models):
    openclaw models fallbacks add ollama/llama3.2:latest

3.  Do another listing to ensure the model is set as a backup:
    openclaw models list
    Output:
    ollama/llama3.2:latest                     text       128k     yes   yes   fallback#1,configured
    ollama/qwen-opus-16k:latest                text       16k      yes   yes   fallback#2,configured