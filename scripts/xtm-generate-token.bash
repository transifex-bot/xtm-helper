#!/usr/bin/env bash

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest

function getXtmToken {
  curl --silent \
    --data '{"client":"", "password":"", "userId": 0}' \
    --header "Content-Type: application/json" \
    $XTM_BASE_URL/auth/token | json_pp
}

getXtmToken
