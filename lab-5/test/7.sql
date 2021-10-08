SELECT o_orderpriority, count(o_orderkey)
FROM orders, lineitem
WHERE o_orderkey = l_orderkey
AND DATE(l_receiptdate) > DATE(l_commitdate)
AND strftime('%Y', o_orderdate) = '1997'
GROUP BY o_orderpriority;