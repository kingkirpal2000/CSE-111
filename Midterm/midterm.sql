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

;
.headers off

SELECT "5----------";
.headers on
--put your code here
SELECT Classes.country, COUNT(Outcomes.result)
FROM Outcomes, Classes, Ships
WHERE Classes.class = Ships.class
AND Ships.name = Outcomes.ship
AND Outcomes.result = "damaged"
GROUP BY Classes.country
;
.headers off

SELECT "6----------";
.headers on
--put your code here
;
.headers off

SELECT "7----------";
.headers on
--put your code here
;
.headers off

SELECT "8----------";
.headers on
--put your code here
;
.headers off

SELECT "9----------";
.headers on
--put your code here
;
.headers off

SELECT "10---------";
.headers on
--put your code here
;
.headers off

SELECT "11---------";
.headers on
--put your code here
;
.headers off

SELECT "12---------";
.headers on
--put your code here
;
.headers off

SELECT "13---------";
.headers on
--put your code here
;
.headers off

SELECT "14---------";
.headers on
--put your code here
;
.headers off

SELECT "15---------";
.headers on
--put your code here
;
.headers off

SELECT "16---------";
.headers on
--put your code here
;
.headers off

SELECT "17---------";
.headers on
--put your code here
;
.headers off
