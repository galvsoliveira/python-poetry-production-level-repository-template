#!/bin/bash

if [ ! -f pyproject.toml ]; then
    echo 'Creating pyproject.toml ...'
    poetry init
    poetry add --group dev pre-commit
    poetry add --group dev detect-secrets
    poetry add --group dev black
    poetry add --group dev pylint
    poetry add --group dev ruff
    poetry add --group dev yamllint
    poetry add --group dev sqlfluff
    poetry install
fi

if [ ! -f .secrets.baseline ]; then
    echo 'Creating .secrets.baseline ...'
    poetry run detect-secrets scan > .secrets.baseline
fi

if [ ! -f .yamllint ]; then
    echo 'Creating .yamllint ...'
    poetry run cat > .yamllint << EOF
---
extends: default

rules:
  line-length:
    max: 80
    level: warning
EOF
fi

if [ ! -f .pre-commit-config.yaml ]; then
    echo 'Creating .pre-commit-config.yaml ...'
    poetry run cat > .pre-commit-config.yaml << EOF
---
fail_fast: true
repos:
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
        args: ["--baseline", ".secrets.baseline"]
        exclude: package.lock.json
  - repo: https://github.com/adrienverge/yamllint.git
    rev: v1.32.0
    hooks:
      - id: yamllint
        args: [--strict, .yamllint]
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.0.291
    hooks:
      - id: ruff
        args: [--fix, --exit-non-zero-on-fix]
  - repo: https://github.com/psf/black
    rev: 23.9.1
    hooks:
      - id: black
        args: ["--check", "--skip-string-normalization"]
  - repo: local
    hooks:
      - id: pylint
        name: pylint
        entry: poetry run pylint .
        language: system
        types: [python]
  - repo: https://github.com/sqlfluff/sqlfluff
    rev: 2.3.0
    hooks:
      - id: sqlfluff-lint
        name: sqlfluff-lint
        # args: [--dialect, sqlite]
        # additional_dependencies:
        #   ['dbt-sqlite==1.4.0', 'sqlfluff-templater-dbt==2.3.0']
EOF
fi

echo 'Installing dependencies and pre-commit ...'
poetry run git config --local --unset-all core.hooksPath
poetry install
poetry run pre-commit install
poetry run pre-commit autoupdate

echo 'Entering the virtual environment...'
poetry shell
