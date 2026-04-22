#!/usr/bin/env bash

project_slug="{{ cookiecutter.project_slug }}"
python_version="{{ cookiecutter.python_version}}"

echo "Installing python version (if not present). version=$python_version"
pyenv install -s $python_version

if pyenv versions | grep -q "${project_slug}"; then
  pyenv virtualenv-delete "${project_slug}"
fi

pyenv virtualenv "${python_version}" "${project_slug}"

pyenv local "${project_slug}"
