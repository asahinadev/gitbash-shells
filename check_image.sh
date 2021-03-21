#!/bin/sh

SHFILE=$(basename $0)
LOGFILE=${LOGFILE:-output.log}
DIR=${1:-.}

if [ ! -d "$DIR" ]; then
	file $DIR | tee -a $LOGFILE
	exit 1
fi

ERROR=$( find "$DIR" \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) -size -2k | wc -l )
TOTAL=$( find "$DIR" \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \)           | wc -l )

printf -v RESULT "%30s %4d %4d" $DIR $ERROR $TOTAL
echo $RESULT

if [ $ERROR -ne 0 ]; then
	echo "# 形式不全（ 200 OK かつ HTML形式 )"
	find "$DIR" \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) -size -2k -exec file {} \;
fi
