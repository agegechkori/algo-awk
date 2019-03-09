function get_first_point(points, rows, i    ,j) {
    for (j in rows[i]) {
        points[i][j];
        return;
    }
}

function print_points(points    ,i, j) {
    for (i in points)
        for (j in points[i])
            printf "(%i, %i)", i, j;
    printf "\n";
}

function pretty_print_points(points, N, M    ,i, j) {
    for (i = 1; i <= N; i++) {
        line = "";
        for (j = 1; j <= M; j++)
            line = line ((i in points && j in points[i]) ? "O" : "X");
        print line;
    }
}

function visit(rows, cols, i, order, visited    ,j) {
    if (i in visited[order]) return;
    visited[order][i];

    for (j in rows[i])
        visit(cols, rows, j, !order, visited);
}

function connected_components(rows, cols, points    ,i, comp_number, visited) {
    visited[0][0];
    visited[1][0];

    for (i in rows)
        if (!(i in visited[0])) {
            visit(rows, cols, i, 0, visited);
            comp_number++;
            get_first_point(points, rows, i);
        }

    return comp_number;
}

$0 !~/^#/ && $0 !~/^$/{
    count++;
    columns_number = NF;
    for (i = 1; i <= NF; i++)
        if ($i == "O") {
            rows[count][i];
            cols[i][count];
        }
    next;
}
$0 ~/^#/ || $0 ~/^$/ {
    cc = connected_components(rows, cols, points);
    print "Number of connected components: ", cc;
    print_points(points);
    pretty_print_points(points, count, columns_number);
    count = 0;
    delete rows;
    delete cols;
    delete points;
    next;
}
END {
    cc = connected_components(rows, cols, points);
    print "Number of connected components: ", cc;
    print_points(points);
    pretty_print_points(points, count, columns_number);
}
