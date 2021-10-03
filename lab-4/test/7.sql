SELECT n_name, o_orderstatus, count(o_orderkey)
FROM nation, orders, region, customer
WHERE r_regionkey = n_regionkey
AND r_name = "AMERICA"
AND o_custkey = c_custkey
AND n_nationkey = c_nationkey
GROUP BY n_name, o_orderstatus