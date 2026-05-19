# Gemma 4 Challenge: Multi-modal Webchat Application

## Features

This application is an interactive webchat that leverages Gemma 4 multi-modal AI models to generate images. Users can enter prompts in a chat interface, configure image settings related to receive AI-generated images.
The principal UI (right panel) includes:

- **Prompt input**: Type a description (e.g., "a mountain-climbing koala") to generate a unique image.
- **Aspect ratio and layout controls**: Choose between landscape and different aspect ratios (e.g., 16:9,3:2,4:3:5:4) for your image.
- **Formatting options**: Adjust the style and composition of the generated image with various formatting settings(e.g., landscape, portrait, square).
- **Color Guidance**: Optionally guide the color palette of the generated image. Use a color picker to select specific colors or let the model choose based on your prompt.
- **Exclude items**: Specify elements to exclude from the image for more control.
- **Gallery**: Browse previously generated images, stored for easy access.
- **Generate button**: Instantly create new images based on your prompt and settings.

The assistant is powered by Gemma 4 models, enabling creative and high-quality image generation from natural language prompts. The interface is designed for ease of use, with clear controls and a modern, visually engaging layout.
All Gemma 4 models are consumed through local Ollama, Vertex AI, Bedrock and Azure OpenAI APIs, ensuring fast and efficient image generation.

### Parameters

All parameters are optional (have a default value), but can be used to customize the image generation process (left panel):

- `provider`: The service provider to use for image generation (e.g., Ollama, Vertex AI, Bedrock, Azure OpenAI).
- `model`: The specific Gemma 4 model to use for generating responses. It is generated dynamically depending on the provider. Depending on the model chosen, the output may vary in style, quality, and content. For example, some models may be better at generating photorealistic images, while others may excel at artistic or abstract styles.
- `temperature`: Controls the randomness of the output. Higher values (e.g., 0.8) make the output more random, while lower values (e.g., 0.2) make it more focused and deterministic.

## Tech Stack

- Language: Python 3.13
- Webchat UI: Streamlit, streamlit-extras, streamlit-components
- API: FastAPI (for async and REST endpoints)
- Image processing: Pillow
- Image generation: Gemma 4 models (OpenAI, via Ollama, Vertex AI, Bedrock, Azure OpenAI)
- Agent SDK: Strands agents SDK, strands-agents-tools, strands-agents-builder
- Async libraries: aiohttp, httpx, asyncio, anyio, uvicorn
- Testing: pytest, pytest-asyncio, httpx
- Linting/Type checking: ruff, mypy
- Documentation: mkdocs

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
