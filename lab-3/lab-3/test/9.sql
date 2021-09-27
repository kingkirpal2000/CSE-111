SELECT n_name, count(s_nationkey), MAX(s_acctbal) FROM nation, supplier WHERE s_nationkey = n_nationkey GROUP BY n_name HAVING COUNT(s_nationkey) > 5;