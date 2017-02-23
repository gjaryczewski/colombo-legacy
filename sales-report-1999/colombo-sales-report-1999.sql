USE [colombo]
GO

/****** Object:  View [dbo].[SalesReport1999]    Script Date: 2017-02-22 19:38:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SalesReport1999]
AS
SELECT TOP (100) PERCENT RTRIM(FirstName) + ' ' + RTRIM(LastName) AS EmpName, Age, CAST(AgeToMoney AS numeric(20, 2)) AS AgeToMoney
FROM     (SELECT a.EmpNo, a.FirstName, a.LastName, a.DateOfBirth, DATEDIFF(yyyy, a.DateOfBirth, GETDATE()) AS Age, b_1.Tot1999, b_1.Tot1999 / DATEDIFF(yyyy, a.DateOfBirth, 
                                    GETDATE()) AS AgeToMoney
                  FROM      dbo.Employees AS a INNER JOIN
                                        (SELECT b.EmpNo, SUM(a.DocTotal) AS Tot1999
                                         FROM      dbo.Invoice AS a INNER JOIN
                                                           dbo.Employees AS b ON a.SlpCode = b.EmpNo
                                         WHERE   (b.DeptNo = 5) AND (YEAR(a.DocDate) = 1999)
                                         GROUP BY b.EmpNo) AS b_1 ON a.EmpNo = b_1.EmpNo) AS c
ORDER BY AgeToMoney DESC

GO