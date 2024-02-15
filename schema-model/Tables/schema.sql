USE master;
GO


DROP DATABASE RestaurantDB;
GO

CREATE DATABASE RestaurantDB;
GO


USE 
RestaurantDB
GO


-- Create Person table
CREATE TABLE Person
(
    PersonID    INT         NOT NULL IDENTITY (1,1) PRIMARY KEY,
    FirstName   VARCHAR(50) NOT NULL,
    LastName    VARCHAR(50) NOT NULL,
    DateOfBirth DATE        NOT NULL,
);
GO

-- Create Employee table
CREATE TABLE Employee
(
    EmployeeID INT         NOT NULL IDENTITY (1,1) PRIMARY KEY,
    PersonID   INT         NOT NULL,
    IDNumber   VARCHAR(13) NOT NULL
);

GO

-- Create Customer table
CREATE TABLE Customer
(
    CustomerID  INT  NOT NULL IDENTITY (1,1) PRIMARY KEY,
    PersonID    INT  NOT NULL,
    JoiningDate DATE NOT NULL
);

GO

-- Create OrderRecord table
CREATE TABLE OrderRecord
(
    OrderId      INT            NOT NULL IDENTITY (1,1) PRIMARY KEY,
    EmployeeID   INT            NOT NULL,
    CustomerID   INT            NOT NULL,
    SaleDateTime DATE           NOT NULL,
    TipAdded     DECIMAL(10, 2) NOT NULL CHECK (TipAdded >= 0)
);

GO

-- Create MenuItem table
CREATE TABLE MenuItem
(
    MenuItemId      INT            NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Price           DECIMAL(10, 2) NOT NULL,
    ItemDescription VARCHAR(100)   NOT NULL
);

GO

-- Create MenuItemsOrdered table
CREATE TABLE MenuItemsOrdered
(
    MenuItemsOrderedID INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    MenuItemID         INT NOT NULL,
    OrderID            INT NOT NULL,
    Quantity           INT NOT NULL,
);

GO

-- Create Rating table
CREATE TABLE Rating
(
    RatingId   INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Stars      INT NOT NULL CHECK (Stars BETWEEN 1 AND 5),
    Comment    VARCHAR(200)
);

GO

-- Altering the Customer table to add a foreign key constraint referencing the Person table
ALTER TABLE Customer
    ADD CONSTRAINT FK_Customer_Person
        FOREIGN KEY (PersonId) REFERENCES Person (PersonId);
GO

-- Altering the Employee table to add foreign key constraint referencing the Person table
ALTER TABLE Employee
    ADD CONSTRAINT FK_Employee_Person
        FOREIGN KEY (PersonId) REFERENCES Person (PersonId);
GO

-- Altering the MenuItemsOrdered table to add foreign key constraints referencing the MenuItem and ResOrder tables
ALTER TABLE MenuItemsOrdered
    ADD CONSTRAINT FK_MenuItemsOrdered_MenuItem
        FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId);
GO

ALTER TABLE MenuItemsOrdered
    ADD CONSTRAINT FK_MenuItemsOrdered_ResOrder
        FOREIGN KEY (OrderId) REFERENCES OrderRecord (OrderId);
GO

-- Altering the ResOrder table to add foreign key constraints referencing the Employee and Customer tables
ALTER TABLE OrderRecord
    ADD CONSTRAINT FK_ResOrder_Employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeId);
GO

ALTER TABLE OrderRecord
    ADD CONSTRAINT FK_ResOrder_Customer
        FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
GO

-- Altering the Rating table to add foreign key constraints referencing the Customer and MenuItem tables
ALTER TABLE Rating
    ADD CONSTRAINT FK_Rating_Customer
        FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId);
GO

ALTER TABLE Rating
    ADD CONSTRAINT FK_Rating_MenuItem
        FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId);
GO
