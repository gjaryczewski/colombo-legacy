@echo off

bcp colombo.dbo.SalesReport1999 out colombo-sales-report-1999.txt -T -f colombo-sales-report-1999.xml -S (localdb)\v11.0

pause
