#!/bin/sh
# $1 : URL
# $2 : OUTPUT
# $3 : REFERRER

SHFILE=$(basename $0)
USER_AGENT=${USER_AGENT:-"Mozilla/5.0"}
LOGFILE=${LOGFILE:-output.log}
URL=$1
OUTPUT=$2
REFERRER=$3

if [ $# -ne 3 ]; then
	echo "Usage: $0 [URL] [OUTPUT] [REFERRER]" >&2
	exit 1
fi

curl "$URL" \
  -H 'authority: ba.hitomi.la' \
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
  -w "$SHFILE %{url_effective} -o $2 # STATUS: %{http_code} \n" \
  -b "manga-spread=single_page; manga=fit_vertical" \
  -o "$OUTPUT"\
  -e "$REFERRER" \
  | tee -a ${LOGFILE}
