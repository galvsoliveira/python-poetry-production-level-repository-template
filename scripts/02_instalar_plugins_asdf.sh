#!/bin/bash

# Instalação do plugin Python para asdf
echo 'Instalando o plugin Python para asdf...'
asdf plugin add python

# Instalação do plugin Poetry para asdf
echo 'Instalando o plugin Poetry para asdf...'
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git

# Leitura das versões do Python e do Poetry do arquivo .tool-versions
python_version=$(grep python .tool-versions | awk '{print $2}')
poetry_version=$(grep poetry .tool-versions | awk '{print $2}')

# Instalação das versões do Python e do Poetry especificadas no arquivo .tool-versions
echo "Instalando Python $python_version..."
asdf install python $python_version
asdf local python $python_version

echo "Instalando Poetry $poetry_version..."
asdf install poetry $poetry_version
asdf local poetry $poetry_version