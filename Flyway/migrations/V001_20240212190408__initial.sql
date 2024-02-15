USE master;
GO


DROP DATABASE RestaurantDB;
GO

CREATE DATABASE RestaurantDB;
GO


USE 
RestaurantDB
GO


CREATE TABLE Person (
  PK_PersonID INT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  DateOfBirth DATE NOT NULL,
  LastName VARCHAR(50) NOT NULL
);
GO


CREATE TABLE Employee (
  PK_EmployeeID INT PRIMARY KEY,
  FK_Person_ID INT FOREIGN KEY REFERENCES Person(PK_PersonID),
  IDNumber VARCHAR(20) NOT NULL
);
GO


CREATE TABLE Customer (
  PK_CustomerID INT PRIMARY KEY,
  FK_PersonID INT FOREIGN KEY REFERENCES Person(PK_PersonID),
  JoiningDate DATE NOT NULL
);
GO


CREATE TABLE OrderRecords (
  PK_OrderID INT PRIMARY KEY,
  FK_EmployeeID INT FOREIGN KEY REFERENCES Employee(PK_EmployeeID),
  FK_CustomerID INT FOREIGN KEY REFERENCES Customer(PK_CustomerID),
  SaleDateTime DATE NOT NULL,
  TipAdded DECIMAL(10,2) NOT NULL
);
GO


CREATE TABLE MenuItem (
  PK_MenuItem_ID INT PRIMARY KEY,
  Price DECIMAL(10,2) NOT NULL,
  ItemDescription VARCHAR(100) NOT NULL
);
GO



CREATE TABLE MenuItemOrdered (
  FK_MenuItem_ID INT,
  FK_OrderID INT,
  Quantity INT NOT NULL,
  CONSTRAINT FK_MenuItem FOREIGN KEY (FK_MenuItem_ID) REFERENCES MenuItem(PK_MenuItem_ID),
  CONSTRAINT FK_OrderRecords FOREIGN KEY (FK_OrderID) REFERENCES OrderRecords(PK_OrderID),
  CONSTRAINT PK_MenuItems_Ordered PRIMARY KEY (FK_MenuItem_ID, FK_OrderID)
);
GO

CREATE TABLE Rating (
  PK_RatingID INT PRIMARY KEY,
  FK_CustomerID INT FOREIGN KEY REFERENCES Customer(PK_CustomerID),
  FK_MenuItem_ID INT FOREIGN KEY REFERENCES MenuItem(PK_MenuItem_ID),
  Stars INT NOT NULL CHECK (Stars BETWEEN 1 AND 5),
  Comment VARCHAR(200) NULL
);
GO

-- -- db/migration/V1__Create_Tables.sql

-- CREATE TABLE Person (
--   PK_PersonID INT PRIMARY KEY,
--   FirstName VARCHAR(50) NOT NULL,
--   DateOfBirth DATE NOT NULL,
--   LastName VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE Employee (
--   PK_EmployeeID INT PRIMARY KEY,
--   FK_Person_ID INT FOREIGN KEY REFERENCES Person(PK_PersonID),
--   IDNumber VARCHAR(20) NOT NULL
-- );

-- CREATE TABLE Customer (
--   PK_CustomerID INT PRIMARY KEY,
--   FK_PersonID INT FOREIGN KEY REFERENCES Person(PK_PersonID),
--   JoiningDate DATE NOT NULL
-- );

-- CREATE TABLE OrderRecords (
--   PK_OrderID INT PRIMARY KEY,
--   FK_EmployeeID INT FOREIGN KEY REFERENCES Employee(PK_EmployeeID),
--   FK_CustomerID INT FOREIGN KEY REFERENCES Customer(PK_CustomerID),
--   SaleDateTime DATE NOT NULL,
--   TipAdded DECIMAL(10,2) NOT NULL
-- );

-- CREATE TABLE MenuItem (
--   PK_MenuItem_ID INT PRIMARY KEY,
--   Price DECIMAL(10,2) NOT NULL,
--   ItemDescription VARCHAR(100) NOT NULL
-- );

-- CREATE TABLE MenuItemOrdered (
--   FK_MenuItem_ID INT,
--   FK_OrderID INT,
--   Quantity INT NOT NULL,
--   CONSTRAINT FK_MenuItem FOREIGN KEY (FK_MenuItem_ID) REFERENCES MenuItem(PK_MenuItem_ID),
--   CONSTRAINT FK_OrderRecords FOREIGN KEY (FK_OrderID) REFERENCES OrderRecords(PK_OrderID),
--   CONSTRAINT PK_MenuItems_Ordered PRIMARY KEY (FK_MenuItem_ID, FK_OrderID)
-- );

-- CREATE TABLE Rating (
--   PK_RatingID INT PRIMARY KEY,
--   FK_CustomerID INT FOREIGN KEY REFERENCES Customer(PK_CustomerID),
--   FK_MenuItem_ID INT FOREIGN KEY REFERENCES MenuItem(PK_MenuItem_ID),
--   Stars INT NOT NULL CHECK (Stars BETWEEN 1 AND 5),
--   Comment VARCHAR(200) NULL
-- );
