# Algorithm handles duplicates.
# Runtime complexity O(n^2)
# Additional space O(1)
function get_pairs(vec, sum, first, last, pairs    ,count) {
    while (first < last)
        if (vec[first] + vec[last] > sum)
            last--;
        else if (vec[first] + vec[last] < sum)
            first++;
        else {
            if (vec[first] != vec[first-1]) {
                pairs[++count][1] = vec[first];
                pairs[count][2] = vec[last];
            }

            first++;
            last--;
        }

    return count;
}

function print_triplets(vec, sum, i, array_length    ,current_number, pairs_count) {
    if (vec[i] == vec[i - 1])
        return 0;

    current_number = vec[i];

    vec[i] = "NULL";
    pairs_count = get_pairs(vec, sum - current_number, i + 1, array_length, pairs);
    vec[i] = current_number;

    for (j = 1; j <= pairs_count; j++)
        printf "(%i, %i, %i)", vec[i], pairs[j][1], pairs[j][2];

    return pairs_count;
}

function get_sum_and_array(vec, input_line    ,sum) {
    split(input_line, input);
    sum = input[1];
    delete input[1];
    return sum;
}

$0 !~/^#/{
    sum = get_sum_and_array(input, $0)
    array_length = asort(input);
    input[0] = input[array_length+1] = "NULL";
    pairs_count = 0;

    for (i = 1; i < array_length - 1; i++) {
        pairs_count += print_triplets(input, sum, i, array_length);
    }

    if (pairs_count > 0)
        printf "\n";
    else
    print "No triplets can be formed";
}
