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
	uv install

install-dev:
	uv install --dev

test:
	pytest

lint:
	ruff check .

format:
	ruff check . --fix

typecheck:
	mypy src tests

run:
	uv run src/main.py

clean:
	rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
