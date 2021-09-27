-- SQLite
.headers on

--1
SELECT DISTINCT maker FROM Product WHERE type="printer" AND maker IN (SELECT DISTINCT maker FROM Printer WHERE color="1" AND price<120);
--2
SELECT DISTINCT maker FROM Product WHERE type="pc" AND maker NOT IN (SELECT maker FROM Product WHERE type="laptop" OR type="printer");
--3
SELECT DISTINCT maker, Laptop.model AS Laptop_Model, PC.model AS PC_Model, MAX(PC.price) + MAX(Laptop.price) AS Combined_Price FROM Product, PC, Laptop where type="laptop" AND maker IN (SELECT maker FROM product WHERE type="pc");
--4
SELECT screen FROM Laptop GROUP BY screen HAVING COUNT(*) > 1;
--5
SELECT model, price FROM Laptop WHERE price > (SELECT MAX(price) FROM PC);
--6
SELECT maker FROM Product WHERE type="pc" OR type="laptop" GROUP BY type HAVING COUNT(*) > 1;