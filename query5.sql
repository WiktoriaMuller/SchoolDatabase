-- Selecting students along with their assigned class.

SELECT Imie "Imię", Nazwisko, Nazwa "Klasa"
FROM Uczen U
INNER JOIN Klasa K ON U.IDKlasy = K.IDKlasy

-- Selecting all classes with students, showing empty classes as well.

SELECT K.Nazwa "Nazwa klasy", U.Imie "Imię ucznia", U.Nazwisko "Nazwisko ucznia" 
FROM Klasa K
LEFT JOIN Uczen U ON K.IDKlasy = U.IDKlasy

-- Retrieving students along with teachers conducting their lessons, filtered by a specific teacher's last name.

SELECT U.Imie "Imię ucznia", U.Nazwisko "Nazwisko ucznia", N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela"
FROM Uczen U 
INNER JOIN Lekcja L ON U.IDKlasy = L.IDKlasy 
INNER JOIN Nauczyciel N ON L.PESELNauczyciela = N.PESEL
WHERE N.Nazwisko = 'Pyszczek'

-- Counting the number of lessons each student attends.

SELECT U.Imie "Imię", U.Nazwisko, COUNT(L.IDLekcji) "Liczba lekcji" 
FROM Uczen U 
LEFT JOIN Klasa K ON U.IDKlasy = K.IDKlasy
LEFT JOIN Lekcja L ON K.IDKlasy = L.IDKlasy
GROUP BY U.Imie, U.Nazwisko, U.PESEL

-- Retrieving lessons conducted by a specific teacher, ordered by date.

SELECT N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela", L.Temat "Temat lekcji", L.Data "Data rozpoczęcia" 
FROM Nauczyciel N
INNER JOIN Lekcja L ON N.PESEL = L.PESELNauczyciela
WHERE N.Nazwisko = 'Pyszczek'
ORDER BY L.Data ASC 

-- Creating a view to count the number of students in each class.

CREATE VIEW UczniowieWKlasie (NazwaKlasy, LiczbaUczniow)
AS SELECT K.Nazwa "Nazwa klasy", COUNT(U.PESEL) "Liczba uczniów" 
FROM Klasa K 
LEFT JOIN Uczen U ON K.IDKlasy = U.IDKlasy
GROUP BY K.Nazwa

-- Creating a view to count the number of lessons conducted by each teacher.

CREATE VIEW LiczbaLekcjiNauczycieli (ImieNauczyciela, NazwiskoNauczyciela, LiczbaLekcji)
AS SELECT N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela", COUNT(L.IDLekcji) "Liczba lekcji" 
FROM Nauczyciel N 
LEFT JOIN Lekcja L ON N.PESEL = L.PESELNauczyciela 
GROUP BY N.Imie, N.Nazwisko, N.PESEL

-- Creating a view to count the number of lessons for each subject.

CREATE VIEW LiczbaZajec (NazwaPrzedmiotu, LiczbaLekcji)
AS SELECT P.Nazwa "Nazwa przedmiotu", COUNT(L.IDLekcji) "Liczba lekcji" 
FROM Przedmiot P 
LEFT JOIN Lekcja L ON P.IDPrzedmiotu = L.IDPrzedmiotu
GROUP BY P.Nazwa
