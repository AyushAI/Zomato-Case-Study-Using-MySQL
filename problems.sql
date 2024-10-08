 USE zomato_data;
 
 SELECT * FROM users;
 
 -- 1. Count the numbers of rows
 SELECT COUNT(*) FROM users;
 SELECT COUNT(*) FROM orders;
 SELECT COUNT(*) FROM order_details;
 
 -- 2.  Returns n random records
 SELECT * FROM users ORDER BY RAND() LIMIT 10;
 SELECT * FROM orders ORDER BY RAND() LIMIT 8;
 
 -- 3.  Find the null values
 SELECT * FROM users WHERE password IS NULL;
 SELECT * FROM restaurants WHERE restaurant_rating IS NULL;
 
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
    B.r_name
FROM menu AS A
INNER JOIN restaurants AS B
ON A.r_id = B.r_id
GROUP BY B.r_id, B.r_name
ORDER BY Total_menu DESC;

SELECT 
    B.r_id,
    B.r_name,
    COUNT(*) AS 'Total_menu'
FROM menu AS A
INNER JOIN restaurants AS B
ON A.r_id = B.r_id
GROUP BY B.r_id, B.r_name
ORDER BY Total_menu DESC;

 
-- 7. Find the number of votes and average 
SELECT 
		r_name,
		AVG(restaurant_rating) AS average_rating,
        COUNT(*) AS number_of_votes
FROM restaurants AS A
INNER JOIN orders AS B
ON A.r_id = B.r_id
GROUP BY A.r_name
ORDER BY average_rating DESC, number_of_votes DESC;
         
