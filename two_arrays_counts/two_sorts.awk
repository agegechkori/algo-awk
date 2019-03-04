# Runtime complexity O(k log(k)), where k = max(n,m), and n,m - arrays sizes
# Additional space depends on the sorting algorithm
function count_lesser_elements(vec1, vec2, counts    ,i, j, k, vec_length1, vec_length2) {
    vec_length1 = asort(vec1);
    vec_length2 = asort(vec2);

    i = 1;
    j = 1;
    while (j <= vec_length2 && i <= vec_length1) {
        if (vec1[i] < vec2[j])
            counts[vec1[i++]] = j - 1;
        else j++;
    }

    for (k = i; k <= vec_length1; k++) {
        counts[vec1[k]] = j - 1;
    }
}

@include "two_arrays_counts.awk"