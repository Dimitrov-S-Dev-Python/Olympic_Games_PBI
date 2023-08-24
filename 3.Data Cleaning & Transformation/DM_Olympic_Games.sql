-- DM Cleansed Olympic Games
SELECT
[ID],
[Name],
CASE
	WHEN [Sex] = 'M' THEN 'Male' WHEN [Sex] = 'F' THEN 'Female' END AS Sex,
[Age],
CASE
	WHEN[Age] < 18 THEN 'Under 18'
	WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
	WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
	ELSE 'Over 30'
	END AS [Age Grouping],
[Height],
[Weight],
[NOC] AS 'Nation Code',
	--CHARINDEX(' ',Games)-1 AS 'Example 1' -- This is just to see CHARINDEX Functionality
	--,CHARINDEX(' ', REVERSE(Games)) - 1 AS 'Example 2'
LEFT(Games, CHARINDEX(' ', Games) -1) AS 'Year', -- Split into year
	--RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) AS 'Season' -- split into game - we dont need it cause of filter
	--[Games]
	--,[City]
[Sport],
[Event],
CASE
	WHEN [Medal] = 'NA' THEN 'Not Registered'
	ELSE [Medal]
	END AS Medal
FROM
	[olympic_games].[dbo].[athletes_event_results]
WHERE
	RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) = 'Summer'
