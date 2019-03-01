# Brute force algorithm that handles duplicates.
# Runtime complexity O(n^3)
# Additional space O(1)
function is_unique_triplet(a, b, c, sum, triplets) {
    if (a + b + c != sum)
        return 0;

    if ((a, b, c) in triplets)
        return 0;

    return 1;
}

function print_unique_triplets(vec, sum    ,i, j, k, array_length, triplet_count, triplets) {
    array_length = asort(vec);

    for (i = 1; i < array_length - 1; i++)
        for (j = i + 1; j < array_length; j++)
            for (k = j + 1; k <= array_length; k++)
                if (is_unique_triplet(vec[i], vec[j], vec[k], sum, triplets)) {
                    triplets[vec[i], vec[j], vec[k]];
                    triplet_count++;
                    printf "(%i, %i, %i)", vec[i], vec[j], vec[k];
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
