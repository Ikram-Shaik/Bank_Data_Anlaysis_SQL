-- 7: Write a query to find the daily transaction volume (total amount of all transactions) for the past month.
# SHAIK MOHAMMED IKRAM
SELECT transaction_day,sum(amount)
FROM(SELECT day(transaction_date) as transaction_day,amount
FROM transactions
WHERE MONTH(transaction_date)=6 AND YEAR(transaction_date)=2024
ORDER BY transaction_date) as derived
GROUP BY transaction_day
ORDER BY transaction_day;