PYTHON ?= python
PACKAGE = {{ cookiecutter.package_name }}

.PHONY: help init install test lint format typecheck clean run venv check unit

help:
	@echo "Targets:"
	@echo "  init         Initialize the project with make"
	@echo "  install      Install package"
	@echo "  test         Run tests"
	@echo "  unit         Run unit tests"
	@echo "  lint         Run ruff checks"
	@echo "  format       Format with ruff"
	@echo "  typecheck    Run mypy"
	@echo "  venv         Setup virtualenv using pyenv"
	@echo "  run          Run example entrypoint"
	@echo "  clean        Remove caches/build artifacts"

install:
	uv pip install -e ".[dev]"

lint:
	uv run --active ruff check .

typecheck:
	uv run --active mypy $(PACKAGE) tests

unit:
	uv pytest

test: lint typecheck unit

format:
	uv run --active ruff check . --fix

venv:
	./scripts/clean_venv.sh

init: venv install

run:
	python $(PACKAGE)/main.py

clean:
	rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
