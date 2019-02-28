# Algorithm handles duplicates.
# Runtime complexity O(n^2)
# Additional space O(1)
function get_pairs(vec, sum, first, last    ,pairs) {
    while (first < last)
        if (vec[first] + vec[last] > sum)
            last--;
        else if (vec[first] + vec[last] < sum)
            first++;
        else {
            if (vec[first] != vec[first-1])
                pairs = pairs"|"vec[first]", "vec[last];

            first++;
            last--;
        }
    return substr(pairs, 2, length(pairs));
}

function print_triplets(vec, sum, i, array_length    ,pairs, pairs_array, end_index, current_number) {
    if (vec[i] == vec[i - 1])
        return;

    current_number = vec[i];

    vec[i] = "NULL";
    pairs = get_pairs(vec, sum - current_number, i + 1, array_length);
    vec[i] = current_number;

    split(pairs, pairs_array, "|");
    end_index = length(pairs_array);
    for (j = 1; j <= end_index; j++)
        printf "(%i, %s)", vec[i], pairs_array[j];
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

    for (i = 1; i < array_length - 1; i++) {
        print_triplets(input, sum, i, array_length);
    }
    printf "\n";
}
