-- 9: Find the branch with the highest average account balance.
# SHAIK MOHAMMED IKRAM
SELECT b.branch_id,b.branch_name,b.city,b.state,
ROUND(AVG(a.balance),2) as Avg_Account_Balance
FROM accounts a
INNER JOIN branches b
ON a.branch_id=b.branch_id
GROUP BY b.branch_name,b.branch_id,b.city,b.state
ORDER BY avg(a.balance) desc
LIMIT 1;