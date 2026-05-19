
from typing import Optional
from pydantic_settings import BaseSettings
from pydantic import Field


class Settings(BaseSettings):
    model: str = Field(default="gemma-4-base", metadata={"env": "MODEL"})
    temperature: float = Field(
        default=0.7,
        ge=0.0,
        le=1.0,
        metadata={"env": "TEMPERATURE"}
    )
    max_tokens: int = Field(
        default=512,
        gt=0,
        metadata={"env": "MAX_TOKENS"}
    )
    provider: str = Field(default="Ollama", metadata={"env": "PROVIDER"})
    color_guidance: Optional[str] = Field(default="#ffffff", metadata={"env": "COLOR_GUIDANCE"})
    aspect_ratio: Optional[str] = Field(default="16:9", metadata={"env": "ASPECT_RATIO"})
    formatting: Optional[str] = Field(default="Default", metadata={"env": "FORMATTING"})
    exclude_items: Optional[str] = Field(default="", metadata={"env": "EXCLUDE_ITEMS"})

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
