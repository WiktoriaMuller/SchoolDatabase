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
