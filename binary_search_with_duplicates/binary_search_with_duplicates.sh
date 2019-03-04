#!/bin/sh

if [ "$1" = "-d" ]; then
    gawk -D -F\, -f binary_search_with_duplicates.awk binary_search_with_duplicates_test_input.txt
else
    awk -F\, -f binary_search_with_duplicates.awk binary_search_with_duplicates_test_input.txt
fi
