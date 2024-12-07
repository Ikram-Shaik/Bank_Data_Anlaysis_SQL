-- 8: Calculate the total transaction amount performed by each age group in the past year. (Age groups: 0-17, 18-30, 31-60, 60+)
# SHAIK MOHAMMED IKRAM
CREATE TEMPORARY TABLE Age_Groups( 
SELECT customer_id,date_of_birth,YEAR(NOW())-YEAR(date_of_birth) as Age,
CASE
	WHEN YEAR(NOW())-YEAR(date_of_birth) BETWEEN 0 AND 17 THEN '0-17'
    WHEN YEAR(NOW())-YEAR(date_of_birth) BETWEEN 18 AND 30 THEN '18-30'
    WHEN YEAR(NOW())-YEAR(date_of_birth) BETWEEN 31 AND 60 THEN '31-60'
    ELSE '60+'
END AS Age_groups
FROM Customers);

SELECT ag.age_groups,sum(amount) as Amount_spent
FROM transactions t
INNER JOIN accounts a
ON t.account_number=a.account_number
INNER JOIN Age_Groups ag
ON a.customer_id=ag.customer_id
WHERE transaction_date >= (NOW() - INTERVAL 1 YEAR)
GROUP BY ag.age_groups;