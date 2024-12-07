-- 1: Write a query to list all customers who haven't made any transactions in the last year. How can we make them active again? Provide appropriate region.
# SHAIK MOHAMMED IKRAM
SELECT c.customer_id, c.first_name, c.last_name, c.email, c.phone,
    b.branch_address, b.branch_location, MAX(DATE(t.transaction_date)) AS last_transaction_date
FROM Customers AS c
INNER JOIN Accounts AS a ON c.customer_id = a.customer_id
INNER JOIN Branches AS b ON a.branch_id = b.branch_id
INNER JOIN Transactions AS t ON a.account_number = t.account_number
WHERE t.transaction_date < (NOW() - INTERVAL 1 YEAR)
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.phone, b.branch_address, b.branch_location
ORDER BY c.customer_id;