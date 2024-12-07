-- 6: Calculate the average number of transactions per customer per account per month over the last year.
# SHAIK MOHAMMED IKRAM
SELECT c.customer_id,c.first_name,c.last_name,a.account_number,b.branch_name,ROUND(AVG(transaction_count),2) AS avg_transactions_per_month
FROM (SELECT account_number,MONTH(transaction_date) AS transaction_month,YEAR(transaction_date) AS transaction_year,
	COUNT(*) AS transaction_count
	FROM Transactions 
	WHERE transaction_date >= (NOW() - INTERVAL 1 YEAR)
	GROUP BY account_number, YEAR(transaction_date), MONTH(transaction_date)
    ) AS monthly_transactions
INNER JOIN accounts AS a 
ON monthly_transactions.account_number = a.account_number
INNER JOIN Customers AS c 
ON a.customer_id = c.customer_id
INNER JOIN branches AS b
ON a.branch_id=b.branch_id
GROUP BY c.customer_id, a.account_number,b.branch_id
ORDER BY c.customer_id, a.account_number;

