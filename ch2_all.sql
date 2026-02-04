SELECT DISTINCT county
FROM ecd;


SELECT company,ed
FROM ecd
WHERE ed IS NULL;


SELECT company,fjtap,capital_investment::numeric/1000000 AS "fjtap_cap_invest_mil"
FROM ecd
WHERE fjtap IS NOT NULL
ORDER BY capital_investment;


SELECT DISTINCT county_tier,
	AVG(new_jobs) AS "NEW JOBS TOTAL"
FROM ecd
GROUP BY county_tier;


SELECT COUNT(DISTINCT company) AS llc_companies
FROM ecd
WHERE UPPER(company) LIKE '%LLC%';