SELECT COUNT(DISTINCT o_orderkey)
FROM lineitem, orders, ( SELECT c_custkey FROM customer WHERE c_acctbal > 0) table1, (SELECT s_suppkey FROM supplier WHERE s_acctbal < 0) table2
WHERE l_orderkey = o_orderkey
AND o_custkey = table1.c_custkey
AND l_suppkey = table2.s_suppkey