# Runtime complexity O(n)
# Additional space O(n)
function subtree_weight(id, weight) {
    if (id in weight_cache)
        return weight_cache[id];

    if (!(id in parents))
        return weight;

    for (child_id in parents[id])
        weight += subtree_weight(child_id, parents[id][child_id]);

    weight_cache[id] = weight;
    return weight;
}

BEGIN { weight_cache["empty"] }
FNR == NR { parents[$2][$1] = $3; next }
{ print $0 "=>" subtree_weight($1, $3) }