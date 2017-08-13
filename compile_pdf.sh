#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BUILD_DIR=$SCRIPTPATH/build

set -e

if [ -z "$1" ]; then
	echo "A .tex file must be specified"
	exit 1
elif ! [ -f "$1" ]; then
	echo "$1 is not a file"
	exit 1
elif ! (file --mime-type "$1" | grep -q tex$); then
	echo "$1 is not a .tex file"
	exit 1
fi

FNAME=$(basename "$1")

if [ -z "$2" ]; then
	OUTPUT_DIR=$BUILD_DIR/${FNAME%%.*}
elif ![ -d "$2" ]; then
	echo "Output directory, $2, must be a directory"
	exit 1
else
	OUTPUT_DIR=$BUILD_DIR/$2
fi

echo "$SCRIPT - Settings"
echo "	Input: $1"
echo "	Output Directory: $OUTPUT_DIR"
echo

if ! [ -e "$OUTPUT_DIR" ]; then
	mkdir -p $OUTPUT_DIR
fi

cd $(dirname "$1")

pdflatex -halt-on-error -output-directory $OUTPUT_DIR $FNAME

cd $SCRIPTPATH
