SELECT COUNT(DISTINCT s_suppkey)
FROM supplier , partsupp, part, nation
WHERE ps_suppkey = s_suppkey
AND ps_partkey = p_partkey
AND s_nationkey = n_nationkey
AND p_retailprice = (SELECT MAX(p_retailprice) FROM part);