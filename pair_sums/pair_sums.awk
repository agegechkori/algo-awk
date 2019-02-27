# Algorithm handles duplicates.
# Runtime complexity O(n)
# Additional space O(1)
function print_pairs(vec, sum,    first, last, array_length) {
    first = 1;
    last = asort(vec);
    array_length = last;

    while (first < last)
        if (vec[first] + vec[last] > sum)
            last--;
        else if (vec[first] + vec[last] < sum)
            first++;
        else {
            if (last < array_length && first > 1 && vec[last] != vec[last+1] && vec[first] != vec[first-1])
                printf "(%i, %i) ", vec[first], vec[last];
            else if (last == array_length && first > 1 && vec[first] != vec[first-1])
                printf "(%i, %i) ", vec[first], vec[last];
            else if (first == 1 && last < array_length && vec[last] != vec[last+1])
                printf "(%i, %i) ", vec[first], vec[last];

            first++;
            last--;
        }
        printf "\n";
}

{
    split($0, input);
    sum = input[1];
    delete input[1];
    asort(input);
    print_pairs(input, sum);
}