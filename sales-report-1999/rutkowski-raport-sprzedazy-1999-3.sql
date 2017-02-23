USE rutkowski;
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Raport_sprzedazy_1999')
	DROP VIEW dbo.Raport_sprzedazy_1999;
GO
CREATE VIEW dbo.Raport_sprzedazy_1999 AS
	SELECT CAST(LOWER(EmpName) AS nvarchar(51)) AS EmpName,
		CAST(Age AS int) AS Age,
		CAST(AgeToMoney AS numeric(20, 2)) AS AgeToMoney
	FROM (
		SELECT TOP (100) PERCENT RTRIM(Imie) + ' ' + RTRIM(Nazwisko) AS EmpName
			,Age
			,CAST(AgeToMoney AS NUMERIC(20, 2)) AS AgeToMoney
		FROM (
			SELECT a.Nr_pracownika
				,a.Imie
				,a.Nazwisko
				,a.Data_urodzenia
				,DATEDIFF(yyyy, a.Data_urodzenia, GETDATE()) AS Age
				,b_1.Tot1999
				,b_1.Tot1999 / DATEDIFF(yyyy, a.Data_urodzenia, GETDATE()) AS AgeToMoney
			FROM dbo.Pracownicy AS a
			INNER JOIN (
				SELECT b.Nr_pracownika
					,SUM(a.Kwota_dokumentu) AS Tot1999
				FROM dbo.Faktury AS a
				INNER JOIN dbo.Pracownicy AS b ON a.Nr_pracownika = b.Nr_pracownika
				WHERE (b.Nr_departamentu = 5)
					AND (YEAR(a.Data_dokumentu) = 1999)
				GROUP BY b.Nr_pracownika
				) AS b_1 ON a.Nr_pracownika = b_1.Nr_pracownika
			) AS c
		ORDER BY AgeToMoney DESC
	) AS D
GO
SELECT * FROM dbo.Raport_sprzedazy_1999