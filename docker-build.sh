#!/bin/bash

## If you want to push it to a registry, 
## please 
## 1) change the user credentials
## 2) uncomment line 50
## 3) change the tag in line 49 accordingly

## If you want to build a multiarch image,
## please 
## 1) uncomment line 48 
## 2) change line 40 to docker buildx build
  
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

# docker login -u $DOCKER_USER -p $DOCKER_PASSWORD

docker build \
  --no-cache \
  --build-arg=FRAPPE_PATH=https://github.com/frappe/frappe \
  --build-arg=FRAPPE_BRANCH=version-15 \
  --build-arg=PYTHON_VERSION=3.11.6 \
  --build-arg=NODE_VERSION=18.18.2 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --file=images/custom/Containerfile . \
  # --platform linux/arm64/v8,linux/amd64 \
  --tag=erpnext-customized:latest \
  # --push
