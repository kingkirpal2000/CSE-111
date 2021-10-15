SELECT COUNT(result.c_custkey)
FROM
(   SELECT c_custkey
    FROM customer, orders
    WHERE strftime("%Y-%m", o_orderdate) = "1995-11"
    AND c_custkey = o_custkey
    GROUP BY c_custkey
    HAVING COUNT(c_custkey) >= 3
) as result;