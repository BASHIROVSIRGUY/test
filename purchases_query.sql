CREATE TABLE Users (
	userId series PRIMARY KEY,
  	age INT(3) NOT NUll
);
INSERT INTO Users VALUES (25);
INSERT INTO Users VALUES (25);
INSERT INTO Users VALUES (18);
INSERT INTO Users VALUES (35);
INSERT INTO Users VALUES (18);
INSERT INTO Users VALUES (22);
INSERT INTO Users VALUES (19);
INSERT INTO Users VALUES (20);
CREATE TABLE Items (
	itemId series PRIMARY KEY,
  	price REAL NOT NUll
);
INSERT INTO Items VALUES (450.99);
INSERT INTO Items VALUES (250.99);
INSERT INTO Items VALUES (350.99);
INSERT INTO Items VALUES (150.99);
INSERT INTO Items VALUES (250.99);
INSERT INTO Items VALUES (444.99);
INSERT INTO Items VALUES (255.99);
INSERT INTO Items VALUES (150.99);
CREATE TABLE Purchases (
	purchaseId series PRIMARY KEY,
    userId INT NULL,
    itemId INT NULL,
  	date DATE NOT NUll,
  	FOREIGN KEY (userId) REFERENCES Users ON DELETE SET NULL (userId),
   	FOREIGN KEY (itemId) REFERENCES Items ON DELETE CASCADE
)
INSERT INTO Purchases VALUES (1,1, 2022-01-01);
INSERT INTO Purchases VALUES (1,1, 2022-01-05);
INSERT INTO Purchases VALUES (2,1, 2022-01-07);
INSERT INTO Purchases VALUES (3,2, 2022-01-01);
INSERT INTO Purchases VALUES (1,2, 2022-01-05);
INSERT INTO Purchases VALUES (2,3, 2022-01-06);
INSERT INTO Purchases VALUES (2,2, 2022-01-05);
INSERT INTO Purchases VALUES (1,1, 2022-01-04);
INSERT INTO Purchases VALUES (1,1, 2022-01-01);
INSERT INTO Purchases VALUES (1,5, 2022-01-05);
INSERT INTO Purchases VALUES (2,1, 2022-01-07);
INSERT INTO Purchases VALUES (3,4, 2022-01-01);
INSERT INTO Purchases VALUES (1,2, 2022-01-05);
INSERT INTO Purchases VALUES (2,2, 2022-01-06);
INSERT INTO Purchases VALUES (4,4, 2022-01-05);
INSERT INTO Purchases VALUES (4,6, 2022-01-04);
INSERT INTO Purchases VALUES (7,7, 2022-01-01);
INSERT INTO Purchases VALUES (3,8, 2022-01-05);
INSERT INTO Purchases VALUES (8,1, 2022-01-07);
INSERT INTO Purchases VALUES (7,2, 2022-01-01);
INSERT INTO Purchases VALUES (5,6, 2022-01-05);
INSERT INTO Purchases VALUES (3,8, 2022-01-06);
INSERT INTO Purchases VALUES (2,5, 2022-01-05);
INSERT INTO Purchases VALUES (5,5, 2022-01-04);
INSERT INTO Purchases VALUES (4,6, 2022-01-01);
INSERT INTO Purchases VALUES (1,5, 2022-01-05);
INSERT INTO Purchases VALUES (2,1, 2022-01-07);
INSERT INTO Purchases VALUES (3,4, 2022-01-01);
INSERT INTO Purchases VALUES (1,2, 2022-01-05);
INSERT INTO Purchases VALUES (5,7, 2022-01-06);
INSERT INTO Purchases VALUES (7,6, 2022-01-05);
INSERT INTO Purchases VALUES (8,8, 2022-01-04);
