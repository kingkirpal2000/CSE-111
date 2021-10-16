SELECT DISTINCT part.p_name
FROM lineitem, part, (
    SELECT p_partkey
    FROM orders, customer, nation, region, lineitem, part
    WHERE c_custkey = o_custkey
    AND o_orderkey = l_orderkey AND l_partkey = p_partkey
    AND c_nationkey = n_nationkey AND n_regionkey = r_regionkey
    AND r_name = 'AMERICA'
) AS result1, (
    SELECT p_partkey
    FROM supplier, nation, region, lineitem, part
    WHERE p_partkey = l_partkey
    AND l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey AND n_regionkey = r_regionkey
    AND r_name = 'ASIA'
    GROUP BY p_partkey
    HAVING COUNT(*) = 3
) AS result2
WHERE l_partkey = result2.p_partkey
AND l_partkey = result1.p_partkey
AND l_partkey = part.p_partkey