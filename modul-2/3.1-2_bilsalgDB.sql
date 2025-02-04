-- Kapittel 3
-- Oppgave 1 og 2


create database if not exists BilsalgDB;
use BilsalgDB;

-- Oppgave 1a)
create table if not exists Bilmodell (
    Bilmerke    varchar(30),
    Bilmodell   varchar(30),
    Gruppe      varchar(20),
    AntallHK    int not null,
    constraint BilmodellPK primary key (Bilmerke, Bilmodell)
);
create table if not exists Kommune (
    KommNr      int,
    KommNavn    varchar(30) unique not null,
    constraint KommunePK primary key (KommNr)
);
create table if not exists Bilsalg (
    Bilmerke    varchar(30),
    Bilmodell   varchar(30),
    KommNr      int,
    Aar         int,
    Maaned      int,
    Antall      int not null,
    constraint BilmodellFK foreign key (Bilmerke, Bilmodell) 
        references Bilmodell(Bilmerke, Bilmodell),
    constraint KommuneFK foreign key (KommNr)
        references Kommune(KommNr),
    constraint BilsalgPK primary key (Bilmerke, Bilmodell, KommNr, Aar, Maaned),
);

-- Oppgave 1b)
insert into Bilmodell (Bilmerke, Bilmodell, Gruppe, AntallHK) values
    ('Nissan', 'Leaf', 'El-bil', 100);

-- Oppgave 1c)
update Bilmodell set AntallHK = 90 
    where Bilmerke = 'Nissan' and Bilmodell = 'Leaf';

-- Oppgave 1d)
delete from Bilmodell 
    where Bilmerke = 'Nissan' and Bilmodell = 'Leaf';

-- Oppgave 2a)
alter table Bilmodell 
    add constraint GruppeVK check (
        Gruppe in ('personbil', 'varebil', 'lastebil', 'buss'));

-- Oppgave 2b)
alter table Bilmodell 
    add constraint AntallHKCHK check 
        (AntallHK > 0 and AntallHK < 300);

-- Oppgave 2c)
alter table Bilsalg 
    add constraint AarCHK check
        (Aar between 2020 and 2025);

-- Oppgave 2d)
alter table Bilsalg 
    add constraint MaanedCHK check
        (Maaned between 1 and 12);

-- Oppgave 2e)
create table BilGruppe (
    GruppeNr   int,
    GruppeNavn varchar(20),
    constraint GruppePK primary key (GruppeNr)
);
alter table Bilmodell 
    add column GruppeNr int after Gruppe,
    add constraint GruppeNrFK foreign key (GruppeNr) 
        references BilGruppe(GruppeNr);



-- Tester
select * from Bilsalg;
select * from Kommune;
select * from Bilmodell;

alter table Bilmodell drop constraint AntallHKCHK;
alter table Bilmodell drop constraint GruppeVK;
alter table Bilmodell drop column Gruppe2;

insert into Kommune (KommNr, KommNavn) values
    (1, 'Oslo'),
    (2, 'Bergen'),
    (3, 'Trondheim'),
    (4, 'Stavanger');
insert into Bilmodell (Bilmerke, Bilmodell, Gruppe, AntallHK) values
    ('Volvo', 'V40', 'Stasjonsvogn', 90),
    ('Volkswagen', 'Golf', 'Stasjonsvogn', 100),
    ('Hyundai', 'SantaFe', 'SUV', 200),
    ('Nissan', 'Leaf', 'El-bil', 100);
insert into Bilsalg (Bilmerke, Bilmodell, KommNr, Aar, Maaned, Antall) values
    ('Volvo', 'V40', 1, 2025, 1, 4),
    ('Hyundai', 'SantaFe', 4, 2025, 1, 2),
    ('Nissan', 'Leaf', 3, 2025, 1, 1),
    ('Volkswagen', 'Golf', 1, 2025, 1, 1),
    ('Volkswagen', 'Golf', 4, 2025, 1, 2),
    ('Nissan', 'Leaf', 4, 2025, 1, 2),
    ('Nissan', 'Leaf', 2, 2025, 1, 3);

delete from Bilsalg;
delete from Bilmodell;
delete from Kommune;