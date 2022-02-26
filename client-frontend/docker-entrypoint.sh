#!/bin/sh
set -e

cd /openspending-frontend
git pull origin develop

cd /client-frontend
yarn install
yarn dev
