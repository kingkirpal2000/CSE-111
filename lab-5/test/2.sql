SELECT r_name, COUNT(s_suppkey)
FROM supplier, region
GROUP BY r_name;