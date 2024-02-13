GO

USE 
RestaurantDB
GO

CREATE VIEW EmployeePerformanceMetrics AS
SELECT
    E.PK_EmployeeID,
    E.FK_Person_ID,
    P.FirstName,
    P.LastName,
    COUNT(O.PK_OrderID) AS OrdersHandled,
    SUM(O.TipAdded) AS TotalTips,
    AVG(O.TipAdded) AS AvgTips
FROM
    Employee E
JOIN
    OrderRecords O ON E.PK_EmployeeID = O.FK_EmployeeID
JOIN
    Person P ON E.FK_Person_ID = P.PK_PersonID
GROUP BY
    E.PK_EmployeeID, E.FK_Person_ID, P.FirstName, P.LastName;
