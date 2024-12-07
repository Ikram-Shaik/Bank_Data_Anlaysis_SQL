-- 5: Identify any accounts that have made more than two transactions in a single day, which could indicate fraudulent activity. How can you verify any fraudulent transaction?
# SHAIK MOHAMMED IKRAM
SELECT account_number,DATE(transaction_date) as Date,
COUNT(DATE(transaction_date)) as No_Of_Transactions
FROM transactions
GROUP BY account_number,DATE(transaction_date)
HAVING COUNT(transaction_date)>2;