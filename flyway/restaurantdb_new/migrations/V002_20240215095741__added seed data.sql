-- Populate Person table
INSERT INTO Person (FirstName, LastName, DateOfBirth)
VALUES
    ('John', 'Doe', '1990-01-01'),
    ('Alice', 'Smith', '1985-03-15'),
    ('Michael', 'Johnson', '1978-07-20'),
    ('Emily', 'Brown', '1995-11-10'),
    ('Sipho', 'Zulu', '1982-09-25'),
    ('Nombuso', 'Mthembu', '1987-04-12'),
    ('William', 'Taylor', '1975-06-30'),
    ('Olivia', 'Anderson', '1992-12-08'),
    ('James', 'Thomas', '1980-08-17'),
    ('Themba', 'Khumalo', '1998-02-28'),
    ('Daniel', 'Young', '1970-05-05'),
    ('Lindiwe', 'Mkhize', '1989-10-03'),
    ('Matthew', 'White', '1993-07-22'),
    ('Nomalanga', 'Mbatha', '1972-03-18'),
    ('Bongani', 'Nkosi', '1984-11-28');

-- Populate Employee table
INSERT INTO Employee (PersonID, IDNumber)
VALUES
    (1, 'EMP001'),
    (2, 'EMP002'),
    (5, 'EMP003'),
    (6, 'EMP004'),
    (9, 'EMP005'),
    (10, 'EMP006'),
    (11, 'EMP007'),
    (12, 'EMP008');

-- Populate Customer table
INSERT INTO Customer (PersonID, JoiningDate)
VALUES
    (3, '2023-12-05'),
    (4, '2024-01-10'),
    (7, '2024-01-02'),
    (8, '2024-01-18'),
    (13, '2023-11-15'),
    (14, '2024-01-07'),
    (15, '2024-01-29');

-- Populate OrderRecord table
INSERT INTO OrderRecord (EmployeeID, CustomerID, SaleDateTime, TipAdded)
VALUES
    (1, 1, '2024-01-05 08:30:00', 5.00),
    (2, 2, '2024-01-12 12:15:00', 7.50),
    (1, 2, '2024-01-20 18:45:00', 6.25),
    (3, 3, '2024-01-08 11:30:00', 4.00),
    (4, 4, '2024-01-16 17:00:00', 8.00),
    (5, 5, '2024-01-22 09:45:00', 5.75),
    (6, 6, '2024-01-04 14:20:00', 7.25),
    (7, 7, '2024-01-19 20:00:00', 6.50),
    (8, 7, '2024-01-25 13:10:00', 9.25),
    (1, 3, '2024-01-11 16:30:00', 3.50),
    (2, 4, '2024-01-27 10:00:00', 5.25),
    (3, 1, '2024-01-03 07:45:00', 6.00),
    (4, 2, '2024-01-14 19:35:00', 7.75),
    (5, 5, '2024-01-21 11:55:00', 4.50),
    (6, 6, '2024-01-29 15:40:00', 8.50),
    (7, 1, '2024-01-06 18:20:00', 7.00);

-- Populate MenuItem table
INSERT INTO MenuItem (Price, ItemDescription)
VALUES
    (9.99, 'Chicken Sandwich'),
    (5.49, 'French Fries'),
    (12.99, 'Steak'),
    (7.99, 'Salmon Fillet'),
    (6.99, 'Caesar Salad'),
    (8.49, 'Spaghetti Carbonara'),
    (10.99, 'Pizza Margherita'),
    (4.99, 'Cheeseburger'),
    (11.49, 'Grilled Chicken Breast'),
    (3.99, 'Onion Rings'),
    (13.99, 'Lobster Tail'),
    (15.49, 'Filet Mignon'),
    (8.99, 'Vegetable Stir-Fry'),
    (7.49, 'Caprese Salad'),
    (6.49, 'Mushroom Risotto');

-- Populate MenuItemsOrdered table
INSERT INTO MenuItemsOrdered (MenuItemID, OrderID, Quantity)
VALUES
    (1, 1, 2),
    (2, 1, 1),
    (3, 2, 1),
    (4, 3, 2),
    (5, 4, 1),
    (6, 5, 2),
    (7, 6, 1),
    (8, 7, 2),
    (9, 8, 1),
    (10, 9, 2),
    (11, 10, 1),
    (12, 11, 2),
    (13, 12, 1),
    (14, 13, 2),
    (15, 14, 1),
    (1, 15, 2);

-- Populate Rating table
INSERT INTO Rating (CustomerID, MenuItemID, Stars, Comment)
VALUES
    (1, 1, 4, 'Tasty sandwich!'),
    (2, 2, 3, 'Good fries.'),
    (2, 3, 5, 'Excellent steak!'),
    (1, 4, 4, 'Great salmon!'),
    (3, 5, 4, 'Nice salad.'),
    (4, 6, 5, 'Delicious pasta!'),
    (5, 7, 4, 'Yummy pizza.'),
    (6, 8, 3, 'Average burger.'),
    (7, 9, 5, 'Amazing chicken!'),
    (1, 10, 4, 'Very good onion rings.'),
    (4, 11, 5, 'Perfect lobster!'),
    (1, 12, 4, 'Tender steak.'),
    (7, 13, 3, 'Okay stir-fry.'),
    (6, 14, 5, 'Fantastic salad!'),
    (3, 15, 4, 'Rich risotto.'),
    (7, 1, 5, 'Best sandwich ever!'),
    (2, 2, 4, 'Great fries!');

