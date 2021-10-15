SELECT COUNT(result.p_partkey)
FROM (
    SELECT p_partkey
    FROM part, supplier, partsupp, nation
    WHERE s_suppkey = ps_suppkey
    AND ps_partkey = p_partkey
    AND n_nationkey = s_nationkey
    AND n_name = "UNITED STATES"
    GROUP BY p_partkey
    HAVING COUNT(DISTINCT s_suppkey) = 2
) as result