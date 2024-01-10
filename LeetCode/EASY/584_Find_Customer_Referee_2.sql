SELECT name
  FROM Customer C1 
 WHERE NOT EXISTS
(
    SELECT 1
    FROM Customer C2
    WHERE referee_id = 2 
      AND C1.id = C2.id
)
;
