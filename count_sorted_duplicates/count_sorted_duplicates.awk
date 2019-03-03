# Runtime complexity O(n)
# Additional space O(1)
$0 !~/^#/{
    split($0, input);
    i = 1;
    j = i + 1;
    array_length = length(input);

    while (j <= array_length) {
        if (input[i] != input[j])
            input[++i] = input[j];
        j++;
    }
    
    for (k = 1; k <= i; k++)
        printf "%i ", input[k];
    
    printf "\n";
}