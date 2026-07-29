# Wireshark Assistant

An AI-powered Wireshark plugin that provides contextual, human-readable explanations of captured network packets directly within the Wireshark interface. The project combines Wireshark's Lua plugin framework with a Python Flask backend and Google's Gemini API to make packet analysis more accessible for students, cybersecurity enthusiasts, and professionals.

---

## Features

### Implemented

* Packet metadata extraction using the Wireshark Lua API.
* AI-powered packet explanations using Google Gemini.
* Python Flask backend for prompt generation and AI inference.
* End-to-end communication pipeline between Wireshark and the AI backend using JSON.
* Packet explanations displayed directly inside Wireshark.

### In Progress

* Improved popup formatting for cleaner, more readable AI responses.
* Robust JSON parsing and enhanced backend error handling.
* General code cleanup and performance improvements for the first stable release.

### Planned

* AI chat interface for asking questions about packets and protocols.
* Capture-wide traffic summarisation.
* Protocol-specific guidance and educational explanations.
* Intelligent threat analysis and suspicious activity detection.
* AI-assisted filtering and investigation recommendations.

---

## Architecture

```text
Wireshark
      │
      ▼
Lua Plugin
      │
      ▼
Packet Metadata (JSON)
      │
      ▼
Python Flask Backend
      │
      ▼
Prompt Builder
      │
      ▼
Google Gemini API
      │
      ▼
AI Response (JSON)
      │
      ▼
Wireshark Popup
```

---

## Tech Stack

* **Languages:** Lua, Python
* **Framework:** Flask
* **AI:** Google Gemini API
* **Networking:** Wireshark Lua API
* **Data Format:** JSON

---

## Project Status

🚧 **Under Active Development**

The core AI pipeline has been successfully implemented and is fully functional. Current development focuses on improving the user experience, strengthening error handling, and preparing the project for its first public release. Future updates will introduce conversational AI, capture-level analysis, and advanced cybersecurity assistance.

---

## Roadmap

* [x] Extract packet metadata from Wireshark
* [x] Integrate Flask backend
* [x] Connect Google Gemini
* [x] Display AI-generated packet explanations
* [ ] Improve UI and popup formatting
* [ ] Implement robust JSON parsing
* [ ] Release **v0.1**
* [ ] AI chat interface
* [ ] Capture summarisation
* [ ] Threat detection assistance
* [ ] Intelligent protocol guidance

---

## License

This project is intended for educational and research purposes.
