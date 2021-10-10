SELECT p_name
FROM part,( SELECT MIN(l_extendedprice*(1-l_discount)) AS min_val, l_partkey FROM lineitem WHERE l_shipdate > '1996-10-02' ORDER BY l_extendedprice*(1-l_discount)) AS subCondition
WHERE p_partkey = l_partkey;