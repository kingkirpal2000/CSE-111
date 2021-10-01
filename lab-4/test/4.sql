SELECT s_name, COUNT(p_name)
FROM partsupp, supplier, part, nation
WHERE ps_suppkey = s_suppkey
AND s_nationkey = n_nationkey
AND p_partkey = ps_partkey
AND p_size < 20
AND n_name = "CANADA"
GROUP BY s_name