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
	Medlemsnummer int NOT NULL,
	Indmeldingsdato varchar(55) NOT NULL,
	Biltype varchar(55) NOT NULL,
	Bilensaargang varchar(55) NOT NULL,
	Andeninfo varchar(55)
);

--Indsætter data i tabellen "Klubinfo"
INSERT INTO Klubinfo VALUES ('Mark','Pedersen','Hanborienhule','666','5000','1','18-05-2020','Fedøse','1845','Andeninfokommerher')


SELECT * FROM Klubinfo;