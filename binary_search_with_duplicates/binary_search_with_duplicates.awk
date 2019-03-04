# Runtime complexity O(log(n))
# Additional space O(1)
@include "binary_search_lib.awk"
$0 !~/^#/{
    key = $1;
    split($2, vec, " ");
    r = asort(vec);
    ind = binary_search(vec, 1, r, key);
    print $0, "=>", ind;
}