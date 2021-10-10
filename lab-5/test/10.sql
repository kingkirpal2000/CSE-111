SELECT r_name, COUNT(c_custkey)
FROM customer, region, nation,
( SELECT AVG(c_acctbal) AS c FROM customer) bals
LEFT JOIN orders ON c_custkey = o_custkey
WHERE o_custkey is NULL
AND c_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND c_acctbal < bals.c
GROUP BY r_name;