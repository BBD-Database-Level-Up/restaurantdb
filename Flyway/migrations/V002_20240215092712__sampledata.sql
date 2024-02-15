INSERT INTO Person (PK_PersonID, FirstName, DateOfBirth, LastName)
VALUES 
    (1, 'John', '1990-05-15', 'Doe'),
    (2, 'Jane', '1985-08-20', 'Smith'),
    (3, 'Michael', '1978-12-10', 'Johnson');

INSERT INTO Employee (PK_EmployeeID, FK_Person_ID, IDNumber)
VALUES 
    (1, 1, 'EMP1001'),
    (2, 2, 'EMP1002');

INSERT INTO Customer (PK_CustomerID, FK_PersonID, JoiningDate)
VALUES 
    (1, 3, '2022-01-01');

INSERT INTO OrderRecords (PK_OrderID, FK_EmployeeID, FK_CustomerID, SaleDateTime, TipAdded)
VALUES 
    (1, 1, 1, '2023-05-10 12:30:00', 5.00),
    (2, 2, 1, '2023-05-11 14:45:00', 7.50);

INSERT INTO MenuItem (PK_MenuItem_ID, Price, ItemDescription)
VALUES 
    (1, 10.99, 'Chicken Alfredo'),
    (2, 8.50, 'Margherita Pizza');

INSERT INTO MenuItemOrdered (FK_MenuItem_ID, FK_OrderID, Quantity)
VALUES 
    (1, 1, 2),
    (2, 1, 1),
    (1, 2, 1);

INSERT INTO Rating (PK_RatingID, FK_CustomerID, FK_MenuItem_ID, Stars, Comment)
VALUES 
    (1, 1, 1, 5, 'Delicious!'),
    (2, 1, 2, 4, 'Great pizza!');
