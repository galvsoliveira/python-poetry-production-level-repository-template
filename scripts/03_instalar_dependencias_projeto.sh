#!/bin/bash

if [ ! -f pyproject.toml ]; then
    echo 'Creating pyproject.toml ...'
    poetry init
    poetry add --group dev pre-commit
    poetry add --group dev detect-secrets
    poetry add --group dev black
    poetry add --group dev pylint
    poetry install
fi

if [ ! -f .pre-commit-config.yaml ]; then
    echo 'Creating .pre-commit-config.yaml ...'
    poetry run pre-commit sample-config > .pre-commit-config.yaml
fi

if [ ! -f .secrets.baseline ]; then
    echo 'Creating .secrets.baseline ...'
    poetry run detect-secrets scan > .secrets.baseline
fi

echo 'Installing dependencies and pre-commit ...'
poetry install
poetry run pre-commit install

echo 'Entering the virtual environment...'
poetry shell
