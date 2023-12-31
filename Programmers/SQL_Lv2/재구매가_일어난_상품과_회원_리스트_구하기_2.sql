WITH CONDITIONS AS (
      SELECT USER_ID, 
             PRODUCT_ID, 
             COUNT(*) COUNT_PRODUCT
        FROM ONLINE_SALE
    GROUP BY USER_ID, 
             PRODUCT_ID
)
  SELECT USER_ID, 
         PRODUCT_ID
    FROM CONDITIONS
   WHERE COUNT_PRODUCT > 1
ORDER BY USER_ID, 
         PRODUCT_ID DESC
;
