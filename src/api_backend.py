

from fastapi import FastAPI, HTTPException
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from agent.agent_backend import create_agent
from typing import Any

app = FastAPI(title="Gemma 4 Challenge API")

# Mount static directory for generated images
import os
static_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "generated_images"))
os.makedirs(static_dir, exist_ok=True)
app.mount("/generated_images", StaticFiles(directory=static_dir), name="generated_images")

class ImageRequest(BaseModel):
    prompt: str
    provider: str
    model: str
    temperature: float = 0.7
    max_tokens: int = 512
    aspect_ratio: str = "16:9"
    formatting: str = "Default"
    color_guidance: str = "#ffffff"
    exclude_items: str = ""

@app.on_event("startup")
async def startup_event() -> None:
    app.state.agent = await create_agent()  # type: ignore[reportUnknownMemberType]

@app.post("/generate-image")
async def generate_image(req: ImageRequest) -> dict[str, Any]:
    agent = app.state.agent
    # Call the agent's skill (simulate async image generation)
    try:
        result = await agent.skills[0].run(
            prompt=req.prompt,
            provider=req.provider,
            model=req.model,
            temperature=req.temperature,
            max_tokens=req.max_tokens,
            aspect_ratio=req.aspect_ratio,
            formatting=req.formatting,
            color_guidance=req.color_guidance,
            exclude_items=req.exclude_items
        )
        return dict(result) if isinstance(result, dict) else {"result": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
