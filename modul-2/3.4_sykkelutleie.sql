-- Kapittel 3
-- Opggave 4

-- ny database
CREATE DATABASE SykkelutleieDB;
USE SykkelutleieDB;

-- Create tables with constraints
CREATE TABLE Modell (
    MNr INT PRIMARY KEY,
    Modellnavn VARCHAR(50) NOT NULL,
    Dagspris DECIMAL(10,2) NOT NULL CHECK (Dagspris > 0)
);

CREATE TABLE Sykkel (
    MNr INT,
    KopiNr INT,
    Ramme VARCHAR(20) NOT NULL,
    Farge VARCHAR(30) NOT NULL,
    PRIMARY KEY (MNr, KopiNr),
    FOREIGN KEY (MNr) REFERENCES Modell(MNr)
);

CREATE TABLE Kunde (
    KNr INT PRIMARY KEY,
    Fornavn VARCHAR(50) NOT NULL,
    Etternavn VARCHAR(50) NOT NULL,
    MobilNr VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Utleie (
    KNr INT,
    MNr INT,
    KopiNr INT,
    DatoUt DATE NOT NULL,
    DatoInn DATE,
    PRIMARY KEY (KNr, MNr, KopiNr, DatoUt),
    FOREIGN KEY (KNr) REFERENCES Kunde(KNr),
    FOREIGN KEY (MNr, KopiNr) REFERENCES Sykkel(MNr, KopiNr),
    CHECK (DatoInn IS NULL OR DatoInn >= DatoUt)
);

-- Insert sample data
INSERT INTO Modell VALUES
(1, 'Mountain Explorer', 299.00),
(2, 'City Cruiser', 199.00),
(3, 'Racing Pro', 399.00);

INSERT INTO Sykkel VALUES
(1, 1, 'Large', 'Red'),
(1, 2, 'Medium', 'Blue'),
(2, 1, 'Small', 'Black'),
(3, 1, 'Medium', 'White');

INSERT INTO Kunde VALUES
(1, 'Ole', 'Hansen', '12345678'),
(2, 'Kari', 'Olsen', '87654321');

INSERT INTO Utleie VALUES
(1, 1, 1, '2024-02-01', '2024-02-03'),
(2, 2, 1, '2024-02-04', NULL);


-- Tester
SELECT * FROM Modell;
SELECT * FROM Sykkel;
SELECT * FROM Kunde;
SELECT * FROM Utleie;