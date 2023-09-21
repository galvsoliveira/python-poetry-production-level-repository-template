#!/bin/bash

# Remova o ambiente virtual do projeto atual
echo 'Removendo o ambiente virtual do projeto atual...'
poetry env remove $(poetry run which python)

echo 'Concluído. O ambiente virtual do projeto atual foi removido.'