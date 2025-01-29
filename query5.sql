SELECT Imie "Imię", Nazwisko, Nazwa "Klasa" FROM Uczen U INNER JOIN Klasa K ON U.IDKlasy = K.IDKlasy

SELECT K.Nazwa "Nazwa klasy", U.Imie "Imię ucznia", U.Nazwisko "Nazwisko ucznia" FROM Klasa K LEFT JOIN Uczen U ON K.IDKlasy = U.IDKlasy

SELECT U.Imie "Imię ucznia", U.Nazwisko "Nazwisko ucznia", N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela"
FROM Uczen U 
INNER JOIN Lekcja L ON U.IDKlasy = L.IDKlasy 
INNER JOIN Nauczyciel N ON L.PESELNauczyciela = N.PESEL
WHERE N.Nazwisko = 'Pyszczek'

SELECT U.Imie "Imię", U.Nazwisko, COUNT(L.IDLekcji) "Liczba lekcji" FROM Uczen U LEFT JOIN Klasa K ON U.IDKlasy = K.IDKlasy LEFT JOIN Lekcja L ON K.IDKlasy = L.IDKlasy
GROUP BY U.Imie, U.Nazwisko, U.PESEL

SELECT N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela", L.Temat "Temat lekcji", L.Data "Data rozpoczęcia" FROM Nauczyciel N INNER JOIN Lekcja L ON N.PESEL = L.PESELNauczyciela
WHERE N.Nazwisko = 'Pyszczek'
ORDER BY L.Data ASC 

CREATE VIEW UczniowieWKlasie (NazwaKlasy, LiczbaUczniow)
AS 
SELECT K.Nazwa "Nazwa klasy", COUNT(U.PESEL) "Liczba uczniów" 
FROM Klasa K 
LEFT JOIN Uczen U ON K.IDKlasy = U.IDKlasy
GROUP BY K.Nazwa

CREATE VIEW LiczbaLekcjiNauczycieli (ImieNauczyciela, NazwiskoNauczyciela, LiczbaLekcji)
AS SELECT N.Imie "Imię nauczyciela", N.Nazwisko "Nazwisko nauczyciela", COUNT(L.IDLekcji) "Liczba lekcji" FROM Nauczyciel N LEFT JOIN Lekcja L ON N.PESEL = L.PESELNauczyciela 
GROUP BY N.Imie, N.Nazwisko, N.PESEL

CREATE VIEW LiczbaZajec (NazwaPrzedmiotu, LiczbaLekcji)
AS SELECT P.Nazwa "Nazwa przedmiotu", COUNT(L.IDLekcji) "Liczba lekcji" FROM Przedmiot P LEFT JOIN Lekcja L ON P.IDPrzedmiotu = L.IDPrzedmiotu
GROUP BY P.Nazwa
