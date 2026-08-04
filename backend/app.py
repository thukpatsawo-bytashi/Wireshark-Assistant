from flask import Flask, request, jsonify

from prompt_builder import build_prompt
from ai_client import generate_explanation

app = Flask(__name__)

@app.route("/explain", methods=["POST"])
def explain():

    packet = request.json

    prompt = build_prompt(packet)

    explanation = generate_explanation(prompt)

    return jsonify({
        "summary": "AI Packet Analysis",
        "explanation": explanation
    })


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)