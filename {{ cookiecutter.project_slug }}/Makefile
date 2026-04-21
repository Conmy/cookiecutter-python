PYTHON ?= python
PACKAGE = {{ cookiecutter.package_name }}

.PHONY: help install install-dev test lint format typecheck clean run venv

help:
	@echo "Targets:"
	@echo "  install      Install package"
	@echo "  install-dev  Install package with dev dependencies"
	@echo "  test         Run tests"
	@echo "  lint         Run ruff checks"
	@echo "  format       Format with ruff"
	@echo "  typecheck    Run mypy"
	@echo "  venv         Setup virtualenv using pyenv"
	@echo "  run          Run example entrypoint"
	@echo "  clean        Remove caches/build artifacts"

install:
	uv pip install .

install-dev:
	uv pip install -e ".[dev]"

test:
	uv run pytest

lint:
	uv run ruff check .

format:
	uv run ruff check . --fix

typecheck:
	uv run mypy src tests

venv:
	pyenv install -s {{ cookiecutter.python_version }}
	pyenv virtualenv {{ cookiecutter.python_version }} {{ cookiecutter.project_slug }}
	pyenv local {{ cookiecutter.project_slug }}

run:
	uv run $(PACKAGE).main

clean:
	rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
