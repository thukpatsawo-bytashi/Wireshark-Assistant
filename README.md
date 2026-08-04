# Wireshark Assistant

An AI-powered Wireshark plugin that generates concise, human-readable explanations of network packets.

The project combines a **Lua Wireshark plugin**, **Python Flask backend**, and **Google Gemini API** to make packet analysis easier to understand.

> **Status:** Ongoing — the core AI packet-analysis pipeline is functional. UI improvements, easier installation, chat functionality, and advanced traffic analysis are planned.

## Features

### Implemented

* Packet metadata extraction using Lua.
* Flask backend for processing packet information.
* Google Gemini integration for AI-generated explanations.
* JSON communication between Wireshark and the backend.
* Human-readable AI analysis displayed inside Wireshark.

### Planned

* AI chat interface.
* Capture-wide traffic summarisation.
* Improved packet extraction and UI.
* Context-aware multi-packet analysis.
* Suspicious traffic and threat-analysis assistance.

## Architecture

```text id="o7l3mc"
Wireshark Packet
      ↓
Lua Plugin
      ↓
Packet Metadata (JSON)
      ↓
Flask Backend
      ↓
Google Gemini
      ↓
AI Explanation
      ↓
Wireshark Popup
```

## Getting Started

### 1. Clone the repository

```bash id="r82tv6"
git clone https://github.com/thukpatsawo-bytashi/Wireshark-Assistant.git
cd Wireshark-Assistant
```

### 2. Set up the backend

```bash id="rgpqyo"
cd backend

python3 -m venv venv
source venv/bin/activate

pip install -r requirements.txt
```

### 3. Configure Gemini

Wireshark Assistant requires your own **Google Gemini API key**.

Get one from [Google AI Studio](https://aistudio.google.com/apikey).

Create:

```text id="06jbrm"
backend/.env
```

and add:

```env id="xbg9gk"
GEMINI_API_KEY=your_api_key_here
```

> Never commit your `.env` or API key to GitHub.

### 4. Install the Wireshark plugin

From the project root:

```bash id="b0xl2n"
mkdir -p ~/.local/lib/wireshark/plugins

cp plugin/explain.lua ~/.local/lib/wireshark/plugins/
cp plugin/libs/dkjson.lua ~/.local/lib/wireshark/plugins/
```

`dkjson` is currently required for decoding responses from the backend.

### 5. Start the backend

```bash id="bh5t6c"
cd backend
source venv/bin/activate
python app.py
```

Keep the backend running while using the plugin.

### 6. Use Wireshark Assistant

Open Wireshark and select a packet.

Right-click and choose:

```text id="6d90nv"
Wireshark Assistant → Explain Packet
```

The selected packet is sent to the local backend, analyzed using Gemini, and the explanation is displayed directly inside Wireshark.

## Tech Stack

* **Lua** — Wireshark plugin
* **Python / Flask** — Backend
* **Google Gemini** — AI analysis
* **JSON** — Plugin/backend communication
* **Wireshark** — Packet analysis

## Roadmap

* [x] Packet extraction
* [x] Flask backend
* [x] Gemini integration
* [x] Human-readable packet explanations
* [ ] Improved UI and error handling
* [ ] AI chat
* [ ] Capture summarisation
* [ ] Multi-packet and threat analysis

## Disclaimer

This project is intended for educational, research, troubleshooting, and authorized cybersecurity use. AI-generated analysis may contain errors and should not be treated as definitive evidence of malicious activity.
