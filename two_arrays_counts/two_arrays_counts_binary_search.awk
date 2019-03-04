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

function print_vector(vec    ,i, vec_length) {
    vec_length = length(vec);
    for (i = 1; i <= vec_length; i++)
        printf "%i ", vec[i];
    printf "\n";
}

BEGIN {i = 1; j = 1;}
$0 !~/^#/{
    if (j == 3) {
        i++;
        j = 1;
    }

    input[i][j][0];
    split($0, input[i][j]);
    j++;
}
END {
    for (i in input) {
        print_vector(input[i][1]);
        print_vector(input[i][2]);
        count_lesser_elements(input[i][1], input[i][2], counts);
        for (j in counts)
            printf "(%i, %i)", j, counts[j];
        printf "\n";
        delete counts;
    }
}