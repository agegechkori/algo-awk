#!/bin/sh

awk -v RS=" " -v sum=7 -f pair_sums.awk pair_sums_test_input.txt
