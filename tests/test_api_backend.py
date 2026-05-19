import pytest
from fastapi.testclient import TestClient
from api_backend import app

client = TestClient(app)

def test_generate_image_success(monkeypatch):
    class DummyAgent:
        class DummySkill:
            async def run(self, **kwargs):
                return {"status": "success", "image_url": "http://test/image.png"}
        skills = [DummySkill()]
    app.state.agent = DummyAgent()
    payload = {
        "prompt": "a cat",
        "provider": "Ollama",
        "model": "gemma:2b",
        "temperature": 0.7,
        "max_tokens": 512,
        "aspect_ratio": "16:9",
        "formatting": "Default",
        "color_guidance": "#ffffff",
        "exclude_items": ""
    }
    response = client.post("/generate-image", json=payload)
    assert response.status_code == 200
    assert response.json()["status"] == "success"
    assert "image_url" in response.json()

def test_generate_image_failure(monkeypatch):
    class DummyAgent:
        class DummySkill:
            async def run(self, **kwargs):
                raise Exception("fail")
        skills = [DummySkill()]
    app.state.agent = DummyAgent()
    payload = {
        "prompt": "a cat",
        "provider": "Ollama",
        "model": "gemma:2b",
        "temperature": 0.7,
        "max_tokens": 512,
        "aspect_ratio": "16:9",
        "formatting": "Default",
        "color_guidance": "#ffffff",
        "exclude_items": ""
    }
    response = client.post("/generate-image", json=payload)
    assert response.status_code == 500
