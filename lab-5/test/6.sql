SELECT p_mfgr
FROM part, partsupp, supplier, (
    SELECT MIN(ps_availqty) AS pop
    FROM part, partsupp, supplier
    WHERE p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey
    AND s_name = 'Supplier#000000010'
    )t1
WHERE p_partkey = ps_partkey
AND ps_suppkey = s_suppkey
AND s_name = 'Supplier#000000010'
AND ps_availqty <= t1.pop;