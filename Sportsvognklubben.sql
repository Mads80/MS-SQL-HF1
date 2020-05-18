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
	ID int IDENTITY (1,1) PRIMARY KEY,
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
INSERT INTO Klubinfo VALUES ('Mark','Pedersen','Hanborienhule','666','5000','18-05-2020','1','1845','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Mads','Finseth','Mars','112','5200','18-05-2020','2','1980','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Jonas','Henriksen','Afrika','114','5300','18-05-2020','3','1990','Andeninfokommerher')

--Se tabel indhold
SELECT * FROM Klubinfo;

USE Sportsvognklub;

CREATE TABLE Bilklasse (
	ID int IDENTITY (1,1) PRIMARY KEY,
	Klasse varchar(55) NOT NULL
);

INSERT INTO Bilklasse VALUES ('Personbil')
INSERT INTO Bilklasse VALUES ('Sportsvogn')
INSERT INTO Bilklasse VALUES ('Veteran')
INSERT INTO Bilklasse VALUES ('Kabriolet')

SELECT * FROM Bilklasse;

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
exec Medlemmer 'brian', 'Briansen', 'Odense', '200', '5000', '18-5-2020', 'C', '2000', 'Andeninfokommerher'

--Opretter procedure til at finde et medlem ved hjælp af navn

create procedure Find_medlem
@Fornavn varchar (20)
AS
select * from Klubinfo
Where  Fornavn =  @fornavn
go

exec Find_medlem 'Mads'

--En SP som tæller hvor mange medlemmer vi har
Create procedure Antal
AS
Begin
--Herfra køre du til og med rowcount. I result ser man 2 kasser, hvor den første består af medlemmer og anden kasse tæller hvor mange medlemmer der er. 
    Select * from Klubinfo 
End
Exec Antal
Select @@rowcount

/*-----------------------------------------------------------------------------------------------------------------------------
Opgave C
------------------------------------------------------------------------------------------------------------------------------*/

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