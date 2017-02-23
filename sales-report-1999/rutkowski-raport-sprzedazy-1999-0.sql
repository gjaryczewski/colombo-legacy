USE rutkowski;
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Raport_sprzedazy_1999')
	DROP VIEW dbo.Raport_sprzedazy_1999;
GO
CREATE VIEW dbo.Raport_sprzedazy_1999 AS
	SELECT CAST(NULL AS nvarchar(51)) AS EmpName,
		CAST(NULL AS int) AS Age,
		CAST(NULL AS numeric) AS AgeToMoney
GO
SELECT * FROM dbo.Raport_sprzedazy_1999