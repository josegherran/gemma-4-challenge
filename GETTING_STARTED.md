# Getting Started with Gemma 4 Challenge

This guide will help you set up, run, and use the Gemma 4 Challenge multi-modal webchat application.

## Prerequisites

- Python 3.13+
- [uv](https://github.com/astral-sh/uv) (for dependency management)
- [Ollama](https://ollama.com/) (optional, for local model serving)
- (Optional) Access to Vertex AI, Bedrock, or Azure OpenAI for remote model providers

## 1. Clone the Repository

```bash
git clone <your-fork-or-repo-url>
cd gemma-4-challenge
```

## 2. Create and Activate a Virtual Environment

```bash
uv venv .venv
source .venv/bin/activate
```

## 3. Install Dependencies

```bash
# Install all dependencies from pyproject.toml (recommended):
uv pip install -r <(uv pip compile pyproject.toml)
# Or, if you have a requirements.txt:
uv pip install -r requirements.txt
```

## 4. Configure Environment (Optional)

You can override default settings by creating a `.env` file in the project root:

```
MODEL=gemma-4-base
PROVIDER=Ollama
TEMPERATURE=0.7
MAX_TOKENS=512
COLOR_GUIDANCE=#ffffff
ASPECT_RATIO=16:9
FORMATTING=Default
EXCLUDE_ITEMS=
```

## 5. Start the Backend API

```bash
uv run uvicorn src.api_backend:app --reload
```

The API will be available at [http://localhost:8000](http://localhost:8000).
All generated images are saved to the `generated_images/` folder and served as static files at `/generated_images/`.

## 6. Start the Webchat UI

```bash
uv run streamlit run src/webchat_ui.py
```

The UI will open in your browser at [http://localhost:8501](http://localhost:8501).

## 7. Using the App

- Enter a prompt and adjust settings in the left panel.
- Click **Generate** to create an image with the selected provider/model.
- Each generated image is saved locally and displayed in the chat and gallery.
- Images are always accessible via the backend's `/generated_images/` static route.

## 8. Running Tests

```bash
uv pip install pytest  # if not already installed
uv run pytest
```

## 9. Linting and Type Checking

```bash
uv pip install ruff mypy  # if not already installed
uv run ruff check .
uv run mypy .
```

## Troubleshooting

- Ensure the backend API is running before using the webchat UI.
- For Ollama, make sure the Ollama server is running locally (`ollama serve`).
- If images do not display, ensure the backend is running and accessible at `http://localhost:8000`.
- Check `.env` for correct settings if you encounter configuration issues.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
