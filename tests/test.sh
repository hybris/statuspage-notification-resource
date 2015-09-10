#!/usr/bin/env bash

set -e

URL=${url:-https://api.statuspage.io/v1/pages}
OAUTH=${OAUTH:-""}
PAGE=${PAGE:-""}
COMPONENT=${COMPONENT:-""}
STATUS=${STATUS:-""}

DIR="$(dirname "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"

echo -e 'Running \e[33mCheck\e[0m...'
if [ "$(echo "" | $DIR/assets/check | jq 'any')" != "false" ]; then
  echo "failed"
fi


echo -e 'Running \e[33mIn\e[0m...'
if [ "$(echo "" | $DIR/assets/in | jq -r '.version.ref')" -ne "0" ]; then
  echo "failed"
fi

echo -e 'Running \e[33mOut\e[0m...'
payload='
{
  "source": {
    "url": "'${URL}'/'${PAGE}'/components/'${COMPONENT}'.json",
    "oauth": "'${OAUTH}'"
  },
  "params": {
    "status": "'${STATUS}'"
  }
}'

if [ "$(echo $payload | $DIR/assets/out | jq -r '.status')" != "${STATUS}" ]; then
  echo "failed"
fi

echo -e '\e[32mall tests passed!\e[0m'
