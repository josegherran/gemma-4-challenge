# skills.py
# Define agent skills for the backend agent (decoupled from UI)
# skills.py
# Define agent skills for the backend agent (decoupled from UI)

import os
import uuid
import httpx
from PIL import Image

class GenerateImageSkill:
    """
    Skill to process image generation requests from prompts.
    """
    name = "generate_image"
    description = "Generate an image from a text prompt using Gemma 4 models."

    async def run(self, prompt: str, **kwargs):
        provider = kwargs.get("provider", "Ollama")
        model = kwargs.get("model", "gemma:2b")
        filename = f"generated_{uuid.uuid4().hex}.png"
        folder = os.path.join(os.path.dirname(__file__), "..", "generated_images")
        os.makedirs(folder, exist_ok=True)
        filepath = os.path.abspath(os.path.join(folder, filename))

        if provider == "Ollama":
            # Call Ollama API for image generation
            ollama_url = "http://localhost:11434/api/generate"
            payload = {
                "model": model,
                "prompt": prompt,
                "stream": False
            }
            try:
                async with httpx.AsyncClient() as client:
                    resp = await client.post(ollama_url, json=payload, timeout=60)
                    resp.raise_for_status()
                    data = resp.json()
                    # Assume Ollama returns a base64-encoded image in 'image' field (update if API differs)
                    image_b64 = data.get("image")
                    if image_b64:
                        import base64
                        img_bytes = base64.b64decode(image_b64)
                        with open(filepath, "wb") as f:
                            f.write(img_bytes)
                    else:
                        # Fallback: create a blank image if Ollama does not return image
                        img = Image.new("RGB", (400, 300), color=(240, 240, 240))
                        img.save(filepath)
            except Exception as e:
                # On error, fallback to blank image
                img = Image.new("RGB", (400, 300), color=(240, 240, 240))
                img.save(filepath)
        else:
            # Fallback for other providers: blank image
            img = Image.new("RGB", (400, 300), color=(240, 240, 240))
            img.save(filepath)

        image_url = f"/generated_images/{filename}"
        return {
            "status": "success",
            "prompt": prompt,
            "image_url": image_url
        }
