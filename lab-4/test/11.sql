SELECT r_name, s_name, MAX(s_acctbal)
FROM supplier, region, nation
WHERE s_nationkey = n_nationkey
AND r_regionkey = n_regionkey
GROUP BY r_name