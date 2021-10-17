SELECT sq2.name FROM (
SELECT sq1.n_name as name, MIN(sq1.tot)
FROM (SELECT n_name, SUM(o_totalprice) as tot FROM orders, nation, customer WHERE n_nationkey = c_nationkey AND o_custkey = c_custkey GROUP BY n_name) as sq1
) as sq2
