import os

from dotenv import load_dotenv
from google import genai

load_dotenv()

api_key = os.getenv("GEMINI_API_KEY")

if not api_key:
    raise ValueError("GEMINI_API_KEY not found in .env")

client = genai.Client(api_key=api_key)


def generate_explanation(prompt: str) -> str:
    models = [
        "gemini-3.5-flash",
        "gemini-3.5-flash-lite",
        "gemini-2.5-flash-lite"
    ]

    for model in models:
        try:
            response = client.models.generate_content(
                model=model,
                contents=prompt,
            )
            return response.text

        except Exception as e:
            print(f"{model} failed: {e}")

    return "All Gemini models are currently unavailable."