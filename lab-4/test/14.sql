SELECT table1.r_name, table2.r_name, MAX(o_totalprice)
FROM ( SELECT * FROM supplier, region, lineitem, nation WHERE s_suppkey = l_suppkey AND s_nationkey = n_nationkey AND r_regionkey = n_regionkey) table1, (SELECT * FROM region, nation, customer, orders WHERE n_regionkey = r_regionkey AND o_custkey = c_custkey AND c_nationkey = n_nationkey) table2
WHERE o_orderkey = l_orderkey
GROUP BY table1.r_name, table2.r_name