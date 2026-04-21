PYTHON ?= python
PACKAGE = {{ cookiecutter.package_name }}

.PHONY: help init install install-dev test lint format typecheck clean run venv check venv-delete

help:
	@echo "Targets:"
	@echo "  init         Initialize the project with make"
	@echo "  install      Install package"
	@echo "  install-dev  Install package with dev dependencies"
	@echo "  test         Run tests"
	@echo "  lint         Run ruff checks"
	@echo "  format       Format with ruff"
	@echo "  typecheck    Run mypy"
	@echo "  venv         Setup virtualenv using pyenv"
	@echo "  venv-delete  Delete the venv, if it exists"
	@echo "  run          Run example entrypoint"
	@echo "  clean        Remove caches/build artifacts"

install:
	pip install .

install-dev:
	pip install -e ".[dev]"

test:
	pytest

lint:
	ruff check .

format:
	ruff check . --fix

typecheck:
	mypy $(PACKAGE) tests

check: typecheck lint test

venv:
	pyenv install -s {{ cookiecutter.python_version }}
	pyenv virtualenv {{ cookiecutter.python_version }} {{ cookiecutter.project_slug }}
	pyenv local {{ cookiecutter.project_slug }}

venv-delete:
	pyenv virtualenv-delete {{ cookiecutter.project_slug }}

init: venv install-dev

run:
	python $(PACKAGE)/main.py

clean:
	rm -rf .pytest_cache .mypy_cache .ruff_cache build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
