--HELLO QT :)
USE master

CREATE DATABASE BikeRoutes;
GO
USE BikeRoutes;

CREATE TABLE [Routes] (
	RouteID int IDENTITY (1,1) PRIMARY KEY,
	RouteName varchar(55) NOT NULL,
	RouteLength int NOT NULL,
	RouteDifficulty int NOT NULL,
	RouteElevation int NOT NULL
);
GO
--Insert Data
INSERT INTO [Routes] VALUES ('RingkøbingFjord','69','2','550')
INSERT INTO [Routes] VALUES ('Skrædderholmen','30','2','250')
INSERT INTO [Routes] VALUES ('AmagerLoop','28','1','100')
INSERT INTO [Routes] VALUES ('HenneKirke','29','1','375')
INSERT INTO [Routes] VALUES ('AlsRuten','78','3','782')
INSERT INTO [Routes] VALUES ('Himmelbjerget','133','3','1222')

SELECT * FROM [Routes];

CREATE TABLE Difficulty (
	DifficultyID int NOT NULL,
	DifficultyName varchar(55) NOT NULL
);
GO
--Insert Data
INSERT INTO Difficulty (DifficultyID, DifficultyName)
VALUES (1, 'Easy')
INSERT INTO Difficulty (DifficultyID, DifficultyName)
VALUES (2, 'Intermediate')
INSERT INTO Difficulty (DifficultyID, DifficultyName)
VALUES (3, 'Hard')

SELECT * FROM Difficulty;

SELECT RouteName, RouteLength, RouteElevation, DifficultyName
FROM [Routes], Difficulty
WHERE DifficultyID = RouteDifficulty

--INNER JOIN
SELECT
	RouteName,
	RouteLength,
	RouteElevation,
	--RouteDifficulty,
	--DifficultyID,
	DifficultyName
FROM
	[Routes]
INNER JOIN Difficulty
	ON RouteDifficulty = DifficultyID
ORDER BY RouteLength DESC;

--Create View
CREATE VIEW BikeRoutesView AS
SELECT RouteName, RouteLength, RouteElevation, DifficultyName
FROM [Routes], Difficulty
WHERE DifficultyID = RouteDifficulty;

SELECT * FROM BikeRoutesView;

/*-----------------------------------------------------------------------------------------------
Create Stored Procedure: fetch_routes
-------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE fetch_routes
AS
SELECT * FROM [Routes]
GO
/*-----------------------------------------------------------------------------------------------
Execute Stored Procedure: fetch_table
-------------------------------------------------------------------------------------------------*/
EXEC fetch_routes
/*-----------------------------------------------------------------------------------------------
Create Stored Procedure: fetch_routes_name
-------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE fetch_routes_name
@RouteName varchar(55)
AS
SELECT * FROM [Routes]
WHERE RouteName = @RouteName
GO
/*-----------------------------------------------------------------------------------------------
Execute Stored Procedure: fetch_routes_name
-------------------------------------------------------------------------------------------------*/
EXEC fetch_routes_name 'AmagerLoop'
EXEC fetch_routes_name ''
EXEC fetch_routes_name 'HenneKirke'
EXEC fetch_routes_name 'DetteNavnFindesIkkeIDatabasen'
/*-----------------------------------------------------------------------------------------------
Alter Stored Procedure: fetch_routes_difficulty
-------------------------------------------------------------------------------------------------*/
ALTER PROCEDURE fetch_routes_difficulty
AS
SELECT RouteName, RouteLength, RouteElevation, DifficultyName
FROM [Routes], Difficulty
WHERE DifficultyID = RouteDifficulty
ORDER BY RouteLength DESC
GO
/*-----------------------------------------------------------------------------------------------
Execute Stored Procedure: fetch_routes_difficulty
-------------------------------------------------------------------------------------------------*/
EXEC fetch_routes_difficulty
/*------------------------------------------------------------------------------------------------
Delete Stored Procedure:
--drop proc fetch_routes
--drop proc fetch_routes_name
-------------------------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------------------------
--USE master
--DROP DATABASE BikeRoutes
--DROP TABLE [Routes]
-------------------------------------------------------------------------------------------------*/

--CREATE DB BACKUP
BACKUP DATABASE BikeRoutes
TO DISK = 'C:\Users\Mads\Documents\GitHub\SQL\BikeRoutes.bak';

--RESTORE DB BACKUP
USE master
RESTORE DATABASE BikeRoutes
FROM DISK = 'C:\Users\Mads\Documents\GitHub\SQL\BikeRoutes.bak';

--CREATE USER
use BikeRoutes
create user madstest for login madstest
create user Route99 for login Route99
--Grant Permission
--Use <database-name>
--Grant <permission-name> on <object-name> to <username\principle>
use BikeRoutes
GO
Grant select on Difficulty to Route99