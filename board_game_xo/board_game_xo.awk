function visit(rows, cols, i, order, visited    ,j) {
    if (i in visited[order]) return;
    visited[order][i];

    for (j in rows[i])
        visit(cols, rows, j, !order, visited);
}

function connected_components(rows, cols    ,i, comp_number, visited) {
    visited[0][0];
    visited[1][0];

    for (i in rows) {
        if (!(i in visited[0])) {
            visit(rows, cols, i, 0, visited);
            comp_number++;
        }
    }
    return comp_number;
}

$0 !~/^#/ && $0 !~/^$/{
    count++;
    for (i = 1; i <= NF; i++)
        if ($i == "O") {
            rows[count][i];
            cols[i][count];
        }
    next;
}
$0 ~/^#/ || $0 ~/^$/ {
    count = 0;
    cc = connected_components(rows, cols);
    print "Number of connected components: ", cc;
    delete rows;
    delete cols;
    next;
}
END {
    cc = connected_components(rows, cols);
    print "Number of connected components: ", cc;
}
