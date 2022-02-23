#!/bin/sh
set -eu

cd /openspending/backend && git pull origin master

cd /server-backend
python manage.py makemigrations
python manage.py makemigrations budgetmapper
python manage.py migrate
python manage.py loaddata budgetmapper/fixtures/budget_xlsx_template.json
python manage.py loaddata budgetmapper/fixtures/iconimages.json
python manage.py collectstatic --no-input
python manage.py runserver 0.0.0.0:8000
