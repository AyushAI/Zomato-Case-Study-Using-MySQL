 USE zomato_data;
 
 SELECT * FROM users;
 
 -- 1. Count the numbers of rows
 SELECT COUNT(*) FROM users;
 SELECT COUNT(*) FROM orders;
 SELECT COUNT(*) FROM order_details;
 
 -- 2.  Returns n random records
 SELECT * FROM users ORDER BY RAND() LIMIT 10;
 
 -- 3.  Find the null values
 SELECT * FROM users WHERE password IS NULL;
 
 -- 4. To replace the null values with 0
 UPDATE users 
	SET password = 0
    WHERE password IS NULL;
    
-- 5. Find the number of order placed by each customer
SELECT 
    B.name,
    COUNT(*) AS total_orders
FROM orders AS A
INNER JOIN users AS B
ON A.user_id = B.user_id
GROUP BY B.user_id, B.name;

-- 6. Find the restaurants with most number of menu items
SELECT 
	COUNT(*) AS 'Total_menu',
	B.r_id,
    A.menu_id
FROM menu AS A
INNER JOIN restaurants AS B
ON A.r_id = B.r_id
GROUP BY B.r_id;
 
