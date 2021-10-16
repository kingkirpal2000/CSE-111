SELECT COUNT(results.s_suppkey)
FROM (
    SELECT s_suppkey
    FROM orders, supplier, lineitem, customer, nation
    WHERE l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey
    AND c_nationkey = n_nationkey
    AND c_custkey = o_custkey
    AND n_name IN ("GERMANY", "FRANCE")
    GROUP BY s_suppkey
    HAVING COUNT(DISTINCT o_orderkey) < 50
) as results;