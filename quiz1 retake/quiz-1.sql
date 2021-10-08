-- SQLite
.headers on


--1
SELECT maker FROM Product, Laptop WHERE type="laptop" AND Laptop.model = Product.model AND Laptop.price < 2000 AND Laptop.screen > 16;

--2
SELECT DISTINCT maker FROM Product WHERE type="pc" AND maker NOT IN (SELECT maker FROM Product WHERE type="laptop");

--3
SELECT maker, PC.model, Printer.model, MAX(PC.price) + MAX(Printer.price) FROM Product, PC, Printer WHERE Product.type = 'pc' AND PC.model = Product.model AND maker IN (SELECT maker FROM Product WHERE Product.type = 'printer');

--4
SELECT hd FROM Laptop GROUP BY hd HAVING COUNT(hd) > 1;

--5
SELECT Product.model, PC.price FROM Product, PC WHERE type="pc" AND PC.model = Product.model AND PC.price < (SELECT MIN(Laptop.price) FROM Laptop);

--6
SELECT maker FROM Product WHERE type="laptop" AND maker IN (SELECT maker FROM Product WHERE type="printer" GROUP BY maker HAVING COUNT(model) >= 2) GROUP BY maker HAVING COUNT(model) >= 1;
