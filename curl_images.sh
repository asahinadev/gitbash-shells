#!/bin/sh

SHFILE=$(basename $0)
USER_AGENT=${USER_AGENT:-"Mozilla/5.0"}
LOGFILE=${LOGFILE:-output.log}

curl \
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
