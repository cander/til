
# DuckDB

While looking through various conference proceedings, I stumbled
upon [DuckDB: an Embeddable Analytical
Database](https://ir.cwi.nl/pub/28800/28800.pdf) which is basically
like a cross between SQLite (an embedded DB) and an OLAP DB. So,
it's in-process and made for big-ish data analysis. It's a
[column-oriented database](https://en.wikipedia.org/wiki/Column-oriented_DBMS), so
it's possible to process data sets in-memory on modest machines
(e.g., a laptop), assuming you don't need to look at all the colums
of all the rows. It's not the sort of thing I do, but I totally get it, and
I think it's brilliant.

There's a [GitHub repo](https://github.com/duckdb/duckdb), the
[DuckDB Organization](https://duckdb.org), and [DuckDB
Labs](https://duckdblabs.com).
