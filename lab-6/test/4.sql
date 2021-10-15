SELECT COUNT(result.s_suppkey)
FROM (
    SELECT s_suppkey
    FROM supplier, partsupp, part, nation
    WHERE s_suppkey = ps_suppkey
    AND ps_partkey = p_partkey
    AND n_nationkey = s_nationkey
    AND n_name = "UNITED STATES"
    GROUP BY s_suppkey
    HAVING COUNT(DISTINCT p_partkey) >= 40
) as result;