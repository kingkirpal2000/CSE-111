SELECT n_name, COUNT(o_custkey)
FROM nation, orders, customer, region
WHERE n_regionkey = 1
AND o_custkey = c_custkey
-- AND c_nationkey = n_nationkey
AND c_nationkey IN
    (
        SELECT n_nationkey
        FROM nation
        WHERE n_regionkey = 1
    )
GROUP BY n_name