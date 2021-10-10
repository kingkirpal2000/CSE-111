SELECT p_name
FROM part, supplier, nation, partsupp
WHERE ps_partkey = p_partkey
AND s_nationkey = n_nationkey
AND s_suppkey = ps_suppkey
AND n_name= 'UNITED STATES'
ORDER BY (ps_supplycost * ps_availqty) DESC
LIMIT (SELECT COUNT(DISTINCT ps_partkey)/100
    FROM part, partsupp, supplier, nation
    WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
    AND s_nationkey = n_nationkey AND n_name= 'UNITED STATES')