CREATE PROCEDURE UpdateMenuItemPrice
    @MenuItemId INT,
    @NewPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE MenuItem
    SET Price = @NewPrice
    WHERE MenuItemId = @MenuItemId;
END;
