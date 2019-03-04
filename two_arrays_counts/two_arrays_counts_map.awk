# Runtime complexity O(k), where k = max(n,m,M), and n,m - arrays sizes, M - max element of second array
# Additional space O(M-M'), where M' - min element of second array
function count_lesser_elements(vec1, vec2, counts    ,i, min, max, cache) {
    min = max = vec2[1];

    for (i in vec2) {
        max = (vec2[i] > max) ? vec2[i] : max;
        min = (vec2[i] < min) ? vec2[i] : min;
        cache[vec2[i]]++;
    }

    for (i = min; i < max; i++)
        cache[i + 1] = cache[i + 1] + cache[i];

    for (i in vec1) {
        counts[vec1[i]] = (vec1[i] < max) ? cache[vec1[i]] : cache[max];
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