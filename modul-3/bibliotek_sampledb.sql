-- Database: Bibliotek



-- Sletter tabellene

-- For å få et skript som kan kjøres flere ganger:

-- DROP TABLE Utlån;
-- DROP TABLE Låner;
-- DROP TABLE Eksemplar;
-- DROP TABLE Bok;


-- MySQL
-- For å få et skript som kan kjøres flere ganger,
-- og som fungerer enten tabellen(e) finnes eller ikke:

-- DROP TABLE IF EXISTS Utlån;
-- DROP TABLE IF EXISTS Låner;
-- DROP TABLE IF EXISTS Eksemplar;
-- DROP TABLE IF EXISTS Bok;

-- nydb
create database if not exists BibliotekDB;
use BibliotekDB;

-- Oppretter tabellene

CREATE TABLE Bok
(
  ISBN        VARCHAR(15),
  Tittel      VARCHAR(50),
  Forfatter   VARCHAR(50),
  Forlag      VARCHAR(50),
  UtgittÅr    INTEGER,
  AntallSider INTEGER,
  CONSTRAINT BokPK PRIMARY KEY (ISBN)
);

CREATE TABLE Eksemplar
(
  ISBN        VARCHAR(15),
  EksNr       INTEGER,
  CONSTRAINT EksemplarPK PRIMARY KEY (ISBN, EksNr),
  CONSTRAINT EksemplarBokFK FOREIGN KEY (ISBN)
    REFERENCES Bok (ISBN)
);

CREATE TABLE Låner
(
  LNr         INTEGER,
  Fornavn     VARCHAR(50),
  Etternavn   VARCHAR(50),
  Adresse     VARCHAR(100),
  CONSTRAINT LånerPK PRIMARY KEY (LNr)
);

CREATE TABLE Utlån
(
  UtlånsNr    INTEGER,
  LNr         INTEGER,
  ISBN        VARCHAR(15),
  EksNr       INTEGER,
  Utlånsdato  DATE,
  Levert      CHAR(1),
  CONSTRAINT UtlånPK PRIMARY KEY (UtlånsNr),
  CONSTRAINT UtlånEksemplarFK FOREIGN KEY (ISBN, EksNr)
    REFERENCES Eksemplar (ISBN, EksNr),
  CONSTRAINT UtlånLånerFK FOREIGN KEY (LNr)
    REFERENCES Låner (LNr)
);


-- Setter inn eksempeldata

INSERT INTO Bok (ISBN, Tittel, Forfatter, Forlag, UtgittÅr, AntallSider) VALUES
('8203188443', 'Kristin Lavransdatter: kransen', 'Undset, Sigrid', 'Aschehoug', 1920, 323),
('8203209394', 'Fyret: en ny sak for Dalgliesh', 'James, P. D.', 'Aschehoug', 2005, 413),
('8205312443', 'Lasso rundt fru Luna', 'Mykle, Agnar', 'Gyldendal', 1954, 614),
('8205336148', 'Victoria', 'Hamsun, Knut', 'Gyldendal', 1898, 111),
('8253025033', 'Jonas', 'Bjørneboe, Jens', 'Pax', 1955, 302),
('8278442231', 'Den gamle mannen og havet', 'Hemingway, Ernest', 'Gyldendal', 1952, 99);


INSERT INTO Eksemplar (ISBN, EksNr) VALUES
('8203188443', 1),
('8203188443', 2),
('8203209394', 1),
('8203209394', 2),
('8203209394', 3),
('8205312443', 1),
('8205336148', 1),
('8205336148', 2),
('8253025033', 1),
('8253025033', 2),
('8278442231', 1);


INSERT INTO Låner (LNr, Fornavn, Etternavn, Adresse) VALUES
(1, 'Lise', 'Jensen', 'Erling Skjalgssons gate 56'),
(2, 'Joakim', 'Gjertsen', 'Grinda 2'),
(3, 'Katrine', 'Garvik', 'Ottar Birtings gate 9'),
(4, 'Emilie', 'Marcussen', 'Kyrre Grepps gate 19'),
(5, 'Valter', 'Eilertsen', 'Fyrstikkbakken 5D'),
(6, 'Tormod', 'Vaksdal', 'Lassons gate 32'),
(7, 'Asle', 'Eckhoff', 'Kirkeveien 5'),
(8, 'Birthe', 'Aass', 'Henrik Wergelands Allé 47');


INSERT INTO Utlån (UtlånsNr, LNr, ISBN, EksNr, Utlånsdato, Levert) VALUES
(1, 2, '8203209394', 1, '2016-08-25', '0'),
(2, 2, '8253025033', 2, '2016-08-25', '1'),
(3, 3, '8203188443', 1, '2016-08-25', '0'),
(4, 4, '8278442231', 1, '2016-08-25', '0'),
(5, 2, '8205336148', 2, '2016-08-27', '0'),
(6, 8, '8203209394', 2, '2016-08-27', '0'),
(7, 7, '8205312443', 1, '2016-08-27', '1');
