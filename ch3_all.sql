SELECT county,
	population AS "2017 Population",
	CASE
		WHEN population>=500000 THEN 'high population'
		WHEN population>100000 AND population<500000 THEN 'medium population'
		WHEN population<=100000 THEN 'low population'
	END AS pop_category
FROM population
WHERE year=2017
ORDER BY population DESC;


SELECT company,
	landed,
	new_jobs,
	CASE
		WHEN new_jobs < 50 THEN 'small startup'
		when new_jobs >=50 AND new_jobs <=100 THEN 'midsize startup'
		WHEN new_jobs > 100 THEN 'large startup'
		ELSE '67'
	END AS startup_class
FROM ecd
WHERE project_type = 'New Startup'
ORDER BY new_jobs;


SELECT 
    SUM(CASE WHEN year = 2010 THEN population END) AS Total_Pop_2010,
    SUM(CASE WHEN year = 2017 THEN population END) AS Total_Pop_2017
FROM population
WHERE year IN (2010, 2017);

