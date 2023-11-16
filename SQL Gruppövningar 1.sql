--USE everyloop;

-- 1
--Ta ut data (select) från tabellen GameOfThrones på sådant sätt att ni får ut en
--kolumn ’Title’ med titeln samt en kolumn ’Episode’ som visar episoder och säsonger
--i formatet ”S01E01”, ”S01E02”, osv. Tips: kolla upp funktionen format()

--SELECT title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode'
--FROM GameOfThrones;

-- 2
--Uppdatera (kopia på) tabellen user och sätt username för alla användare så den blir
--de 2 första bokstäverna i förnamnet, och de 2 första i efternamnet (istället för 3+3
--som det är i orginalet). Hela användarnamnet ska vara i små bokstäver.

--SELECT * INTO Users2 FROM Users;

--SELECT UserName FROM Users2;

--SELECT 
--(SUBSTRING(LOWER([FirstName]), 1, 2) +
--SUBSTRING(LOWER([LastName]), 1, 2))
--FROM Users2;

--UPDATE Users2
--SET username =
--(SUBSTRING(LOWER([FirstName]), 1, 2) +
--SUBSTRING(LOWER([LastName]), 1, 2));

-- 3 
--Uppdatera (kopia på) tabellen airports så att alla
--null-värden i kolumnerna Time och DST byts ut mot ’-’

--SELECT * INTO Airports2 FROM Airports;

--SELECT [Time], [DST]
--FROM Airports2
--WHERE [Time] is null or [DST] is null;

--SELECT [Time], [DST],
--	CASE
--		WHEN [Time] is null THEN '-' ELSE [Time]
--	END
--		AS [Time],
--	CASE
--		WHEN [DST] is null THEN '-' ELSE [DST]
--	END
--		AS [DST]
--FROM Airports2;

--UPDATE Airports2
--   SET [Time] = COALESCE([Time], '-'),
--       [DST] = COALESCE([DST], '-')
--WHERE [Time] is null or [DST] is null;

-- 4
--Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon
--av följande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla
--rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

--SELECT * INTO Elements2 FROM Elements;

--SELECT [Name] FROM Elements2;

--SELECT * FROM Elements2
--WHERE
--[Name] in ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE 'D%'
--OR [Name] LIKE 'K%'
--OR [Name] LIKE 'M%'
--OR [Name] LIKE 'O%'
--OR [Name] LIKE 'U%';

--DELETE FROM Elements2
--WHERE
--[Name] in ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--OR [Name] LIKE 'D%'
--OR [Name] LIKE 'K%'
--OR [Name] LIKE 'M%'
--OR [Name] LIKE 'O%'
--OR [Name] LIKE 'U%';

-- 5
--Skapa en ny tabell med alla rader från tabellen Elements. Den nya
--tabellen ska innehålla ”Symbol” och ”Name” från orginalet, samt
--en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar
--med bokstäverna i ”Symbol”, och ’No’ för de rader där de inte gör det.

--SELECT [Symbol], [Name] INTO Elements3 FROM Elements;

--SELECT * FROM Elements3
--WHERE [Name]
--LIKE CONCAT([Symbol], '%');

--UPDATE Elements3
--SET [Yes/No] =
--	CASE 
--		WHEN [Name] LIKE CONCAT([Symbol], '%') THEN 'YES'
--		ELSE 'No'
--	END;

--SELECT * FROM Elements;

-- 6
--Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”. Gör sedan
--en select från Colors2 som ger samma resultat som du skulle fått från select * from
--Colors; (Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

--SELECT * INTO Colors2 FROM Colors;

--SELECT * FROM Colors2;

--ALTER TABLE Colors2
--DROP COLUMN [Code];

--SELECT 
--  Name,
--  Red,
--  Green,
--  Blue,
--  '#' + FORMAT(Red, 'X2') + FORMAT(Green, 'X2') + FORMAT(Blue, 'X2') AS Code
--FROM Colors2;

--SELECT * FROM Colors;

-- 7
--Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till
--en ny tabell. Gör sedan en select från den nya tabellen som ger samma
--resultat som du skulle fått från select * from types;

--SELECT [Integer], [String] INTO Types2 from Types;

SELECT * FROM Types;

SELECT (integer % 2) AS Bool from Types2;

SELECT integer, CAST(integer / 100.0 AS float) AS Float, string, ('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2) AS Bool 
FROM types2;