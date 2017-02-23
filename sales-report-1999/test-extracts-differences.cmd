@echo off

rem Parametry polecenia FC
rem   /A         Wy�wietla tylko pierwszy i ostatni wiersz ka�dego zestawu r�nic.
rem   /B         Wykonuje por�wnywanie w systemie dw�jkowym (binarne).
rem   /C         Nie rozr�nia wielkich i ma�ych liter.
rem   /L         Por�wnuje pliki jako tekst ASCII.
rem   /LBn       Ustala maksymaln� liczb� kolejnych wyst�pie� niezgodno�ci
rem              na okre�lon� liczb� wierszy.
rem   /N         Przy por�wnywaniu ASCII wy�wietla numery wierszy.
rem   /OFF[LINE] Nie pomija plik�w z ustawionym atrybutem przesuni�cia.
rem   /T         Nie zamienia tabulator�w na spacje.
rem   /U         Por�wnuje pliki jako pliki tekstowe UNICODE.
rem   /W         Kompresuje do por�wnania bia�e miejsca (tabulatory i spacje).
rem   /nnnn      Okre�la liczb� kolejnych wierszy, kt�re musz� by� zgodne
rem              po wyst�pieniu niezgodno�ci.

fc /b colombo-sales-report-1999.txt rutkowski-raport-sprzedazy-1999.txt

pause