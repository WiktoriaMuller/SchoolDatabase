-- Creating a database schema for a school management system in the "Szkola" database.
-- It defines tables for classes, students, teachers, subjects, lessons, and the relationships between them.

USE Szkola;

-- Creating the "Klasa" table to store class details.

CREATE TABLE Klasa
(
	Nazwa VARCHAR(8),
	Profil VARCHAR(32),
	Rocznik DATE,
	Sala VARCHAR(8),
	IDKlasy INT PRIMARY KEY IDENTITY(1,1)
)

-- Creating the "Uczen" (Student) table to store student details.
	
	CREATE TABLE Uczen
(
	PESEL VARCHAR(11) PRIMARY KEY,
	Imie VARCHAR(32),
	Nazwisko VARCHAR(64),
	DataUrodzenia DATE,
	Plec VARCHAR(1),
	Adres VARCHAR(250),
	Telefon VARCHAR(12),
	MiejsceUrodzenia VARCHAR(32),
	UNIQUE (PESEL),
	IDKlasy INT,
	FOREIGN KEY (IDKlasy) REFERENCES Klasa(IDKlasy)
)

-- Creating the "Nauczyciel" (Teacher) table to store teacher details.
	
CREATE TABLE Nauczyciel
(
	PESEL VARCHAR(11) PRIMARY KEY,
	Imie VARCHAR(32),
	Nazwisko VARCHAR(64),
	DataUrodzenia DATE,
	Plec VARCHAR(1),
	Specjalizacja VARCHAR(100),
	Telefon VARCHAR(12),
	Adres VARCHAR(250),
	TytulNaukowy VARCHAR(64),
	DataZatrudnienia DATE,
	UNIQUE (PESEL)
)

-- Creating the "Przedmiot" (Subject) table to store details about subjects taught in the school.

CREATE TABLE Przedmiot
(
	Nazwa VARCHAR(64),
	Dziedzina VARCHAR(64),
	Wymagania TEXT,
	Zakres TEXT,
	LiczbaGodzin INT,
	IDPrzedmiotu INT PRIMARY KEY IDENTITY(1,1),
)

-- Creating the "Lekcja" (Lesson) table to store details about individual lessons.

CREATE TABLE Lekcja
(
	Temat VARCHAR(250),
	Data DATETIME,
	Sala VARCHAR(8),
	CzasTrwania INT,
	IDLekcji INT PRIMARY KEY IDENTITY(1,1),
	IDKlasy INT,
	FOREIGN KEY (IDKlasy) REFERENCES Klasa(IDKlasy),
	PESELNauczyciela VARCHAR(11),
	FOREIGN KEY (PESELNauczyciela) REFERENCES Nauczyciel(PESEL),
	IDPrzedmiotu INT,
	FOREIGN KEY (IDPrzedmiotu) REFERENCES Przedmiot(IDPrzedmiotu)
		ON DELETE CASCADE
)

-- Creating the "NauczycielKlasa" (Teacher-Class Relationship) table.
-- This table establishes a many-to-many relationship between teachers and classes.

CREATE TABLE NauczycielKlasa
(	
	PRIMARY KEY (PESELNauczyciela, IDKlasy),
	PESELNauczyciela VARCHAR(11),
	FOREIGN KEY (PESELNauczyciela) REFERENCES Nauczyciel(PESEL),
	IDKlasy INT,
	FOREIGN KEY (IDKlasy) REFERENCES Klasa(IDKlasy)
)
