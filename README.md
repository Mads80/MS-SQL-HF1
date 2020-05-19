	Database 	
Opgaven:

Sportsvogn klubben

Alt i denne opgave løses på en MS-SQL databaseserver og udføres i sql script. Du laver et script som opdeles og kommenteres af dig.  Scriptet sendes til den relevante lærers mailadresse samt præsenteres for en database lærer.

Opgave A:
Lav en database til en veteranbilklub med Toyotas MRII sportsvogne. Lav relevante tabeller til klubbens medlemmer der skal registreres med følgende data. Tabellerne skal indeholde primære nøgler(PK) og eventuelt sekundære(FK) nøgler og eventuelt referencer(REFRENCE). De primære nøgler skal være auto nummererede. Der vælges og anvendes relevante relations typer mellem tabellerne.
Tabel ID i alle tabeller
Navn
Efternavn
Adresse
Telefonnummer
Postnummer
Medlemsnummer
Årstal for indmelding (Kan bruges i forbindelse med erfaringsrabat)
Type bil medlemmet ejer
Bilens årgang
Eventuelt andre punkter du finder relevant

Lav script til at udskrive forskellige relevante data fra tabellerne.

Det er vigtigt at der laves kommentar i koden før hver nyt område så der holdes god orden i koden.

Opgave B
Der skal laves script til Stored Procedure som indsætter data i tabellerne.
Lav en Stored Procedure(SP) som tæller hvor mange medlemmer klubben har.
Der skal laves Stored Procedure som søger relevante data i tabellerne. 
Der skal laves script til at ændre data i tabellerne.

Opgave C
Lav et View der indeholder data fra to tabeller.

Opgave D
Fremstil et diagram over alle tabeller i din database med Sql serverens indbyggede diagram værktøj.

Opgave E
Lav et script som opretter en bruger med både SQL autentifikation og en med Windows autentifikation.
Tildel rettigheder så den nye bruger kun kan læse tabellerne i bil databasen og ikke andet. 

----------------------------------------------------------------------------------------------------------------------------------------------
Opgave F
Lav backup af databasen med et script og gerne i en Stored Procedure .
Lav restore script til databasen i en Stored Procedure.
Tag en backup med dit program script og slet noget i databasen eller hele databasen og genetabler din database med dit script.
Hint: man kan ikke slette en database man er i og man kan ikke være i en database under genetablering. Du har mulighed for at stoppe og starte databaser.
---------------------------------------------------------------------------------------------------------------------------------------------

Opgave F
Der skal laves script til at fjerne alle tabeller og hele databasen.

Opgave G
Frit valg af administrative funktioner du ønsker at vise
