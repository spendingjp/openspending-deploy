#!/bin/bash
set -eu

cd /openspending-backend && git pull origin develop

cd /openspending-backend/frontend
yarn install
yarn dev
