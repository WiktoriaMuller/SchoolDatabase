-- Updating, modifying, and removing data in the "Szkola" database.

USE Szkola;

-- Changing the first name of a student.

UPDATE Uczen
SET Imie = 'Joanna'
WHERE PESEL = '95100513772';

-- Changing the class assignment of a student.

UPDATE Uczen
SET IDKlasy = (SELECT IDKlasy FROM Klasa WHERE Nazwa = '2C')
WHERE PESEL = '27071138908';

-- Changing the date and time of a specific lesson.

UPDATE Lekcja
SET Data = CONVERT(DATETIME, '02-01-2025 10:15', 104)
WHERE Temat = 'Budowa komórki roślinnej i zwierzęcej';

-- Updating student birthdate.

UPDATE Uczen
SET DataUrodzenia = CONVERT(DATETIME, '15-05-2008', 104)
WHERE PESEL = '77090426445';

-- Assigning a new teacher to a specific lesson.

UPDATE Lekcja
SET PESELNauczyciela = '81321155104'
WHERE Temat = 'Analiza Pana Tadeusza';

-- Removing a student from the "Uczen" table.

DELETE FROM Uczen
WHERE PESEL = '79110527459';

-- Deleting a lesson from the "Lekcja" table.

DELETE FROM Lekcja
WHERE Temat = 'Zasady dynamiki Newtona';

-- Removing a subject from the "Przedmiot" table.

DELETE FROM Przedmiot
WHERE Nazwa = 'Plastyka';
