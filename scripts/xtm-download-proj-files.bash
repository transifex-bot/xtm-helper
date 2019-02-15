#!/usr/bin/env bash

BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest

if [ "$#" -ne 1 ]; then
  usage
  exit 
fi

URL=$BASE_URL/projects/$1/files/download

function usage
{
  echo "This script requires one parameter, the project id."
}

function download_project()
{
  set -x

  curl $URL \
    --include \
    --get \
    -d 'fileScope=JOB' -d 'fileType=TARGET' \
    --config xtm-access-token.txt \
    --output $1.zip
}

download_project $1

ls -asl $1.zip

echo
