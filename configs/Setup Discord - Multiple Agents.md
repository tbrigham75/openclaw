In the “multi‑agent” OpenClaw pattern you’re trying to use (separate coder, tester, main orchestrator, etc.), you generally need one Discord bot per agent, not just one bot shared across all agents. Your current setup—where only the main agent is wired into Discord—is why “giving the coder and tester permissions” doesn’t work yet.
What “one bot per agent” means

    Each agent (main, coder, tester, researcher, etc.) lives in its own workspace and usually maps to:

        One Discord bot account (its own bot token).

        One channel account in openclaw.json (e.g., accounts: { default: {...}, coding: {...}, testing: {...} }).

    OpenClaw then routes messages to the right agent based on which bot account they came from.

Here’s a concise, step‑by‑step setup for what you want:

    One Discord server

    Separate bots: main agent, coder, tester

    Each bot from its own Discord app

    Wired into OpenClaw so you can talk to your main agent, which spawns tasks handled by coder/tester in project channels.

1. Create the Discord apps (bots)

    Go to:
    https://discord.com/developers/applications

    Create three apps:

        Click New Application three times.

        Name them something like:

            Main Agent Bot

            Coder Bot

            Tester Bot

    For each app:

        On the left, click Bot.

        If it says Add Bot, click that.

        Note the token (click Reset Token if you want a fresh one, then copy and store it securely).

    Save the tokens somewhere safe, e.g.:

        main_bot_token = ...

        coder_bot_token = ...

        tester_bot_token = ...

You now have 3 apps, each with its own bot token.
2. Invite each bot to your server

    For each bot:

        In its app → OAuth2 → URL Generator.

        Under Scopes, check bot.

        Under Bot Permissions:
        
            At least:

                View Channel
                Send Messages
            
            Optional:
                            
                Create Public Threads
                Create Private Threads
                Send Messages in Threads
                Manage Threads
                Read Message History

        Copy the generated URL and open it in your browser.

        Continue to Discord

        Choose your server and click Continue
        Verify permssions and Authorize.

    Repeat for all three bots.

    NOTE:  If you accidently mess up permission then just recheck permissions and regen the url.

    Now all three bots are in your server.

3. Give bots Discord‑side channel permissions

    In Discord, right‑click your project channel → Edit Channel → Permissions.

    For each bot:

        Click + and add the bot’s role (or the bot user directly).

        Allow:

            View Channel

            Send Messages

            Read Message History

    Repeat for any other project channels you want coder/tester to live in.

(The main orchestrator can either be in those channels or just in your main HQ channel; your choice.)

4. Configure OpenClaw for multiple bots

In your openclaw.json, under channels.discord, you want roughly this pattern:

Prompt if you get your agent to do it: I want you to update your openclaw.json file.  We are modifying discord channels and agents access.  I want you to merge this into the existing json without breaking things.  Stop and think before applying.  Here is the info in json format:

json
"channels": {
  "discord": {
    "guilds": {
      "YOUR_GUILD_ID": {
        "friendlyName": "OpenClaw",
        "categories": {
          "projects": {
            "id": "Right-Click Text Channels_CATEGORY_ID",
            "allowedAgents": ["agent/coder", "agent/tester"]
          }
        },
        "channels": {
          "YOUR_MAIN_CHANNEL_ID": {
            "allowedAgents": ["agent/main"],
            "requireMention": false
          },
          "YOUR_PROJECT_CHANNEL_ID": {
            "allowedAgents": ["agent/coder", "agent/tester"],
            "requireMention": false
          }
        }
      }
    },
    "accounts": {
      "main": {
        "name": "main",
        "token": "YOUR_MAIN_BOT_TOKEN_HERE"
      },
      "coding": {
        "name": "coding",
        "token": "YOUR_CODER_BOT_TOKEN_HERE"
      },
      "testing": {
        "name": "testing",
        "token": "YOUR_TESTER_BOT_TOKEN_HERE"
      }
    }
  }
}

Where:

    YOUR_GUILD_ID = your server’s numeric ID (right‑click server → Copy ID with Dev Mode).

    YOUR_MAIN_CHANNEL_ID = your main command channel.

    YOUR_PROJECT_CHANNEL_ID = your project channel.

    agent/main, agent/coder, agent/tester = the actual agent IDs you defined in your agents list (or workspace files).

Reload or restart OpenClaw after saving.

5. Update your agent definitions (concept)

In your agent setup (e.g., in agents.json or workspace files):

    Define:

        main (your orchestrator)

        coder

        tester

    Each has:

        Tools, memory, and routing rules.

    Your main agent should be allowed to:

        Send messages to coder and tester agents (via sessions_spawn or custom tool).

        Have access only to the main channel (unless you also allow it in project channels).

You can also design a small “project channel” tool:

    When you say “start a new project channel for X,” your main agent:

        Asks you to create the channel in Discord.

        Asks you to give coder/tester permissions (you do this manually once).

        Then OpenClaw is informed via allowedAgents: ["agent/coder", "agent/tester"] for that channel.

6. Test the flow

    Talk to your main agent in #main.

    Tell it to “spawn a coding task in the project channel.”

    It should:

        Spawn a subagent tied to agent/coder.

        That coder bot replies in the project channel and stays there for the thread / conversation.

    Likewise for the tester if you trigger tests.