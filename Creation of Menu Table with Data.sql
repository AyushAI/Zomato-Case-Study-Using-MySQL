CREATE TABLE menu(

	menu_id INT,
    r_id int,
    f_id INT,
    price DECIMAL(6,2)
);

-- Insert 100 records with random r_id, f_id, and price
INSERT INTO menu (menu_id, r_id, f_id, price)
SELECT 
    seq AS menu_id,
    FLOOR(1 + (RAND() * 100)) AS r_id,
    FLOOR(1 + (RAND() * 100)) AS f_id,
    FLOOR(100 + (RAND() * 901)) AS price
FROM 
    (SELECT @row := @row + 1 AS seq 
     FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) a,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) b,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) c,
          (SELECT @row := 0) r
     LIMIT 100) t;