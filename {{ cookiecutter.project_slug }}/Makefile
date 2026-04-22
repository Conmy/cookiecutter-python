PYTHON ?= python
PACKAGE = {{ cookiecutter.package_name }}
_PYTHON_VERSION = {{ cookiecutter.python_version }}

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
	uv pip install -e . --group dev

lint:
	uv run ruff check .

typecheck:
	uv run mypy $(PACKAGE) tests

unit:
	uv run pytest

test: lint typecheck unit

format:
	uv run ruff check . --fix

venv:
	uv venv --python $(_PYTHON_VERSION)

init: venv install

run:
	uv run $(PACKAGE)/main.py

clean:
	rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
