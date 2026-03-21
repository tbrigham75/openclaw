# OpenClaw Common CMDs

Basics CMDs I'm learning along the journey

    npm install -g openclaw@latest #Update OpenClaw
    openclaw onboard #Start the onboard process after init install
    openclaw onboard --auth-choice ollama #How to skip other parts and go right to ollama selection
    openclaw onboard --auth-choice google #Same as above but for Google
    openclaw dashboard --no-open #Provides the gateway token
    openclaw tui #Opens Terminal User Interface to chat with OpenClaw
    openclaw doctor #CMD that pretty much fixes everything
    openclaw doctor --fix #openclaw doctor always tells me to run this to fix things
    openclaw gateway restart #Restarts the main gateway - use anytime major changes - especially openclaw.json edits
    openclaw devices list #List devices awaiting approval
    openclaw devices approve --latest #Will auto approve latest requests.