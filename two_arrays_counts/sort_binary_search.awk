# Runtime complexity O(max(n,m) log(m)), where n,m - size of the first and second arrays, acordingly.
# Additional space depends on the sorting algorithm
@include "../binary_search_with_duplicates/binary_search_lib.awk"

function count_lesser_elements(vec1, vec2, counts    ,i, j, k, vec_length1, vec_length2) {
    vec_length1 = length(vec1);
    vec_length2 = asort(vec2);

    for (i = 1; i <= vec_length1; i++) {
        j = binary_search(vec2, 1, vec_length2, vec1[i]);

        if (j < 0) {
            j = -j;
            if (j > vec_length2)
                break;
        } else
            j++;

        counts[vec1[i]] = j - 1;
    }

    for (k = i; k <= vec_length1; k++) {
        counts[vec1[k]] = j - 1;
    }
}

@include "two_arrays_counts.awk"