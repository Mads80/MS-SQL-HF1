/*-----------------------------------------------------------------------------------------------------------------------------
Opgave A 
------------------------------------------------------------------------------------------------------------------------------*/

USE master

--Først opretter vi en database
CREATE DATABASE Sportsvognklub;
GO
--Bruger den nyoprettede database
USE Sportsvognklub;

--Opretter en tabel med navnet "Klubinfo"
CREATE TABLE Klubinfo (
	Medlemsnummer int IDENTITY (1,1) PRIMARY KEY,
	Fornavn varchar(55) NOT NULL,
	Efternavn varchar(55) NOT NULL,
	Adresse varchar(55) NOT NULL,
	Telefonnummer int NOT NULL,
	Postnummer int NOT NULL,
	Indmeldingsdato varchar(55) NOT NULL,
	Biltype int NOT NULL,
	Bilensaargang varchar(55) NOT NULL,
	Andeninfo varchar(55)
);

--Indsætter data i tabellen "Klubinfo"
INSERT INTO Klubinfo VALUES ('Mark','Pedersen','Hanborienhule','666','5000','18-05-2020','2','1845','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Mads','Finseth','Mars','112','5200','18-05-2020','1','1980','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Jonas','Henriksen','Afrika','114','5300','18-05-2020','4','1990','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Jane','Doe','Østrig','55555555','4600','12-07-2020','3','1790','Andeninfokommerher')

--Se tabel indhold
SELECT * FROM Klubinfo;

USE Sportsvognklub;
--Opretter en tabel med navnet "Bilklasse"
CREATE TABLE Bilklasse (
	BilklasseID int IDENTITY (1,1) PRIMARY KEY,
	Klasse varchar(55) NOT NULL
);

--Indsætter data i tabellen "Bilklasse"
INSERT INTO Bilklasse VALUES ('Personbil')
INSERT INTO Bilklasse VALUES ('Sportsvogn')
INSERT INTO Bilklasse VALUES ('Veteran')
INSERT INTO Bilklasse VALUES ('Kabriolet')

--Se tabel indhold
SELECT * FROM Bilklasse;

--Vis biltyper efter klasse
SELECT Klasse
FROM Klubinfo, Bilklasse
WHERE BilklasseID = Biltype
Order by BilklasseID

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave B
------------------------------------------------------------------------------------------------------------------------------*/

--Opretter en Stored procedure til at ændre data i tabel
Create procedure Medlemmer

@Fornavn varchar(20),
@Efternavn varchar(20),
@Adresse varchar(20),
@Telefonnummer Int,
@Postnummer Int,
@Indmeldingsdato varchar(20),
@Biltype int,
@Bilensaargang int,
@Andeninfo varchar (20)
as
INSERT INTO Klubinfo (Fornavn, Efternavn, Adresse, Telefonnummer, Postnummer, Indmeldingsdato, Biltype, Bilensaargang, Andeninfo)
Values (@Fornavn, @Efternavn, @Adresse, @Telefonnummer, @Postnummer, @Indmeldingsdato, @Biltype, @Bilensaargang, @Andeninfo)
Go

--Her executer vi det nye medlem
Exec Medlemmer 'Brian', 'Briansen', 'Odense', '200', '5000', '18-5-2020', '3', '2000', 'Andeninfokommerher'

--Opretter procedure til at finde et medlem ved hjælp af navn

create procedure Find_medlem
@Fornavn varchar (20)
AS
select * from Klubinfo
Where  Fornavn =  @fornavn
go

Exec Find_medlem 'Mads'

--En SP som tæller hvor mange medlemmer vi har
Create procedure Antal
AS
--Herfra køre du til og med rowcount. I result ser man 2 kasser, hvor den første består af medlemmer og anden kasse tæller hvor mange medlemmer der er.
Begin
Select * from Klubinfo 
End
Exec Antal
Select @@rowcount

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave C
------------------------------------------------------------------------------------------------------------------------------*/

--Opretter View af Medlemsnummer,Navn,Efternav,Biltype og Årgang
CREATE VIEW Medlemmer_køre
as
select Medlemsnummer, Fornavn, Efternavn, Klasse, Bilensaargang From Klubinfo, Bilklasse Where Biltype=BilklasseID

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave D
------------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave E
------------------------------------------------------------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave F_a
------------------------------------------------------------------------------------------------------------------------------*/

--CREATE DB BACKUP
BACKUP DATABASE Sportsvognklub
TO DISK = 'C:\Sportsvognklubben.bak';

--RESTORE DB BACKUP
USE master
RESTORE DATABASE Sportsvognklub
FROM DISK = 'C:\Sportsvognklubben.bak';

--BACKUP DB PROCEDURE
CREATE PROCEDURE BackupDB
AS
BACKUP DATABASE Sportsvognklub
TO DISK = 'C:\Sportsvognklubben.bak';

EXEC BackupDB;

--RESTORE DB PROCEDURE
CREATE PROCEDURE RestoreDB
AS
RESTORE DATABASE Sportsvognklub
TO DISK = 'C:\Sportsvognklubben.bak';

EXEC RestoreDB;

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave F_b
------------------------------------------------------------------------------------------------------------------------------*/

--Slet database
DROP DATABASE Sportsvognklub;
--Slet tabel
DROP TABLE Klubinfo;

--Slet database procedure
Create Procedure SletDB
AS
Drop database Sportsvognklub;

EXEC SletDB;

--Slet tabel procedure
Create Procedure SletTabel
AS
Drop table Klubinfo;

EXEC SletTabel;

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave G
------------------------------------------------------------------------------------------------------------------------------*/