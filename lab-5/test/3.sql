SELECT MIN(l_discount)
FROM lineitem, orders
WHERE l_orderkey = o_orderkey
AND l_discount > (SELECT AVG(l_discount) FROM lineitem)
AND strftime('%Y %m', o_orderdate) = "1996 10"