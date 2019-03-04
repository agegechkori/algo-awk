# Runtime complexity O(k), where k = max(n,m,M-M'), and n,m - arrays sizes, 
# M - max element of second array, M' - min element of second array
# Auxiliary space O(M-M')
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

@include "two_arrays_counts.awk"