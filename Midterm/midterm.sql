SELECT "1----------";
.headers on
--put your code here
CREATE TABLE Classes(
    class VARCHAR(20) not null,
    type CHAR(2) not null,
    country VARCHAR(20) not null,
    numGuns DECIMAL(2, 0) not null,
    bore DECIMAL(2, 0) not null,
    displacement DECIMAL(6, 0) not null
);

CREATE TABLE Ships(
    name VARCHAR(20) not null,
    class VARCHAR(20) not null,
    launched DECIMAL(4, 0) not null
);

CREATE TABLE Battles(
    name VARCHAR(20) not null,
    date DATE not null
);

CREATE TABLE Outcomes(
    ship VARCHAR(20) not null,
    battle VARCHAR(20) not null,
    result VARCHAR(10) not null
);
.headers off

SELECT "2----------";
.headers on
--put your code here
INSERT INTO Classes VALUES ("Bismark", "bb", "Germany", 8, 15, 42000);
INSERT INTO Classes VALUES ("Iowa", "bb", "USA", 9, 16, 46000);
INSERT INTO Classes VALUES ("Kongo", "bc", "Japan", 8, 14, 32000);
INSERT INTO Classes VALUES ("North Carolina", "bb", "USA", 9, 16, 37000);
INSERT INTO Classes VALUES ("Renown", "bb", "Britain", 6, 15, 32000);
INSERT INTO Classes VALUES ("Revenge", "bb", "Britain", 8, 15, 29000);
INSERT INTO Classes VALUES ("Tennessee", "bb", "USA", 12, 14, 32000);
INSERT INTO Classes VALUES ("Yamato", "bb", "Japan", 9, 18, 65000);

INSERT INTO Ships VALUES("California", "Tennessee", 1915);
INSERT INTO Ships VALUES("Haruna", "Kongo", 1915);
INSERT INTO Ships VALUES("Hiei", "Kongo", 1915);
INSERT INTO Ships VALUES("Iowa", "Iowa", 1933);
INSERT INTO Ships VALUES("Kirishima", "Kongo", 1915);
INSERT INTO Ships VALUES("Kongo", "Kongo", 1913);
INSERT INTO Ships VALUES("Missouri", "Iowa", 1935);
INSERT INTO Ships VALUES("Musashi", "Yamato", 1942);
INSERT INTO Ships VALUES("New Jersey", "Iowa", 1935);
INSERT INTO Ships VALUES("North Carolina", "North Carolina", 1941);
INSERT INTO Ships VALUES("Ramillies", "Revenge", 1917);
INSERT INTO Ships VALUES("Renown", "Renown", 1916);
INSERT INTO Ships VALUES("Repulse", "Renown", 1916);
INSERT INTO Ships VALUES("Resolution", "Revenge", 1916);
INSERT INTO Ships VALUES("Revenge", "Revenge", 1916);
INSERT INTO Ships VALUES("Royal Oak", "Revenge", 1916);
INSERT INTO Ships VALUES("Royal Sovereign", "Revenge", 1916);
INSERT INTO Ships VALUES("Tennessee", "Tennessee", 1915);
INSERT INTO Ships VALUES("Washington", "North Carolina", 1941);
INSERT INTO Ships VALUES("Wisconsin", "Iowa", 1940);
INSERT INTO Ships VALUES("Yamato", "Yamato", 1941);

INSERT INTO Battles VALUES("Denmark Strait", '1941-05-24');
INSERT INTO Battles VALUES("Guadalcanal", '1942-11-15');
INSERT INTO Battles VALUES("North Cape", '1943-12-26');
INSERT INTO Battles VALUES("Surigao Strait", '1944-10-25');

INSERT INTO Outcomes VALUES("California", "Surigao Strait", "ok");
INSERT INTO Outcomes VALUES("Kirishima", "Guadalcanal", "sunk");
INSERT INTO Outcomes VALUES("Resolution", "Denmark Strait", "ok");
INSERT INTO Outcomes VALUES("Wisconsin", "Guadalcanal", "damaged");
INSERT INTO Outcomes VALUES("Tennessee", "Surigao Strait", "ok");
INSERT INTO Outcomes VALUES("Washington", "Guadalcanal", "ok");
INSERT INTO Outcomes VALUES("New Jersey", "Surigao Strait", "ok");
INSERT INTO Outcomes VALUES("Yamato", "Surigao Strait", "sunk");
INSERT INTO Outcomes VALUES("Wisconsin", "Surigao Strait", "damaged");
;
.headers off

SELECT "3----------";
.headers on
--put your code here
SELECT Classes.country, COUNT(Ships.name)
FROM Classes, Ships
WHERE Classes.class = Ships.class
AND Ships.launched BETWEEN "1930" AND "1940"
GROUP BY Classes.country;
.headers off

SELECT "4----------";
.headers on
--put your code here
INSERT INTO Outcomes(ship, battle, result)
SELECT s.name, "Denmark Strait", "damaged"
FROM Ships as s
WHERE NOT(s.name IN (SELECT ship from Outcomes WHERE Outcomes.battle = "Denmark Strait"))
AND s.launched <= 1920;
.headers off

SELECT "5----------";
.headers on
--put your code here
SELECT Classes.country as cntry, COUNT(Outcomes.result) as cnt
FROM Outcomes, Classes, Ships
WHERE Classes.class = Ships.class
AND Ships.name = Outcomes.ship
AND Outcomes.result = "damaged"
GROUP BY Classes.country;
.headers off

SELECT "6----------";
.headers on
--put your code here
SELECT sq1.cntry, sq1.cnt
FROM (
    SELECT Classes.country as cntry, COUNT(Outcomes.result) as cnt
    FROM Outcomes, Classes, Ships
    WHERE Classes.class = Ships.class
    AND Ships.name = Outcomes.ship
    AND Outcomes.result = "damaged"
    GROUP BY Classes.country
) sq1
WHERE sq1.cnt = (SELECT MIN(sq2.cnt) FROM (
    SELECT Classes.country as cntry, COUNT(Outcomes.result) as cnt
    FROM Outcomes, Classes, Ships
    WHERE Classes.class = Ships.class
    AND Ships.name = Outcomes.ship
    AND Outcomes.result = "damaged"
    GROUP BY Classes.country
) sq2)
GROUP BY sq1.cntry;
.headers off

SELECT "7----------";
.headers on
--put your code here
DELETE FROM Outcomes
WHERE ship IN(
    SELECT ship
    FROM Outcomes, Classes, Ships
    WHERE Outcomes.ship = Ships.name
    AND Ships.class = Classes.class
    AND Outcomes.battle = 'Denmark Strait'
    GROUP BY Outcomes.ship
    HAVING Classes.country = 'Japan'
) AND battle IN(
    SELECT battle
    FROM Outcomes
    WHERE Outcomes.battle = 'Denmark Strait'
);
.headers off

SELECT "8----------";
.headers on
--put your code here
SELECT DISTINCT Outcomes.ship
FROM outcomes, ships, classes
WHERE Ships.class = Classes.class
AND Ships.name = Outcomes.ship
and Outcomes.result = "damaged"
GROUP BY Outcomes.ship
HAVING COUNT(Outcomes.result = "damaged") > 1;
.headers off

SELECT "9----------";
.headers on
--put your code here
.headers off

SELECT "10---------";
.headers on
--put your code here
UPDATE Classes SET numGuns = numGuns * 2
WHERE Classes.class IN(
    SELECT Classes.class
    FROM Classes, Ships
    WHERE Classes.class = Ships.class
    AND Ships.launched >= 1940
);
.headers off

SELECT "11---------";
.headers on
--put your code here
SELECT Classes.class
FROM Ships, Classes
WHERE Ships.class = Classes.class
GROUP BY Classes.class
HAVING COUNT(Classes.class) = 2;
.headers off

SELECT "12---------";
.headers on
--put your code here
SELECT Classes.class, COUNT(*)
FROM Classes, Ships, Outcomes
WHERE Outcomes.ship = Ships.name
AND Classes.country IN (
    SELECT Classes.country
    FROM Ships, Classes, Outcomes
    WHERE Outcomes.result = "damaged"
)
GROUP BY Classes.country
ORDER BY Count(*)
LIMIT 1;

.headers off

SELECT "13---------";
.headers on
--put your code here
DELETE FROM Ships
WHERE name IN (
    SELECT ship
    FROM Outcomes
    WHERE result = "sunk"
);
.headers off

SELECT "14---------";
.headers on
--put your code here
SELECT Classes.Country, TOTAL(numGuns)
FROM Ships, Classes
WHERE Ships.class = Classes.class
GROUP BY Classes.country;
.headers off

SELECT "15---------";
.headers on
--put your code here
;
.headers off

SELECT "16---------";
.headers on
--put your code here
INSERT INTO Ships(name, class, launched)
SELECT Classes.class, Classes.class, Ships.launched -- name of ship is same as class name
FROM Ships, Classes
WHERE Classes.class NOT IN (SELECT Ships.class FROM Ships)
AND Ships.launched = (SELECT min(Ships.launched) FROM Ships, Classes WHERE Ships.class = Classes.class)
GROUP BY Classes.class;
.headers off

SELECT "17---------";
.headers on
--put your code here
;
.headers off
