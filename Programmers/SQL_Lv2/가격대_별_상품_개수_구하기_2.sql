WITH CONDITION AS (
      SELECT TRUNC(PRICE/10000)*10000 PRICE_GROUP,
             COUNT(PRODUCT_ID) PRODUCTS
        FROM PRODUCT
    GROUP BY TRUNC(PRICE/10000)
)
  SELECT PRICE_GROUP,
         PRODUCTS
    FROM CONDITION
ORDER BY PRICE_GROUP
;
