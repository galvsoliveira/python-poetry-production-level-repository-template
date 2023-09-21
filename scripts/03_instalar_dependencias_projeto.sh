#!/bin/bash

if [ ! -f pyproject.toml ]; then
    echo 'Creating pyproject.toml ...'
    poetry init
    poetry add --group dev pre-commit
    poetry add --group dev detect-secrets
fi

if [ ! -f .pre-commit-config.yaml ]; then
    echo 'Creating .pre-commit-config.yaml ...'
    pre-commit sample-config > .pre-commit-config.yaml
fi

if [ ! -f .secrets.baseline ]; then
    echo 'Creating .secrets.baseline ...'
    detect-secrets scan > .secrets.baseline
fi

echo 'Installing dependencies and pre-commit ...'
poetry install
poetry run pre-commit install
poetry shell