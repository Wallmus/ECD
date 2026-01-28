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
