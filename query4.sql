USE Szkola;

UPDATE Uczen
SET Imie = 'Joanna'
WHERE PESEL = '95100513772';

UPDATE Uczen
SET IDKlasy = (SELECT IDKlasy FROM Klasa WHERE Nazwa = '2C')
WHERE PESEL = '27071138908';

UPDATE Lekcja
SET Data = CONVERT(DATETIME, '02-01-2025 10:15', 104)
WHERE Temat = 'Budowa komórki roœlinnej i zwierzêcej';

UPDATE Uczen
SET DataUrodzenia = CONVERT(DATETIME, '15-05-2008', 104)
WHERE PESEL = '77090426445';

UPDATE Lekcja
SET PESELNauczyciela = '81321155104'
WHERE Temat = 'Analiza Pana Tadeusza';


DELETE FROM Uczen
WHERE PESEL = '79110527459';

DELETE FROM Lekcja
WHERE Temat = 'Zasady dynamiki Newtona';

DELETE FROM Przedmiot
WHERE Nazwa = 'Plastyka';

---doda³am ON DELETE CASCADE we wczeœniejszym pliku, dlatego on równie¿ jest za³¹czony