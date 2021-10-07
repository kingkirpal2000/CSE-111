SELECT nation.n_name, t1.cnt1, t2.cnt2
FROM (
    SELECT n_name, COUNT(c_custkey) AS cnt1
    FROM customer, nation, region
    WHERE c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = "AFRICA"
    GROUP BY n_nationkey
)t1, (
    SELECT n_name, COUNT(s_suppkey) AS cnt2
    FROM supplier, nation, region
    WHERE s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = "AFRICA"
    GROUP BY n_nationkey
)t2, nation
WHERE nation.n_name = t1.n_name
AND nation.n_name = t2.n_name








