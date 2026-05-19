# Makefile for Gemma 4 Challenge

.PHONY: install lint typecheck run clean

install:
	uv sync

lint:
	ruff check .
	ruff format --check .
	ruff check --fix .

format:
	ruff format .
	ruff check --fix .
	ruff check .
	ruff format --check .
	ruff check --show-source .
	ruff check --output-format=github .
	ruff format --diff .
	ruff format --check .
	ruff check --fix .


typecheck:
	mypy .

run:
	streamlit run app.py

clean:
	rm -rf .venv __pycache__ .mypy_cache .ruff_cache
