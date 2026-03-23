# Cookiecutter Python Template

A modern Python project template with:

- src/ layout
- pyproject.toml
- Makefile
- pytest, ruff, mypy
- optional pyenv setup

## Usage

Ensure you have `uv` installed either using the install script here:

```bash
curl -Ls https://astral.sh/uv/install.sh | sh
```

Or by installing with a tool like Homebrew (MacOS and Linux):

```bash
brew install uv
```

Install the template with:

```bash
uvx cookiecutter gh:ConmyMe/cookiecutter-python
```

## Features

- src/ layout for safe imports
- dev dependencies via pyproject.toml
- Makefile for common tasks

## Options

| Variable | Description |
| -- | -- |
| project_slug | Project directory name |
| python_version | Python version via pyenv |

## Generated Structure

```
my-project/
├── pyproject.toml
├── Makefile
├── src/
└── tests/
```
