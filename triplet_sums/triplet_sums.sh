#!/bin/sh

awk -f triplet_sums.awk triplet_sums_test_input.txt | tee solution.txt

awk -f triplet_sums_brute_force.awk triplet_sums_test_input.txt | tee solution_brute_force.txt

difference=$(diff solution.txt solution_brute_force.txt)

if [ "${difference}" ]; then
    echo "Oh, no!"
fi