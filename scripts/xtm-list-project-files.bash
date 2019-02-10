#!/usr/bin/env bash

# If you are using a sandbox, you may need to change XTM_BASE_URL

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest
URL=$XTM_BASE_URL/projects

# set -x 

curl $URL --config xtm-basic-token.txt --silent | json_pp
