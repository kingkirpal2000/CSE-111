SELECT c_name, SUM(o_totalprice)
FROM customer, nation, orders
WHERE c_custkey = o_custkey
AND c_nationkey = n_nationkey
AND n_name = 'FRANCE'
AND o_orderdate >= '1995-01-01'
AND o_orderdate <= '1995-12-31'
GROUP BY c_name;
