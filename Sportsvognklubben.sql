--HEJ <3
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
	Biltype varchar(55) NOT NULL,
	Bilensaargang varchar(55) NOT NULL,
	Andeninfo varchar(55)
);

--Indsætter data i tabellen "Klubinfo"
INSERT INTO Klubinfo VALUES ('Mark','Pedersen','Hanborienhule','666','5000','18-05-2020','Fedøse','1845','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Mads','Finseth','Mars','112','5200','18-05-2020','3hjuletcykel','1980','Andeninfokommerher')
INSERT INTO Klubinfo VALUES ('Jonas','Henriksen','Afrika','114','5300','18-05-2020','Elefant','1990','Andeninfokommerher')

--Se tabel indhold
SELECT * FROM Klubinfo;

--Slet tabel
DROP TABLE Klubinfo;


/*-------------------------------------------------------------------------------------------------------------------------------
Opgave F 
--------------------------------------------------------------------------------------------------------------------------------*/

--CREATE DB BACKUP
BACKUP DATABASE Sportsvognklub
TO DISK = 'C:\Users\Mads\Documents\GitHub\database_hf1\Sportsvognklubben.bak';

--RESTORE DB BACKUP
USE master
RESTORE DATABASE Sportsvognklub
FROM DISK = 'C:\Users\Mads\Documents\GitHub\database_hf1\Sportsvognklubben.bak';

CREATE PROCEDURE BackupDB
AS
BACKUP DATABASE Sportsvognklub
TO DISK = 'C:\Users\Mads\Documents\GitHub\database_hf1\Sportsvognklubben.bak';

EXEC BackupDB;