@echo off

bcp colombo.dbo.SalesReport1999 format nul -T -c -x -f colombo-sales-report-1999.xml -S (localdb)\v11.0

pause
