#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Make migrations
python manage.py makemigrations --no-input

# Apply migrations
python manage.py migrate

# Create superuser if the environment variable is set
if [[ $CREATE_SUPERUSER ]]; then
    python manage.py createsuperuser --no-input || true
fi
