SELECT n_name
FROM nation, customer
WHERE c_nationkey = n_nationkey
GROUP BY n_name HAVING COUNT(c_custkey) = (SELECT MIN(minCusts.c) FROM (SELECT COUNT(c_custkey) as c FROM customer, nation WHERE n_nationkey = c_nationkey GROUP BY n_name) as minCusts);