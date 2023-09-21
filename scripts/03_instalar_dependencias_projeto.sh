#!/bin/bash

if [ ! -f pyproject.toml ]; then
    echo 'Creating pyproject.toml ...'
    poetry init
    poetry add --dev pre-commit
fi

echo 'Installing dependencies and pre-commit ...'
poetry install
poetry run pre-commit install
poetry shell