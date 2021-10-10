SELECT o_orderpriority, COUNT(*)
FROM orders
WHERE strftime('%Y-%m', o_orderdate) BETWEEN '1997-10' AND '1997-12'
AND EXISTS ( SELECT * FROM lineitem WHERE l_orderkey = o_orderkey AND l_receiptdate < l_commitdate )
GROUP BY o_orderpriority
ORDER BY o_orderpriority;