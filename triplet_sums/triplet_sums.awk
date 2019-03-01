# Algorithm handles duplicates.
# Runtime complexity O(n^2)
# Additional space O(1)
function is_unique_pair(vec, first, first_index) {
    return first == first_index || vec[first] != vec[first-1];
}

function get_pairs(vec, sum, first, last, pairs    ,first_index, count) {
    first_index = first;

    while (first < last)
        if (vec[first] + vec[last] > sum)
            last--;
        else if (vec[first] + vec[last] < sum)
            first++;
        else {
            if (is_unique_pair(vec, first, first_index)) {
                pairs[++count][1] = vec[first];
                pairs[count][2] = vec[last];
            }

            first++;
            last--;
        }

    return count;
}

function is_duplicate_number(vec, i) {
    return i > 1 && vec[i] == vec[i - 1];
}

function get_pairs_for_index(vec, sum, i, last, pairs    ,pair_count) {
    if (is_duplicate_number(vec, i))
        return 0;

    pair_count = get_pairs(vec, sum - vec[i], i + 1, last, pairs);
    return pair_count;
}

function print_unique_triplets(vec, sum    ,last, triplet_count, i, pair_count, pairs) {
    last = asort(vec);

    for (i = 1; i < last - 1; i++) {
        pair_count = get_pairs_for_index(vec, sum, i, last, pairs);
        triplet_count += pair_count;

        for (j = 1; j <= pair_count; j++)
            printf "(%i, %i, %i)", vec[i], pairs[j][1], pairs[j][2];
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

    triplet_count = print_unique_triplets(input, sum);

    if (triplet_count > 0)
        printf "\n";
    else
        print "No triplets can be formed";
}
