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