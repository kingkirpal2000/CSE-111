SELECT DISTINCT result.r_name
FROM (
    SELECT r_name
    FROM region, nation, customer, supplier, lineitem
    WHERE c_nationkey = s_nationkey
    AND s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND s_suppkey = l_suppkey
    AND l_extendedprice = (SELECT MIN(l_extendedprice) FROM lineitem)
) AS result