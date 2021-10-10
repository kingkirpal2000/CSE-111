SELECT count(DISTINCT s_suppkey)
FROM partsupp, supplier, part
WHERE p_partkey = ps_partkey
AND ps_suppkey = s_suppkey
AND p_type LIKE "%POLISHED%"
AND p_size IN (3,23,36,49);