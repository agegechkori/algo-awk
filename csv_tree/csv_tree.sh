#!/bin/sh

INPUT_FILE=$1
SCRIPT_FILE="tree.awk"

awk -F\, -f ${SCRIPT_FILE} ${INPUT_FILE} ${INPUT_FILE}