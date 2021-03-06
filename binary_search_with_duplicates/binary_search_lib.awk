# Runtime complexity O(log(n))
# Additional space O(1)
function binary_search(vec, l, r, key) {
    if (key < vec[l])
        return -1;
    if (key > vec[r])
        return -r - 1;

    while (r - l > 1) {
        m = int((l + r) / 2);
        if (vec[m] <= key)
            l = m;
        else
            r = m;
    }
    if (vec[l] == key) {
        return l;
    }
    return -r;
}
