#!/bin/sh
set -e

cd /openspending-backend
git pull origin develop

cd /server-backend
python manage.py makemigrations
python manage.py makemigrations budgetmapper
python manage.py migrate
python manage.py loaddata budgetmapper/fixtures/budget_xlsx_template.json
python manage.py loaddata budgetmapper/fixtures/iconimages.json
python manage.py collectstatic --no-input

rm -rf /static/server-backend
mkdir -p /static/server-backend
cp -a /server-backend/staticfiles/* /static/server-backend

rm -rf /static/server-frontend
mkdir -p /static/server-frontend
cp -a /server-frontend/* /static/server-frontend

rm -rf /static/server-site
mkdir -p /static/server-site
cp -a /server-site/* /static/server-site

rm -rf /static/client-frontend
mkdir -p /static/client-frontend
cp -a /client-frontend/* /static/client-frontend

python manage.py runserver 0.0.0.0:8000
