SELECT DISTINCT county_tier,
	AVG(new_jobs) AS "NEW JOBS TOTAL"
FROM ecd
GROUP BY county_tier;
