/*-----------------------------------------------------------------------------------------------------------------------------
Opgave A 
------------------------------------------------------------------------------------------------------------------------------*/
USE master

--Først opretter vi en database
CREATE DATABASE Sportsvognklub;
GO
--Bruger den nyoprettede database
USE Sportsvognklub;
GO
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
INSERT INTO Klubinfo VALUES ('Hans','Hansen','Sverige','78987612','3600','11-01-2020','3','2020','Andeninfokommerher')

--Se tabel "Klubinfo" indhold
SELECT * FROM Klubinfo;

USE Sportsvognklub;
--Opretter en tabel med navnet "Bilklasse"
CREATE TABLE Bilklasse (
	BilklasseID int IDENTITY (1,1) PRIMARY KEY,
	Klasse varchar(55) NOT NULL
);
GO
--Indsætter data i tabellen "Bilklasse"
INSERT INTO Bilklasse VALUES ('Personbil')
INSERT INTO Bilklasse VALUES ('Sportsvogn')
INSERT INTO Bilklasse VALUES ('Veteran')
INSERT INTO Bilklasse VALUES ('Kabriolet')

--Se tabel indhold
SELECT * FROM Bilklasse;

--Vis biltyper, sorter efter "BilklasseID"
SELECT Klasse, BilklasseID
FROM Klubinfo, Bilklasse
WHERE BilklasseID = Biltype
Order by BilklasseID

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave B
------------------------------------------------------------------------------------------------------------------------------*/

--Opretter en SP der tilføjer data til en tabel
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

--En SP som viser antal medlemmer
Create procedure Antal
AS
--Start
Begin
Select * from Klubinfo 
End
Exec Antal
Select @@rowcount
--Slut

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave C
------------------------------------------------------------------------------------------------------------------------------*/

--Opretter View af Medlemsnummer, Navn, Efternav, Biltype og Årgang
CREATE VIEW Medlemmer_køre
as
select Medlemsnummer, Fornavn, Efternavn, Klasse, Bilensaargang From Klubinfo, Bilklasse Where Biltype=BilklasseID

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave D
------------------------------------------------------------------------------------------------------------------------------*/

https://github.com/Mads80/database_hf1/blob/master/dbdiagram.png

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave E
------------------------------------------------------------------------------------------------------------------------------*/

--CREATE SQL USER
--Først opretter du et nyt "Login" her: Sercurity->Logins->New Login...
use Sportsvognklub
create user MadsHarEnSportsVogn for login MadsHarEnSportsVogn
create user MarkHarEnKabriolet for login MarkHarEnKabriolet
--Grant <permission-name> on <object-name> to <username\principle>
GO
--Giv brugeren "MarkHarEnKabriolet" lov til at læse i tabellen "Klubinfo" og ikke andet
Grant Select on Klubinfo to MarkHarEnKabriolet

-- Opretter en ny bruger med Windows autentifikation
USE [Sportsvognklub]
GO
CREATE USER [Jonas B] FOR LOGIN [DESKTOP-MBOR3K8\Jonas Bagge] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO

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

/*

Der kan operrets Scripts ikke kun til login men mange andre funktioner. Dette vises ved hjælp af et billede med testen Script ved siden af den.
for eksempel SQL Server->Security->Server Roles herefter højreklikker der på "Server Roles" og "New Server Roles". Efter der er fuldt de nødvendige
data in kan der nu trykkets på "Script" oppe ved siden af "Help", dette vil give en ny Query med den code der skal til.

*/

