#!/bin/sh
set -e

#echo "pwd:$PWD"
#echo "#1:$1"
#echo "#2:$ROOT_DIR"
#echo "[ COMMAND LIST ]"

CMD_LIST=$(cat "schemes/$1.schm" | sed '/^$/d; /^\s*#/d; s/^\s*//g; s/\s\+/./g')

RES=""
for item in $CMD_LIST; do
	RES="$RES $item"
done
echo "$RES"
