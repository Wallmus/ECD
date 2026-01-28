SELECT 
    SUM(CASE WHEN year = 2010 THEN population END) AS Total_Pop_2010,
    SUM(CASE WHEN year = 2017 THEN population END) AS Total_Pop_2017
FROM population
WHERE year IN (2010, 2017);
