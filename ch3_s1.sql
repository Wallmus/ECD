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
