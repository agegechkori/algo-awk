function subtree_weight(id, weight) {
    if (!(id in parents)) {
        return weight;
    }

    for (i in parents[id]) {
        weight += subtree_weight(parents[id][i]["id"], parents[id][i]["weight"]);
    }

    return weight;
}

FNR == NR {
    new_ind = ($2 in parents) ? length(parents[$2]) + 1 : 1;
    parents[$2][new_ind]["id"] = $1;
    parents[$2][new_ind]["parent"] = $2;
    parents[$2][new_ind]["weight"] = $3;
    next;
}
{
    print $0 "=>" subtree_weight($1, $3);
}