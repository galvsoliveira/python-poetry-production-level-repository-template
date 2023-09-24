#!/bin/bash

# Removing the virtual environment of the current project
echo 'Removing the virtual environment of the current project...'
poetry env remove "$(poetry run which python)"

echo 'Done. The virtual environment of the current project was removed.'
