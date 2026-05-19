# Developer Guide: Gemma 4 Challenge

## Project Structure

- `webchat_ui.py` — Streamlit UI for prompt-to-image and gallery
- `api_backend.py` — FastAPI backend for image generation
- `agent/` — Backend agent logic (roles, skills, agent entrypoint)
- `config.py` — Pydantic settings management
- `tests/` — Pytest-based tests for settings, API, and UI

## Setup

1. Clone the repo and create a virtual environment:
   ```sh
   uv venv .venv
   source .venv/bin/activate
   ```
2. Install dependencies:
   ```sh
   uv sync
   ```
3. Copy `.env.example` to `.env` and configure as needed.

## Running the App

- Start the backend:
  ```sh
  uvicorn api_backend:app --reload
  ```
- Start the UI:
  ```sh
  streamlit run webchat_ui.py
  ```

## Linting, Type Checking, and Tests

- Lint: `uv run ruff check .`
- Type check: `uv run mypy .`
- Tests: `PYTHONPATH=. uv run pytest`

## Documentation

- Main user guide: `README.md`
- Developer guide: `README_DEV.md`
- Project specification: `SPEC.md`
- Setup instructions: `SETUP.md`

## DevOps

- Use `Makefile` for common tasks (install, lint, typecheck, run, clean)
- Use GitHub Actions or similar for CI (add `.github/workflows/` as needed)
- All code should pass lint, type check, and tests before merging

## Notes

- Some tests require agent dependencies and config to be present.
- For local development, ensure Ollama is running for model discovery.
- For API integration, backend and UI must be running simultaneously.
