SELECT COUNT(DISTINCT company) AS llc_companies
FROM ecd
WHERE UPPER(company) LIKE '%LLC%';
