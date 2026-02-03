-- Find Athletes from Summer or Winter Games. Write a query to list all athlete names who participated in the Summer or Winter Olympics. Ensure no duplicates appear in the final table using a set theory clause.

SELECT DISTINCT name AS athletes_summer_winter
FROM athletes
LEFT JOIN summer_games
ON athletes.id = summer_games.athlete_id
UNION
SELECT DISTINCT name
FROM athletes
LEFT JOIN winter_games
ON athletes.id = winter_games.athlete_id
ORDER BY athletes_summer_winter;


-- Find Countries Participating in Both Games
	-- Write a query to retrieve country_id and country_name for countries in the Summer Olympics.
	-- Add a JOIN to include the country’s 2016 population and exclude the country_id from the SELECT statement.
	-- Repeat the process for the Winter Olympics.
	-- Use a set theory clause to combine the results.
	SELECT  DISTINCT countries.country AS country_name, LEFT(country_stats.year, 4) AS year, country_stats.pop_in_millions::NUMERIC AS pop_millz
	FROM summer_games
	LEFT JOIN countries
	ON summer_games.country_id = countries.id
	LEFT JOIN country_stats
	ON countries.id = country_stats.country_id
	WHERE country_stats.year LIKE '2016%'
	INTERSECT
	SELECT  DISTINCT countries.country AS country_name, LEFT(country_stats.year, 4) AS year, country_stats.pop_in_millions::NUMERIC AS pop_millz
	FROM winter_games
	LEFT JOIN countries
	ON winter_games.country_id = countries.id
	LEFT JOIN country_stats
	ON countries.id = country_stats.country_id
	WHERE country_stats.year LIKE '2016%'
	ORDER BY pop_millz DESC;

-- Identify Countries Exclusive to the Summer Olympics
-- Return the country_name and region for countries present in the countries table but not in the winter_games table.
-- (Hint: Use a set theory clause where the top query doesn’t involve a JOIN, but the bottom query does.)
SELECT country, region
FROM countries
WHERE country NOT IN(SELECT countries.country
	FROM winter_games
	LEFT JOIN countries
	ON winter_games.country_id = countries.id);
