@echo off

bcp rutkowski.dbo.Raport_sprzedazy_1999 format nul -T -c -x -f rutkowski-raport-sprzedazy-1999.xml -S (localdb)\v11.0

pause