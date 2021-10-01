SELECT c_name, COUNT(o_orderkey)
FROM orders, customer, nation
WHERE n_name = "GERMANY"
AND o_custkey = c_custkey
AND c_nationkey = n_nationkey
AND strftime('%Y', o_orderdate) = "1993"
GROUP BY c_name