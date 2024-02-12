CREATE FUNCTION dbo.fn_AverageRatingForMenuItem
(
    @MenuItemID INT
)
RETURNS DECIMAL(3, 2)
AS
BEGIN
    DECLARE @AverageRating DECIMAL(3, 2);

    SELECT @AverageRating = AVG(CAST(Stars AS DECIMAL(3, 2)))
    FROM Rating
    WHERE FK_MenuItem_ID = @MenuItemID;

    RETURN @AverageRating;
END;
