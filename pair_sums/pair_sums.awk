# Algorithm handles duplicates.
# Runtime complexity O(n log(n))
# Additional space O(1)
function print_pairs(vec, sum,    first, last) {
    first = 1;
    last = asort(vec);

    while (first < last)
        if (vec[first] + vec[last] > sum)
            last--;
        else if (vec[first] + vec[last] < sum)
            first++;
        else {
            if (first == 1 || vec[first] != vec[first-1])
                printf "(%i, %i) ", vec[first], vec[last];

            first++;
            last--;
        }
        printf "\n";
}

$0 !~/^#/{
    split($0, input);
    sum = input[1];
    delete input[1];
    print_pairs(input, sum);
}
