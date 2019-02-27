{input[++i] = $1}
END{
    first = 1;
    last = asort(input);

    while (first < last) {
        if (input[first] + input[last] > sum) {
            last--;
        } else if (input[first] + input[last] < sum) {
            first++;
        } else {
            printf "(%i, %i)\n", input[first++], input[last--];
        }
    }
}