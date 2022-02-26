#!/bin/sh
set -e

cd /openspending-frontend
git pull origin develop

cd /client-frontend
yarn install
yarn generate --fail-on-error

rm -rf /static/client-frontend
mkdir -p /static/client-frontend
cp -a ./dist/* /static/client-frontend
