USE Szkola;

CREATE TABLE Klasa
(
	Nazwa VARCHAR(8),
	Profil VARCHAR(32),
	Rocznik DATE,
	Sala VARCHAR(8),
	IDKlasy INT PRIMARY KEY IDENTITY(1,1)
)

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

CREATE TABLE Przedmiot
(
	Nazwa VARCHAR(64),
	Dziedzina VARCHAR(64),
	Wymagania TEXT,
	Zakres TEXT,
	LiczbaGodzin INT,
	IDPrzedmiotu INT PRIMARY KEY IDENTITY(1,1),
)

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

CREATE TABLE NauczycielKlasa
(	
	PRIMARY KEY (PESELNauczyciela, IDKlasy),
	PESELNauczyciela VARCHAR(11),
	FOREIGN KEY (PESELNauczyciela) REFERENCES Nauczyciel(PESEL),
	IDKlasy INT,
	FOREIGN KEY (IDKlasy) REFERENCES Klasa(IDKlasy)
)
