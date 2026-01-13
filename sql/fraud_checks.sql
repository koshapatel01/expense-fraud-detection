-- 1. High-value expense claims (policy threshold) 
SELECT * 
FROM expenses 
WHERE amount > 500; 
 
-- 2. Frequent small claims (expense splitting) 
SELECT employee_id, 
    COUNT(*) AS claim_count, 
    SUM(amount) AS total_amount 
FROM expenses 
WHERE amount BETWEEN 90 AND 110 
GROUP BY employee_id 
HAVING COUNT(*) > 5; 
 
-- 3. Duplicate expenses (same employee, date, amount) 
SELECT employee_id, expense_date, amount, COUNT(*) AS duplicate_count
FROM expenses 
GROUP BY employee_id, expense_date, amount 
HAVING COUNT(*) > 1; 
 
-- 4. Weekend expenses 
SELECT * 
FROM expenses 
WHERE strftime('%w', expense_date) IN ('0','6'); 
 
-- 5. Unusual merchants per employee 
SELECT employee_id, merchant, COUNT(*) AS frequency
FROM expenses 
GROUP BY employee_id, merchant 
HAVING COUNT(*) = 1;