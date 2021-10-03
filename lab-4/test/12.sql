SELECT n_name, MAX(s_acctbal)
FROM nation, supplier
WHERE n_nationkey = s_nationkey
GROUP BY n_name
HAVING MAX(s_acctbal) > 9000