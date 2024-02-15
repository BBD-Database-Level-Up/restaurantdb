CREATE VIEW EmployeePerformanceMetrics AS
SELECT
    E.EmployeeID,
    E.PersonID,
    P.FirstName,
    P.LastName,
    COUNT(O.OrderId) AS OrdersHandled,
    SUM(O.TipAdded) AS TotalTips,
    AVG(O.TipAdded) AS AvgTips
FROM
    Employee E
JOIN
    OrderRecord O ON E.EmployeeID = O.EmployeeID
JOIN
    Person P ON E.PersonID = P.PersonID
GROUP BY
    E.EmployeeID, E.PersonID, P.FirstName, P.LastName;