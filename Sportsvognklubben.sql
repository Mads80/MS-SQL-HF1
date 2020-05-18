--HEJ <3
USE master

CREATE DATABASE Sportsvognklub;
GO
USE Sportsvognklub;

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