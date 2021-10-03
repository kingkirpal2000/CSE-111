SELECT COUNT(DISTINCT o_clerk)
FROM supplier, lineitem, nation, orders
WHERE n_name = "UNITED STATES"
AND o_orderkey = l_orderkey
AND n_nationkey = s_nationkey
AND l_suppkey = s_suppkey