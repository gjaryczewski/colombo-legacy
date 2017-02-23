@echo off

for %%i in (C:\Users\gjaryczewski\Documents\colombo-legacy\sales-report-1999\test-*.sql) do sqlcmd -S (localdb)\v11.0 -i "%%i"

bcp colombo.dbo.SalesReport1999 out colombo-sales-report-1999.txt -T -f colombo-sales-report-1999.xml -S (localdb)\v11.0
bcp rutkowski.dbo.Raport_sprzedazy_1999 out rutkowski-raport-sprzedazy-1999.txt -T -f rutkowski-raport-sprzedazy-1999.xml -S (localdb)\v11.0

fc /b colombo-sales-report-1999.txt rutkowski-raport-sprzedazy-1999.txt

pause