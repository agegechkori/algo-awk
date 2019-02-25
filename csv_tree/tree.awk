function copy_array(src, dest,  array_index) {
    if (isarray(dest)) {
        for (array_index in src)
            dest[array_index] = src[array_index];
        delete dest[0];
    }
}

function create_node(n, id, parent, weight) {
    n["id"] = id;
    n["parent"] = parent;
    n["weight"] = weight;
}

function subtree_weight(node,  id, weight) {
    id = node["id"];
    weight = node["weight"];

    if (!(id in parents)) {
        return weight;
    }

    for (i in parents[id]) {
        weight += subtree_weight(parents[id][i]);
    }

    return weight;
}

FNR == NR {
    create_node(n, $1, $2, $3);
    new_ind = ($2 in parents) ? length(parents[$2]) + 1 : 1;
    parents[$2][new_ind][0];
    copy_array(n, parents[$2][new_ind]);
    next;
}
{
    create_node(n, $1, $2, $3);
    print $0 "=>" subtree_weight(n);
}