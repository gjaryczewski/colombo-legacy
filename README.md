Ćwiczenia z refaktoryzacji kodu SQL: spadkowa baza danych firny Colombo Ltd przechodzi do firny Rutkowski SA. 

# Kontekst 
 
Jesteśmy twórcami nowej operacyjnej bazy danych firmy Rutkowski SA. Firma powstała z przejęcia firmy Colombo Ltd i baza danych tej firmy stanowi punkt wyjścia dla prac nad nowym systemem transakcyjnym, a w drugim kroku także nad nową hurtownią danych. 
 
Do czasu przygotowania całościowego rozwiązania, istniejąca hurtownia danych musi być jednak zasilana plikami z projektowanego systemu z zachowaniem istniejącej infrastruktury. W szczególności powstawać mają takie same pliki ekstraktowe, które zasilają bieżący mechanizm ETL. 
 
# Zadanie 
 
W ramach projektu mamy do wykonania następujące zadanie: odtworzyć na bazie nowego systemu ekstrakt danych odpowiadający raportowi pt. "Sales Report 1999", którego celem jest znalezienie najlepszych i najmłodszych sprzedawców w roku 1999. 
 
Aczkolwiek zadanie wydaje się zbędne (po co odtwarzać ekstrakt z historycznymi danymi?), to jego wykonanie ma duże szanse powodzenia i jako takie  świetnie nadaje się do sprawdzenia koncepcji (proof of concept) oraz wykorzystania metody pocisku smugowego (trace bullet methodology). 
 
Raport jest szczegółowo opisany na archiwalnych stronach projektowych firmy Colombo SA, włącznie ze wskazówkami, jak zbudować raport krok po kroku: 
http://www.sqlexamples.info/SQL/tsql_salesrep2.htm 
 
# Narzędzia 
 
Preferowanym przez Klienta środowiskiem bazodanowym jest SQL Server w wersji 2012. Do zadań deweloperskich zastosujemy edycję LocalDb serwera SQL Server, która oferuje lekki ekwiwalent wszystkomającego serwisu bazy danych, uruchamianego i zamykanego razem ze środowiskiem programistycznym: 
https://msdn.microsoft.com/pl-pl/library/hh510202(v=sql.110).aspx 
 
Jako środowiska programistycznego użyjemy zaś SQL Server Management Studio: 
https://docs.microsoft.com/en-us/sql/ssms 
 
# Przygotowanie środowiska spadkowego 
 
Archiwum projektowe systemu bazodanowego firny Colombo Ltd jest dostępne za pośrednictwem serwisu www: 
http://www.sqlexamples.info/home.htm 
 
Dla naszego zadania szczególnie interesująca jest dostępność kopii zapasowej testowej bazy danych: 
http://www.sqlexamples.info/dow/colombo_bak_2012.zip 
 
1. Ściągamy plik ZIP i rozpakowujemy plik kopii zapasowej do katalogu lokalnego. 
2. Odtwarzamy bazę colombo z archiwum ściągniętego ze strony sqlexamples.info (restore-database-colombo.sql). 
3. Tworzymy w bazie colombo widok SalesReport1999, realizujący zadanie raportowe (colombo-sales-report-1999.sql). 
4. Przygotowujemy plik formatu dla mechanizmu ETL (colombo-sales-report-1999-format.cmd). 
5. Uruchamiamy skrypt ekstraktu dla mechanizmu ETL (colombo-sales-report-1999-export.cmd). 
6. Sprawdzamy, czy efektem działania jest plik ekstraktu (colombo-sales-report-1999.txt). 
 
# Przygotowanie środowiska rozwojowego 
 
1. Odtwarzamy aktualny stan projektu nowej bazy danych rutkowski (restore-database-rutkowski.sql). 
2. Przygotowujemy skrypt tworzący ramę nowego raportu jako widoku w bazie rutkowski (generate-code-for-bare-structure.sql). 
3. Tworzymy widok dla nowego raportu w bazie rutkowski (rutkowski-raport-sprzedazy-1999-0.sql). 
4. Przygotowujemy plik formatu dla mechanizmu ETL (rutkowski-raport-sprzedazy-1999-format.cmd). 
5. Uruchamiamy skrypt ekstraktu dla mechanizmu ETL (rutkowski-raport-sprzedazy-1999-export.cmd). 
6. Sprawdzamy, czy efektem działania jest plik ekstraktu (rutkowski-raport-sprzedazy-1999.txt). 
7. Piszemy skrypt porównujący zawartość plików (test-extracts-differences.cmd). 
8. Wykonujemy skrypt porównujący zawartość plików (test-extracts-differences.cmd). 
9. Przygotowujemy pierwszą wersję raportu, łącząc ramę z kodem spadkowym (rutkowski-raport-sprzedazy-1999-1.sql). 
 
# Refaktoryzacja kodu raportu 
 
1. Piszemy skrypt nadrzędny, wywołujący kolejne skrypty testowe (run-all-tests.cmd). 
2. Piszemy test na format pierwszej kolumny: nazwiska pisane małymi literami (test-all-names-in-lowercase.sql). 
3. Zmieniamy kod widoku tak, aby przeszedł powyższy test (rutkowski-raport-sprzedazy-1999-2.sql). 
4. Piszemy test na format trzeciej kolumny: format wyniku #####0.00 (test-record-amount-format.sql). 
5. Zmieniamy kod widoku tak, aby przeszedł powyższy test (rutkowski-raport-sprzedazy-1999-3.sql). 
6. Wykonujemy skrypt porównujący zawartość plików (test-extracts-differences.cmd). 
 
Więcej ogólnych informacji o koncepcji i metodach refaktoryzacji kodu można znaleźć w artykule Wikipedii:
https://en.wikipedia.org/wiki/Code_refactoring 
 
# Zastosowane zasady pragmatycznego programowania 
 
Pragmatic Software Development Tips 
https://pragprog.com/the-pragmatic-programmer/extracts/tips 
 
Care About Your Craft 
Why spend your life developing software unless you care about doing it well? 
 
Don’t Assume It—Prove It 
Prove your assumptions in the actual environment — with real data and boundary conditions. 
 
Write Code That Writes Code 
Code generators increase your productivity and help avoid duplication. 
 
# Inne metody refaktoryzacji i debugowania kodu SQL 
 
Running the Transact-SQL Debugger 
https://technet.microsoft.com/en-us/library/ff953262(v=sql.105).aspx 
 
Walkthrough: Creating and Running a SQL Server Unit Test 
https://msdn.microsoft.com/en-us/library/jj851212(v=vs.103).aspx 
 
tSQLt Tutorial 
http://tsqlt.org/user-guide/tsqlt-tutorial/ 
 
SQL Server Data Tools 
https://msdn.microsoft.com/en-us/library/hh272686(v=vs.103).aspx 
 
# Artykuły nt. szkoleniowej bazy SQL Server i przykłady użycia 
 
TSQL2012 Sample Database 
http://tsql.solidq.com/SampleDatabases/TSQL2012.zip 
 
Resources | Itzik Ben-Gan 
http://tsql.solidq.com/resources/ 
 
T-SQL Script List | Henry Chen 
https://henry416.wordpress.com/databases/microsoft-sql-server/t-sql-script-list/ 
 
# Bibliografia 
 
* Modelowanie danych (Sharon Allen) 
* Praca z zastanym kodem. Najlepsze techniki (Michael Feathers) 
* Pragmatyczny programista (Andy Hunt, Dave Thomas) 
* Praktyki mistrza SQL. Programowanie zaawansowane (Joe Celko) 
* Sprzedaj swój program. Droga do udanych projektów programistycznych (Jared R. Richardson, William A. Gwaltney Jr) 
* TDD. Sztuka tworzenia dobrego kodu (Kent Beck) 
* Training Kit (Exam 70-461): Querying Microsoft SQL Server 2012 (Itzik Ben-Gan) 
* Wzorce implementacyjne (Kent Beck) 
* Zwinne wytwarzanie oprogramowania. Najlepsze zasady, wzorce i praktyki (Robert C. Martin) 
