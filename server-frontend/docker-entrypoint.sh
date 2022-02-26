#!/bin/sh
set -e

cd /openspending-backend
git pull origin develop

cd frontend
yarn install
yarn generate --fail-on-error

rm -rf /static/server-frontend
mkdir -p /static/server-frontend
cp -a ./dist/* /static/server-frontend
