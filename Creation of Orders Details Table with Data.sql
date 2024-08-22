CREATE table order_details
(
	id INT,
    order_id INT,
    f_id INT
);

-- Insert 100 records with random order_id and f_id values
INSERT INTO order_details (id, order_id, f_id)
SELECT 
    seq AS id,
    FLOOR(1001 + (RAND() * 100)) AS order_id,
    FLOOR(1 + (RAND() * 100)) AS f_id
FROM 
    (SELECT @row := @row + 1 AS seq 
     FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) a,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) b,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) c,
          (SELECT @row := 0) r
     LIMIT 100) t;