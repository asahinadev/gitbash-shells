#!/bin/sh

SHFILE=$(basename $0)
URL=${1}
USER_AGENT=${USER_AGENT:-"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45"}

LOGFILE=${LOGFILE:-output.log}

curl "${URL}" \
  -H 'pragma: no-cache' \
  -H 'cache-control: no-cache' \
  -H 'dnt: 1' \
  -H 'accept: image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-dest: image' \
  -H 'accept-language: ja,en;q=0.9,en-GB;q=0.8,en-US;q=0.7' \
  -A "${USER_AGENT}" \
  -s \
  -w "$SHFILE $*  # STATUS: %{http_code} \n" \
  $* \
  | tee -a ${LOGFILE}
