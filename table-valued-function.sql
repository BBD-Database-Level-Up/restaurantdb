USE master;
GO

USE 
RestaurantDB
GO



CREATE FUNCTION GetCustomerOrders
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.PK_OrderID AS OrderID,
        o.SaleDateTime AS OrderDateTime,
        o.TipAdded AS TipAmount,
        m.ItemDescription AS MenuItemDescription,
        mo.Quantity AS QuantityOrdered
    FROM
        OrderRecords o
    INNER JOIN
        MenuItemOrdered mo ON o.PK_OrderID = mo.FK_OrderID
    INNER JOIN
        MenuItem m ON mo.FK_MenuItem_ID = m.PK_MenuItem_ID
    WHERE
        o.FK_CustomerID = @CustomerID
);
GO