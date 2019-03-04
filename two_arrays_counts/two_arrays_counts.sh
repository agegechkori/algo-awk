#!/bin/sh

AWK_SCRIPT="two_arrays_counts.awk"
if [ "$1" = "-b" -o "$2" = "-b" ]; then
    AWK_SCRIPT="two_arrays_counts_binary_search.awk"
fi

if [ "$1" = "-d" -o "$2" = "-d" ]; then
    echo "Debugging script: ${AWK_SCRIPT}"
    gawk -D -f ${AWK_SCRIPT} two_arrays_counts_test_input.txt
else
    echo "Running script: ${AWK_SCRIPT}"
    awk -f ${AWK_SCRIPT} two_arrays_counts_test_input.txt
fi
