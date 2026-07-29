# Wireshark Assistant

An AI-powered Wireshark plugin that explains captured network packets in plain English using Google Gemini. Built with the Wireshark Lua API and a Python Flask backend, it helps students and security professionals understand packet contents more efficiently.

## Features

- Extracts packet metadata using the Wireshark Lua API
- Generates AI-powered packet explanations with Google Gemini
- Flask backend for prompt generation and inference
- Displays explanations directly inside Wireshark
- JSON-based communication between Wireshark and the backend

## Planned Features

- AI chat for packet analysis
- Capture-wide traffic summaries
- Threat detection assistance
- Protocol-specific explanations
- Intelligent filtering recommendations

## Architecture

```text
Wireshark
    │
Lua Plugin
    │
Packet Metadata (JSON)
    │
Flask Backend
    │
Google Gemini
    │
AI Response
    │
Wireshark Popup
```

## Tech Stack

- **Languages:** Lua, Python
- **Framework:** Flask
- **AI:** Google Gemini API
- **Tools:** Wireshark, JSON

## Quick Start

```bash
git clone https://github.com/thukpatsawo-bytashi/Wireshark-Assistant.git
cd Wireshark-Assistant/backend

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Create a `.env` file:

```env
GEMINI_API_KEY=your_api_key
```

Start the backend:

```bash
python app.py
```

Install the plugin:

```bash
ln -sf ~/Desktop/Wireshark-Assistant/plugin/explain.lua \
~/.local/lib/wireshark/plugins/explain.lua
```

Launch Wireshark, select a packet, then choose:

**Wireshark Assistant → Explain Packet**

## Project Structure

```text
Wireshark-Assistant/
├── backend/
├── plugin/
├── captures/
├── docs/
└── README.md
```

## Status

🚧 Active development. Core AI pipeline is complete, with new analysis and usability features planned.

## License

Educational and research purposes.
