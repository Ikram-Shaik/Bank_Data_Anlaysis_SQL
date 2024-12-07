-- 3: Rank branches based on the total amount of deposits made in the last quarter.
# SHAIK MOHAMMED IKRAM
SELECT DENSE_RANK() OVER(ORDER BY sum(t.amount) desc) as Ranking,
b.branch_name,sum(t.amount) as Deposit_Amount
FROM transactions t
INNER JOIN Accounts a
ON t.account_number=a.account_number
INNER JOIN branches b
ON a.branch_id=b.branch_id
where transaction_date< (now() - INTERVAL 1 QUARTER) 
AND t.transaction_type='Deposit'
GROUP BY b.branch_name;