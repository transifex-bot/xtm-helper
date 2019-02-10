#!/usr/bin/env bash

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest
URL=$XTM_BASE_URL/projects

# set -x 

curl $URL --config xtm-basic-token.txt --silent | json_pp
