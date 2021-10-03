SELECT * FROM (
    SELECT n_name, COUNT(DISTINCT l_orderkey) as c
    FROM orders, supplier, nation, region, lineitem
    WHERE s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND l_suppkey = s_suppkey
    AND o_orderkey = l_orderkey
    AND o_orderstatus = 'F'
    AND strftime('%Y', o_orderdate) = '1995'
    GROUP BY n_name ) innerQuery
    WHERE innerQuery.c > 50


