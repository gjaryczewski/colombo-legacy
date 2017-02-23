USE [master]
RESTORE DATABASE [colombo] FROM  DISK = N'C:\Users\gjaryczewski\Downloads\colombo.bak' WITH  FILE = 1,  MOVE N'demo1' TO N'C:\Users\gjaryczewski\colombo.mdf',  MOVE N'demo1_log' TO N'C:\Users\gjaryczewski\colombo_log.mdf',  NOUNLOAD,  REPLACE,  STATS = 5

GO

