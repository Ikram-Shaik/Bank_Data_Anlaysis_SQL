-- 10: Calculate the average balance per customer at the end of each month in the last year.
# SHAIK MOHAMMED IKRAM
SELECT c.customer_id, c.first_name, c.last_name, DATE_FORMAT(LAST_DAY(t.transaction_date), '%Y-%m') AS month_year,
    AVG(a.balance) AS avg_balance
FROM Transactions t
INNER JOIN Accounts a 
ON t.account_number = a.account_number
INNER JOIN Customers c 
ON a.customer_id = c.customer_id
WHERE t.transaction_date >= NOW() - INTERVAL 1 YEAR
GROUP BY c.customer_id, c.first_name, c.last_name, YEAR(t.transaction_date), DATE_FORMAT(LAST_DAY(t.transaction_date), '%Y-%m'),
    MONTH(t.transaction_date)
ORDER BY c.customer_id, YEAR(t.transaction_date) DESC, MONTH(t.transaction_date);
