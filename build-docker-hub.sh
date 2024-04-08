#!/bin/bash

## CHANGE THE TAG IN LINE 39!!
DOCKER_USER="user"
DOCKER_PASSWORD="pass"

export APPS_JSON='[
  {
    "url": "https://github.com/frappe/erpnext",
    "branch": "version-15"
  },
  {
    "url": "https://github.com/frappe/payments",
    "branch": "version-15"
  },
  {
    "url": "https://github.com/frappe/hrms",
    "branch": "version-15"
  },
  {
    "url": "https://github.com/alyf-de/erpnext_germany",
    "branch": "version-15"
  }
]'

export APPS_JSON_BASE64=$(echo ${APPS_JSON} | base64 -w 0)

docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

docker buildx build \
  --no-cache \
  --build-arg=FRAPPE_PATH=https://github.com/frappe/frappe \
  --build-arg=FRAPPE_BRANCH=version-15 \
  --build-arg=PYTHON_VERSION=3.11.6 \
  --build-arg=NODE_VERSION=18.18.2 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --push \
  --platform linux/arm64/v8,linux/amd64 \
  --tag=timsch12345/erpnext-customized:latest \
  --file=images/custom/Containerfile .
