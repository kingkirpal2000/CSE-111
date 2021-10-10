SELECT region.r_name, COUNT(supplier.s_suppkey)
FROM supplier, region, nation, ( SELECT r_regionkey, avg(s_acctbal) as AR FROM region, supplier, nation WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey GROUP by r_name ) as averageR
WHERE supplier.s_nationkey = nation.n_nationkey
AND averageR.r_regionkey = region.r_regionkey
AND nation.n_regionkey = region.r_regionkey
AND supplier.s_acctbal < averageR.AR
GROUP BY region.r_name;
