SELECT s_name, c_name, MIN(o_totalprice)
FROM supplier, customer, lineitem, orders
WHERE c_custkey = o_custkey
AND o_orderstatus = 'F'
AND s_suppkey = l_suppkey
AND l_orderkey = o_orderkey
