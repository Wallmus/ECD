-- Find which county had the most months with unemployment rates above the state average:
	-- Write a query to calculate the state average unemployment rate.
SELECT AVG(value) AS state_avg_unemp
FROM unemployment;

	-- Use this query in the WHERE clause of an outer query to filter for months above the average.
SELECT *
FROM unemployment
WHERE value >
	(
	SELECT AVG(value) AS state_avg_unemp
	FROM unemployment
	);

	-- Use Select to count the number of months each county was above the average. Which county had the most?
SELECT DISTINCT county, COUNT(period) AS many_months
FROM (SELECT *
	FROM unemployment
	WHERE value >
		(
		SELECT AVG(value) AS state_avg_unemp
		FROM unemployment
		))
GROUP BY county
ORDER BY many_months DESC;

-- Find the average number of jobs created for each county based on projects involving the largest capital investment by each company:
	-- Write a query to find each company’s largest capital investment, returning the company name along with the relevant capital investment amount for each.
SELECT company, MAX(capital_investment) AS largest_cap_invest
FROM ecd
GROUP BY company
ORDER BY largest_cap_invest DESC;

	-- Use this query in the FROM clause of an outer query, alias it, and join it with the original table. 
	-- Adjust the SELECT clause to calculate the average number of jobs created by county
SELECT county, AVG(ecd.new_jobs) AS new_job_avg
FROM ecd
LEFT JOIN (SELECT *
			FROM (SELECT company, MAX(capital_investment) AS largest_cap_invest
			FROM ecd
			GROUP BY company
			ORDER BY largest_cap_invest DESC) AS larg_inv) AS googoo
ON ecd.company = googoo.company
GROUP BY county
ORDER BY county;


	