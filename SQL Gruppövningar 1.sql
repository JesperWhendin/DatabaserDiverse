--USE everyloop;

-- 1
--Ta ut data (select) fr�n tabellen GameOfThrones p� s�dant s�tt att ni f�r ut en
--kolumn �Title� med titeln samt en kolumn �Episode� som visar episoder och s�songer
--i formatet �S01E01�, �S01E02�, osv. Tips: kolla upp funktionen format()

--SELECT title, ('S' + FORMAT(season, '00') + 'E' + FORMAT(EpisodeInSeason, '00')) AS 'Season and episode'
--FROM GameOfThrones;

-- 2
--Uppdatera (kopia p�) tabellen user och s�tt username f�r alla anv�ndare s� den blir
--de 2 f�rsta bokst�verna i f�rnamnet, och de 2 f�rsta i efternamnet (ist�llet f�r 3+3
--som det �r i orginalet). Hela anv�ndarnamnet ska vara i sm� bokst�ver.

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
--Uppdatera (kopia p�) tabellen airports s� att alla
--null-v�rden i kolumnerna Time och DST byts ut mot �-�

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
--Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon
--av f�ljande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla
--rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

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
--Skapa en ny tabell med alla rader fr�n tabellen Elements. Den nya
--tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet, samt
--en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar
--med bokst�verna i �Symbol�, och �No� f�r de rader d�r de inte g�r det.

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
--Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�. G�r sedan
--en select fr�n Colors2 som ger samma resultat som du skulle f�tt fr�n select * from
--Colors; (Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet).

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
--Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� till
--en ny tabell. G�r sedan en select fr�n den nya tabellen som ger samma
--resultat som du skulle f�tt fr�n select * from types;

--SELECT [Integer], [String] INTO Types2 from Types;

SELECT * FROM Types;

SELECT (integer % 2) AS Bool from Types2;

SELECT integer, CAST(integer / 100.0 AS float) AS Float, string, ('2019-01-' + FORMAT(integer, '00') + ' 09:' + FORMAT(integer, '00') + ':00.000000') AS 'DateTime', (integer % 2) AS Bool 
FROM types2;