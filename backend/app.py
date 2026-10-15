from flask import Flask, request, jsonify

from prompt_builder import build_prompt
from ai_client import generate_explanation

app = Flask(__name__)


@app.route("/explain", methods=["POST"])
def explain():
    packet = request.get_json(silent=True)

    if not isinstance(packet, dict):
        return jsonify({
            "summary": "Invalid Packet Data",
            "explanation": "The backend did not receive a valid JSON object."
        }), 400

    prompt = build_prompt(packet)
    explanation = generate_explanation(prompt)

    # Generate a basic summary from the packet's protocol.
    protocol = str(packet.get("protocol", "Unknown"))
    summary = f"{protocol} Packet Analysis"

    return jsonify({
        "summary": summary,
        "explanation": explanation
    })


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)
