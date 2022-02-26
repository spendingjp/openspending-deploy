#!/bin/sh
set -e

cd /openspending-backend
git pull origin develop

cd /server-frontend
yarn install
yarn dev
