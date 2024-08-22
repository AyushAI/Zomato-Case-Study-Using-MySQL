CREATE TABLE orders
(
	order_id INT,
    user_id INT,
    r_id INT, 
    amount DECIMAL(6,2),
    `date` date,
    partner_id INT,
    delivery_time INT,
    delivery_rating INT,
    restaurant_rating INT
    
);

-- Insert 100 records with the specified random values
INSERT INTO orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating)
SELECT 
    seq + 1000 AS order_id,
    FLOOR(1 + (RAND() * 100)) AS user_id,
    FLOOR(1 + (RAND() * 100)) AS r_id,
    FLOOR(100 + (RAND() * 901)) AS amount,
    DATE(FROM_DAYS(TO_DAYS('2024-06-01') + FLOOR(RAND() * 91))) AS order_date,  -- Random date between June and August 2024
    FLOOR(1 + (RAND() * 30)) AS partner_id,
    FLOOR(1 + (RAND() * 120)) AS delivery_time,
    FLOOR(1 + (RAND() * 5)) AS delivery_rating,
    FLOOR(1 + (RAND() * 5)) AS restaurant_rating
FROM 
    (SELECT @row := @row + 1 AS seq 
     FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) a,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) b,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) c,
          (SELECT @row := 0) r
     LIMIT 100) t;