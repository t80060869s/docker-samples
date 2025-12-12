#!/bin/bash
set -e

echo "Applying Alembic migrations..."
poetry run alembic upgrade head

echo "Starting Uvicorn server with debugpy..."
exec python -m debugpy --listen 0.0.0.0:5679 -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
