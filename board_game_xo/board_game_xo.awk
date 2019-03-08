function visit(rows, cols, i, order, visited    ,j, is_visited) {
    visited[order][i];

    for (j in rows[i]) {
        if (!(j in visited[!order])) {
            is_visited = 1; 
            return visit(cols, rows, j, !order, visited);
        }
    }

    if (is_visited == 0) {
        return 1;
    }
}

function connected_components(rows, cols    ,i, comp_number, visited) {
    visited[0][0]; visited[1][0];
    for (i in rows) {
        if (!(i in visited[0]))
            comp_number += visit(rows, cols, i, 0, visited);
    }
    return comp_number;
}

$0 !~/^#/{
    for (i = 1; i <= NF; i++)
        if ($i == "O") {
            rows[NR][i];
            cols[i][NR];
        }
}
END {
    cc = connected_components(rows, cols);
    print "Number of connected components: ", cc;
}