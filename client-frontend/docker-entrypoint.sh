#!/bin/bash
set -eu

cd /openspending-frontend && git pull origin develop

cd /openspending-frontend
yarn install
yarn dev
