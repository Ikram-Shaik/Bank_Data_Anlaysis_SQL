-- 2: Summarize the total transaction amount per account per month.
# SHAIK MOHAMMED IKRAM
SELECT account_number,YEAR(transaction_date) AS year,
MONTHNAME(transaction_date) AS month_name,SUM(amount) AS total_amount
FROM transactions
GROUP BY account_number,YEAR(transaction_date),
MONTH(transaction_date),MONTHNAME(transaction_date)
ORDER BY account_number,YEAR(transaction_date) DESC,
MONTH(transaction_date);
