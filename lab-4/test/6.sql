SELECT s_name, o_orderpriority, COUNT(DISTINCT p_partkey)
FROM supplier, orders, part, nation, partsupp, lineitem
WHERE s_nationkey = n_nationkey
AND p_partkey = l_partkey
AND l_orderkey = o_orderkey
AND l_suppkey = ps_suppkey
AND ps_suppkey = s_suppkey
AND n_name = "CANADA"
GROUP BY s_name, o_orderpriority