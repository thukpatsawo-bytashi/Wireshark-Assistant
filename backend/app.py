from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/explain", methods=["POST"])
def explain():

    data = request.json

    protocol = data.get("protocol", "Unknown")
    src = data.get("source", "Unknown")
    dst = data.get("destination", "Unknown")

    return jsonify({
        "status": "success",
        "explanation":
        f"This is a {protocol} packet travelling from {src} to {dst}."
    })

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)