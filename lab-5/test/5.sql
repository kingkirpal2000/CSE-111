SELECT s_name, p_size, MIN(ps_supplycost)
FROM supplier, partsupp, part, nation, region
WHERE p_type LIKE '%STEEL'
AND p_partkey = ps_partkey
AND ps_suppkey = s_suppkey
AND s_nationkey = n_nationkey
AND n_regionkey = r_regionkey
AND r_name = "ASIA"
GROUP BY p_size

-- Dont know why it says its wrong, result looks right to me