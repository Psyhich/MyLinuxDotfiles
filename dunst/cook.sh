#!/bin/bash

function extract_color() {
	echo "#$(xrdb -query all | grep "$1" | head -n 1 | cut -d '#' -f 2)"
}

BG=$(extract_color "color2")
FG=$(extract_color "foreground")

IN_FILE="$1"
OUT_FILE="$2"

if [ ! -f "$IN_FILE" ]; then 
	printf "Input file doesn't exist!\n"
	exit -1
fi

rm -f "$OUT_FILE"
cp -f "$IN_FILE" "$OUT_FILE"

sed -i "s/\$bg/\\$BG/" "$OUT_FILE"
sed -i "s/\$fg/\\$FG/" "$OUT_FILE"
