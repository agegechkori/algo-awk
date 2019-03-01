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

function get_pairs_for_index(vec, sum, i, array_length, pairs    ,current_number, triplet_count) {
    if (vec[i] == vec[i - 1])
        return 0;

    current_number = vec[i];
    vec[i] = "NULL";

    triplet_count = get_pairs(vec, sum - current_number, i + 1, array_length, pairs);

    vec[i] = current_number;

    return triplet_count;
}

function print_unique_triplets(vec, sum    ,array_length, triplet_count, i, pair_count, pairs) {
    array_length = asort(vec);
    vec[0] = vec[array_length + 1] = "NULL";

    for (i = 1; i < array_length - 1; i++) {
        pair_count = get_pairs_for_index(vec, sum, i, array_length, pairs);
        for (j = 1; j <= pair_count; j++)
            printf "(%i, %i, %i)", vec[i], pairs[j][1], pairs[j][2];
        triplet_count += pair_count;
    }

    return triplet_count;
}

function get_sum_and_array(vec, input_line    ,sum) {
    split(input_line, vec);
    sum = vec[1];
    delete vec[1];
    return sum;
}

$0 !~/^#/{
    sum = get_sum_and_array(input, $0);
    triplet_count = 0;

    triplet_count = print_unique_triplets(input, sum);

    if (triplet_count > 0)
        printf "\n";
    else
        print "No triplets can be formed";
}
