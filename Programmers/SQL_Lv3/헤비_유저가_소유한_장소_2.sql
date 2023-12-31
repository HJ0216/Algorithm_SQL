WITH CONDITIONS AS (
      SELECT HOST_ID 
        FROM PLACES
    GROUP BY HOST_ID
      HAVING COUNT(HOST_ID) > 1
)
  SELECT P.*
    FROM PLACES P
    JOIN CONDITIONS C 
      ON P.HOST_ID = C.HOST_ID
ORDER BY P.ID
;
