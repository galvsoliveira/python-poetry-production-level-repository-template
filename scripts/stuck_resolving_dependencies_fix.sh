#!/bin/bash/

poetry cache clear . --all
rm poetry.lock
poetry install
