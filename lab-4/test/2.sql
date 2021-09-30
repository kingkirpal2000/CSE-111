SELECT r_name, COUNT(s_suppkey)
FROM nation, region, supplier
WHERE r_regionkey = n_regionkey
AND s_nationkey = n_nationkey
GROUP BY r_name

