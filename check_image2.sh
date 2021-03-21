#!/bin/sh

EXEC_DIR=$(dirname $0)

find $DIR -maxdepth 1 -mindepth 1 -type d | while read SUBDIR
do 
	${EXEC_DIR}/check_image.sh "$SUBDIR"
done
