#!/bin/sh

AWK_SCRIPT="two_sorts.awk"
if [ "$1" = "-b" -o "$2" = "-b" ]; then
    AWK_SCRIPT="sort_binary_search.awk"
elif [ "$1" = "-m" -o "$2" = "-m" ]; then
    AWK_SCRIPT="map_based.awk"
fi

if [ "$1" = "-d" -o "$2" = "-d" ]; then
    echo "Debugging script: ${AWK_SCRIPT}"
    gawk -D -f ${AWK_SCRIPT} two_arrays_counts_test_input.txt
else
    echo "Running script: ${AWK_SCRIPT}"
    awk -f ${AWK_SCRIPT} two_arrays_counts_test_input.txt
fi
