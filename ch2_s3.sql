SELECT company,fjtap,capital_investment::numeric/1000000 AS "fjtap_cap_invest_mil"
FROM ecd
WHERE fjtap IS NOT NULL
ORDER BY capital_investment;