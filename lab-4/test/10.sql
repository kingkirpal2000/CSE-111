SELECT DISTINCT(p_type), MIN(l_discount), MAX(l_discount)
FROM lineitem, part
WHERE p_partkey = l_partkey
AND p_type LIKE '%ECONOMY %COPPER'
GROUP BY p_type