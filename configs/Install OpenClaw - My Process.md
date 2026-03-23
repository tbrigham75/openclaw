# Install OpenClaw - My Process

Below is my process of installing OpenClaw

1.  curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs

2.  node -v 

3.  mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

4. Install HomeBrew on Linux:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

5. npm config set fund false

6.  npm install -g openclaw@latest

7.  openclaw --version

8.  openclaw onboard --install-daemon

9. I understand this is personal-by-default and shared/multi-user use requires lock-down. Continue?
│  ● Yes / ○ No

10.  Onboarding mode
│  ● QuickStart (Configure details later via openclaw configure.)
│  ○ Manual

11.  Model/auth provider #Choose your own model - Maybe Google
     Ollama (Cloud and local open models)
	http://192.168.2.120:11434/

12. ◆  Ollama mode
│  ● Cloud + Local (Ollama cloud models + local models)
│  ○ Local

13. Default model
	ollama/gpt-oss:120b-cloud (ctx 128k)

14.  ◆  Select channel (QuickStart)
│  	● Telegram (Bot API) (recommended · newcomer-friendly)

15.  How do you want to provide this Telegram bot
    │token?
    │  ● Enter Telegram bot token (Stores the
    │  credential directly in OpenClaw config)
    │  ○ Use external secret provider
        #Paste your token

16.  Search provider
│  ○ Brave Search
│  ● Gemini (Google Search) (Google Search grounding · AI-synthesized)
   #Paste your token

16.  ◆  Configure skills now? (recommended)
│  ● Yes / ○ No

18. Install missing skill dependencies
│  ◻ Skip for now (Continue without installing
│  dependencies)
│  ◻ 🔐 1password
│  ◻ 📰 blogwatcher
│  ◻ 🫐 blucli
│  ◻ 📸 camsnap
│  ◼ 🧩 clawhub (Use the ClawHub CLI to search
   More below this
19.  Preferred node manager for skill installs
│  ● npm
│  ○ pnpm
│  ○ bun

20.  ◇  Set GOOGLE_PLACES_API_KEY for goplaces?
│  No
│
◇  Set GEMINI_API_KEY for nano-banana-pro?
│  No
│
◇  Set NOTION_API_KEY for notion?
│  No
│
◇  Set OPENAI_API_KEY for openai-image-gen?
│  No
│
◇  Set OPENAI_API_KEY for openai-whisper-api?
│  No
│
◇  Set ELEVENLABS_API_KEY for sag?
│  No

21.   Enable hooks?
│  ◻ Skip for now
│  ◼ 🚀 boot-md (Run BOOT.md on gateway startup)
│  ◻ 📎 bootstrap-extra-files
│  ◼ 📝 command-logger (Log all command events to
│   a centralized audit file)
│  ◼ 💾 session-memory (Save session context to
│  memory when /new or /reset command is issued)

22. How do you want to hatch your bot?
│  ● Hatch in TUI (recommended)
│  ○ Open the Web UI
│  ○ Do this later

23.  In the chat:  Lets start the onboarding process and get to know each other

24.  My info:  My name is [fill in name].  I am an advanced IT professional based in [fill in location you live].  My timezone in [fill in].  I specialize in Virtualization, Windows Server administration, Linux Server Admin, DevOps, and infrastructure automation.
Expertise Highlights:
    • Manages a self-hosted homelab environments with Ansible, Docker, and Proxmox.  Expert at virtualization:  Vmware, ProxMox, VirtualBox  Known OS:  Windows, Linux
    • Pursues hands-on hobbies including: [fill in]

25.  Your identity:  Your name is [fill in].  You will be my direct assistant and in charge of all my other agents.  If there is ever a question my other agents will come back to you for answers.  If you don't know the answer or what to do you will ask me.   Your emoji should be an [fill in].

26.  /quit to quit the TUI or Ctrl C + Ctrl C real fast.

27.  To reopen TUI:  openclaw tui

28.  Note: these are personal settings I do.  Backup the openclaw.json! Edit: openclaw.json with things from the file on your desktop.  These things:
	
	A. UNDER Channels and TeleGram:
	      "groupPolicy": "allowlist",
      "allowFrom": [
        "YourTelegramID"
      ],

	B.UNDER Gateway:
	"bind": "lan",
    	"controlUi": {
      "allowedOrigins": [
    	"https://YourURL2Access",
    	"https://YourURL2Access:443"
  	]
     },

	C. Under your Auth:
    	"trustedProxies": [
      	  "YourProxyIDIP"
    	],

29.  Back at the Terminal Look for the gateway token
	openclaw dashboard --no-open

30.  Open web browser with the token and click connect.  Example:
	http://192.168.2.170:18789/#token=PutGatewayTokenHere
	NOTE:  (Above)Ensure "allowedOrigins": is set to correct URL

31.  openclaw devices list

32.  openclaw devices approve --latest