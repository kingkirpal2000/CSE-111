SELECT COUNT(c_custkey)
FROM customer
WHERE c_custkey NOT IN (
    SELECT c_custkey
    FROM customer, nation, region
    WHERE c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name IN ("EUROPE", "AFRICA", "ASIA")
    GROUP BY c_custkey
)
