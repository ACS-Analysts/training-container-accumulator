#!/usr/bin/env sh
pipenv run gunicorn --chdir /app/src accumulator:app -b 0.0.0.0:8000
