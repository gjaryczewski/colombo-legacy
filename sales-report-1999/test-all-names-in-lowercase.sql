IF EXISTS (
	SELECT * FROM rutkowski.dbo.Raport_sprzedazy_1999
	WHERE HASHBYTES('sha1', EmpName) <> HASHBYTES('sha1', LOWER(EmpName))
) BEGIN
	RAISERROR (N'test-all-names-in-lowercase: failed.', 16, 1) WITH NOWAIT;
END ELSE BEGIN
	PRINT N'test-all-names-in-lowercase: passed.';
END

-- NOTE Powyzszy kod nie zalamie sie, a powinien, bo nazwiska w kolumnie EmpName nie za zapisane
-- malymi literami. Problem tkwi w ustawieniu COLLATE dla bazy, kt�ry jest nieczu�y na wielko��
-- znaku, co generalnie jest zalet�. Przyk�adowe rozwi�zania problemu:
-- 1) WHERE EmpName COLLATE Polish_CS_AS <> LOWER(EmpName) COLLATE Polish_CS_AS
-- 2) WHERE HASHBYTES('sha1', EmpName) <> HASHBYTES('sha1', LOWER(EmpName))
