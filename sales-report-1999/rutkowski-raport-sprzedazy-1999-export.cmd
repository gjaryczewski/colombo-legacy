@echo off

bcp rutkowski.dbo.Raport_sprzedazy_1999 out rutkowski-raport-sprzedazy-1999.txt -T -f rutkowski-raport-sprzedazy-1999.xml -S (localdb)\v11.0

pause
