-- Kontekst

Jesteœmy twórcami nowej operacyjnej bazy danych firmy Rutkowski SA. Firma powsta³a z przejêcia firmy Colombo Ltd i dane tej firmy stanowi¹ punkt wyjœcia dla dalszych prac.

Do czasu przygotowania ca³oœciowego rozwi¹zania, istniej¹ca hurtownia danych musi byæ zasilana plikami z zachowaniem istniej¹cej infrastruktury. W szczególnoœci powstawaæ maj¹ takie same pliki ekstraktowe, które zasilaj¹ mechanizm ETL.

-- Zadanie

Odtworzyæ ekstrakt odpowiadaj¹cy raportowi pt. "Sales Report 1999", którego celem jest znalezienie najlepszych i najm³odszych sprzedawców w roku 1999.

Sales Reports using TSQL syntax. Part 2
http://www.sqlexamples.info/SQL/tsql_salesrep2.htm

-- Narzêdzia

SQL Server 2012 Express LocalDB
https://msdn.microsoft.com/pl-pl/library/hh510202(v=sql.110).aspx

SqlLocalDB Utility
https://msdn.microsoft.com/pl-pl/library/hh212961(v=sql.110).aspx

SQL Server Management Studio
https://docs.microsoft.com/en-us/sql/ssms

-- Spadkowa baza danych Colombo Ltd

Archive of SQL examples
http://www.sqlexamples.info/home.htm

WEB resources
http://www.sqlexamples.info/resources.htm

database .bak file with tables used in sql examples
http://www.sqlexamples.info/dow/colombo_bak_2012.zip

-- Przygotowanie œrodowiska spadkowego

1. Odtwarzamy bazê colombo z archiwum œci¹gniêtego ze strony sqlexamples.info (restore-database-colombo.sql).
2. Tworzymy w bazie colombo widok SalesReport1999, realizuj¹cy zadanie raportowe (colombo-sales-report-1999.sql).
3. Przygotowujemy plik formatu dla mechanizmu ETL (colombo-sales-report-1999-format.cmd).
4. Uruchamiamy skrypt ekstraktu dla mechanizmu ETL (colombo-sales-report-1999-export.cmd).
5. Sprawdzamy, czy efektem dzia³ania jest plik ekstraktu (colombo-sales-report-1999.txt).

-- Przygotowanie œrodowiska rozwojowego

1. Odtwarzamy aktualny stan projektu nowej bazy danych rutkowski (restore-database-rutkowski.sql).
2. Przygotowujemy skrypt tworz¹cy ramê nowego raportu jako widoku w bazie rutkowski (generate-code-for-bare-structure.sql).
3. Tworzymy widok dla nowego raportu w bazie rutkowski (rutkowski-raport-sprzedazy-1999-0.sql).
4. Przygotowujemy plik formatu dla mechanizmu ETL (rutkowski-raport-sprzedazy-1999-format.cmd).
5. Uruchamiamy skrypt ekstraktu dla mechanizmu ETL (rutkowski-raport-sprzedazy-1999-export.cmd).
6. Sprawdzamy, czy efektem dzia³ania jest plik ekstraktu (rutkowski-raport-sprzedazy-1999.txt).
7. Piszemy skrypt porównuj¹cy zawartoœæ plików (test-extracts-differences.cmd).
8. Wykonujemy skrypt porównuj¹cy zawartoœæ plików (test-extracts-differences.cmd).
9. Przygotowujemy pierwsz¹ wersjê raportu, ³¹cz¹c ramê z kodem spadkowym (rutkowski-raport-sprzedazy-1999-1.sql).

-- Refaktoryzacja kodu raportu

1. Piszemy skrypt nadrzêdny, wywo³uj¹cy kolejne skrypty testowe (run-all-tests.cmd).
2. Piszemy test na format pierwszej kolumny: nazwiska pisane ma³ymi literami (test-all-names-in-lowercase.sql).
3. Zmieniamy kod widoku tak, aby przeszed³ powy¿szy test (rutkowski-raport-sprzedazy-1999-2.sql).
4. Piszemy test na format trzeciej kolumny: format wyniku #####0.00 (test-record-amount-format.sql).
5. Zmieniamy kod widoku tak, aby przeszed³ powy¿szy test (rutkowski-raport-sprzedazy-1999-3.sql).
6. Wykonujemy skrypt porównuj¹cy zawartoœæ plików (test-extracts-differences.cmd).

Refaktoryzacja kodu (ogólnie)
https://en.wikipedia.org/wiki/Code_refactoring

-- Zastosowane zasady pragmatycznego programowania

Pragmatic Software Development Tips
https://pragprog.com/the-pragmatic-programmer/extracts/tips

Care About Your Craft
Why spend your life developing software unless you care about doing it well?

Don’t Assume It—Prove It
Prove your assumptions in the actual environment — with real data and boundary conditions.

Write Code That Writes Code
Code generators increase your productivity and help avoid duplication.

-- Inne metody refaktoryzacji i debugowania kodu SQL

Running the Transact-SQL Debugger
https://technet.microsoft.com/en-us/library/ff953262(v=sql.105).aspx

Walkthrough: Creating and Running a SQL Server Unit Test
https://msdn.microsoft.com/en-us/library/jj851212(v=vs.103).aspx

tSQLt Tutorial
http://tsqlt.org/user-guide/tsqlt-tutorial/

SQL Server Data Tools
https://msdn.microsoft.com/en-us/library/hh272686(v=vs.103).aspx

-- Artyku³y nt. szkoleniowej bazy SQL Server i przyk³ady u¿ycia

TSQL2012 Sample Database
http://tsql.solidq.com/SampleDatabases/TSQL2012.zip

Resources | Itzik Ben-Gan
http://tsql.solidq.com/resources/

T-SQL Script List | Henry Chen
https://henry416.wordpress.com/databases/microsoft-sql-server/t-sql-script-list/

-- Bibliografia

Modelowanie danych (Sharon Allen)
Praca z zastanym kodem. Najlepsze techniki (Michael Feathers)
Pragmatyczny programista (Andy Hunt, Dave Thomas)
Praktyki mistrza SQL. Programowanie zaawansowane (Joe Celko)
Sprzedaj swój program. Droga do udanych projektów programistycznych (Jared R. Richardson, William A. Gwaltney Jr)
TDD. Sztuka tworzenia dobrego kodu (Kent Beck)
Training Kit (Exam 70-461): Querying Microsoft SQL Server 2012 (Itzik Ben-Gan)
Wzorce implementacyjne (Kent Beck)
Zwinne wytwarzanie oprogramowania. Najlepsze zasady, wzorce i praktyki (Robert C. Martin)