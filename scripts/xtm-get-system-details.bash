#!/usr/bin/env bash

BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest
URL=$BASE_URL/system

set -x

curl $URL \
  --config xtm-access-token.txt \
  --silent | json_pp
