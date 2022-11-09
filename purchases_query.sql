CREATE TABLE IF NOT EXISTS Users (
	userId SERIAL PRIMARY KEY,
  	age SMALLINT NOT NUll
);
INSERT INTO users (age) VALUES (25);
INSERT INTO users (age) VALUES (18);
INSERT INTO users (age) VALUES (35);
INSERT INTO users (age) VALUES (18);
INSERT INTO Users (age) VALUES (22);
INSERT INTO Users (age) VALUES (19);
INSERT INTO Users (age) VALUES (20);
CREATE TABLE IF NOT EXISTS Items (
	itemId SERIAL PRIMARY KEY,
  	price REAL NOT NUll
);
INSERT INTO Items (price) VALUES (450.99);
INSERT INTO Items (price) VALUES (250.99);
INSERT INTO Items (price) VALUES (350.99);
INSERT INTO Items (price) VALUES (150.99);
INSERT INTO Items (price) VALUES (250.99);
INSERT INTO Items (price) VALUES (444.99);
INSERT INTO Items (price) VALUES (255.99);
CREATE TABLE IF NOT EXISTS Purchases (
	purchaseId SERIAL PRIMARY KEY,
    userId INT NULL,
    itemId INT NULL,
  	date DATE NOT NUll,
  	FOREIGN KEY (userId) REFERENCES Users ON DELETE SET NULL (userId),
   	FOREIGN KEY (itemId) REFERENCES Items ON DELETE CASCADE
);
INSERT INTO Purchases (userId, itemId, date) VALUES (1,1, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,1, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,1, '2022-01-07');
INSERT INTO Purchases (userId, itemId, date) VALUES (3,2, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,2, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,3, '2022-01-06');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,2, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,1, '2022-01-04');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,1, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,5, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,1, '2022-01-07');
INSERT INTO Purchases (userId, itemId, date) VALUES (3,4, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,2, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,2, '2022-01-06');
INSERT INTO Purchases (userId, itemId, date) VALUES (4,4, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (4,6, '2022-01-04');
INSERT INTO Purchases (userId, itemId, date) VALUES (7,7, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (3,8, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (8,1, '2022-01-07');
INSERT INTO Purchases (userId, itemId, date) VALUES (7,2, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (5,6, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (3,8, '2022-01-06');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,5, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (5,5, '2022-01-04');
INSERT INTO Purchases (userId, itemId, date) VALUES (4,6, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,5, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (2,1, '2022-01-07');
INSERT INTO Purchases (userId, itemId, date) VALUES (3,4, '2022-01-01');
INSERT INTO Purchases (userId, itemId, date) VALUES (1,2, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (5,7, '2022-01-06');
INSERT INTO Purchases (userId, itemId, date) VALUES (7,6, '2022-01-05');
INSERT INTO Purchases (userId, itemId, date) VALUES (8,8, '2022-01-04');
/*
А) какую сумму в среднем в месяц тратит:
- пользователи в возрастном диапазоне от 18 до 25 лет включительно
- пользователи в возрастном диапазоне от 26 до 35 лет включительно
Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая
В) какой товар обеспечивает дает наибольший вклад в выручку за последний год
Г) топ-3 товаров по выручке и их доля в общей выручке за любой год
*/


