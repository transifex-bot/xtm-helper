#!/usr/bin/env bash

# You may need to change the following URL if you are using a sandbox

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest

curl --silent \
    --data '{"client":"Acme", "password":"12345678", "userId": 88}' \
    --header "Content-Type: application/json" \
    $XTM_BASE_URL/auth/token | json_pp

