#!/usr/bin/env bash

# you may need to change the following URL 
# if you are using a sandbox

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest

function uploadFiles() {
  set -x

  curl --silent \
    --config xtm-access-token.txt \
    --form 'files[0].file=@./testfile1.txt' \
    --form 'files[1].file=@./testfile2.txt' \
    --form 'files[2].file=@./testfile3.txt' \
    --form 'matchType=MATCH_NAMES' \
    "$BASE_XTM_URL/projects/$1/files/upload" | json_pp
}

uploadFiles 1234

echo
