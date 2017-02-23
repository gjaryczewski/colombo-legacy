@echo off

rem Parametry polecenia FC
rem   /A         Wyœwietla tylko pierwszy i ostatni wiersz ka¿dego zestawu ró¿nic.
rem   /B         Wykonuje porównywanie w systemie dwójkowym (binarne).
rem   /C         Nie rozró¿nia wielkich i ma³ych liter.
rem   /L         Porównuje pliki jako tekst ASCII.
rem   /LBn       Ustala maksymaln¹ liczbê kolejnych wyst¹pieñ niezgodnoœci
rem              na okreœlon¹ liczbê wierszy.
rem   /N         Przy porównywaniu ASCII wyœwietla numery wierszy.
rem   /OFF[LINE] Nie pomija plików z ustawionym atrybutem przesuniêcia.
rem   /T         Nie zamienia tabulatorów na spacje.
rem   /U         Porównuje pliki jako pliki tekstowe UNICODE.
rem   /W         Kompresuje do porównania bia³e miejsca (tabulatory i spacje).
rem   /nnnn      Okreœla liczbê kolejnych wierszy, które musz¹ byæ zgodne
rem              po wyst¹pieniu niezgodnoœci.

fc /b colombo-sales-report-1999.txt rutkowski-raport-sprzedazy-1999.txt

pause