CREATE FUNCTION GetCustomerOrders
(
    @CustomerID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.OrderID AS OrderID,
        o.SaleDateTime AS OrderDateTime,
        o.TipAdded AS TipAmount,
        m.ItemDescription AS MenuItemDescription,
        mo.Quantity AS QuantityOrdered
    FROM
        OrderRecord o
    INNER JOIN
        MenuItemsOrdered mo ON o.OrderID = mo.OrderID
    INNER JOIN
        MenuItem m ON mo.MenuItemID = m.MenuItemID
    WHERE
        o.CustomerID = @CustomerID
);
GO