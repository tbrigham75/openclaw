# OpenClaw + 5 Free Tools Setup

This guide walks you through installing and connecting all tools used in the “OpenClaw Is Useless Without These 5 FREE Tools” workflow.

---

## 1. Prerequisites

- An OpenClaw setup already running (see creator’s previous OpenClaw setup video if needed). [web:1]  
- Basic familiarity with API keys and environment variables.

---

## 2. AgentMail – Agent‑friendly email

AgentMail gives OpenClaw its own inbox so it can send and receive emails without being blocked by Gmail. [web:1]

### Steps

1. Go to **https://www.agentmail.to/** and click **“Start for free”**. [web:1]  
2. Sign in with your Google account.  
3. In the dashboard, click **Inbox → Create new inbox**.  
   - Name: `OpenClaw` (or similar).  
   - Display name: `OpenClaw`.  
   - Create inbox. [web:1]  
4. Optionally forward a test email (e.g., an invoice or receipt) to this inbox so OpenClaw can see messages. [web:1]  
5. Go to **API keys** and:  
   - Click **Create new API key**.  
   - Label it `OpenClaw`.  
   - Copy the key. [web:1]  
6. In **OpenClaw**, run a prompt like:

   > You have access to AgentMail — an Email API for Agents. The llms.txt file is a very good starting point. Read it first, then go from there based on what the user needs. llms.txt (overview + all doc links): https://docs.agentmail.to/llms.txt.  llms-full.txt (complete reference with inline code examples): https://docs.agentmail.to/llms-full.txt.  Install my AgentMail API key: `<PASTE_KEY>`. Then read the latest message in your inbox and tell me what it’s about without revealing sensitive data.

7. Test reply:

   > Fred, reply to that message saying your favorite color. [web:1]

   Confirm the email reaches your personal inbox.

---

## 3. here.now – Instant web hosting

This lets OpenClaw publish HTML pages live on the internet in seconds. [web:1]

### Steps

1. Go to **https://here.now/**. [web:1]  
2. Create a free account (optional; keeps the page available beyond 24 hours).  
3. In the dashboard, copy the **API setup instructions** shown for agents.  
4. In **OpenClaw**, prompt:

   > Hey OpenClaw, use here.now to publish a webpage with:
   > - A large octopus emoji in the center.  
   > - A couple of fun facts about octopuses floating around it. [web:1]

5. OpenClaw should return the live URL; verify the page matches your request. [web:1]  

Use this pattern any time you want to:
- push a report,
- share a marketing plan, or
- show a data visualization as a live page. [web:1]

---

## 4. Tavily – Web search & research

Tavily gives OpenClaw live, reliable web search and deep‑research capabilities. [web:1]

### Steps

1. Go to **https://tavily.com/** and sign up for a free account. [web:1]  
2. In your dashboard, locate **“API key”** and copy it. [web:1]  
3. In **OpenClaw**, prompt:

   > Hey OpenClaw, configure Tavily search using this API key: `<PASTE_KEY>`. [web:1]

4. Test research:

   > Use Tavily to find the three most important factors for growing a YouTube channel.  
   > Return bullet‑point insights, formatted nicely. [web:1]

5. Optionally chain with here.now:

   > Once you have the research, publish it on here.now using YouTube‑style branding and give me the URL. [web:1]

---

## 5. Firecrawl – Web scraping & mapping

Firecrawl lets OpenClaw scrape and structure content from any site (including those behind Cloudflare). [web:1]

### Steps

1. Go to **https://www.firecrawl.dev/** and sign up / log in. [web:1]  
2. In your dashboard, copy the **API key**. [web:1]  
3. In **OpenClaw**, prompt:

   > Hey OpenClaw, use my Firecrawl API key `<PASTE_KEY>` to scrape the Remotion website  
   > and return:  
   > - Branding palette (colors, fonts).  
   > - Any relevant documentation needed to install or integrate it. [web:1]

4. Confirm it returns:
   - Clean Markdown/JSON.
   - A clear color and font breakdown.
   - Pointers to Remotion docs or setup guides. [web:1]

Use Firecrawl whenever you need:
- full‑site structure,
- competitor‑site content extraction, or
- documentation scraping for agents. [web:1]

---

## 6. Remotion – Programmatic video

Remotion lets OpenClaw generate videos by writing React/JSX code. [web:1]

### Steps

1. Go to **https://www.remotion.dev/** and create a free account. [web:1]  
2. In the dashboard, grab:  
   - Any required API key or project URL.  
   - Example project slug or template links. [web:1]  
3. In **OpenClaw**, prompt:

   > Hey OpenClaw, use Remotion to create a 5‑second promo video for:
   > - Channel: `Jimi Barkway AI Automations`.  
   > - Use YouTube branding (colors, logo references). [web:1]

4. Remotion will open a code editor in your browser; OpenClaw may:
   - Populate JSX/React code.
   - You render the video by clicking **“Render”** and downloading the file. [web:1]

Tip: Chain this with earlier research:
> Use my YouTube‑growth research above and create a short promo video summarizing the key points. [web:1]

---

## 7. Zapier SDK – Connect 9,000+ apps

The Zapier SDK in open beta lets OpenClaw talk to most SaaS tools without manually managing each API. [web:1]

### Steps

1. Go to **Zapier’s SDK / agent integration page** (URL shown in the video; typically under Zapier’s developer or SDK docs). [web:1]  
2. Sign in and authorize your connected apps (e.g., Slack, Gmail, CRM apps). [web:1]  
3. In the Zapier dashboard, copy the **SDK URL / setup instructions** for AI agents. [web:1]  
4. In **OpenClaw**, start a new session and prompt:

   > Hey OpenClaw, use the Zapier SDK at `<PASTE_URL>` so you can send messages to my Slack. [web:1]

5. Confirm a test message arrives in your Slack channel. [web:1]  

From here, you can:
- create cross‑app workflows (e.g., “on new email → Slack alert → Google Sheet update”),  
- all driven by natural‑language prompts to OpenClaw. [web:1]

---

## 8. Optional: Notion command kit

The creator offers a **Notion “command kit”** with full prompts and install guides. [web:1]

- Join the **AI Automations by Jimi** Skool community via the first link in the video description.  
- Inside Skool, go to the **OpenClaw and 5 Free Tools** classroom module.  
- Scroll to the bottom and open the **Notion guide**. [web:1]

This guide contains:
- All exact prompts.
- Command templates.
- Links and reminders for each integration. [web:1]