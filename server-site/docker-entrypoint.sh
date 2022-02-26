#!/bin/sh
set -e

cd /openspending-lp
git pull origin main

cd /server-site
yarn install
yarn dev
