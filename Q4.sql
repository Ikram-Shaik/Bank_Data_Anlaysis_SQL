-- 4: Find the name of the customer who has deposited the highest amount.
# SHAIK MOHAMMED IKRAM
SELECT c.customer_id,t.account_number,c.first_name,c.last_name,c.email,c.phone,c.address,c.city,c.state,
MAX(t.amount) as Amount_Deposited
FROM transactions t
INNER JOIN accounts a
ON t.account_number=a.account_number
INNER JOIN customers c
ON a.customer_id=c.customer_id
WHERE transaction_type='Deposit'
GROUP BY account_number
ORDER BY MAX(amount) DESC
LIMIT 1;