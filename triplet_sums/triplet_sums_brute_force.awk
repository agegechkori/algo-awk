# Algorithm handles duplicates.
# Runtime complexity O(n^2)
# Additional space O(1)
function print_triplets(vec, sum    , i, j, k, array_length, pairs_count) {
    array_length = length(vec);

    for (i = 1; i < array_length - 1; i++)
	for (j = i + 1; j < array_length; j++)
	    for (k = j + 1; k <= array_length; k++)
		if (vec[i] + vec[j] + vec[k] == sum) {
		    if (!((vec[i], vec[j], vec[k]) in pairs)) {
		        pairs[vec[i], vec[j], vec[k]];
		        printf "(%i, %i, %i)", vec[i], vec[j], vec[k];
		        pairs_count++;
		    }
	        }
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
    pairs_count = 0;

    pairs_count = print_triplets(input, sum, i, array_length);

    if (pairs_count > 0)
        printf "\n";
    else
	print "No triplets can be formed";
}
