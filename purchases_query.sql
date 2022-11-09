CREATE TABLE IF NOT EXISTS Users (
	userId SERIAL PRIMARY KEY,
  	age SMALLINT NOT NUll
);
INSERT INTO users (age) VALUES 
			(25),
			(18),
			(35),
			(18),
			(22),
			(19),
			(20);
CREATE TABLE IF NOT EXISTS Items (
	itemId SERIAL PRIMARY KEY,
  	price REAL NOT NUll
);
INSERT INTO Items (price) VALUES 
			(450.99),
			(250.99),
			(350.99),
			(150.99),
			(250.99),
			(444.99),
			(255.99);
CREATE TABLE IF NOT EXISTS Purchases (
	purchaseId SERIAL PRIMARY KEY,
    userId INT NULL,
    itemId INT NULL,
  	date DATE NOT NUll,
  	FOREIGN KEY (userId) REFERENCES Users ON DELETE SET NULL (userId),
   	FOREIGN KEY (itemId) REFERENCES Items ON DELETE CASCADE
);
INSERT INTO Purchases (userId, itemId, date) VALUES 
			(1,1, '2022-01-01'),
			(1,1, '2022-01-05'),
			(2,1, '2022-01-07'),
			(3,2, '2022-01-01'),
			(1,2, '2022-01-05'),
			(2,3, '2022-01-06'),
			(2,2, '2022-01-05'),
			(1,1, '2022-01-04'),
			(1,1, '2022-01-01'),
			(1,5, '2022-01-05'),
			(2,1, '2022-01-07'),
			(3,4, '2022-01-01'),
			(1,2, '2022-01-05'),
			(2,2, '2022-01-06'),
			(4,4, '2022-01-05'),
			(4,6, '2022-01-04'),
			(7,7, '2022-01-01'),
			(3,8, '2022-01-05'),
			(8,1, '2022-01-07'),
			(7,2, '2022-01-01'),
			(5,6, '2022-01-05'),
			(3,8, '2022-01-06'),
			(2,5, '2022-01-05'),
			(5,5, '2022-01-04'),
			(4,6, '2022-01-01'),
			(1,5, '2022-01-05'),
			(2,1, '2022-01-07'),
			(3,4, '2022-01-01'),
			(1,2, '2022-01-05'),
			(5,7, '2022-01-06'),
			(7,6, '2022-01-05'),
			(8,8, '2022-01-04');
/*
А) какую сумму в среднем в месяц тратит:
- пользователи в возрастном диапазоне от 18 до 25 лет включительно
*/
SELECT DISTINCT
AVG(I.price) OVER (PARTITION By EXTRACT(MONTH FROM date)) as price_avg,
EXTRACT(MONTH FROM date) as MONTH
FROM Purchases P
JOIN Users U on p.userId = U.userId
JOIN Items I on P.itemId = I.itemId
WHERE U.age > 17 AND U.age < 26
/*
- пользователи в возрастном диапазоне от 26 до 35 лет включительно
*/
SELECT DISTINCT
AVG(I.price) OVER (PARTITION By EXTRACT(MONTH FROM date)) as price_avg,
EXTRACT(MONTH FROM date) as MONTH
FROM Purchases P
JOIN Users U on p.userId = U.userId
JOIN Items I on P.itemId = I.itemId
WHERE U.age > 24 AND U.age < 36
/*
Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая
*/
SELECT Q2.mon_num FROM
(SELECT MAX(Q.mon_revenue) as max_mon_revenue
from (
  SELECT DISTINCT
    SUM(I.price) OVER (PARTITION By EXTRACT(MONTH FROM date)) as mon_revenue,
    EXTRACT(MONTH FROM date) as mon_num
  FROM Purchases P
  JOIN Users U on p.userId = U.userId 
  JOIN Items I on P.itemId = I.itemId
  WHERE U.age > 34 AND EXTRACT(YEAR FROM date) = 2022) as Q) as Q1
JOIN
  (SELECT DISTINCT
    SUM(I.price) OVER (PARTITION By EXTRACT(MONTH FROM date)) as mon_revenue,
    EXTRACT(MONTH FROM date) as mon_num
  FROM Purchases P
  JOIN Users U on p.userId = U.userId 
  JOIN Items I on P.itemId = I.itemId
  WHERE U.age > 34 AND EXTRACT(YEAR FROM date) = 2022) as Q2
on Q2.mon_revenue = Q1.max_mon_revenue
/*
В) какой товар обеспечивает дает наибольший вклад в выручку за последний год
Г) топ-3 товаров по выручке и их доля в общей выручке за любой год
*/


