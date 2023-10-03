#!/bin/bash

echo 'Installing Python plugin for asdf...'
asdf plugin add python

echo 'Installing Poetry plugin for asdf...'
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git

# Read the .tool-versions file and install the specified versions
if ! python_version=$(grep python .tool-versions | awk '{print $2}'); then
    echo "Failed to get Python version"
    exit 1
fi

if ! poetry_version=$(grep poetry .tool-versions | awk '{print $2}'); then
    echo "Failed to get Poetry version"
    exit 1
fi

echo "Installing Python ${python_version}..."
asdf install python "${python_version}"
asdf local python "${python_version}"

echo "Installing Poetry ${poetry_version}..."
asdf install poetry "${poetry_version}"
asdf local poetry "${poetry_version}"
