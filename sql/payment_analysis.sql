-- PAYFLOW | FINTECH PAYMENT ANALYSIS
-- SQL BUSINESS QUESTIONS


-- BQ1: How many transactions are recorded?

SELECT
    COUNT(*) AS total_transactions
FROM payment_transactions;


-- BQ2: How are transactions distributed by status?

SELECT
    transaction_status,
    COUNT(*) AS transaction_count
FROM payment_transactions
GROUP BY transaction_status
ORDER BY transaction_count DESC;


-- BQ3: What is the average successful
-- transaction amount?

SELECT
    AVG(transaction_amount)
        AS average_successful_amount
FROM payment_transactions
WHERE transaction_status = 'Successful';


-- BQ4: Which payment method generates the
-- highest successful transaction volume?

SELECT
    payment_method,
    SUM(transaction_amount)
        AS successful_transaction_volume
FROM payment_transactions
WHERE transaction_status = 'Successful'
GROUP BY payment_method
ORDER BY successful_transaction_volume DESC;


-- BQ5: What are the most common failure reasons?

SELECT
    failure_reason,
    COUNT(*) AS failure_count
FROM payment_transactions
WHERE transaction_status = 'Failed'
GROUP BY failure_reason
ORDER BY failure_count DESC;


-- BQ6: Which customer segment has the
-- highest average transaction amount?

SELECT
    customer_segment,
    AVG(transaction_amount)
        AS average_transaction_amount
FROM payment_transactions
GROUP BY customer_segment
ORDER BY average_transaction_amount DESC;


-- BQ7: How does successful transaction
-- volume differ by merchant category?

SELECT
    merchant_category,
    COUNT(*) AS successful_transaction_count,
    SUM(transaction_amount)
        AS successful_transaction_volume
FROM payment_transactions
WHERE transaction_status = 'Successful'
GROUP BY merchant_category
ORDER BY successful_transaction_volume DESC;


-- BQ8: Which city has the highest
-- successful transaction volume?

SELECT
    city,
    SUM(transaction_amount)
        AS successful_transaction_volume
FROM payment_transactions
WHERE transaction_status = 'Successful'
GROUP BY city
ORDER BY successful_transaction_volume DESC;
