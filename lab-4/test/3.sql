SELECT n_name, COUNT(o_orderkey)
FROM nation, orders, customer, region
WHERE n_regionkey = r_regionkey
AND r_regionkey = 1
AND o_custkey = c_custkey
AND c_nationkey = n_nationkey
GROUP BY n_name