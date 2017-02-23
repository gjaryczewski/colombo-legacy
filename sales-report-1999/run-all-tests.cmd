@echo off

for %%i in (C:\Users\gjaryczewski\Documents\colombo-legacy\sales-report-1999\test-*.sql) do sqlcmd -S (localdb)\v11.0 -i "%%i"

pause