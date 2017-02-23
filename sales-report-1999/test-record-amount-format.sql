IF EXISTS (
	SELECT * FROM rutkowski.dbo.Raport_sprzedazy_1999
	WHERE CAST(AgeToMoney AS nvarchar(20)) NOT LIKE N'%_.__'
) BEGIN
	RAISERROR (N'test-record-amount-format: failed.', 16, 1) WITH NOWAIT;
END ELSE BEGIN
	PRINT N'test-record-amount-format: passed.';
END
