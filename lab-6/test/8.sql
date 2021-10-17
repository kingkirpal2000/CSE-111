SELECT COUNT(DISTINCT(o_custkey))
FROM orders
WHERE o_orderkey NOT IN (
    SELECT DISTINCT(o_orderkey)
    FROM nation, region, supplier, lineitem, orders
    WHERE s_suppkey = l_suppkey
    AND o_orderkey = l_orderkey
    AND r_regionkey = n_regionkey
    AND n_nationkey = s_nationkey
    AND r_name NOT IN ('AMERICA')
);

-- got help from someone